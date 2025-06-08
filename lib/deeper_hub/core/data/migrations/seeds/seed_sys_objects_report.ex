defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsReportSeed do
  @moduledoc """
  Seed para a tabela sys_objects_report.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Insere os registros na tabela.
  Usa INSERT OR REPLACE para evitar erros de UNIQUE CONSTRAINT.
  """
  def run do
    Logger.info("Inserindo registros na tabela sys_objects_report...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_cmts", "system", "sys_cmts_reports", "sys_cmts_reports_track", 31536000, 1, "", "", "sys_cmts_ids", "id", "author_id", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons", "bx_persons_reports", "bx_persons_reports_track", 31536000, 1, "page.php?i=view-persons-profile&id={object_id}", "bx_persons_notes", "bx_persons_data", "id", "author", "reports", "BxPersonsReport", "modules/boonex/persons/classes/BxPersonsReport.php"])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_report!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_report: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_report...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_report")
    Logger.info("Tabela sys_objects_report limpa com sucesso.", module: __MODULE__)
  end
end
