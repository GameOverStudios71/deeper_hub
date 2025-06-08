defmodule DeeperHub.Core.Data.Schemas.SysFormDisplayInputs do
  @moduledoc """
  Represents the schema for the 'sys_form_display_inputs' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_form_display_inputs"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_form_display_inputs" do
  #   field :display_name, :string
  #   field :input_name, :string
  #   field :order, :integer
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:display_name, :input_name, :order])
  #   # |> validate_required([:display_name, :input_name])
  #   {struct_or_schema, attrs}
  # end
end
