defmodule DeeperHub.Core.Data.Migrations.SeedRegistry do
  @moduledoc """
  Migration para criar a tabela de controle de seeds executados.
  Esta tabela mantém registro de quais seeds já foram executados com sucesso.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migration para criar a tabela sys_seed_registry.
  """
  def up do
    Logger.info("Criando tabela sys_seed_registry para controle de seeds...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_seed_registry (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      seed_name TEXT NOT NULL UNIQUE,
      executed_at TEXT NOT NULL,
      status TEXT NOT NULL DEFAULT 'success',
      error_message TEXT,
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    )
    """

    case Repo.execute(sql) do
      {:ok, _result} ->
        Logger.info("Tabela sys_seed_registry criada com sucesso.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar tabela sys_seed_registry: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migration removendo a tabela sys_seed_registry.
  """
  def down do
    Logger.info("Removendo tabela sys_seed_registry...", module: __MODULE__)

    sql = "DROP TABLE IF EXISTS sys_seed_registry"

    case Repo.execute(sql) do
      {:ok, _result} ->
        Logger.info("Tabela sys_seed_registry removida com sucesso.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao remover tabela sys_seed_registry: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
