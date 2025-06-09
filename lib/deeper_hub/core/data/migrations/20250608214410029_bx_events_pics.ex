defmodule DeeperHub.Core.Data.Migrations.BxEventsPics do
  @moduledoc """
  Migration para criar e remover a tabela bx_events_pics.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de bx_events_pics.
  """
  def up do
    Logger.info("Criando tabela de bx_events_pics...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS bx_events_pics (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    profile_id INTEGER NOT NULL,
    remote_id TEXT NOT NULL,
    path TEXT NOT NULL,
    file_name TEXT NOT NULL,
    mime_type TEXT NOT NULL,
    ext TEXT NOT NULL,
    size INTEGER NOT NULL,
    dimensions TEXT NOT NULL,
    added INTEGER NOT NULL,
    modified INTEGER NOT NULL,
    private INTEGER NOT NULL,
      UNIQUE (remote_id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de bx_events_pics criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de bx_events_pics: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de bx_events_pics: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de bx_events_pics.
  """
  def down do
    Logger.info("Removendo tabela de bx_events_pics...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS bx_events_pics
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de bx_events_pics removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de bx_events_pics: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de bx_events_pics: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
