defmodule DeeperHub.Core.Data.Schemas.SysStdWidgets do
  @moduledoc """
  Represents the schema for the 'sys_std_widgets' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_std_widgets"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_std_widgets" do
  #   field :module, :string
  #   field :type, :string
  #   field :url, :string
  #   field :caption, :string
  #   field :icon, :string
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:module, :type, :url, :caption, :icon])
  #   # |> validate_required([:module, :type])
  #   {struct_or_schema, attrs}
  # end
end
