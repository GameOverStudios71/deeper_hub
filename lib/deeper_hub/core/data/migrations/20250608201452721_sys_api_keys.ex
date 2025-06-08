defmodule DeeperHub.Core.Data.Migrations.SysApiKeys do
  @moduledoc """
  Migration para criar e remover a tabela sys_api_keys.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de sys_api_keys.
  """
  def up do
    Logger.info("Criando tabela de sys_api_keys...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_api_keys (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    'key' TEXT NOT NULL,
    'order' INTEGER NOT NULL
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_api_keys criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de sys_api_keys: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de sys_api_keys: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de sys_api_keys.
  """
  def down do
    Logger.info("Removendo tabela de sys_api_keys...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_api_keys
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_api_keys removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de sys_api_keys: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de sys_api_keys: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
