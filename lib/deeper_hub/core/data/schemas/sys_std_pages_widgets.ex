defmodule DeeperHub.Core.Data.Schemas.SysStdPagesWidgets do
  @moduledoc """
  Represents the schema for the 'sys_std_pages_widgets' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_std_pages_widgets"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_std_pages_widgets" do
  #   field :page_id, :integer
  #   field :widget_id, :integer
  #   field :order, :integer
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:page_id, :widget_id, :order])
  #   # |> validate_required([:page_id, :widget_id])
  #   {struct_or_schema, attrs}
  # end
end
