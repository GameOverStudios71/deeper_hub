defmodule DeeperHub.CMS.Forms.FormFieldType do
  @moduledoc """
  Schema para tipos de campo de formulário do sistema usando db_connection.
  Representa diferentes tipos de campos disponíveis.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_form_field_types"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para tipos de campo.
  """
  defstruct [
    :id, :name, :title, :description, :input_type, :validation_rules, :default_options,
    :is_active, :is_system, :created_at, :order_index
  ]

  @doc """
  Valida dados do tipo de campo.
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

    # Validação do input_type
    input_type = attrs[:input_type] || attrs["input_type"]
    valid_input_types = [
      "text", "textarea", "email", "password", "number", "tel", "url", "date",
      "datetime-local", "time", "select", "radio", "checkbox", "file", "hidden",
      "range", "color", "search", "submit", "button", "reset"
    ]
    errors = if not is_binary(input_type) or not Enum.member?(valid_input_types, input_type) do
      ["input_type deve ser um dos seguintes: #{Enum.join(valid_input_types, ", ")}" | errors]
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
  Cria um novo tipo de campo com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      input_type: attrs[:input_type],
      validation_rules: attrs[:validation_rules] || "{}",
      default_options: attrs[:default_options] || "{}",
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
  Retorna as regras de validação como mapa.
  """
  def validation_rules_map(%__MODULE__{validation_rules: rules}) when is_binary(rules) and rules != "" do
    case Jason.decode(rules) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def validation_rules_map(_), do: %{}

  @doc """
  Retorna as opções padrão como mapa.
  """
  def default_options_map(%__MODULE__{default_options: options}) when is_binary(options) and options != "" do
    case Jason.decode(options) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def default_options_map(_), do: %{}

  @doc """
  Verifica se é um campo de texto.
  """
  def text_input?(%__MODULE__{input_type: type}) do
    type in ["text", "email", "password", "tel", "url", "search"]
  end

  @doc """
  Verifica se é um campo de área de texto.
  """
  def textarea_input?(%__MODULE__{input_type: "textarea"}), do: true
  def textarea_input?(_), do: false

  @doc """
  Verifica se é um campo numérico.
  """
  def numeric_input?(%__MODULE__{input_type: type}) do
    type in ["number", "range"]
  end

  @doc """
  Verifica se é um campo de data/hora.
  """
  def datetime_input?(%__MODULE__{input_type: type}) do
    type in ["date", "datetime-local", "time"]
  end

  @doc """
  Verifica se é um campo de seleção.
  """
  def selection_input?(%__MODULE__{input_type: type}) do
    type in ["select", "radio", "checkbox"]
  end

  @doc """
  Verifica se é um campo de arquivo.
  """
  def file_input?(%__MODULE__{input_type: "file"}), do: true
  def file_input?(_), do: false

  @doc """
  Verifica se é um campo oculto.
  """
  def hidden_input?(%__MODULE__{input_type: "hidden"}), do: true
  def hidden_input?(_), do: false

  @doc """
  Verifica se é um botão.
  """
  def button_input?(%__MODULE__{input_type: type}) do
    type in ["submit", "button", "reset"]
  end

  @doc """
  Verifica se suporta múltiplos valores.
  """
  def supports_multiple?(%__MODULE__{input_type: type}) do
    type in ["checkbox", "file"] or
    (type == "select" and supports_multiple_select?(%__MODULE__{input_type: type}))
  end

  @doc """
  Verifica se é um select que suporta múltipla seleção.
  """
  def supports_multiple_select?(%__MODULE__{input_type: "select", default_options: options}) do
    options_map = default_options_map(%__MODULE__{default_options: options})
    Map.get(options_map, "multiple", false)
  end
  def supports_multiple_select?(_), do: false

  @doc """
  Verifica se requer opções (select, radio, checkbox).
  """
  def requires_options?(%__MODULE__{input_type: type}) do
    type in ["select", "radio", "checkbox"]
  end

  @doc """
  Verifica se suporta placeholder.
  """
  def supports_placeholder?(%__MODULE__{input_type: type}) do
    type in ["text", "textarea", "email", "password", "tel", "url", "search", "number"]
  end

  @doc """
  Verifica se suporta pattern (regex).
  """
  def supports_pattern?(%__MODULE__{input_type: type}) do
    type in ["text", "email", "password", "tel", "url", "search"]
  end

  @doc """
  Verifica se suporta min/max length.
  """
  def supports_length?(%__MODULE__{input_type: type}) do
    type in ["text", "textarea", "email", "password", "tel", "url", "search"]
  end

  @doc """
  Verifica se suporta min/max value.
  """
  def supports_value_range?(%__MODULE__{input_type: type}) do
    type in ["number", "range", "date", "datetime-local", "time"]
  end

  @doc """
  Retorna características do tipo de campo.
  """
  def characteristics(%__MODULE__{input_type: type} = field_type) do
    %{
      input_type: type,
      is_text: text_input?(field_type),
      is_textarea: textarea_input?(field_type),
      is_numeric: numeric_input?(field_type),
      is_datetime: datetime_input?(field_type),
      is_selection: selection_input?(field_type),
      is_file: file_input?(field_type),
      is_hidden: hidden_input?(field_type),
      is_button: button_input?(field_type),
      supports_multiple: supports_multiple?(field_type),
      requires_options: requires_options?(field_type),
      supports_placeholder: supports_placeholder?(field_type),
      supports_pattern: supports_pattern?(field_type),
      supports_length: supports_length?(field_type),
      supports_value_range: supports_value_range?(field_type)
    }
  end

  @doc """
  Retorna validações padrão baseadas no tipo.
  """
  def default_validations(%__MODULE__{input_type: type}) do
    case type do
      "email" ->
        %{
          "pattern" => "email",
          "type" => "email"
        }
      "url" ->
        %{
          "pattern" => "url",
          "type" => "url"
        }
      "tel" ->
        %{
          "pattern" => "phone",
          "type" => "tel"
        }
      "number" ->
        %{
          "type" => "number"
        }
      "range" ->
        %{
          "type" => "range",
          "min" => 0,
          "max" => 100
        }
      "date" ->
        %{
          "type" => "date"
        }
      "datetime-local" ->
        %{
          "type" => "datetime"
        }
      "time" ->
        %{
          "type" => "time"
        }
      "password" ->
        %{
          "minlength" => 6,
          "type" => "password"
        }
      "file" ->
        %{
          "type" => "file"
        }
      _ ->
        %{}
    end
  end

  @doc """
  Retorna opções padrão baseadas no tipo.
  """
  def default_options(%__MODULE__{input_type: type}) do
    case type do
      "textarea" ->
        %{
          "rows" => 4,
          "cols" => 50
        }
      "select" ->
        %{
          "multiple" => false
        }
      "file" ->
        %{
          "accept" => "*",
          "multiple" => false
        }
      "range" ->
        %{
          "min" => 0,
          "max" => 100,
          "step" => 1
        }
      "number" ->
        %{
          "step" => 1
        }
      _ ->
        %{}
    end
  end

  @doc """
  Retorna informações resumidas do tipo.
  """
  def summary(%__MODULE__{} = field_type) do
    characteristics = characteristics(field_type)

    %{
      id: field_type.id,
      name: field_type.name,
      title: field_type.title,
      input_type: field_type.input_type,
      is_active: field_type.is_active,
      is_system: field_type.is_system,
      order_index: field_type.order_index,
      characteristics: characteristics,
      validation_rules: validation_rules_map(field_type),
      default_options: default_options_map(field_type)
    }
  end

  @doc """
  Retorna sugestões de uso baseadas no tipo.
  """
  def usage_suggestions(%__MODULE__{input_type: type, name: name}) do
    base_suggestions = case type do
      "text" -> ["Use para textos curtos", "Configure placeholder", "Defina maxlength se necessário"]
      "textarea" -> ["Use para textos longos", "Configure rows e cols", "Considere editor rich text"]
      "email" -> ["Validação automática de email", "Use placeholder como exemplo", "Configure mensagem de erro"]
      "password" -> ["Configure minlength", "Use confirmação de senha", "Considere força da senha"]
      "number" -> ["Configure min e max", "Defina step se necessário", "Use placeholder para formato"]
      "tel" -> ["Use pattern para formato", "Configure placeholder", "Considere máscara"]
      "url" -> ["Validação automática de URL", "Use placeholder como exemplo", "Aceita http/https"]
      "date" -> ["Configure min e max dates", "Use formato ISO", "Considere timezone"]
      "select" -> ["Configure opções", "Use optgroups se necessário", "Considere busca"]
      "radio" -> ["Use para poucas opções", "Configure layout", "Uma opção por linha"]
      "checkbox" -> ["Use para múltiplas opções", "Configure layout", "Permita seleção múltipla"]
      "file" -> ["Configure accept", "Defina tamanho máximo", "Considere preview"]
      _ -> ["Configure conforme necessário"]
    end

    # Sugestões específicas por nome
    name_suggestions = case name do
      "name" -> ["Campo obrigatório", "Use validação de nome", "Considere nome completo"]
      "email" -> ["Campo obrigatório", "Use validação única", "Configure confirmação"]
      "phone" -> ["Use máscara", "Configure formato", "Considere código do país"]
      "message" -> ["Use textarea", "Configure placeholder", "Defina maxlength"]
      "subject" -> ["Campo obrigatório", "Use lista predefinida", "Configure maxlength"]
      _ -> []
    end

    base_suggestions ++ name_suggestions
  end

  @doc """
  Verifica compatibilidade com HTML5.
  """
  def html5_compatible?(%__MODULE__{input_type: type}) do
    html5_types = [
      "text", "email", "password", "tel", "url", "number", "date", "datetime-local",
      "time", "range", "color", "search", "file", "hidden", "submit", "button", "reset"
    ]

    type in html5_types
  end

  @doc """
  Retorna atributos HTML recomendados.
  """
  def recommended_html_attributes(%__MODULE__{input_type: type} = _field_type) do
    base_attrs = %{
      "type" => type,
      "class" => "form-control"
    }

    type_specific = case type do
      "email" ->
        %{"autocomplete" => "email", "spellcheck" => "false"}
      "password" ->
        %{"autocomplete" => "current-password"}
      "tel" ->
        %{"autocomplete" => "tel"}
      "url" ->
        %{"spellcheck" => "false"}
      "search" ->
        %{"autocomplete" => "off", "spellcheck" => "false"}
      "textarea" ->
        %{"spellcheck" => "true"}
      _ ->
        %{}
    end

    Map.merge(base_attrs, type_specific)
  end
end
