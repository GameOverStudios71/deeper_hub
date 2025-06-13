defmodule DeeperHub.CMS.Pages.DesignBox do
  @moduledoc """
  Schema para caixas de design do sistema usando db_connection.
  Representa estilos visuais que podem ser aplicados aos blocos de página.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_design_boxes"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para caixas de design.
  """
  defstruct [
    :id, :name, :title, :description, :template, :css_class, :icon,
    :is_active, :is_system, :created_at, :order_index
  ]

  @doc """
  Valida dados da caixa de design.
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

    # Validação do name
    name = attrs[:name] || attrs["name"]
    errors = if not is_binary(name) or String.length(name) < 2 do
      ["name é obrigatório e deve ter pelo menos 2 caracteres" | errors]
    else
      errors
    end

    # Validação do title
    title = attrs[:title] || attrs["title"]
    errors = if not is_binary(title) or String.length(title) < 2 do
      ["title é obrigatório e deve ter pelo menos 2 caracteres" | errors]
    else
      errors
    end

    # Validação do template
    template = attrs[:template] || attrs["template"]
    errors = if not is_binary(template) or String.length(template) < 1 do
      ["template é obrigatório" | errors]
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
  Cria uma nova caixa de design com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      template: attrs[:template],
      css_class: attrs[:css_class] || "",
      icon: attrs[:icon] || "",
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      created_at: attrs[:created_at],
      order_index: attrs[:order_index] || 0
    }
  end

  @doc """
  Verifica se a caixa está ativa.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se a caixa é do sistema.
  """
  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  @doc """
  Verifica se a caixa tem ícone.
  """
  def has_icon?(%__MODULE__{icon: icon}) do
    is_binary(icon) and icon != ""
  end

  @doc """
  Verifica se a caixa tem classes CSS.
  """
  def has_css_class?(%__MODULE__{css_class: css_class}) do
    is_binary(css_class) and css_class != ""
  end

  @doc """
  Retorna o caminho completo do template.
  """
  def template_path(%__MODULE__{template: template}, base_path \\ "templates/design_boxes/") do
    if String.starts_with?(template, "/") do
      template
    else
      Path.join(base_path, template)
    end
  end

  @doc """
  Retorna as classes CSS como lista.
  """
  def css_classes(%__MODULE__{css_class: css_class}) when is_binary(css_class) and css_class != "" do
    css_class
    |> String.split(" ")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
  end
  def css_classes(_), do: []

  @doc """
  Verifica se é uma caixa sem decoração.
  """
  def none?(%__MODULE__{name: "none"}), do: true
  def none?(_), do: false

  @doc """
  Verifica se é uma caixa do tipo card.
  """
  def card?(%__MODULE__{name: "card"}), do: true
  def card?(_), do: false

  @doc """
  Verifica se é uma caixa do tipo painel.
  """
  def panel?(%__MODULE__{name: "panel"}), do: true
  def panel?(_), do: false

  @doc """
  Verifica se é uma caixa do tipo well.
  """
  def well?(%__MODULE__{name: "well"}), do: true
  def well?(_), do: false

  @doc """
  Verifica se é uma caixa do tipo alerta.
  """
  def alert?(%__MODULE__{name: name}) do
    String.starts_with?(name, "alert_")
  end

  @doc """
  Retorna o tipo de alerta se for uma caixa de alerta.
  """
  def alert_type(%__MODULE__{name: name}) do
    case name do
      "alert_info" -> :info
      "alert_success" -> :success
      "alert_warning" -> :warning
      "alert_danger" -> :danger
      _ -> nil
    end
  end

  @doc """
  Retorna informações resumidas da caixa.
  """
  def summary(%__MODULE__{} = design_box) do
    %{
      id: design_box.id,
      name: design_box.name,
      title: design_box.title,
      is_active: design_box.is_active,
      is_system: design_box.is_system,
      has_icon: has_icon?(design_box),
      has_css_class: has_css_class?(design_box),
      is_alert: alert?(design_box)
    }
  end

  @doc """
  Retorna características visuais da caixa.
  """
  def visual_characteristics(%__MODULE__{name: name}) do
    case name do
      "none" ->
        %{
          has_border: false,
          has_shadow: false,
          has_background: false,
          padding: :none
        }
      "card" ->
        %{
          has_border: true,
          has_shadow: true,
          has_background: true,
          padding: :medium
        }
      "panel" ->
        %{
          has_border: true,
          has_shadow: false,
          has_background: true,
          padding: :medium
        }
      "well" ->
        %{
          has_border: false,
          has_shadow: false,
          has_background: true,
          padding: :large
        }
      name when name in ["alert_info", "alert_success", "alert_warning", "alert_danger"] ->
        %{
          has_border: true,
          has_shadow: false,
          has_background: true,
          padding: :medium
        }
      _ ->
        %{
          has_border: false,
          has_shadow: false,
          has_background: false,
          padding: :small
        }
    end
  end

  @doc """
  Verifica se a caixa tem bordas.
  """
  def has_border?(%__MODULE__{} = design_box) do
    characteristics = visual_characteristics(design_box)
    characteristics.has_border
  end

  @doc """
  Verifica se a caixa tem sombra.
  """
  def has_shadow?(%__MODULE__{} = design_box) do
    characteristics = visual_characteristics(design_box)
    characteristics.has_shadow
  end

  @doc """
  Verifica se a caixa tem fundo.
  """
  def has_background?(%__MODULE__{} = design_box) do
    characteristics = visual_characteristics(design_box)
    characteristics.has_background
  end

  @doc """
  Retorna o nível de padding da caixa.
  """
  def padding_level(%__MODULE__{} = design_box) do
    characteristics = visual_characteristics(design_box)
    characteristics.padding
  end
end
