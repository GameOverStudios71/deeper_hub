defmodule DeeperHub.CMS.Widgets.Widget do
  @moduledoc """
  Schema para widgets do sistema usando db_connection.
  Representa widgets que podem ser inseridos em páginas.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_widgets"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para widgets.
  """
  defstruct [
    :id, :name, :title, :description, :widget_type_id, :module, :template,
    :css_class, :custom_css, :content, :content_type, :config_data, :api_endpoint,
    :refresh_interval, :visible_for_levels, :is_active, :is_featured, :created_at,
    :updated_at, :created_by, :widget_type_title, :widget_type_category
  ]

  @doc """
  Valida dados do widget.
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

    # Validação do widget_type_id
    widget_type_id = attrs[:widget_type_id] || attrs["widget_type_id"]
    errors = if not is_integer(widget_type_id) or widget_type_id <= 0 do
      ["widget_type_id é obrigatório e deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    # Validação do content_type
    content_type = attrs[:content_type] || attrs["content_type"]
    valid_content_types = ["html", "markdown", "text", "json"]
    errors = if content_type && not Enum.member?(valid_content_types, content_type) do
      ["content_type deve ser um dos seguintes: #{Enum.join(valid_content_types, ", ")}" | errors]
    else
      errors
    end

    # Validação do refresh_interval
    refresh_interval = attrs[:refresh_interval] || attrs["refresh_interval"]
    errors = if refresh_interval && (not is_integer(refresh_interval) or refresh_interval < 0) do
      ["refresh_interval deve ser um número inteiro não negativo" | errors]
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
  Cria um novo widget com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      widget_type_id: attrs[:widget_type_id],
      module: attrs[:module] || "cms",
      template: attrs[:template] || "",
      css_class: attrs[:css_class] || "",
      custom_css: attrs[:custom_css] || "",
      content: attrs[:content] || "",
      content_type: attrs[:content_type] || "html",
      config_data: attrs[:config_data] || "",
      api_endpoint: attrs[:api_endpoint] || "",
      refresh_interval: attrs[:refresh_interval] || 0,
      visible_for_levels: attrs[:visible_for_levels] || 2147483647,
      is_active: attrs[:is_active] || true,
      is_featured: attrs[:is_featured] || false,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at],
      created_by: attrs[:created_by],
      widget_type_title: attrs[:widget_type_title],
      widget_type_category: attrs[:widget_type_category]
    }
  end

  @doc """
  Verifica se o widget está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se o widget está em destaque.
  """
  def featured?(%__MODULE__{is_featured: true}), do: true
  def featured?(_), do: false

  @doc """
  Verifica se o widget tem conteúdo.
  """
  def has_content?(%__MODULE__{content: content}) do
    is_binary(content) and String.trim(content) != ""
  end

  @doc """
  Verifica se o widget tem CSS customizado.
  """
  def has_custom_css?(%__MODULE__{custom_css: css}) do
    is_binary(css) and String.trim(css) != ""
  end

  @doc """
  Verifica se o widget tem classes CSS.
  """
  def has_css_class?(%__MODULE__{css_class: css_class}) do
    is_binary(css_class) and String.trim(css_class) != ""
  end

  @doc """
  Verifica se o widget tem template customizado.
  """
  def has_custom_template?(%__MODULE__{template: template}) do
    is_binary(template) and String.trim(template) != ""
  end

  @doc """
  Verifica se o widget tem endpoint de API.
  """
  def has_api_endpoint?(%__MODULE__{api_endpoint: endpoint}) do
    is_binary(endpoint) and String.trim(endpoint) != ""
  end

  @doc """
  Verifica se o widget tem refresh automático.
  """
  def auto_refresh?(%__MODULE__{refresh_interval: interval}) do
    is_integer(interval) and interval > 0
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
  Retorna a configuração como mapa.
  """
  def configuration(%__MODULE__{config_data: config}) when is_binary(config) and config != "" do
    case Jason.decode(config) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def configuration(_), do: %{}

  @doc """
  Verifica se é um widget HTML.
  """
  def html_content?(%__MODULE__{content_type: "html"}), do: true
  def html_content?(_), do: false

  @doc """
  Verifica se é um widget Markdown.
  """
  def markdown_content?(%__MODULE__{content_type: "markdown"}), do: true
  def markdown_content?(_), do: false

  @doc """
  Verifica se é um widget de texto simples.
  """
  def text_content?(%__MODULE__{content_type: "text"}), do: true
  def text_content?(_), do: false

  @doc """
  Verifica se é um widget JSON.
  """
  def json_content?(%__MODULE__{content_type: "json"}), do: true
  def json_content?(_), do: false

  @doc """
  Retorna o caminho completo do template.
  """
  def template_path(%__MODULE__{template: template}, base_path \\ "templates/widgets/") do
    cond do
      template == "" ->
        nil
      String.starts_with?(template, "/") ->
        template
      true ->
        Path.join(base_path, template)
    end
  end

  @doc """
  Retorna informações de refresh do widget.
  """
  def refresh_info(%__MODULE__{refresh_interval: interval}) do
    %{
      enabled: interval > 0,
      interval_seconds: interval,
      interval_minutes: if(interval > 0, do: interval / 60, else: 0)
    }
  end

  @doc """
  Retorna informações resumidas do widget.
  """
  def summary(%__MODULE__{} = widget) do
    %{
      id: widget.id,
      name: widget.name,
      title: widget.title,
      widget_type_id: widget.widget_type_id,
      widget_type_title: widget.widget_type_title,
      widget_type_category: widget.widget_type_category,
      is_active: widget.is_active,
      is_featured: widget.is_featured,
      has_content: has_content?(widget),
      has_custom_css: has_custom_css?(widget),
      has_api_endpoint: has_api_endpoint?(widget),
      auto_refresh: auto_refresh?(widget),
      content_type: widget.content_type
    }
  end

  @doc """
  Retorna características do widget baseadas no tipo de conteúdo.
  """
  def content_characteristics(%__MODULE__{content_type: type}) do
    case type do
      "html" ->
        %{
          supports_formatting: true,
          supports_media: true,
          supports_links: true,
          requires_sanitization: true,
          cacheable: true
        }
      "markdown" ->
        %{
          supports_formatting: true,
          supports_media: true,
          supports_links: true,
          requires_sanitization: false,
          cacheable: true
        }
      "text" ->
        %{
          supports_formatting: false,
          supports_media: false,
          supports_links: false,
          requires_sanitization: false,
          cacheable: true
        }
      "json" ->
        %{
          supports_formatting: false,
          supports_media: false,
          supports_links: false,
          requires_sanitization: false,
          cacheable: false
        }
      _ ->
        %{
          supports_formatting: false,
          supports_media: false,
          supports_links: false,
          requires_sanitization: true,
          cacheable: true
        }
    end
  end

  @doc """
  Verifica se o conteúdo suporta formatação.
  """
  def supports_formatting?(%__MODULE__{} = widget) do
    characteristics = content_characteristics(widget)
    characteristics.supports_formatting
  end

  @doc """
  Verifica se o conteúdo suporta mídia.
  """
  def supports_media?(%__MODULE__{} = widget) do
    characteristics = content_characteristics(widget)
    characteristics.supports_media
  end

  @doc """
  Verifica se o conteúdo requer sanitização.
  """
  def requires_sanitization?(%__MODULE__{} = widget) do
    characteristics = content_characteristics(widget)
    characteristics.requires_sanitization
  end

  @doc """
  Verifica se o widget é cacheável.
  """
  def cacheable?(%__MODULE__{} = widget) do
    characteristics = content_characteristics(widget)
    characteristics.cacheable and not auto_refresh?(widget)
  end
end
