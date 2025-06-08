defmodule DeeperHub.Core.Data.Schemas.SysRewriteRules do
  @moduledoc """
  Represents the schema for the 'sys_rewrite_rules' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_rewrite_rules"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_rewrite_rules" do
  #   field :module, :string
  #   field :uri, :string
  #   field :replace, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :uri, :replace])
  #   # |> validate_required([:module, :uri, :replace])
  #   {struct_or_schema, attrs}
  # end
end
