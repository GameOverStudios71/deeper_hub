defmodule DeeperHub.CMS.Pages.PageBlock do
  @moduledoc """
  Schema para blocos de página do sistema usando db_connection.
  Representa blocos de conteúdo dentro das páginas.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_page_blocks"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para blocos de página.
  """
  defstruct [
    :id, :page_id, :cell_id, :module, :name, :title_system, :title, :description,
    :type, :content, :content_empty, :design_box_id, :css_class, :custom_css,
    :is_active, :is_async, :tabs, :visible_for_levels, :hidden_on, :cache_lifetime,
    :config_api, :help, :is_deletable, :is_copyable, :is_editable, :order_index,
    :created_at, :updated_at
  ]

  @doc """
  Valida dados do bloco de página.
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

    # Validação do page_id
    page_id = attrs[:page_id] || attrs["page_id"]
    errors = if not is_integer(page_id) or page_id <= 0 do
      ["page_id é obrigatório e deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    # Validação do name
    name = attrs[:name] || attrs["name"]
    errors = if not is_binary(name) or String.length(name) < 2 do
      ["name é obrigatório e deve ter pelo menos 2 caracteres" | errors]
    else
      errors
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

    # Validação do type
    type = attrs[:type] || attrs["type"]
    valid_types = ["html", "widget", "service", "menu", "form", "text", "image", "video"]
    errors = if type && not Enum.member?(valid_types, type) do
      ["type deve ser um dos seguintes: #{Enum.join(valid_types, ", ")}" | errors]
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
  Cria um novo bloco com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      page_id: attrs[:page_id],
      cell_id: attrs[:cell_id] || 1,
      module: attrs[:module] || "cms",
      name: attrs[:name],
      title_system: attrs[:title_system],
      title: attrs[:title],
      description: attrs[:description] || "",
      type: attrs[:type] || "html",
      content: attrs[:content] || "",
      content_empty: attrs[:content_empty] || "",
      design_box_id: attrs[:design_box_id] || 1,
      css_class: attrs[:css_class] || "",
      custom_css: attrs[:custom_css] || "",
      is_active: attrs[:is_active] || true,
      is_async: attrs[:is_async] || false,
      tabs: attrs[:tabs] || false,
      visible_for_levels: attrs[:visible_for_levels] || 2147483647,
      hidden_on: attrs[:hidden_on] || "",
      cache_lifetime: attrs[:cache_lifetime] || 0,
      config_api: attrs[:config_api] || "",
      help: attrs[:help] || "",
      is_deletable: attrs[:is_deletable] || true,
      is_copyable: attrs[:is_copyable] || true,
      is_editable: attrs[:is_editable] || true,
      order_index: attrs[:order_index] || 0,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at]
    }
  end

  @doc """
  Verifica se o bloco está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se o bloco é assíncrono.
  """
  def async?(%__MODULE__{is_async: true}), do: true
  def async?(_), do: false

  @doc """
  Verifica se o bloco tem abas.
  """
  def has_tabs?(%__MODULE__{tabs: true}), do: true
  def has_tabs?(_), do: false

  @doc """
  Verifica se o bloco é editável.
  """
  def editable?(%__MODULE__{is_editable: true}), do: true
  def editable?(_), do: false

  @doc """
  Verifica se o bloco é deletável.
  """
  def deletable?(%__MODULE__{is_deletable: true}), do: true
  def deletable?(_), do: false

  @doc """
  Verifica se o bloco é copiável.
  """
  def copyable?(%__MODULE__{is_copyable: true}), do: true
  def copyable?(_), do: false

  @doc """
  Verifica se o bloco tem conteúdo.
  """
  def has_content?(%__MODULE__{content: content}) do
    is_binary(content) and String.trim(content) != ""
  end

  @doc """
  Verifica se o bloco tem CSS customizado.
  """
  def has_custom_css?(%__MODULE__{custom_css: css}) do
    is_binary(css) and String.trim(css) != ""
  end

  @doc """
  Verifica se o bloco tem classes CSS.
  """
  def has_css_class?(%__MODULE__{css_class: css_class}) do
    is_binary(css_class) and String.trim(css_class) != ""
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
  Verifica se o bloco está oculto em dispositivos específicos.
  """
  def hidden_on_devices(%__MODULE__{hidden_on: hidden_on}) when is_binary(hidden_on) and hidden_on != "" do
    hidden_on
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
  end
  def hidden_on_devices(_), do: []

  @doc """
  Verifica se o bloco está oculto em um dispositivo específico.
  """
  def hidden_on_device?(%__MODULE__{} = block, device) do
    device in hidden_on_devices(block)
  end

  @doc """
  Retorna informações de cache do bloco.
  """
  def cache_info(%__MODULE__{cache_lifetime: lifetime}) do
    %{
      enabled: lifetime > 0,
      lifetime: lifetime
    }
  end

  @doc """
  Verifica se o cache está habilitado.
  """
  def cache_enabled?(%__MODULE__{cache_lifetime: lifetime}) do
    lifetime > 0
  end

  @doc """
  Retorna a configuração da API como mapa.
  """
  def api_configuration(%__MODULE__{config_api: config}) when is_binary(config) and config != "" do
    case Jason.decode(config) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def api_configuration(_), do: %{}

  @doc """
  Verifica se é um bloco HTML.
  """
  def html_type?(%__MODULE__{type: "html"}), do: true
  def html_type?(_), do: false

  @doc """
  Verifica se é um bloco widget.
  """
  def widget_type?(%__MODULE__{type: "widget"}), do: true
  def widget_type?(_), do: false

  @doc """
  Verifica se é um bloco de serviço.
  """
  def service_type?(%__MODULE__{type: "service"}), do: true
  def service_type?(_), do: false

  @doc """
  Verifica se é um bloco de menu.
  """
  def menu_type?(%__MODULE__{type: "menu"}), do: true
  def menu_type?(_), do: false

  @doc """
  Verifica se é um bloco de formulário.
  """
  def form_type?(%__MODULE__{type: "form"}), do: true
  def form_type?(_), do: false

  @doc """
  Retorna informações resumidas do bloco.
  """
  def summary(%__MODULE__{} = block) do
    %{
      id: block.id,
      name: block.name,
      title: block.title,
      type: block.type,
      cell_id: block.cell_id,
      is_active: block.is_active,
      is_async: block.is_async,
      has_content: has_content?(block),
      cache_enabled: cache_enabled?(block),
      order_index: block.order_index
    }
  end
end
