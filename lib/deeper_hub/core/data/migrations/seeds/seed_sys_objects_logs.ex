defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLogsSeed do
  @moduledoc """
  Seed para a tabela sys_objects_logs.
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
    Logger.info("Inserindo registros na tabela sys_objects_logs...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_debug", "system", "Auto", "_sys_log_debug", 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_sms", "system", "Auto", "_sys_log_sms", 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_push", "system", "Auto", "_sys_log_push", 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_payments", "system", "Auto", "_sys_log_payments", 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [5, "sys_cron_jobs", "system", "Auto", "_sys_log_cron_jobs", 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [6, "sys_transcoder", "system", "Auto", "_sys_log_transcoder", 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [7, "sys_background_jobs", "system", "Auto", "_sys_log_background_jobs", 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [8, "bx_profiler", "bx_profiler", "Auto", "_bx_profiler_log", 1, "", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_logs!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_logs: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_logs...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_logs")
    Logger.info("Tabela sys_objects_logs limpa com sucesso.", module: __MODULE__)
  end
end
