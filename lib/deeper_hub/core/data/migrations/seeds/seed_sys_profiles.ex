defmodule DeeperHub.Core.Data.Migrations.Seeds.SysProfilesSeed do
  @moduledoc """
  Seed para a tabela sys_profiles.
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
    Logger.info("Inserindo registros na tabela sys_profiles...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_profiles (id, account_id, 'type', content_id, cfw_value, cfw_items, cfu_items, cfu_locked, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, 1, "system", 1, 2147483647, 2147483647, 2147483647, 0, "active"])
    Repo.execute("INSERT OR REPLACE INTO sys_profiles (id, account_id, 'type', content_id, cfw_value, cfw_items, cfu_items, cfu_locked, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, 2, "system", 2, 2147483647, 2147483647, 2147483647, 0, "active"])
      Logger.info("Registros inseridos com sucesso na tabela sys_profiles!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_profiles: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_profiles...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_profiles")
    Logger.info("Tabela sys_profiles limpa com sucesso.", module: __MODULE__)
  end
end
