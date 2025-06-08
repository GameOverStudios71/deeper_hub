defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesSeed do
  @moduledoc """
  Seed para a tabela sys_std_roles.
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
    Logger.info("Inserindo registros na tabela sys_std_roles...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_std_roles (id, name, title, description, active, order) VALUES (?, ?, ?, ?, ?, ?)", [1, "master", "_adm_rl_txt_role_master", "_adm_rl_txt_role_master_dsc", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles (id, name, title, description, active, order) VALUES (?, ?, ?, ?, ?, ?)", [2, "operator", "_adm_rl_txt_role_operator", "_adm_rl_txt_role_operator_dsc", 1, 2])
      Logger.info("Registros inseridos com sucesso na tabela sys_std_roles!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_std_roles: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_std_roles...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_std_roles")
    Logger.info("Tabela sys_std_roles limpa com sucesso.", module: __MODULE__)
  end
end
