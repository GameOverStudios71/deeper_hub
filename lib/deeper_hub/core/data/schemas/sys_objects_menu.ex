defmodule DeeperHub.Core.Data.Schemas.SysObjectsMenu do
  @moduledoc """
  Represents the schema for the 'sys_objects_menu' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_objects_menu"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_objects_menu" do
  #   field :module, :string
  #   field :name, :string
  #   field :title, :string
  #   field :object, :string
  #   field :set_name, :string
  #   field :type, :string
  #   field :template_id, :integer
  #   field :deletable, :boolean
  #   field :override_class_name, :string
  #   field :override_class_file, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :name, :title, :object, :set_name, :type, :template_id, :deletable, :override_class_name, :override_class_file])
  #   # |> validate_required([:name, :title, :object, :set_name])
  #   {struct_or_schema, attrs}
  # end
end
