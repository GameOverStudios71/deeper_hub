defmodule DeeperHub.CMS.Forms.FormPreList do
  @moduledoc """
  Schema para listas pré-definidas do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_form_pre_lists"

  @derive Jason.Encoder
  defstruct [
    :id, :name, :title, :description, :module, :list_type, :source_table,
    :source_query, :source_api_url, :cache_lifetime, :is_active, :is_system,
    :created_at, :updated_at
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      module: attrs[:module] || "cms",
      list_type: attrs[:list_type] || "static",
      source_table: attrs[:source_table] || "",
      source_query: attrs[:source_query] || "",
      source_api_url: attrs[:source_api_url] || "",
      cache_lifetime: attrs[:cache_lifetime] || 3600,
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at]
    }
  end

  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  def static_type?(%__MODULE__{list_type: "static"}), do: true
  def static_type?(_), do: false

  def dynamic_type?(%__MODULE__{list_type: "dynamic"}), do: true
  def dynamic_type?(_), do: false

  def api_type?(%__MODULE__{list_type: "api"}), do: true
  def api_type?(_), do: false
end
