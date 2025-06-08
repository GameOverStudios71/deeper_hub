defmodule DeeperHub.Core.Data.Schemas.SysGridFields do
  @moduledoc """
  Represents the schema for the 'sys_grid_fields' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_grid_fields"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_grid_fields" do
  #   field :object, :string
  #   field :name, :string
  #   field :title, :string
  #   field :width, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:object, :name, :title, :width])
  #   # |> validate_required([:object, :name])
  #   {struct_or_schema, attrs}
  # end
end
