defmodule DeeperHub.Core.Data.Schemas.SysObjectsPage do
  @moduledoc """
  Represents the schema for the 'sys_objects_page' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_objects_page"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_objects_page" do
  #   field :module, :string
  #   field :name_system, :string
  #   field :name, :string
  #   field :title, :string
  #   field :layout_id, :integer
  #   field :deletable, :boolean
  #   field :override_class_name, :string
  #   field :override_class_file, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :name_system, :name, :title, :layout_id, :deletable, :override_class_name, :override_class_file])
  #   # |> validate_required([:name_system, :name, :title, :layout_id])
  #   {struct_or_schema, attrs}
  # end
end
