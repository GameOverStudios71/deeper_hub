defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesActions2rolesSeed do
  @moduledoc """
  Seed para a tabela sys_std_roles_actions2roles.
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
    Logger.info("Inserindo registros na tabela sys_std_roles_actions2roles...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 7])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 8])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [1, 9])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 7])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 8])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions2roles (role_id, action_id) VALUES (?, ?)", [2, 9])
      Logger.info("Registros inseridos com sucesso na tabela sys_std_roles_actions2roles!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_std_roles_actions2roles: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_std_roles_actions2roles...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_std_roles_actions2roles")
    Logger.info("Tabela sys_std_roles_actions2roles limpa com sucesso.", module: __MODULE__)
  end
end
