defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLiveUpdatesSeed do
  @moduledoc """
  Seed para a tabela sys_objects_live_updates.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_live_updates...")

    Repo.execute("INSERT INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?)", [1, 0, 1, 1])
    Repo.execute("INSERT INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?)", [2, 0, 1, 1])
    Repo.execute("INSERT INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?)", [3, 0, 1, 1])
    Repo.execute("INSERT INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?)", [4, 0, 1, 1])
    Repo.execute("INSERT INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?)", [5, 0, 1, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
