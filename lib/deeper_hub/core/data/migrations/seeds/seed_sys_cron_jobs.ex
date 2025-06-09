defmodule DeeperHub.Core.Data.Migrations.Seeds.SysCronJobsSeed do
  @moduledoc """
  Seed para a tabela sys_cron_jobs.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_cron_jobs_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_cron_jobs já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_cron_jobs...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "pruning", "0 0 * * *", "BxDolCronPruning", "inc/classes/BxDolCronPruning.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_acl", "0 0 * * *", "BxDolCronAcl", "inc/classes/BxDolCronAcl.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_account", "0 0 * * *", "BxDolCronAccount", "inc/classes/BxDolCronAccount.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_profile", "0 0 * * *", "BxDolCronProfile", "inc/classes/BxDolCronProfile.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [5, "sys_upgrade", "0 3 * * *", "BxDolCronUpgradeCheck", "inc/classes/BxDolCronUpgradeCheck.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [6, "sys_upgrade_modules", "30 2 * * *", "BxDolCronUpgradeModulesCheck", "inc/classes/BxDolCronUpgradeModulesCheck.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [7, "sys_storage", "* * * * *", "BxDolCronStorage", "inc/classes/BxDolCronStorage.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [8, "sys_transcoder", "* * * * *", "BxDolCronTranscoder", "inc/classes/BxDolCronTranscoder.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [9, "sys_queue_email", "* * * * *", "BxDolCronQueueEmail", "inc/classes/BxDolCronQueueEmail.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [10, "sys_queue_push", "* * * * *", "BxDolCronQueuePush", "inc/classes/BxDolCronQueuePush.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [11, "sys_audit_clean", "* * * * *", "BxDolCronAudit", "inc/classes/BxDolCronAudit.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [12, "sys_background_jobs", "* * * * *", "BxDolCronBackgroundJobs", "inc/classes/BxDolCronBackgroundJobs.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [15, "bx_charts_cron", "0 1 * * *", "BxChartsCron", "modules/boonex/charts/classes/BxChartsCron.php", "", 0, 0.0])
    Repo.execute("INSERT OR REPLACE INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [16, "bx_reminders", "0 0 * * *", "BxRemindersCron", "modules/boonex/reminders/classes/BxRemindersCron.php", "", 0, 0.0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_cron_jobs executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_cron_jobs: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_cron_jobs...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_cron_jobs será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_cron_jobs...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_cron_jobs")
    Logger.info("Tabela sys_cron_jobs limpa com sucesso.", module: __MODULE__)
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
