defmodule DeeperHub.CMS.Pages.ContentPlaceholder do
  @moduledoc """
  Schema para placeholders de conteúdo do sistema usando db_connection.
  Representa áreas predefinidas onde o conteúdo pode ser inserido.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_content_placeholders"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para placeholders de conteúdo.
  """
  defstruct [
    :id, :name, :title, :description, :module, :template, :placeholder_type,
    :default_content, :is_active, :is_system, :created_at, :order_index
  ]

  @doc """
  Valida dados do placeholder.
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

    # Validação do placeholder_type
    placeholder_type = attrs[:placeholder_type] || attrs["placeholder_type"]
    valid_types = ["content", "widget", "menu", "form", "media", "navigation"]
    errors = if placeholder_type && not Enum.member?(valid_types, placeholder_type) do
      ["placeholder_type deve ser um dos seguintes: #{Enum.join(valid_types, ", ")}" | errors]
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
  Cria um novo placeholder com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      module: attrs[:module] || "cms",
      template: attrs[:template],
      placeholder_type: attrs[:placeholder_type] || "content",
      default_content: attrs[:default_content] || "",
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      created_at: attrs[:created_at],
      order_index: attrs[:order_index] || 0
    }
  end

  @doc """
  Verifica se o placeholder está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se o placeholder é do sistema.
  """
  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  @doc """
  Verifica se o placeholder tem conteúdo padrão.
  """
  def has_default_content?(%__MODULE__{default_content: content}) do
    is_binary(content) and String.trim(content) != ""
  end

  @doc """
  Retorna o caminho completo do template.
  """
  def template_path(%__MODULE__{template: template}, base_path \\ "templates/placeholders/") do
    if String.starts_with?(template, "/") do
      template
    else
      Path.join(base_path, template)
    end
  end

  @doc """
  Verifica se é um placeholder de conteúdo.
  """
  def content_type?(%__MODULE__{placeholder_type: "content"}), do: true
  def content_type?(_), do: false

  @doc """
  Verifica se é um placeholder de widget.
  """
  def widget_type?(%__MODULE__{placeholder_type: "widget"}), do: true
  def widget_type?(_), do: false

  @doc """
  Verifica se é um placeholder de menu.
  """
  def menu_type?(%__MODULE__{placeholder_type: "menu"}), do: true
  def menu_type?(_), do: false

  @doc """
  Verifica se é um placeholder de formulário.
  """
  def form_type?(%__MODULE__{placeholder_type: "form"}), do: true
  def form_type?(_), do: false

  @doc """
  Verifica se é um placeholder de mídia.
  """
  def media_type?(%__MODULE__{placeholder_type: "media"}), do: true
  def media_type?(_), do: false

  @doc """
  Verifica se é um placeholder de navegação.
  """
  def navigation_type?(%__MODULE__{placeholder_type: "navigation"}), do: true
  def navigation_type?(_), do: false

  @doc """
  Retorna características do tipo de placeholder.
  """
  def type_characteristics(%__MODULE__{placeholder_type: type}) do
    case type do
      "content" ->
        %{
          allows_html: true,
          allows_widgets: false,
          cacheable: true,
          editable: true,
          supports_media: true
        }
      "widget" ->
        %{
          allows_html: false,
          allows_widgets: true,
          cacheable: false,
          editable: false,
          supports_media: false
        }
      "menu" ->
        %{
          allows_html: false,
          allows_widgets: false,
          cacheable: true,
          editable: false,
          supports_media: false
        }
      "form" ->
        %{
          allows_html: false,
          allows_widgets: false,
          cacheable: false,
          editable: false,
          supports_media: false
        }
      "media" ->
        %{
          allows_html: false,
          allows_widgets: false,
          cacheable: true,
          editable: true,
          supports_media: true
        }
      "navigation" ->
        %{
          allows_html: false,
          allows_widgets: false,
          cacheable: true,
          editable: false,
          supports_media: false
        }
      _ ->
        %{
          allows_html: true,
          allows_widgets: false,
          cacheable: true,
          editable: true,
          supports_media: false
        }
    end
  end

  @doc """
  Verifica se o placeholder permite HTML.
  """
  def allows_html?(%__MODULE__{} = placeholder) do
    characteristics = type_characteristics(placeholder)
    characteristics.allows_html
  end

  @doc """
  Verifica se o placeholder permite widgets.
  """
  def allows_widgets?(%__MODULE__{} = placeholder) do
    characteristics = type_characteristics(placeholder)
    characteristics.allows_widgets
  end

  @doc """
  Verifica se o placeholder é cacheável.
  """
  def cacheable?(%__MODULE__{} = placeholder) do
    characteristics = type_characteristics(placeholder)
    characteristics.cacheable
  end

  @doc """
  Verifica se o placeholder é editável.
  """
  def editable?(%__MODULE__{} = placeholder) do
    characteristics = type_characteristics(placeholder)
    characteristics.editable
  end

  @doc """
  Verifica se o placeholder suporta mídia.
  """
  def supports_media?(%__MODULE__{} = placeholder) do
    characteristics = type_characteristics(placeholder)
    characteristics.supports_media
  end

  @doc """
  Retorna informações resumidas do placeholder.
  """
  def summary(%__MODULE__{} = placeholder) do
    %{
      id: placeholder.id,
      name: placeholder.name,
      title: placeholder.title,
      placeholder_type: placeholder.placeholder_type,
      is_active: placeholder.is_active,
      is_system: placeholder.is_system,
      has_default_content: has_default_content?(placeholder),
      allows_html: allows_html?(placeholder),
      allows_widgets: allows_widgets?(placeholder),
      cacheable: cacheable?(placeholder)
    }
  end

  @doc """
  Retorna sugestões de uso baseadas no tipo.
  """
  def usage_suggestions(%__MODULE__{placeholder_type: type, name: name}) do
    base_suggestions = case type do
      "content" ->
        ["Adicione texto rico", "Insira imagens", "Crie listas", "Adicione links"]
      "widget" ->
        ["Adicione widgets dinâmicos", "Configure componentes interativos"]
      "menu" ->
        ["Configure menu de navegação", "Defina estrutura hierárquica"]
      "form" ->
        ["Adicione formulários de contato", "Configure campos de entrada"]
      "media" ->
        ["Insira imagens", "Adicione vídeos", "Configure galeria"]
      "navigation" ->
        ["Configure breadcrumbs", "Adicione links de navegação"]
      _ ->
        ["Configure conteúdo personalizado"]
    end

    # Adicionar sugestões específicas baseadas no nome
    name_suggestions = case name do
      "header" -> ["Adicione logo", "Configure menu principal", "Adicione informações de contato"]
      "footer" -> ["Adicione informações da empresa", "Configure links úteis", "Adicione redes sociais"]
      "sidebar" -> ["Adicione widgets", "Configure menu lateral", "Adicione banners"]
      "main_content" -> ["Adicione conteúdo principal", "Configure seções", "Adicione call-to-actions"]
      _ -> []
    end

    base_suggestions ++ name_suggestions
  end
end
