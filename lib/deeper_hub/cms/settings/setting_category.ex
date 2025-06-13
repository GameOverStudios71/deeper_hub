defmodule DeeperHub.CMS.Settings.SettingCategory do
  @moduledoc """
  Schema para categorias de configuração do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_setting_categories"

  @derive Jason.Encoder
  defstruct [
    :id, :name, :title, :description, :icon, :is_active, :is_system, 
    :created_at, :order_index
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      icon: attrs[:icon] || "",
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

  def has_icon?(%__MODULE__{icon: icon}) do
    is_binary(icon) and String.trim(icon) != ""
  end

  def summary(%__MODULE__{} = category) do
    %{
      id: category.id,
      name: category.name,
      title: category.title,
      icon: category.icon,
      is_active: category.is_active,
      is_system: category.is_system,
      order_index: category.order_index,
      has_icon: has_icon?(category)
    }
  end
end
