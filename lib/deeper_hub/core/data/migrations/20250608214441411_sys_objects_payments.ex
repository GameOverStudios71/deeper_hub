defmodule DeeperHub.Core.Data.Migrations.SysObjectsPayments do
  @moduledoc """
  Migration para criar e remover a tabela sys_objects_payments.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de sys_objects_payments.
  """
  def up do
    Logger.info("Criando tabela de sys_objects_payments...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_objects_payments (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    object TEXT NOT NULL,
    title TEXT NOT NULL,
    uri TEXT NOT NULL,
      UNIQUE (object),
      UNIQUE (uri)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_objects_payments criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de sys_objects_payments: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de sys_objects_payments: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de sys_objects_payments.
  """
  def down do
    Logger.info("Removendo tabela de sys_objects_payments...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_objects_payments
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_objects_payments removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de sys_objects_payments: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de sys_objects_payments: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
