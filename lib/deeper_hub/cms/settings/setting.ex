defmodule DeeperHub.CMS.Settings.Setting do
  @moduledoc """
  Schema para configurações do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_settings"

  @derive Jason.Encoder
  defstruct [
    :id, :category_id, :setting_type_id, :name, :title, :description, :value, :default_value,
    :options, :validation_rules, :placeholder, :help_text, :is_required, :is_readonly,
    :is_translatable, :is_active, :is_system, :created_at, :updated_at, :order_index,
    :category_title, :type_title, :input_type
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      category_id: attrs[:category_id],
      setting_type_id: attrs[:setting_type_id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      value: attrs[:value] || "",
      default_value: attrs[:default_value] || "",
      options: attrs[:options] || "",
      validation_rules: attrs[:validation_rules] || "",
      placeholder: attrs[:placeholder] || "",
      help_text: attrs[:help_text] || "",
      is_required: attrs[:is_required] || false,
      is_readonly: attrs[:is_readonly] || false,
      is_translatable: attrs[:is_translatable] || false,
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at],
      order_index: attrs[:order_index] || 0,
      category_title: attrs[:category_title],
      type_title: attrs[:type_title],
      input_type: attrs[:input_type]
    }
  end

  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  def required?(%__MODULE__{is_required: true}), do: true
  def required?(_), do: false

  def readonly?(%__MODULE__{is_readonly: true}), do: true
  def readonly?(_), do: false

  def translatable?(%__MODULE__{is_translatable: true}), do: true
  def translatable?(_), do: false

  def has_value?(%__MODULE__{value: value}) do
    is_binary(value) and String.trim(value) != ""
  end

  def has_default?(%__MODULE__{default_value: default}) do
    is_binary(default) and String.trim(default) != ""
  end

  def has_placeholder?(%__MODULE__{placeholder: placeholder}) do
    is_binary(placeholder) and String.trim(placeholder) != ""
  end

  def has_help_text?(%__MODULE__{help_text: help}) do
    is_binary(help) and String.trim(help) != ""
  end

  def options_list(%__MODULE__{options: options}) when is_binary(options) and options != "" do
    case Jason.decode(options) do
      {:ok, list} when is_list(list) -> list
      {:error, _} -> []
    end
  end
  def options_list(_), do: []

  def validation_rules_map(%__MODULE__{validation_rules: rules}) when is_binary(rules) and rules != "" do
    case Jason.decode(rules) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def validation_rules_map(_), do: %{}

  def effective_value(%__MODULE__{value: value, default_value: default}) do
    if has_value?(%__MODULE__{value: value}) do
      value
    else
      default
    end
  end

  def typed_value(%__MODULE__{input_type: type} = setting) do
    value = effective_value(setting)
    
    case type do
      "number" ->
        case Float.parse(value) do
          {num, ""} -> num
          _ -> 0
        end
      "checkbox" ->
        value in ["true", "1", "yes", "on"]
      "range" ->
        case Integer.parse(value) do
          {num, ""} -> num
          _ -> 0
        end
      _ ->
        value
    end
  end

  def is_boolean_setting?(%__MODULE__{input_type: "checkbox"}), do: true
  def is_boolean_setting?(_), do: false

  def is_numeric_setting?(%__MODULE__{input_type: type}) do
    type in ["number", "range"]
  end

  def is_text_setting?(%__MODULE__{input_type: type}) do
    type in ["text", "textarea", "email", "url", "password"]
  end

  def is_select_setting?(%__MODULE__{input_type: type}) do
    type in ["select", "radio"]
  end

  def is_file_setting?(%__MODULE__{input_type: type}) do
    type in ["file", "image"]
  end

  def summary(%__MODULE__{} = setting) do
    %{
      id: setting.id,
      name: setting.name,
      title: setting.title,
      category_id: setting.category_id,
      category_title: setting.category_title,
      input_type: setting.input_type,
      value: setting.value,
      default_value: setting.default_value,
      is_active: setting.is_active,
      is_system: setting.is_system,
      is_required: setting.is_required,
      is_readonly: setting.is_readonly,
      is_translatable: setting.is_translatable,
      has_value: has_value?(setting),
      has_default: has_default?(setting),
      effective_value: effective_value(setting),
      typed_value: typed_value(setting),
      is_boolean: is_boolean_setting?(setting),
      is_numeric: is_numeric_setting?(setting),
      is_text: is_text_setting?(setting),
      is_select: is_select_setting?(setting),
      is_file: is_file_setting?(setting)
    }
  end

  def html_attributes(%__MODULE__{} = setting) do
    base_attrs = %{
      "name" => setting.name,
      "id" => "setting_#{setting.name}",
      "type" => setting.input_type
    }

    # Adicionar placeholder se necessário
    attrs = if has_placeholder?(setting), do: Map.put(base_attrs, "placeholder", setting.placeholder), else: base_attrs

    # Adicionar required se necessário
    attrs = if required?(setting), do: Map.put(attrs, "required", "required"), else: attrs

    # Adicionar readonly se necessário
    attrs = if readonly?(setting), do: Map.put(attrs, "readonly", "readonly"), else: attrs

    # Adicionar validações específicas
    validation_rules = validation_rules_map(setting)
    
    attrs = if Map.has_key?(validation_rules, "maxlength") do
      Map.put(attrs, "maxlength", validation_rules["maxlength"])
    else
      attrs
    end

    attrs = if Map.has_key?(validation_rules, "min") do
      Map.put(attrs, "min", validation_rules["min"])
    else
      attrs
    end

    attrs = if Map.has_key?(validation_rules, "max") do
      Map.put(attrs, "max", validation_rules["max"])
    else
      attrs
    end

    attrs
  end

  def configuration_suggestions(%__MODULE__{input_type: type, name: name}) do
    base_suggestions = case type do
      "text" ->
        ["Configure validação adequada", "Defina placeholder útil", "Limite tamanho se necessário"]
      "textarea" ->
        ["Configure número de linhas", "Defina limite de caracteres", "Use para textos longos"]
      "number" ->
        ["Defina valores mínimo e máximo", "Configure step se necessário", "Valide entrada numérica"]
      "email" ->
        ["Valide formato de email", "Configure placeholder exemplo", "Use para contatos"]
      "url" ->
        ["Valide formato de URL", "Configure placeholder exemplo", "Inclua protocolo"]
      "password" ->
        ["Defina tamanho mínimo", "Configure regras de segurança", "Use hash para armazenamento"]
      "select" ->
        ["Configure opções adequadas", "Defina valor padrão", "Organize por relevância"]
      "checkbox" ->
        ["Defina estado padrão", "Use para configurações booleanas", "Configure label clara"]
      "color" ->
        ["Defina cor padrão", "Use para personalização", "Valide formato hexadecimal"]
      "file" ->
        ["Configure tipos permitidos", "Defina tamanho máximo", "Valide upload"]
      "image" ->
        ["Configure dimensões", "Defina formatos aceitos", "Otimize para web"]
      _ ->
        ["Configure conforme necessidade", "Teste funcionalidade", "Valide entrada"]
    end

    # Adicionar sugestões específicas baseadas no nome
    name_suggestions = case name do
      "site_name" -> ["Use nome descritivo", "Evite caracteres especiais", "Mantenha conciso"]
      "admin_email" -> ["Use email válido", "Configure notificações", "Mantenha atualizado"]
      "theme" -> ["Teste compatibilidade", "Configure responsividade", "Valide recursos"]
      _ -> []
    end

    base_suggestions ++ name_suggestions
  end
end
