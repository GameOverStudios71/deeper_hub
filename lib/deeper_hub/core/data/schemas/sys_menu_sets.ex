defmodule DeeperHub.Core.Data.Schemas.SysMenuSets do
  @moduledoc """
  Represents the schema for the 'sys_menu_sets' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_menu_sets"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_menu_sets" do
  #   field :module, :string
  #   field :name, :string
  #   field :title, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :name, :title])
  #   # |> validate_required([:name, :title])
  #   {struct_or_schema, attrs}
  # end
end
