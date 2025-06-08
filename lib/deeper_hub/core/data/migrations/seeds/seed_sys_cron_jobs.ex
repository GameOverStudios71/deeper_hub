defmodule DeeperHub.Core.Data.Migrations.Seeds.SysCronJobsSeed do
  @moduledoc """
  Seed para a tabela sys_cron_jobs.
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
    Logger.info("Inserindo registros na tabela sys_cron_jobs...", module: __MODULE__)

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
      Logger.info("Registros inseridos com sucesso na tabela sys_cron_jobs!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_cron_jobs: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_cron_jobs...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_cron_jobs")
    Logger.info("Tabela sys_cron_jobs limpa com sucesso.", module: __MODULE__)
  end
end
