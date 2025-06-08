defmodule DeeperHub.Core.Data.Migrations.Seeds.SysCronJobsSeed do
  @moduledoc """
  Seed para a tabela sys_cron_jobs.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_cron_jobs...")

    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [1, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [2, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [3, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [4, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [5, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [6, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [7, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [8, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [9, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [10, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [11, 0, 0.0])
    Repo.execute("INSERT INTO sys_cron_jobs (id, name, time, class, file, service_call, ts, timing) VALUES (?, ?, ?)", [12, 0, 0.0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
