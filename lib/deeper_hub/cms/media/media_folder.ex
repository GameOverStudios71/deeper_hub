defmodule DeeperHub.CMS.Media.MediaFolder do
  @moduledoc """
  Schema para pastas de mídia do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_media_folders"

  @derive Jason.Encoder
  defstruct [
    :id, :parent_id, :storage_id, :name, :path, :full_path, :description,
    :is_public, :visible_for_levels, :is_active, :is_system, :created_at,
    :updated_at, :created_by, :storage_title
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      parent_id: attrs[:parent_id],
      storage_id: attrs[:storage_id],
      name: attrs[:name],
      path: attrs[:path],
      full_path: attrs[:full_path],
      description: attrs[:description] || "",
      is_public: attrs[:is_public] || true,
      visible_for_levels: attrs[:visible_for_levels] || 2147483647,
      is_active: attrs[:is_active] || true,
      is_system: attrs[:is_system] || false,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at],
      created_by: attrs[:created_by],
      storage_title: attrs[:storage_title]
    }
  end

  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  def public?(%__MODULE__{is_public: true}), do: true
  def public?(_), do: false

  def system?(%__MODULE__{is_system: true}), do: true
  def system?(_), do: false

  def root_folder?(%__MODULE__{parent_id: nil}), do: true
  def root_folder?(_), do: false

  def sub_folder?(%__MODULE__{parent_id: parent_id}) when is_integer(parent_id), do: true
  def sub_folder?(_), do: false

  def summary(%__MODULE__{} = folder) do
    %{
      id: folder.id,
      parent_id: folder.parent_id,
      storage_id: folder.storage_id,
      name: folder.name,
      path: folder.path,
      full_path: folder.full_path,
      is_active: folder.is_active,
      is_public: folder.is_public,
      is_system: folder.is_system,
      is_root: root_folder?(folder),
      storage_title: folder.storage_title
    }
  end
end
