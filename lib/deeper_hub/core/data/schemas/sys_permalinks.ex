defmodule DeeperHub.Core.Data.Schemas.SysPermalinks do
  @moduledoc """
  Represents the schema for the 'sys_permalinks' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_permalinks"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_permalinks" do
  #   field :standard, :string
  #   field :permalink, :string
  #   field :view, :string
  #   field :module, :string
  #   field :check, :string
  #   field :active, :boolean
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:standard, :permalink, :view, :module, :check, :active])
  #   # |> validate_required([:standard, :permalink, :module])
  #   {struct_or_schema, attrs}
  # end
end
