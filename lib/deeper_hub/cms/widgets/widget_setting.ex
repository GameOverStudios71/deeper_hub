defmodule DeeperHub.CMS.Widgets.WidgetSetting do
  @moduledoc """
  Schema para configurações de widget do sistema usando db_connection.
  Representa configurações específicas de widgets ou instâncias.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_widget_settings"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para configurações de widget.
  """
  defstruct [
    :id, :widget_id, :instance_id, :setting_key, :setting_value, :setting_type,
    :setting_group, :setting_order, :created_at, :updated_at
  ]

  @doc """
  Valida dados da configuração.
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

    # Validação do setting_key
    setting_key = attrs[:setting_key] || attrs["setting_key"]
    errors = if not is_binary(setting_key) or String.length(setting_key) < 1 do
      ["setting_key é obrigatório" | errors]
    else
      errors
    end

    # Validação do setting_type
    setting_type = attrs[:setting_type] || attrs["setting_type"]
    valid_types = ["text", "number", "boolean", "json", "array", "url", "email", "color", "date"]
    errors = if setting_type && not Enum.member?(valid_types, setting_type) do
      ["setting_type deve ser um dos seguintes: #{Enum.join(valid_types, ", ")}" | errors]
    else
      errors
    end

    # Validação de que deve ter widget_id OU instance_id, mas não ambos
    widget_id = attrs[:widget_id] || attrs["widget_id"]
    instance_id = attrs[:instance_id] || attrs["instance_id"]
    
    errors = cond do
      widget_id && instance_id ->
        ["Deve ter widget_id OU instance_id, não ambos" | errors]
      not widget_id && not instance_id ->
        ["Deve ter widget_id OU instance_id" | errors]
      true ->
        errors
    end

    if length(errors) == 0 do
      {:ok, attrs}
    else
      {:error, errors}
    end
  end

  @doc """
  Cria uma nova configuração com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      widget_id: attrs[:widget_id],
      instance_id: attrs[:instance_id],
      setting_key: attrs[:setting_key],
      setting_value: attrs[:setting_value] || "",
      setting_type: attrs[:setting_type] || "text",
      setting_group: attrs[:setting_group] || "general",
      setting_order: attrs[:setting_order] || 0,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at]
    }
  end

  @doc """
  Verifica se é uma configuração de widget.
  """
  def widget_setting?(%__MODULE__{widget_id: widget_id, instance_id: nil}) when is_integer(widget_id), do: true
  def widget_setting?(_), do: false

  @doc """
  Verifica se é uma configuração de instância.
  """
  def instance_setting?(%__MODULE__{widget_id: nil, instance_id: instance_id}) when is_integer(instance_id), do: true
  def instance_setting?(_), do: false

  @doc """
  Verifica se é do tipo texto.
  """
  def text_type?(%__MODULE__{setting_type: "text"}), do: true
  def text_type?(_), do: false

  @doc """
  Verifica se é do tipo número.
  """
  def number_type?(%__MODULE__{setting_type: "number"}), do: true
  def number_type?(_), do: false

  @doc """
  Verifica se é do tipo boolean.
  """
  def boolean_type?(%__MODULE__{setting_type: "boolean"}), do: true
  def boolean_type?(_), do: false

  @doc """
  Verifica se é do tipo JSON.
  """
  def json_type?(%__MODULE__{setting_type: "json"}), do: true
  def json_type?(_), do: false

  @doc """
  Verifica se é do tipo array.
  """
  def array_type?(%__MODULE__{setting_type: "array"}), do: true
  def array_type?(_), do: false

  @doc """
  Verifica se é do tipo URL.
  """
  def url_type?(%__MODULE__{setting_type: "url"}), do: true
  def url_type?(_), do: false

  @doc """
  Verifica se é do tipo email.
  """
  def email_type?(%__MODULE__{setting_type: "email"}), do: true
  def email_type?(_), do: false

  @doc """
  Verifica se é do tipo cor.
  """
  def color_type?(%__MODULE__{setting_type: "color"}), do: true
  def color_type?(_), do: false

  @doc """
  Verifica se é do tipo data.
  """
  def date_type?(%__MODULE__{setting_type: "date"}), do: true
  def date_type?(_), do: false

  @doc """
  Retorna o valor convertido para o tipo apropriado.
  """
  def typed_value(%__MODULE__{setting_value: value, setting_type: type}) do
    case type do
      "number" ->
        case Float.parse(value) do
          {num, ""} -> num
          _ -> 0
        end
      
      "boolean" ->
        value in ["true", "1", "yes", "on"]
      
      "json" ->
        case Jason.decode(value) do
          {:ok, parsed} -> parsed
          {:error, _} -> %{}
        end
      
      "array" ->
        case Jason.decode(value) do
          {:ok, list} when is_list(list) -> list
          {:error, _} -> []
        end
      
      "date" ->
        case Date.from_iso8601(value) do
          {:ok, date} -> date
          {:error, _} -> nil
        end
      
      _ ->
        value
    end
  end

  @doc """
  Verifica se o valor é válido para o tipo.
  """
  def valid_value?(%__MODULE__{setting_value: value, setting_type: type}) do
    case type do
      "number" ->
        case Float.parse(value) do
          {_num, ""} -> true
          _ -> false
        end
      
      "boolean" ->
        value in ["true", "false", "1", "0", "yes", "no", "on", "off"]
      
      "json" ->
        case Jason.decode(value) do
          {:ok, _} -> true
          {:error, _} -> false
        end
      
      "array" ->
        case Jason.decode(value) do
          {:ok, list} when is_list(list) -> true
          {:error, _} -> false
        end
      
      "url" ->
        uri = URI.parse(value)
        uri.scheme != nil and uri.host != nil
      
      "email" ->
        String.match?(value, ~r/^[^\s]+@[^\s]+\.[^\s]+$/)
      
      "color" ->
        String.match?(value, ~r/^#[0-9A-Fa-f]{6}$/) or 
        String.match?(value, ~r/^#[0-9A-Fa-f]{3}$/) or
        value in ["red", "green", "blue", "black", "white", "yellow", "orange", "purple", "pink", "brown", "gray", "grey"]
      
      "date" ->
        case Date.from_iso8601(value) do
          {:ok, _} -> true
          {:error, _} -> false
        end
      
      _ ->
        true
    end
  end

  @doc """
  Retorna informações do grupo de configuração.
  """
  def group_info(%__MODULE__{setting_group: group}) do
    case group do
      "general" ->
        %{
          title: "Geral",
          description: "Configurações gerais do widget",
          icon: "settings",
          order: 1
        }
      "appearance" ->
        %{
          title: "Aparência",
          description: "Configurações visuais e de estilo",
          icon: "palette",
          order: 2
        }
      "behavior" ->
        %{
          title: "Comportamento",
          description: "Configurações de funcionamento",
          icon: "cog",
          order: 3
        }
      "content" ->
        %{
          title: "Conteúdo",
          description: "Configurações de conteúdo",
          icon: "file-text",
          order: 4
        }
      "advanced" ->
        %{
          title: "Avançado",
          description: "Configurações avançadas",
          icon: "code",
          order: 5
        }
      _ ->
        %{
          title: String.capitalize(group),
          description: "Configurações de #{group}",
          icon: "settings",
          order: 99
        }
    end
  end

  @doc """
  Retorna sugestões de validação baseadas no tipo.
  """
  def validation_suggestions(%__MODULE__{setting_type: type}) do
    case type do
      "number" ->
        ["Use apenas números", "Decimais devem usar ponto (.)", "Exemplo: 123.45"]
      
      "boolean" ->
        ["Use: true/false, 1/0, yes/no, on/off"]
      
      "json" ->
        ["Use JSON válido", "Exemplo: {\"key\": \"value\"}", "Verifique sintaxe"]
      
      "array" ->
        ["Use array JSON", "Exemplo: [\"item1\", \"item2\"]", "Verifique sintaxe"]
      
      "url" ->
        ["Use URL completa", "Exemplo: https://exemplo.com", "Inclua protocolo (http/https)"]
      
      "email" ->
        ["Use formato válido", "Exemplo: usuario@dominio.com", "Verifique @ e domínio"]
      
      "color" ->
        ["Use hex (#FF0000)", "Ou nomes (red, blue)", "Exemplo: #FF5733"]
      
      "date" ->
        ["Use formato ISO", "Exemplo: 2024-01-15", "Formato: YYYY-MM-DD"]
      
      _ ->
        ["Digite o valor desejado"]
    end
  end

  @doc """
  Retorna informações resumidas da configuração.
  """
  def summary(%__MODULE__{} = setting) do
    %{
      id: setting.id,
      setting_key: setting.setting_key,
      setting_type: setting.setting_type,
      setting_group: setting.setting_group,
      setting_order: setting.setting_order,
      is_widget_setting: widget_setting?(setting),
      is_instance_setting: instance_setting?(setting),
      has_value: setting.setting_value != "",
      is_valid: valid_value?(setting),
      typed_value: typed_value(setting)
    }
  end

  @doc """
  Converte valor para string apropriada para armazenamento.
  """
  def value_to_string(value, type) do
    case type do
      "boolean" ->
        if value, do: "true", else: "false"
      
      "json" ->
        case Jason.encode(value) do
          {:ok, json} -> json
          {:error, _} -> ""
        end
      
      "array" ->
        case Jason.encode(value) do
          {:ok, json} -> json
          {:error, _} -> "[]"
        end
      
      "date" ->
        case value do
          %Date{} -> Date.to_iso8601(value)
          _ -> to_string(value)
        end
      
      _ ->
        to_string(value)
    end
  end
end
