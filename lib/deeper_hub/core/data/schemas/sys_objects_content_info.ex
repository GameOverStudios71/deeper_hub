defmodule DeeperHub.Core.Data.Schemas.SysObjectsContentInfo do
  @moduledoc """
  Represents the schema for the 'sys_objects_content_info' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_objects_content_info"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_objects_content_info" do
  #   field :object, :string
  #   field :module, :string
  #   field :title, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:object, :module, :title])
  #   # |> validate_required([:object])
  #   {struct_or_schema, attrs}
  # end
end
