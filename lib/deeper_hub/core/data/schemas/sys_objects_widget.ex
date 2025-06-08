defmodule DeeperHub.Core.Data.Schemas.SysObjectsWidget do
  @moduledoc """
  Represents the schema for the 'sys_objects_widget' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_objects_widget"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_objects_widget" do
  #   field :module, :string
  #   field :name, :string
  #   field :title, :string
  #   field :type, :string
  #   field :deletable, :boolean
  #   field :override_class_name, :string
  #   field :override_class_file, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :name, :title, :type, :deletable, :override_class_name, :override_class_file])
  #   # |> validate_required([:name, :title, :type])
  #   {struct_or_schema, attrs}
  # end
end
