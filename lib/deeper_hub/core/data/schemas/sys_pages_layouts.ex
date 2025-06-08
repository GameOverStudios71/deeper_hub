defmodule DeeperHub.Core.Data.Schemas.SysPagesLayouts do
  @moduledoc """
  Represents the schema for the 'sys_pages_layouts' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_pages_layouts"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_pages_layouts" do
  #   field :module, :string
  #   field :name, :string
  #   field :title, :string
  #   field :template, :string # TEXT field
  #   field :cells_number, :integer
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :name, :title, :template, :cells_number])
  #   # |> validate_required([:name, :title, :template, :cells_number])
  #   {struct_or_schema, attrs}
  # end
end
