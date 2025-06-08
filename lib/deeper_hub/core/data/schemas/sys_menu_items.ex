defmodule DeeperHub.Core.Data.Schemas.SysMenuItems do
  @moduledoc """
  Represents the schema for the 'sys_menu_items' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_menu_items"

  # Note: Field definitions are not strictly required by SchemaBase/Crud as they
  # operate on maps and dynamic SQL. However, you might want to add Ecto.Schema
  # and field definitions here for clarity, validation (changesets), or if you
  # plan to integrate more deeply with Ecto in the future.
  #
  # For example, to add Ecto schema and changesets:
  #
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true} # Ecto convention
  # schema "sys_menu_items" do
  #   field :set_name, :string
  #   field :module, :string
  #   field :name, :string
  #   field :title_system, :string
  #   field :title, :string
  #   field :link, :string
  #   field :onclick, :string
  #   field :target, :string
  #   field :icon, :string
  #   field :addon, :string
  #   field :submenu_object, :string
  #   field :submenu_popup, :boolean
  #   field :visible_for_levels, :integer
  #   field :visible_for_id, :integer
  #   field :active, :boolean
  #   field :copyable, :boolean
  #   field :editable, :boolean
  #   field :hidden_on, :string
  #   field :order, :integer
  #   field :parent_id, :integer
  #
  #   # timestamps()
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # Example with Ecto.Changeset:
  #   # struct_or_schema
  #   # |> cast(attrs, [:set_name, :module, :name, :title, :link, :onclick, :target, :icon, :addon, :submenu_object, :submenu_popup, :visible_for_levels, :visible_for_id, :active, :copyable, :editable, :hidden_on, :order, :parent_id])
  #   # |> validate_required([:name, :title, :link])
  #   {struct_or_schema, attrs} # Basic pass-through if not using Ecto.Changeset
  # end
end
