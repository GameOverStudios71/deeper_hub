defmodule DeeperHub.CMS.Forms.FormField do
  @moduledoc """
  Schema para campos de formulário do sistema usando db_connection.
  Representa campos individuais dentro de formulários.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_form_fields"

  @derive Jason.Encoder
  @doc """
  Estrutura de dados para campos de formulário.
  """
  defstruct [
    :id, :form_id, :name, :title, :description, :field_type_id, :input_type,
    :is_required, :is_unique, :min_length, :max_length, :min_value, :max_value,
    :pattern, :validation_message, :default_value, :placeholder, :help_text,
    :options_source, :options_list_id, :options_data, :css_class, :wrapper_class,
    :label_class, :input_attrs, :is_searchable, :is_sortable, :is_filterable,
    :conditional_logic, :is_active, :order_index, :created_at, :updated_at
  ]

  @doc """
  Valida dados do campo.
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

    # Validação do form_id
    form_id = attrs[:form_id] || attrs["form_id"]
    errors = if not is_integer(form_id) or form_id <= 0 do
      ["form_id é obrigatório e deve ser um número inteiro positivo" | errors]
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

    # Validação do title
    title = attrs[:title] || attrs["title"]
    errors = if not is_binary(title) or String.length(title) < 2 do
      ["title é obrigatório e deve ter pelo menos 2 caracteres" | errors]
    else
      errors
    end

    # Validação do field_type_id
    field_type_id = attrs[:field_type_id] || attrs["field_type_id"]
    errors = if not is_integer(field_type_id) or field_type_id <= 0 do
      ["field_type_id é obrigatório e deve ser um número inteiro positivo" | errors]
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

    # Validação do options_source
    options_source = attrs[:options_source] || attrs["options_source"]
    valid_sources = ["manual", "list", "query", "api"]
    errors = if options_source && not Enum.member?(valid_sources, options_source) do
      ["options_source deve ser um dos seguintes: #{Enum.join(valid_sources, ", ")}" | errors]
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
  Cria um novo campo com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      form_id: attrs[:form_id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      field_type_id: attrs[:field_type_id],
      input_type: attrs[:input_type],
      is_required: attrs[:is_required] || false,
      is_unique: attrs[:is_unique] || false,
      min_length: attrs[:min_length] || 0,
      max_length: attrs[:max_length] || 0,
      min_value: attrs[:min_value],
      max_value: attrs[:max_value],
      pattern: attrs[:pattern] || "",
      validation_message: attrs[:validation_message] || "",
      default_value: attrs[:default_value] || "",
      placeholder: attrs[:placeholder] || "",
      help_text: attrs[:help_text] || "",
      options_source: attrs[:options_source] || "manual",
      options_list_id: attrs[:options_list_id],
      options_data: attrs[:options_data] || "",
      css_class: attrs[:css_class] || "",
      wrapper_class: attrs[:wrapper_class] || "",
      label_class: attrs[:label_class] || "",
      input_attrs: attrs[:input_attrs] || "",
      is_searchable: attrs[:is_searchable] || false,
      is_sortable: attrs[:is_sortable] || false,
      is_filterable: attrs[:is_filterable] || false,
      conditional_logic: attrs[:conditional_logic] || "",
      is_active: attrs[:is_active] || true,
      order_index: attrs[:order_index] || 0,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at]
    }
  end

  @doc """
  Verifica se o campo está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se o campo é obrigatório.
  """
  def required?(%__MODULE__{is_required: true}), do: true
  def required?(_), do: false

  @doc """
  Verifica se o campo deve ser único.
  """
  def unique?(%__MODULE__{is_unique: true}), do: true
  def unique?(_), do: false

  @doc """
  Verifica se o campo é pesquisável.
  """
  def searchable?(%__MODULE__{is_searchable: true}), do: true
  def searchable?(_), do: false

  @doc """
  Verifica se o campo é ordenável.
  """
  def sortable?(%__MODULE__{is_sortable: true}), do: true
  def sortable?(_), do: false

  @doc """
  Verifica se o campo é filtrável.
  """
  def filterable?(%__MODULE__{is_filterable: true}), do: true
  def filterable?(_), do: false

  @doc """
  Verifica se tem valor padrão.
  """
  def has_default_value?(%__MODULE__{default_value: value}) do
    is_binary(value) and String.trim(value) != ""
  end

  @doc """
  Verifica se tem placeholder.
  """
  def has_placeholder?(%__MODULE__{placeholder: placeholder}) do
    is_binary(placeholder) and String.trim(placeholder) != ""
  end

  @doc """
  Verifica se tem texto de ajuda.
  """
  def has_help_text?(%__MODULE__{help_text: help}) do
    is_binary(help) and String.trim(help) != ""
  end

  @doc """
  Verifica se tem padrão de validação.
  """
  def has_pattern?(%__MODULE__{pattern: pattern}) do
    is_binary(pattern) and String.trim(pattern) != ""
  end

  @doc """
  Verifica se tem mensagem de validação customizada.
  """
  def has_validation_message?(%__MODULE__{validation_message: message}) do
    is_binary(message) and String.trim(message) != ""
  end

  @doc """
  Verifica se tem lógica condicional.
  """
  def has_conditional_logic?(%__MODULE__{conditional_logic: logic}) do
    is_binary(logic) and String.trim(logic) != ""
  end

  @doc """
  Verifica se tem restrições de comprimento.
  """
  def has_length_restrictions?(%__MODULE__{min_length: min, max_length: max}) do
    min > 0 or max > 0
  end

  @doc """
  Verifica se tem restrições de valor.
  """
  def has_value_restrictions?(%__MODULE__{min_value: min, max_value: max}) do
    not is_nil(min) or not is_nil(max)
  end

  @doc """
  Retorna as opções como lista.
  """
  def options_list(%__MODULE__{options_data: data}) when is_binary(data) and data != "" do
    case Jason.decode(data) do
      {:ok, list} when is_list(list) -> list
      {:ok, map} when is_map(map) -> Map.to_list(map)
      {:error, _} -> []
    end
  end
  def options_list(_), do: []

  @doc """
  Retorna a lógica condicional como mapa.
  """
  def conditional_logic_map(%__MODULE__{conditional_logic: logic}) when is_binary(logic) and logic != "" do
    case Jason.decode(logic) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def conditional_logic_map(_), do: %{}

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
  Verifica se é um campo de texto.
  """
  def text_field?(%__MODULE__{input_type: type}) do
    type in ["text", "email", "password", "tel", "url", "search"]
  end

  @doc """
  Verifica se é um campo de área de texto.
  """
  def textarea_field?(%__MODULE__{input_type: "textarea"}), do: true
  def textarea_field?(_), do: false

  @doc """
  Verifica se é um campo numérico.
  """
  def numeric_field?(%__MODULE__{input_type: type}) do
    type in ["number", "range"]
  end

  @doc """
  Verifica se é um campo de data/hora.
  """
  def datetime_field?(%__MODULE__{input_type: type}) do
    type in ["date", "datetime-local", "time"]
  end

  @doc """
  Verifica se é um campo de seleção.
  """
  def selection_field?(%__MODULE__{input_type: type}) do
    type in ["select", "radio", "checkbox"]
  end

  @doc """
  Verifica se é um campo de arquivo.
  """
  def file_field?(%__MODULE__{input_type: "file"}), do: true
  def file_field?(_), do: false

  @doc """
  Verifica se é um campo oculto.
  """
  def hidden_field?(%__MODULE__{input_type: "hidden"}), do: true
  def hidden_field?(_), do: false

  @doc """
  Verifica se usa opções manuais.
  """
  def manual_options?(%__MODULE__{options_source: "manual"}), do: true
  def manual_options?(_), do: false

  @doc """
  Verifica se usa lista predefinida.
  """
  def list_options?(%__MODULE__{options_source: "list"}), do: true
  def list_options?(_), do: false

  @doc """
  Verifica se usa query para opções.
  """
  def query_options?(%__MODULE__{options_source: "query"}), do: true
  def query_options?(_), do: false

  @doc """
  Verifica se usa API para opções.
  """
  def api_options?(%__MODULE__{options_source: "api"}), do: true
  def api_options?(_), do: false

  @doc """
  Retorna informações de validação do campo.
  """
  def validation_info(%__MODULE__{} = field) do
    %{
      is_required: required?(field),
      is_unique: unique?(field),
      has_length_restrictions: has_length_restrictions?(field),
      min_length: field.min_length,
      max_length: field.max_length,
      has_value_restrictions: has_value_restrictions?(field),
      min_value: field.min_value,
      max_value: field.max_value,
      has_pattern: has_pattern?(field),
      pattern: field.pattern,
      has_custom_message: has_validation_message?(field),
      validation_message: field.validation_message
    }
  end

  @doc """
  Retorna informações de opções do campo.
  """
  def options_info(%__MODULE__{} = field) do
    %{
      source: field.options_source,
      is_manual: manual_options?(field),
      is_list: list_options?(field),
      is_query: query_options?(field),
      is_api: api_options?(field),
      list_id: field.options_list_id,
      options_count: length(options_list(field)),
      has_options: length(options_list(field)) > 0
    }
  end

  @doc """
  Retorna informações resumidas do campo.
  """
  def summary(%__MODULE__{} = field) do
    %{
      id: field.id,
      form_id: field.form_id,
      name: field.name,
      title: field.title,
      input_type: field.input_type,
      is_active: field.is_active,
      is_required: field.is_required,
      is_unique: field.is_unique,
      order_index: field.order_index,
      is_text: text_field?(field),
      is_selection: selection_field?(field),
      is_file: file_field?(field),
      is_hidden: hidden_field?(field),
      has_default: has_default_value?(field),
      has_help: has_help_text?(field),
      has_conditional: has_conditional_logic?(field),
      options_source: field.options_source
    }
  end

  @doc """
  Gera atributos HTML para o campo.
  """
  def html_attributes(%__MODULE__{} = field) do
    base_attrs = %{
      "type" => field.input_type,
      "name" => field.name,
      "id" => field.name,
      "class" => Enum.join(["form-control" | css_classes(field)], " ")
    }

    # Adicionar atributos condicionais
    attrs = if required?(field), do: Map.put(base_attrs, "required", "required"), else: base_attrs
    attrs = if has_placeholder?(field), do: Map.put(attrs, "placeholder", field.placeholder), else: attrs
    attrs = if has_default_value?(field), do: Map.put(attrs, "value", field.default_value), else: attrs
    attrs = if has_pattern?(field), do: Map.put(attrs, "pattern", field.pattern), else: attrs

    # Adicionar restrições de comprimento
    attrs = if field.min_length > 0, do: Map.put(attrs, "minlength", field.min_length), else: attrs
    attrs = if field.max_length > 0, do: Map.put(attrs, "maxlength", field.max_length), else: attrs

    # Adicionar restrições de valor
    attrs = if not is_nil(field.min_value), do: Map.put(attrs, "min", field.min_value), else: attrs
    attrs = if not is_nil(field.max_value), do: Map.put(attrs, "max", field.max_value), else: attrs

    attrs
  end

  @doc """
  Valida um valor contra as regras do campo.
  """
  def validate_value(%__MODULE__{} = field, value) do
    errors = []

    # Verificar se é obrigatório
    errors = if required?(field) and (is_nil(value) or value == "") do
      ["#{field.title} é obrigatório" | errors]
    else
      errors
    end

    # Verificar comprimento mínimo
    errors = if field.min_length > 0 and is_binary(value) and String.length(value) < field.min_length do
      ["#{field.title} deve ter pelo menos #{field.min_length} caracteres" | errors]
    else
      errors
    end

    # Verificar comprimento máximo
    errors = if field.max_length > 0 and is_binary(value) and String.length(value) > field.max_length do
      ["#{field.title} deve ter no máximo #{field.max_length} caracteres" | errors]
    else
      errors
    end

    # Verificar padrão
    errors = if has_pattern?(field) and is_binary(value) and value != "" and not String.match?(value, ~r/#{field.pattern}/) do
      message = if has_validation_message?(field), do: field.validation_message, else: "#{field.title} não está no formato correto"
      [message | errors]
    else
      errors
    end

    if length(errors) == 0 do
      {:ok, value}
    else
      {:error, errors}
    end
  end
end
