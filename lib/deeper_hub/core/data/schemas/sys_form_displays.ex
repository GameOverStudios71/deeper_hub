defmodule DeeperHub.Core.Data.Schemas.SysFormDisplays do
  @moduledoc """
  Represents the schema for the 'sys_form_displays' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_form_displays"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_form_displays" do
  #   field :object, :string
  #   field :display_name, :string
  #   field :title, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:object, :display_name, :title])
  #   # |> validate_required([:object, :display_name])
  #   {struct_or_schema, attrs}
  # end
end
