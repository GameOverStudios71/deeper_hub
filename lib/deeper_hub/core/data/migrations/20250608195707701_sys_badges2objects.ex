defmodule DeeperHub.Core.Data.Migrations.SysBadges2objects do
  @moduledoc """
  Migration para criar e remover a tabela sys_badges2objects.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de sys_badges2objects.
  """
  def up do
    Logger.info("Criando tabela de sys_badges2objects...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_badges2objects (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    badge_id INTEGER NOT NULL,
    object_id INTEGER NOT NULL,
    module TEXT NOT NULL,
    added INTEGER NOT NULL,
      UNIQUE (object_id, badge_id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_badges2objects criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de sys_badges2objects: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de sys_badges2objects: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de sys_badges2objects.
  """
  def down do
    Logger.info("Removendo tabela de sys_badges2objects...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_badges2objects
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_badges2objects removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de sys_badges2objects: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de sys_badges2objects: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
