defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsReportSeed do
  @moduledoc """
  Seed para a tabela sys_objects_report.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_report_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_report já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_report...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_cmts", "system", "sys_cmts_reports", "sys_cmts_reports_track", 31536000, 1, "", "", "sys_cmts_ids", "id", "author_id", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons", "bx_persons_reports", "bx_persons_reports_track", 31536000, 1, "page.php?i=view-persons-profile&id={object_id}", "bx_persons_notes", "bx_persons_data", "id", "author", "reports", "BxPersonsReport", "modules/boonex/persons/classes/BxPersonsReport.php"])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_report executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_report: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_report...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_report será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_report...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_report")
    Logger.info("Tabela sys_objects_report limpa com sucesso.", module: __MODULE__)
  end

  # Funções privadas para controle de execução
  defp seed_already_executed? do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.exists?(seed_file)
  end

  defp mark_seed_executed do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    File.write(seed_file, "executed_at: #{timestamp}")
  end

  defp ensure_seeds_dir do
    unless File.exists?(@seeds_dir) do
      File.mkdir_p(@seeds_dir)
    end
  end
end
