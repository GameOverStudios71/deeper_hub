defmodule DeeperHub.Core.Data.Migrations.SysRecommendationData do
  @moduledoc """
  Migration para criar e remover a tabela sys_recommendation_data.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de sys_recommendation_data.
  """
  def up do
    Logger.info("Criando tabela de sys_recommendation_data...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_recommendation_data (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    profile_id INTEGER NOT NULL DEFAULT 0,
    object_id INTEGER NOT NULL DEFAULT 0,
    item_id INTEGER NOT NULL DEFAULT 0,
    item_type TEXT NOT NULL,
    item_value INTEGER NOT NULL DEFAULT 0,
    item_reducer INTEGER NOT NULL DEFAULT 0,
      UNIQUE (profile_id, object_id, item_id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_recommendation_data criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de sys_recommendation_data: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de sys_recommendation_data: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de sys_recommendation_data.
  """
  def down do
    Logger.info("Removendo tabela de sys_recommendation_data...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_recommendation_data
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_recommendation_data removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de sys_recommendation_data: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de sys_recommendation_data: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
