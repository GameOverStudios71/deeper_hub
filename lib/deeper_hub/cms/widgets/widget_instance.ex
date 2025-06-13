defmodule DeeperHub.CMS.Widgets.WidgetInstance do
  @moduledoc """
  Schema para instâncias de widget do sistema usando db_connection.
  Representa widgets inseridos em páginas específicas.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_widget_instances"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para instâncias de widget.
  """
  defstruct [
    :id, :widget_id, :page_id, :position, :cell_id, :order_index, :instance_title,
    :instance_config, :custom_css, :design_box_id, :show_title, :is_active,
    :is_collapsed, :visible_for_levels, :hidden_on, :cache_lifetime, :created_at, :updated_at
  ]

  @doc """
  Valida dados da instância de widget.
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

    # Validação da position
    position = attrs[:position] || attrs["position"]
    valid_positions = ["sidebar", "header", "footer", "content", "left", "right", "top", "bottom"]
    errors = if not is_binary(position) or not Enum.member?(valid_positions, position) do
      ["position deve ser uma das seguintes: #{Enum.join(valid_positions, ", ")}" | errors]
    else
      errors
    end

    # Validação do cell_id
    cell_id = attrs[:cell_id] || attrs["cell_id"]
    errors = if cell_id && (not is_integer(cell_id) or cell_id <= 0) do
      ["cell_id deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    # Validação do order_index
    order_index = attrs[:order_index] || attrs["order_index"]
    errors = if order_index && (not is_integer(order_index) or order_index < 0) do
      ["order_index deve ser um número inteiro não negativo" | errors]
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
  Cria uma nova instância de widget com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      widget_id: attrs[:widget_id],
      page_id: attrs[:page_id],
      position: attrs[:position] || "sidebar",
      cell_id: attrs[:cell_id] || 1,
      order_index: attrs[:order_index] || 0,
      instance_title: attrs[:instance_title] || "",
      instance_config: attrs[:instance_config] || "",
      custom_css: attrs[:custom_css] || "",
      design_box_id: attrs[:design_box_id] || 1,
      show_title: attrs[:show_title] || true,
      is_active: attrs[:is_active] || true,
      is_collapsed: attrs[:is_collapsed] || false,
      visible_for_levels: attrs[:visible_for_levels],
      hidden_on: attrs[:hidden_on] || "",
      cache_lifetime: attrs[:cache_lifetime],
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at]
    }
  end

  @doc """
  Verifica se a instância está ativa.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se a instância está colapsada.
  """
  def collapsed?(%__MODULE__{is_collapsed: true}), do: true
  def collapsed?(_), do: false

  @doc """
  Verifica se deve mostrar o título.
  """
  def show_title?(%__MODULE__{show_title: true}), do: true
  def show_title?(_), do: false

  @doc """
  Verifica se tem título personalizado.
  """
  def has_custom_title?(%__MODULE__{instance_title: title}) do
    is_binary(title) and String.trim(title) != ""
  end

  @doc """
  Verifica se tem configuração personalizada.
  """
  def has_custom_config?(%__MODULE__{instance_config: config}) do
    is_binary(config) and String.trim(config) != ""
  end

  @doc """
  Verifica se tem CSS customizado.
  """
  def has_custom_css?(%__MODULE__{custom_css: css}) do
    is_binary(css) and String.trim(css) != ""
  end

  @doc """
  Retorna a configuração da instância como mapa.
  """
  def configuration(%__MODULE__{instance_config: config}) when is_binary(config) and config != "" do
    case Jason.decode(config) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def configuration(_), do: %{}

  @doc """
  Retorna os dispositivos onde está oculto.
  """
  def hidden_on_devices(%__MODULE__{hidden_on: hidden_on}) when is_binary(hidden_on) and hidden_on != "" do
    hidden_on
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
  end
  def hidden_on_devices(_), do: []

  @doc """
  Verifica se está oculto em um dispositivo específico.
  """
  def hidden_on_device?(%__MODULE__{} = instance, device) do
    device in hidden_on_devices(instance)
  end

  @doc """
  Verifica se está oculto no mobile.
  """
  def hidden_on_mobile?(%__MODULE__{} = instance) do
    hidden_on_device?(instance, "mobile")
  end

  @doc """
  Verifica se está oculto no tablet.
  """
  def hidden_on_tablet?(%__MODULE__{} = instance) do
    hidden_on_device?(instance, "tablet")
  end

  @doc """
  Verifica se está oculto no desktop.
  """
  def hidden_on_desktop?(%__MODULE__{} = instance) do
    hidden_on_device?(instance, "desktop")
  end

  @doc """
  Verifica se é uma instância global (sem página específica).
  """
  def global?(%__MODULE__{page_id: nil}), do: true
  def global?(_), do: false

  @doc """
  Verifica se é uma instância específica de página.
  """
  def page_specific?(%__MODULE__{page_id: page_id}) when is_integer(page_id), do: true
  def page_specific?(_), do: false

  @doc """
  Verifica se está na sidebar.
  """
  def sidebar_position?(%__MODULE__{position: "sidebar"}), do: true
  def sidebar_position?(%__MODULE__{position: "left"}), do: true
  def sidebar_position?(%__MODULE__{position: "right"}), do: true
  def sidebar_position?(_), do: false

  @doc """
  Verifica se está no header.
  """
  def header_position?(%__MODULE__{position: "header"}), do: true
  def header_position?(%__MODULE__{position: "top"}), do: true
  def header_position?(_), do: false

  @doc """
  Verifica se está no footer.
  """
  def footer_position?(%__MODULE__{position: "footer"}), do: true
  def footer_position?(%__MODULE__{position: "bottom"}), do: true
  def footer_position?(_), do: false

  @doc """
  Verifica se está no conteúdo.
  """
  def content_position?(%__MODULE__{position: "content"}), do: true
  def content_position?(_), do: false

  @doc """
  Retorna informações de cache da instância.
  """
  def cache_info(%__MODULE__{cache_lifetime: lifetime}) do
    %{
      has_custom_cache: not is_nil(lifetime),
      lifetime_seconds: lifetime || 0,
      inherits_from_widget: is_nil(lifetime)
    }
  end

  @doc """
  Verifica se tem cache customizado.
  """
  def has_custom_cache?(%__MODULE__{cache_lifetime: lifetime}) do
    not is_nil(lifetime)
  end

  @doc """
  Retorna informações de posicionamento.
  """
  def position_info(%__MODULE__{position: position, cell_id: cell_id, order_index: order_index}) do
    %{
      position: position,
      cell_id: cell_id,
      order_index: order_index,
      is_sidebar: sidebar_position?(%__MODULE__{position: position}),
      is_header: header_position?(%__MODULE__{position: position}),
      is_footer: footer_position?(%__MODULE__{position: position}),
      is_content: content_position?(%__MODULE__{position: position})
    }
  end

  @doc """
  Retorna informações resumidas da instância.
  """
  def summary(%__MODULE__{} = instance) do
    %{
      id: instance.id,
      widget_id: instance.widget_id,
      page_id: instance.page_id,
      position: instance.position,
      cell_id: instance.cell_id,
      order_index: instance.order_index,
      is_active: instance.is_active,
      is_collapsed: instance.is_collapsed,
      show_title: instance.show_title,
      is_global: global?(instance),
      has_custom_title: has_custom_title?(instance),
      has_custom_config: has_custom_config?(instance),
      has_custom_css: has_custom_css?(instance),
      has_custom_cache: has_custom_cache?(instance),
      hidden_devices: hidden_on_devices(instance)
    }
  end

  @doc """
  Retorna o título efetivo da instância.
  """
  def effective_title(%__MODULE__{instance_title: instance_title}, widget_title \\ "") do
    if has_custom_title?(%__MODULE__{instance_title: instance_title}) do
      instance_title
    else
      widget_title
    end
  end

  @doc """
  Verifica se a instância é visível em um contexto específico.
  """
  def visible_in_context?(%__MODULE__{} = instance, context) do
    device = Map.get(context, :device, "desktop")
    user_level = Map.get(context, :user_level, 0)
    
    # Verificar se está ativo
    active = active?(instance)
    
    # Verificar se não está oculto no dispositivo
    not_hidden = not hidden_on_device?(instance, device)
    
    # Verificar permissões de nível (se definido)
    has_permission = case instance.visible_for_levels do
      nil -> true
      levels -> user_level >= levels
    end
    
    active and not_hidden and has_permission
  end
end
