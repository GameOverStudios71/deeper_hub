defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFavoriteSeed do
  @moduledoc """
  Seed para a tabela sys_objects_favorite.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_favorite...")

    Repo.execute("INSERT INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?)", [1, 31536000, 1, 1, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
