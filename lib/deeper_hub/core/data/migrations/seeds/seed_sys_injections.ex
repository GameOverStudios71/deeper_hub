defmodule DeeperHub.Core.Data.Migrations.Seeds.SysInjectionsSeed do
  @moduledoc """
  Seed para a tabela sys_injections.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_injections...")

    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?)", [1, 150, 0, 1])
    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?)", [2, 0, 0, 1])
    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?)", [3, 0, 0, 1])
    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?)", [4, 0, 0, 1])
    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?)", [5, 0, 0, 1])
    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?)", [6, 0, 0, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
