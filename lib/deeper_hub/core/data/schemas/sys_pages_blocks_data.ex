defmodule DeeperHub.Core.Data.Schemas.SysPagesBlocksData do
  @moduledoc """
  Represents the schema for the 'sys_pages_blocks_data' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_pages_blocks_data"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_pages_blocks_data" do
  #   field :block_id, :integer
  #   field :system, :boolean
  #   field :key, :string
  #   field :value, :string # TEXT field
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:block_id, :system, :key, :value])
  #   # |> validate_required([:block_id, :key, :value])
  #   {struct_or_schema, attrs}
  # end
end
