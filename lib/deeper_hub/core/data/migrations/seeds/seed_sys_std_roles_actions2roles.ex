defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesActions2rolesSeed do
  @moduledoc """
  Seed para a tabela sys_std_roles_actions2roles.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_std_roles_actions2roles...")

    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 1])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 2])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 3])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 4])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 5])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 6])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 7])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 8])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 9])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 3])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 4])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 5])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 6])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 7])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 8])
    Repo.execute("INSERT INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 9])

    IO.puts("Registros inseridos com sucesso!")
  end
end
