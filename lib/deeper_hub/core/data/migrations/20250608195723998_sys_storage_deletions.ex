defmodule DeeperHub.Core.Data.Migrations.SysStorageDeletions do
  @moduledoc """
  Migration para criar e remover a tabela sys_storage_deletions.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de sys_storage_deletions.
  """
  def up do
    Logger.info("Criando tabela de sys_storage_deletions...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_storage_deletions (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    object TEXT NOT NULL,
    file_id INTEGER NOT NULL,
    requested INTEGER NOT NULL,
      UNIQUE (object, file_id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_storage_deletions criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de sys_storage_deletions: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de sys_storage_deletions: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de sys_storage_deletions.
  """
  def down do
    Logger.info("Removendo tabela de sys_storage_deletions...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_storage_deletions
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_storage_deletions removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de sys_storage_deletions: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de sys_storage_deletions: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
