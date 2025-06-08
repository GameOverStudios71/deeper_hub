defmodule DeeperHub.Core.Data.Schemas.SysFormInputs do
  @moduledoc """
  Represents the schema for the 'sys_form_inputs' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_form_inputs"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_form_inputs" do
  #   field :object, :string
  #   field :name, :string
  #   field :type, :string
  #   field :caption, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:object, :name, :type, :caption])
  #   # |> validate_required([:object, :name])
  #   {struct_or_schema, attrs}
  # end
end
