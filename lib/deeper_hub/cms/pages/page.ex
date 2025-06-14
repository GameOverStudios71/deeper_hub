defmodule DeeperHub.CMS.Pages.Page do
  @moduledoc """
  Schema para páginas do sistema usando db_connection.
  Representa páginas do CMS com todas as configurações e metadados.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_pages"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para páginas.
  """
  defstruct [
    :id, :name, :uri, :title_system, :title, :description, :module,
    :page_type_id, :layout_id, :meta_title, :meta_description, :meta_keywords,
    :meta_robots, :is_active, :is_system, :is_home, :sticky_columns,
    :cache_lifetime, :cache_editable, :visible_for_levels, :visible_for_levels_editable,
    :inject_head, :inject_footer, :config_api, :custom_css, :custom_js,
    :author_id, :is_deletable, :is_editable, :created_at, :updated_at, :published_at,
    :page_type_title, :layout_title
  ]

  @doc """
  Valida dados da página.
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

    # Validação do uri
    uri = attrs[:uri] || attrs["uri"]
    errors = if not is_binary(uri) or String.length(uri) < 1 do
      ["uri é obrigatório" | errors]
    else
      # Validar formato da URI
      if not String.match?(uri, ~r/^\/[a-zA-Z0-9\-_\/]*$/) do
        ["uri deve começar com / e conter apenas letras, números, hífens e underscores" | errors]
      else
        errors
      end
    end

    # Validação do title_system
    title_system = attrs[:title_system] || attrs["title_system"]
    errors = if not is_binary(title_system) or String.length(title_system) < 2 do
      ["title_system é obrigatório e deve ter pelo menos 2 caracteres" | errors]
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

    # Validação dos IDs de relacionamento
    page_type_id = attrs[:page_type_id] || attrs["page_type_id"]
    errors = if page_type_id && not is_integer(page_type_id) do
      ["page_type_id deve ser um número inteiro" | errors]
    else
      errors
    end

    layout_id = attrs[:layout_id] || attrs["layout_id"]
    errors = if layout_id && not is_integer(layout_id) do
      ["layout_id deve ser um número inteiro" | errors]
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
  Cria uma nova página com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      uri: attrs[:uri],
      title_system: attrs[:title_system],
      title: attrs[:title],
      description: attrs[:description] || "",
      module: attrs[:module] || "cms",
      page_type_id: attrs[:page_type_id] || 1,
      layout_id: attrs[:layout_id] || 1,
      meta_title: attrs[:meta_title] || "",
      meta_description: attrs[:meta_description] || "",
      meta_keywords: attrs[:meta_keywords] || "",
      meta_robots: attrs[:meta_robots] || "index,follow",
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      is_home: attrs[:is_home] || false,
      sticky_columns: attrs[:sticky_columns] || false,
      cache_lifetime: attrs[:cache_lifetime] || 0,
      cache_editable: attrs[:cache_editable] || true,
      visible_for_levels: attrs[:visible_for_levels] || 2147483647,
      visible_for_levels_editable: attrs[:visible_for_levels_editable] || true,
      inject_head: attrs[:inject_head] || "",
      inject_footer: attrs[:inject_footer] || "",
      config_api: attrs[:config_api] || "",
      custom_css: attrs[:custom_css] || "",
      custom_js: attrs[:custom_js] || "",
      author_id: attrs[:author_id],
      is_deletable: attrs[:is_deletable] || true,
      is_editable: attrs[:is_editable] || true,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at],
      published_at: attrs[:published_at],
      page_type_title: attrs[:page_type_title],
      layout_title: attrs[:layout_title]
    }
  end

  @doc """
  Verifica se a página é a página inicial.
  """
  def home?(%__MODULE__{is_home: true}), do: true
  def home?(_), do: false

  @doc """
  Verifica se a página está ativa.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se a página é do sistema.
  """
  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  @doc """
  Verifica se a página é editável.
  """
  def editable?(%__MODULE__{is_editable: true}), do: true
  def editable?(_), do: false

  @doc """
  Verifica se a página é deletável.
  """
  def deletable?(%__MODULE__{is_deletable: true}), do: true
  def deletable?(_), do: false

  @doc """
  Verifica se a página está publicada.
  """
  def published?(%__MODULE__{published_at: nil}), do: false
  def published?(%__MODULE__{published_at: published_at}) do
    case DateTime.from_iso8601(published_at) do
      {:ok, datetime, _} -> DateTime.compare(datetime, DateTime.utc_now()) != :gt
      _ -> false
    end
  end

  @doc """
  Retorna a URL completa da página.
  """
  def full_url(%__MODULE__{uri: uri}, base_url \\ "") do
    if String.starts_with?(uri, "/") do
      base_url <> uri
    else
      base_url <> "/" <> uri
    end
  end

  @doc """
  Retorna o título para SEO (meta_title ou title).
  """
  def seo_title(%__MODULE__{meta_title: meta_title, title: title}) do
    if meta_title != "" and not is_nil(meta_title) do
      meta_title
    else
      title
    end
  end

  @doc """
  Retorna a descrição para SEO.
  """
  def seo_description(%__MODULE__{meta_description: meta_description, description: description}) do
    if meta_description != "" and not is_nil(meta_description) do
      meta_description
    else
      description
    end
  end

  @doc """
  Verifica se a página tem CSS customizado.
  """
  def has_custom_css?(%__MODULE__{custom_css: css}) do
    is_binary(css) and css != ""
  end

  @doc """
  Verifica se a página tem JavaScript customizado.
  """
  def has_custom_js?(%__MODULE__{custom_js: js}) do
    is_binary(js) and js != ""
  end

  @doc """
  Verifica se a página tem injeção de código no head.
  """
  def has_head_injection?(%__MODULE__{inject_head: head}) do
    is_binary(head) and head != ""
  end

  @doc """
  Verifica se a página tem injeção de código no footer.
  """
  def has_footer_injection?(%__MODULE__{inject_footer: footer}) do
    is_binary(footer) and footer != ""
  end

  @doc """
  Retorna informações de cache da página.
  """
  def cache_info(%__MODULE__{cache_lifetime: lifetime, cache_editable: editable}) do
    %{
      enabled: lifetime > 0,
      lifetime: lifetime,
      editable: editable
    }
  end
end
