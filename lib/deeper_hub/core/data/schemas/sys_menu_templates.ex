defmodule DeeperHub.Core.Data.Schemas.SysMenuTemplates do
  @moduledoc """
  Represents the schema for the 'sys_menu_templates' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_menu_templates"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_menu_templates" do
  #   field :module, :string
  #   field :name, :string
  #   field :title, :string
  #   field :template, :string # TEXT field
  #   field :attrs, :string # TEXT field
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :name, :title, :template, :attrs])
  #   # |> validate_required([:name, :title, :template])
  #   {struct_or_schema, attrs}
  # end
end
