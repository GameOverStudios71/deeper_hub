defmodule DeeperHub.Core.Data.Schemas.SysSeoUriRewrites do
  @moduledoc """
  Represents the schema for the 'sys_seo_uri_rewrites' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_seo_uri_rewrites"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_seo_uri_rewrites" do
  #   field :module, :string
  #   field :name, :string
  #   field :title, :string
  #   field :uri_from, :string
  #   field :uri_to, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :name, :title, :uri_from, :uri_to])
  #   # |> validate_required([:name, :title, :uri_from, :uri_to])
  #   {struct_or_schema, attrs}
  # end
end
