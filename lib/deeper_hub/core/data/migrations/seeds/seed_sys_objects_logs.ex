defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLogsSeed do
  @moduledoc """
  Seed para a tabela sys_objects_logs.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_logs...")

    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_debug", "system", "Auto", "_sys_log_debug", 1, "", ""])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_sms", "system", "Auto", "_sys_log_sms", 1, "", ""])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_push", "system", "Auto", "_sys_log_push", 1, "", ""])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_payments", "system", "Auto", "_sys_log_payments", 1, "", ""])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [5, "sys_cron_jobs", "system", "Auto", "_sys_log_cron_jobs", 0, "", ""])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [6, "sys_transcoder", "system", "Auto", "_sys_log_transcoder", 1, "", ""])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [7, "sys_background_jobs", "system", "Auto", "_sys_log_background_jobs", 1, "", ""])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [8, "bx_profiler", "bx_profiler", "Auto", "_bx_profiler_log", 1, "", ""])

    IO.puts("Registros inseridos com sucesso!")
  end
end
