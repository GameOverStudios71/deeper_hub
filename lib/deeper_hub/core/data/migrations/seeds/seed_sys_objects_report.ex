defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsReportSeed do
  @moduledoc """
  Seed para a tabela sys_objects_report.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_report...")

    Repo.execute("INSERT INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?)", [1, 31536000, 1])
    Repo.execute("INSERT INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?)", [2, 31536000, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
