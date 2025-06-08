defmodule DeeperHub.Core.Data.Schemas.SysStdPages do
  @moduledoc """
  Represents the schema for the 'sys_std_pages' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_std_pages"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_std_pages" do
  #   field :index, :integer
  #   field :name, :string
  #   field :header, :string
  #   field :caption, :string
  #   field :icon, :string
  #   field :cover, :string
  #   field :cover_title, :string
  #   field :cover_image, :integer
  #   field :cover_position, :string
  #   field :type_id, :integer
  #   field :uri, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:index, :name, :header, :caption, :icon, :cover, :cover_title, :cover_image, :cover_position, :type_id, :uri])
  #   # |> validate_required([:name, :uri])
  #   {struct_or_schema, attrs}
  # end
end
