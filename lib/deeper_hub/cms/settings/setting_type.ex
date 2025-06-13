defmodule DeeperHub.CMS.Settings.SettingType do
  @moduledoc """
  Schema para tipos de configuração do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_setting_types"

  @derive Jason.Encoder
  defstruct [
    :id, :name, :title, :description, :input_type, :validation_rules, :default_options,
    :is_active, :is_system, :created_at, :order_index
  ]

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

  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  def text_type?(%__MODULE__{input_type: "text"}), do: true
  def text_type?(_), do: false

  def textarea_type?(%__MODULE__{input_type: "textarea"}), do: true
  def textarea_type?(_), do: false

  def select_type?(%__MODULE__{input_type: "select"}), do: true
  def select_type?(_), do: false

  def checkbox_type?(%__MODULE__{input_type: "checkbox"}), do: true
  def checkbox_type?(_), do: false

  def file_type?(%__MODULE__{input_type: type}) do
    type in ["file", "image"]
  end

  def validation_rules_map(%__MODULE__{validation_rules: rules}) when is_binary(rules) and rules != "" do
    case Jason.decode(rules) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def validation_rules_map(_), do: %{}

  def default_options_map(%__MODULE__{default_options: options}) when is_binary(options) and options != "" do
    case Jason.decode(options) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def default_options_map(_), do: %{}

  def summary(%__MODULE__{} = type) do
    %{
      id: type.id,
      name: type.name,
      title: type.title,
      input_type: type.input_type,
      is_active: type.is_active,
      is_system: type.is_system,
      order_index: type.order_index,
      is_text: text_type?(type),
      is_select: select_type?(type),
      is_file: file_type?(type)
    }
  end
end
