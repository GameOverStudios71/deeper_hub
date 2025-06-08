defmodule DeeperHub.Core.Data.Schemas.SysPagesWikiBlocks do
  @moduledoc """
  Represents the schema for the 'sys_pages_wiki_blocks' table.
  This module uses DeeperHub.Core.Data.SchemaBase to provide CRUD operations.
  """
  use DeeperHub.Core.Data.SchemaBase, table_name: "sys_pages_wiki_blocks"

  # Example Ecto.Schema (optional):
  # use Ecto.Schema
  # import Ecto.Changeset
  #
  # @primary_key {:id, :id, autogenerate: true}
  # schema "sys_pages_wiki_blocks" do
  #   field :page_id, :integer
  #   field :block_id, :integer
  #   field :revision, :integer
  #   field :profile_id, :integer
  #   field :content, :string # TEXT field
  #   field :added, :integer # Timestamp
  #
  #   # timestamps() - 'added' might serve as 'inserted_at'
  # end
  #
  # def changeset(struct_or_schema, attrs) do
  #   # struct_or_schema
  #   # |> cast(attrs, [:page_id, :block_id, :revision, :profile_id, :content, :added])
  #   # |> validate_required([:page_id, :block_id, :profile_id, :content, :added])
  #   {struct_or_schema, attrs}
  # end
end
