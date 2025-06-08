defmodule DeeperHub.Core.Data.Schemas.SysPagesTypes do
  @moduledoc """
  Represents the schema for the 'sys_pages_types' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_pages_types"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_pages_types" do
  #   field :module, :string
  #   field :name, :string
  #   field :title, :string
  #   field :layout_id, :integer
  #   field :visible_for_levels, :integer
  #   field :url, :string
  #   field :uri, :string
  #   field :icon, :string
  #   field :index, :integer
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :name, :title, :layout_id, :visible_for_levels, :url, :uri, :icon, :index])
  #   # |> validate_required([:name, :title, :layout_id, :uri])
  #   {struct_or_schema, attrs}
  # end
end
