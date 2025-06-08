defmodule DeeperHub.Core.Data.Schemas.SysPagesBlocks do
  @moduledoc """
  Represents the schema for the 'sys_pages_blocks' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_pages_blocks"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_pages_blocks" do
  #   field :object, :string
  #   field :cell_id, :integer
  #   field :module, :string
  #   field :title_system, :string
  #   field :title, :string
  #   field :designbox_id, :integer
  #   field :visible_for_levels, :integer
  #   field :type, :string
  #   field :content, :string # TEXT field
  #   field :deletable, :boolean
  #   field :copyable, :boolean
  #   field :active, :boolean
  #   field :order, :integer
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:object, :cell_id, :module, :title_system, :title, :designbox_id, :visible_for_levels, :type, :content, :deletable, :copyable, :active, :order])
  #   # |> validate_required([:object, :title])
  #   {struct_or_schema, attrs}
  # end
end
