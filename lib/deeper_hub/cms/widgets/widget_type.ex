defmodule DeeperHub.CMS.Widgets.WidgetType do
  @moduledoc """
  Schema para tipos de widget do sistema usando db_connection.
  Representa diferentes tipos de widgets disponíveis.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_widget_types"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para tipos de widget.
  """
  defstruct [
    :id, :name, :title, :description, :category, :template, :icon, :preview_image,
    :has_settings, :has_content, :is_cacheable, :cache_lifetime, :supported_positions,
    :min_width, :max_width, :is_active, :is_system, :created_at, :order_index
  ]

  @doc """
  Valida dados do tipo de widget.
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

    # Validação da category
    category = attrs[:category] || attrs["category"]
    valid_categories = ["general", "content", "navigation", "social", "contact", "forms", "media", "tools", "stats"]
    errors = if category && not Enum.member?(valid_categories, category) do
      ["category deve ser uma das seguintes: #{Enum.join(valid_categories, ", ")}" | errors]
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
  Cria um novo tipo de widget com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      category: attrs[:category] || "general",
      template: attrs[:template],
      icon: attrs[:icon] || "",
      preview_image: attrs[:preview_image] || "",
      has_settings: attrs[:has_settings] || true,
      has_content: attrs[:has_content] || true,
      is_cacheable: attrs[:is_cacheable] || true,
      cache_lifetime: attrs[:cache_lifetime] || 3600,
      supported_positions: attrs[:supported_positions] || "",
      min_width: attrs[:min_width] || 0,
      max_width: attrs[:max_width] || 0,
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
  Verifica se o tipo tem configurações.
  """
  def has_settings?(%__MODULE__{has_settings: true}), do: true
  def has_settings?(_), do: false

  @doc """
  Verifica se o tipo tem conteúdo.
  """
  def has_content?(%__MODULE__{has_content: true}), do: true
  def has_content?(_), do: false

  @doc """
  Verifica se o tipo é cacheável.
  """
  def cacheable?(%__MODULE__{is_cacheable: true}), do: true
  def cacheable?(_), do: false

  @doc """
  Verifica se o tipo tem ícone.
  """
  def has_icon?(%__MODULE__{icon: icon}) do
    is_binary(icon) and icon != ""
  end

  @doc """
  Verifica se o tipo tem imagem de preview.
  """
  def has_preview_image?(%__MODULE__{preview_image: image}) do
    is_binary(image) and image != ""
  end

  @doc """
  Retorna o caminho completo do template.
  """
  def template_path(%__MODULE__{template: template}, base_path \\ "templates/widget_types/") do
    if String.starts_with?(template, "/") do
      template
    else
      Path.join(base_path, template)
    end
  end

  @doc """
  Retorna as posições suportadas como lista.
  """
  def supported_positions_list(%__MODULE__{supported_positions: positions}) when is_binary(positions) and positions != "" do
    case Jason.decode(positions) do
      {:ok, list} when is_list(list) -> list
      {:error, _} -> []
    end
  end
  def supported_positions_list(_), do: []

  @doc """
  Verifica se o tipo suporta uma posição específica.
  """
  def supports_position?(%__MODULE__{} = widget_type, position) do
    position in supported_positions_list(widget_type)
  end

  @doc """
  Verifica se tem restrições de largura.
  """
  def has_width_restrictions?(%__MODULE__{min_width: min, max_width: max}) do
    min > 0 or max > 0
  end

  @doc """
  Retorna informações de largura.
  """
  def width_info(%__MODULE__{min_width: min, max_width: max}) do
    %{
      has_restrictions: min > 0 or max > 0,
      min_width: min,
      max_width: max,
      flexible: min == 0 and max == 0
    }
  end

  @doc """
  Retorna informações de cache.
  """
  def cache_info(%__MODULE__{is_cacheable: cacheable, cache_lifetime: lifetime}) do
    %{
      enabled: cacheable,
      lifetime_seconds: if(cacheable, do: lifetime, else: 0),
      lifetime_minutes: if(cacheable and lifetime > 0, do: lifetime / 60, else: 0)
    }
  end

  @doc """
  Verifica se é da categoria de conteúdo.
  """
  def content_category?(%__MODULE__{category: "content"}), do: true
  def content_category?(_), do: false

  @doc """
  Verifica se é da categoria de navegação.
  """
  def navigation_category?(%__MODULE__{category: "navigation"}), do: true
  def navigation_category?(_), do: false

  @doc """
  Verifica se é da categoria social.
  """
  def social_category?(%__MODULE__{category: "social"}), do: true
  def social_category?(_), do: false

  @doc """
  Verifica se é da categoria de mídia.
  """
  def media_category?(%__MODULE__{category: "media"}), do: true
  def media_category?(_), do: false

  @doc """
  Verifica se é da categoria de ferramentas.
  """
  def tools_category?(%__MODULE__{category: "tools"}), do: true
  def tools_category?(_), do: false

  @doc """
  Verifica se é da categoria de formulários.
  """
  def forms_category?(%__MODULE__{category: "forms"}), do: true
  def forms_category?(_), do: false

  @doc """
  Verifica se é da categoria de estatísticas.
  """
  def stats_category?(%__MODULE__{category: "stats"}), do: true
  def stats_category?(_), do: false

  @doc """
  Retorna características da categoria.
  """
  def category_characteristics(%__MODULE__{category: category}) do
    case category do
      "content" ->
        %{
          typical_positions: ["content", "sidebar"],
          requires_content: true,
          supports_html: true,
          default_cache: 3600
        }
      "navigation" ->
        %{
          typical_positions: ["header", "sidebar", "footer"],
          requires_content: false,
          supports_html: false,
          default_cache: 7200
        }
      "social" ->
        %{
          typical_positions: ["sidebar", "header", "footer"],
          requires_content: true,
          supports_html: true,
          default_cache: 86400
        }
      "media" ->
        %{
          typical_positions: ["content", "sidebar"],
          requires_content: true,
          supports_html: true,
          default_cache: 3600
        }
      "tools" ->
        %{
          typical_positions: ["sidebar", "header"],
          requires_content: false,
          supports_html: false,
          default_cache: 1800
        }
      "forms" ->
        %{
          typical_positions: ["sidebar", "footer"],
          requires_content: true,
          supports_html: true,
          default_cache: 0
        }
      "stats" ->
        %{
          typical_positions: ["content", "sidebar"],
          requires_content: true,
          supports_html: true,
          default_cache: 3600
        }
      _ ->
        %{
          typical_positions: ["sidebar"],
          requires_content: true,
          supports_html: true,
          default_cache: 3600
        }
    end
  end

  @doc """
  Retorna informações resumidas do tipo.
  """
  def summary(%__MODULE__{} = widget_type) do
    %{
      id: widget_type.id,
      name: widget_type.name,
      title: widget_type.title,
      category: widget_type.category,
      is_active: widget_type.is_active,
      is_system: widget_type.is_system,
      has_settings: widget_type.has_settings,
      has_content: widget_type.has_content,
      is_cacheable: widget_type.is_cacheable,
      has_icon: has_icon?(widget_type),
      has_preview: has_preview_image?(widget_type),
      supported_positions: supported_positions_list(widget_type),
      has_width_restrictions: has_width_restrictions?(widget_type)
    }
  end

  @doc """
  Retorna sugestões de uso baseadas no tipo.
  """
  def usage_suggestions(%__MODULE__{name: name, category: category}) do
    base_suggestions = case category do
      "content" -> ["Adicione texto rico", "Insira imagens", "Configure formatação"]
      "navigation" -> ["Configure menu", "Defina links", "Organize hierarquia"]
      "social" -> ["Adicione links sociais", "Configure compartilhamento", "Defina perfis"]
      "media" -> ["Insira imagens", "Adicione vídeos", "Configure galeria"]
      "tools" -> ["Configure funcionalidade", "Defina parâmetros", "Teste comportamento"]
      "forms" -> ["Configure campos", "Defina validações", "Configure envio"]
      "stats" -> ["Configure métricas", "Defina visualização", "Configure atualização"]
      _ -> ["Configure widget", "Defina conteúdo", "Teste funcionalidade"]
    end

    # Sugestões específicas por nome
    name_suggestions = case name do
      "html" -> ["Use HTML válido", "Evite scripts maliciosos", "Teste responsividade"]
      "menu" -> ["Organize itens logicamente", "Use hierarquia clara", "Teste navegação"]
      "search" -> ["Configure índices", "Defina filtros", "Teste relevância"]
      "gallery" -> ["Otimize imagens", "Configure thumbnails", "Teste carregamento"]
      "video" -> ["Use formatos compatíveis", "Configure controles", "Teste reprodução"]
      "newsletter" -> ["Configure SMTP", "Defina templates", "Teste envio"]
      _ -> []
    end

    base_suggestions ++ name_suggestions
  end
end
