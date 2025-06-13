defmodule DeeperHub.CMS.Pages.PageType do
  @moduledoc """
  Schema para tipos de página do sistema usando db_connection.
  Representa diferentes tipos de páginas (padrão, home, blog, etc.).
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_page_types"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para tipos de página.
  """
  defstruct [
    :id, :name, :title, :description, :template, :icon, :is_active,
    :is_system, :created_at, :order_index
  ]

  @doc """
  Valida dados do tipo de página.
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
  Cria um novo tipo de página com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      template: attrs[:template],
      icon: attrs[:icon] || "",
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      created_at: attrs[:created_at],
      order_index: attrs[:order_index] || 0
    }
  end

  @doc """
  Verifica se o tipo está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se o tipo é do sistema.
  """
  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  @doc """
  Verifica se o tipo tem ícone.
  """
  def has_icon?(%__MODULE__{icon: icon}) do
    is_binary(icon) and icon != ""
  end

  @doc """
  Retorna o caminho completo do template.
  """
  def template_path(%__MODULE__{template: template}, base_path \\ "templates/pages/") do
    if String.starts_with?(template, "/") do
      template
    else
      Path.join(base_path, template)
    end
  end

  @doc """
  Verifica se é o tipo padrão.
  """
  def standard?(%__MODULE__{name: "standard"}), do: true
  def standard?(_), do: false

  @doc """
  Verifica se é o tipo home.
  """
  def home_type?(%__MODULE__{name: "home"}), do: true
  def home_type?(_), do: false

  @doc """
  Verifica se é o tipo blog.
  """
  def blog_type?(%__MODULE__{name: "blog"}), do: true
  def blog_type?(_), do: false

  @doc """
  Verifica se é o tipo landing page.
  """
  def landing_type?(%__MODULE__{name: "landing"}), do: true
  def landing_type?(_), do: false

  @doc """
  Verifica se é o tipo contato.
  """
  def contact_type?(%__MODULE__{name: "contact"}), do: true
  def contact_type?(_), do: false

  @doc """
  Verifica se é o tipo sobre.
  """
  def about_type?(%__MODULE__{name: "about"}), do: true
  def about_type?(_), do: false

  @doc """
  Retorna informações resumidas do tipo.
  """
  def summary(%__MODULE__{} = page_type) do
    %{
      id: page_type.id,
      name: page_type.name,
      title: page_type.title,
      is_active: page_type.is_active,
      is_system: page_type.is_system,
      has_icon: has_icon?(page_type)
    }
  end

  @doc """
  Retorna características especiais do tipo de página.
  """
  def characteristics(%__MODULE__{name: name}) do
    case name do
      "home" ->
        %{
          unique: true,
          seo_important: true,
          cache_recommended: true,
          special_features: ["hero_section", "featured_content"]
        }
      "blog" ->
        %{
          unique: false,
          seo_important: true,
          cache_recommended: false,
          special_features: ["post_listing", "pagination", "categories"]
        }
      "landing" ->
        %{
          unique: false,
          seo_important: true,
          cache_recommended: true,
          special_features: ["conversion_tracking", "a_b_testing", "forms"]
        }
      "contact" ->
        %{
          unique: true,
          seo_important: false,
          cache_recommended: false,
          special_features: ["contact_form", "map_integration", "business_info"]
        }
      "about" ->
        %{
          unique: true,
          seo_important: true,
          cache_recommended: true,
          special_features: ["team_section", "company_history", "values"]
        }
      _ ->
        %{
          unique: false,
          seo_important: false,
          cache_recommended: true,
          special_features: []
        }
    end
  end

  @doc """
  Verifica se o tipo permite múltiplas páginas.
  """
  def allows_multiple?(%__MODULE__{} = page_type) do
    characteristics = characteristics(page_type)
    not characteristics.unique
  end

  @doc """
  Verifica se o tipo é importante para SEO.
  """
  def seo_important?(%__MODULE__{} = page_type) do
    characteristics = characteristics(page_type)
    characteristics.seo_important
  end

  @doc """
  Verifica se o cache é recomendado para este tipo.
  """
  def cache_recommended?(%__MODULE__{} = page_type) do
    characteristics = characteristics(page_type)
    characteristics.cache_recommended
  end

  @doc """
  Retorna as funcionalidades especiais do tipo.
  """
  def special_features(%__MODULE__{} = page_type) do
    characteristics = characteristics(page_type)
    characteristics.special_features
  end
end
