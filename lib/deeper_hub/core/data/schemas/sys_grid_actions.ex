defmodule DeeperHub.Core.Data.Schemas.SysGridActions do
  @moduledoc """
  Represents the schema for the 'sys_grid_actions' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_grid_actions"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_grid_actions" do
  #   field :object, :string
  #   field :type, :string
  #   field :name, :string
  #   field :title, :string
  #   field :icon, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:object, :type, :name, :title, :icon])
  #   # |> validate_required([:object, :type, :name])
  #   {struct_or_schema, attrs}
  # end
end
