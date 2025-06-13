defmodule DeeperHub.CMS.Settings.ThemeSetting do
  @moduledoc """
  Schema para configurações específicas de tema do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_theme_settings"

  @derive Jason.Encoder
  defstruct [
    :id, :theme_id, :setting_name, :setting_value, :setting_type, :is_active, 
    :created_at, :updated_at
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      theme_id: attrs[:theme_id],
      setting_name: attrs[:setting_name],
      setting_value: attrs[:setting_value] || "",
      setting_type: attrs[:setting_type] || "text",
      is_active: attrs[:is_active] || true,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at]
    }
  end

  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  def has_value?(%__MODULE__{setting_value: value}) do
    is_binary(value) and String.trim(value) != ""
  end

  def typed_value(%__MODULE__{setting_value: value, setting_type: type}) do
    case type do
      "boolean" ->
        value in ["true", "1", "yes", "on"]
      "number" ->
        case Float.parse(value) do
          {num, ""} -> num
          _ -> 0
        end
      "json" ->
        case Jason.decode(value) do
          {:ok, parsed} -> parsed
          {:error, _} -> %{}
        end
      _ ->
        value
    end
  end

  def summary(%__MODULE__{} = setting) do
    %{
      id: setting.id,
      theme_id: setting.theme_id,
      setting_name: setting.setting_name,
      setting_value: setting.setting_value,
      setting_type: setting.setting_type,
      is_active: setting.is_active,
      has_value: has_value?(setting),
      typed_value: typed_value(setting)
    }
  end
end
