defmodule DeeperHub.CMS.Widgets.WidgetBookmark do
  @moduledoc """
  Schema para favoritos de widget do sistema usando db_connection.
  Representa widgets marcados como favoritos por usuários.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_widget_bookmarks"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para favoritos de widget.
  """
  defstruct [
    :id, :widget_id, :user_id, :is_bookmarked, :created_at, :updated_at
  ]

  @doc """
  Valida dados do favorito.
  """
  def validate(attrs) do
    errors = []

    # Converte chaves string para atom se necessário
    attrs = case attrs do
      %{} = map when is_map(map) ->
        for {key, value} <- map, into: %{} do
          key_atom = if is_binary(key), do: String.to_atom(key), else: key
          {key_atom, value}
        end
      _ -> attrs
    end

    # Validação do widget_id
    widget_id = attrs[:widget_id] || attrs["widget_id"]
    errors = if not is_integer(widget_id) or widget_id <= 0 do
      ["widget_id é obrigatório e deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    # Validação do user_id
    user_id = attrs[:user_id] || attrs["user_id"]
    errors = if not is_integer(user_id) or user_id <= 0 do
      ["user_id é obrigatório e deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    if length(errors) == 0 do
      {:ok, attrs}
    else
      {:error, errors}
    end
  end

  @doc """
  Cria um novo favorito com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      widget_id: attrs[:widget_id],
      user_id: attrs[:user_id],
      is_bookmarked: attrs[:is_bookmarked] || true,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at]
    }
  end

  @doc """
  Verifica se está marcado como favorito.
  """
  def bookmarked?(%__MODULE__{is_bookmarked: true}), do: true
  def bookmarked?(_), do: false

  @doc """
  Verifica se foi removido dos favoritos.
  """
  def unbookmarked?(%__MODULE__{is_bookmarked: false}), do: true
  def unbookmarked?(_), do: false

  @doc """
  Retorna informações resumidas do favorito.
  """
  def summary(%__MODULE__{} = bookmark) do
    %{
      id: bookmark.id,
      widget_id: bookmark.widget_id,
      user_id: bookmark.user_id,
      is_bookmarked: bookmark.is_bookmarked,
      created_at: bookmark.created_at,
      updated_at: bookmark.updated_at
    }
  end

  @doc """
  Retorna o status do favorito como string.
  """
  def status(%__MODULE__{is_bookmarked: true}), do: "bookmarked"
  def status(%__MODULE__{is_bookmarked: false}), do: "unbookmarked"

  @doc """
  Retorna informações de data de criação formatada.
  """
  def bookmark_date_info(%__MODULE__{created_at: created_at, updated_at: updated_at}) do
    %{
      created_at: created_at,
      updated_at: updated_at,
      is_recent: is_recent_bookmark?(created_at),
      days_since_created: days_since_created(created_at)
    }
  end

  @doc """
  Verifica se é um favorito recente (últimos 7 dias).
  """
  def recent?(%__MODULE__{created_at: created_at}) do
    is_recent_bookmark?(created_at)
  end

  # Funções auxiliares privadas
  defp is_recent_bookmark?(created_at) when is_binary(created_at) do
    case DateTime.from_iso8601(created_at) do
      {:ok, datetime, _} ->
        now = DateTime.utc_now()
        diff_seconds = DateTime.diff(now, datetime)
        diff_days = diff_seconds / (24 * 60 * 60)
        diff_days <= 7
      _ ->
        false
    end
  end
  defp is_recent_bookmark?(_), do: false

  defp days_since_created(created_at) when is_binary(created_at) do
    case DateTime.from_iso8601(created_at) do
      {:ok, datetime, _} ->
        now = DateTime.utc_now()
        diff_seconds = DateTime.diff(now, datetime)
        round(diff_seconds / (24 * 60 * 60))
      _ ->
        0
    end
  end
  defp days_since_created(_), do: 0

  @doc """
  Retorna ações disponíveis para o favorito.
  """
  def available_actions(%__MODULE__{is_bookmarked: true}) do
    ["remove_bookmark", "view_widget", "use_widget"]
  end
  def available_actions(%__MODULE__{is_bookmarked: false}) do
    ["add_bookmark", "view_widget", "use_widget"]
  end

  @doc """
  Retorna o ícone apropriado para o status.
  """
  def status_icon(%__MODULE__{is_bookmarked: true}), do: "bookmark"
  def status_icon(%__MODULE__{is_bookmarked: false}), do: "bookmark-o"

  @doc """
  Retorna a cor apropriada para o status.
  """
  def status_color(%__MODULE__{is_bookmarked: true}), do: "primary"
  def status_color(%__MODULE__{is_bookmarked: false}), do: "secondary"

  @doc """
  Retorna o texto do botão baseado no status.
  """
  def action_button_text(%__MODULE__{is_bookmarked: true}), do: "Remover dos Favoritos"
  def action_button_text(%__MODULE__{is_bookmarked: false}), do: "Adicionar aos Favoritos"

  @doc """
  Retorna a ação do botão baseada no status.
  """
  def action_button_action(%__MODULE__{is_bookmarked: true}), do: "unbookmark"
  def action_button_action(%__MODULE__{is_bookmarked: false}), do: "bookmark"

  @doc """
  Verifica se o favorito foi modificado recentemente.
  """
  def recently_modified?(%__MODULE__{created_at: created_at, updated_at: updated_at}) do
    # Se updated_at é diferente de created_at, foi modificado
    created_at != updated_at and is_recent_bookmark?(updated_at)
  end

  @doc """
  Retorna estatísticas do favorito.
  """
  def statistics(%__MODULE__{} = bookmark) do
    %{
      is_bookmarked: bookmark.is_bookmarked,
      is_recent: recent?(bookmark),
      days_old: days_since_created(bookmark.created_at),
      recently_modified: recently_modified?(bookmark),
      status: status(bookmark)
    }
  end

  @doc """
  Cria dados para toggle do favorito.
  """
  def toggle_data(%__MODULE__{widget_id: widget_id, user_id: user_id, is_bookmarked: current_status}) do
    %{
      widget_id: widget_id,
      user_id: user_id,
      current_status: current_status,
      new_status: not current_status,
      action: if(current_status, do: "remove", else: "add")
    }
  end

  @doc """
  Retorna mensagem de confirmação para ação.
  """
  def confirmation_message(bookmark, widget_title \\ "este widget")
  def confirmation_message(%__MODULE__{is_bookmarked: true}, widget_title) do
    "Tem certeza que deseja remover '#{widget_title}' dos seus favoritos?"
  end
  def confirmation_message(%__MODULE__{is_bookmarked: false}, widget_title) do
    "Deseja adicionar '#{widget_title}' aos seus favoritos?"
  end

  @doc """
  Retorna mensagem de sucesso para ação.
  """
  def success_message(bookmark, widget_title \\ "Widget")
  def success_message(%__MODULE__{is_bookmarked: true}, widget_title) do
    "'#{widget_title}' foi removido dos seus favoritos."
  end
  def success_message(%__MODULE__{is_bookmarked: false}, widget_title) do
    "'#{widget_title}' foi adicionado aos seus favoritos."
  end

  @doc """
  Verifica se o usuário pode modificar este favorito.
  """
  def can_modify?(%__MODULE__{user_id: bookmark_user_id}, current_user_id) do
    bookmark_user_id == current_user_id
  end

  @doc """
  Retorna dados para API de favoritos.
  """
  def api_data(%__MODULE__{} = bookmark) do
    %{
      id: bookmark.id,
      widget_id: bookmark.widget_id,
      user_id: bookmark.user_id,
      is_bookmarked: bookmark.is_bookmarked,
      status: status(bookmark),
      created_at: bookmark.created_at,
      updated_at: bookmark.updated_at,
      is_recent: recent?(bookmark),
      days_old: days_since_created(bookmark.created_at),
      available_actions: available_actions(bookmark)
    }
  end
end
