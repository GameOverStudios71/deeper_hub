defmodule DeeperHub.Core.Data.Schemas.SysContentInfoGrids do
  @moduledoc """
  Represents the schema for the 'sys_content_info_grids' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_content_info_grids"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_content_info_grids" do
  #   field :grid_object, :string
  #   field :content_info_object, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:grid_object, :content_info_object])
  #   # |> validate_required([:grid_object, :content_info_object])
  #   {struct_or_schema, attrs}
  # end
end
