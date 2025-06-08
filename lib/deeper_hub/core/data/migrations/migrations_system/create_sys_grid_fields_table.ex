defmodule DeeperHub.Core.Data.Migrations.CreateSysGridFieldsTable do
  @moduledoc """
  Migração para criar a tabela sys_grid_fields no banco de dados.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_grid_fields...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_grid_fields (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      object TEXT NOT NULL,
      name TEXT NOT NULL,
      title TEXT,
      width TEXT
    );

    CREATE UNIQUE INDEX IF NOT EXISTS idx_sys_grid_fields_object_name ON sys_grid_fields(object, name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_grid_fields criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_grid_fields: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_grid_fields...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_grid_fields;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_grid_fields removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_grid_fields: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
