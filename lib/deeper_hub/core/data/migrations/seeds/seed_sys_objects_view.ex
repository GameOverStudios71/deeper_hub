defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsViewSeed do
  @moduledoc """
  Seed para a tabela sys_objects_view.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_view...")

    Repo.execute("INSERT INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons", "bx_persons_views_track", 86400, 31536000, 1, "bx_persons_data", "id", "author", "views", "", ""])

    IO.puts("Registros inseridos com sucesso!")
  end
end
