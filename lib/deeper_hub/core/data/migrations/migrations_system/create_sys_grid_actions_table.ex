defmodule DeeperHub.Core.Data.Migrations.CreateSysGridActionsTable do
  @moduledoc """
  Migração para criar a tabela sys_grid_actions no banco de dados.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_grid_actions...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_grid_actions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      object TEXT NOT NULL,
      type TEXT NOT NULL,
      name TEXT NOT NULL,
      title TEXT,
      icon TEXT
    );

    CREATE UNIQUE INDEX IF NOT EXISTS idx_sys_grid_actions_object_type_name ON sys_grid_actions(object, type, name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_grid_actions criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_grid_actions: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_grid_actions...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_grid_actions;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_grid_actions removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_grid_actions: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
