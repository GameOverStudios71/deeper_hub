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

    Repo.execute("INSERT INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_cmts", "system", "sys_cmts_reports", "sys_cmts_reports_track", 31536000, 1, "", "", "sys_cmts_ids", "id", "author_id", "reports", "", ""])
    Repo.execute("INSERT INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons", "bx_persons_reports", "bx_persons_reports_track", 31536000, 1, "page.php?i=view-persons-profile&id={object_id}", "bx_persons_notes", "bx_persons_data", "id", "author", "reports", "BxPersonsReport", "modules/boonex/persons/classes/BxPersonsReport.php"])

    IO.puts("Registros inseridos com sucesso!")
  end
end
