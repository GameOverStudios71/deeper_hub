defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesActionsSeed do
  @moduledoc """
  Seed para a tabela sys_std_roles_actions.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_std_roles_actions...")

    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?)", [1])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?)", [2])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?)", [3])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?)", [4])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?)", [5])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?)", [6])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?)", [7])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?)", [8])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?)", [9])

    IO.puts("Registros inseridos com sucesso!")
  end
end
