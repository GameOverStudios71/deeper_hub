defmodule DeeperHub.Core.Data.Schemas.SysSeoLinks do
  @moduledoc """
  Represents the schema for the 'sys_seo_links' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_seo_links"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_seo_links" do
  #   field :module, :string
  #   field :object, :string
  #   field :object_id, :integer
  #   field :uri, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :object, :object_id, :uri])
  #   # |> validate_required([:module, :object, :uri])
  #   {struct_or_schema, attrs}
  # end
end
