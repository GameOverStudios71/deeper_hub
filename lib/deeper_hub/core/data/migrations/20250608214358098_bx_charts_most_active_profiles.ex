defmodule DeeperHub.Core.Data.Migrations.BxChartsMostActiveProfiles do
  @moduledoc """
  Migration para criar e remover a tabela bx_charts_most_active_profiles.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de bx_charts_most_active_profiles.
  """
  def up do
    Logger.info("Criando tabela de bx_charts_most_active_profiles...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS bx_charts_most_active_profiles (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    object_id INTEGER NOT NULL DEFAULT 0,
    profile_module TEXT NOT NULL,
    content_module TEXT NOT NULL,
    views_count INTEGER NOT NULL DEFAULT 0,
    create_count INTEGER NOT NULL DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de bx_charts_most_active_profiles criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de bx_charts_most_active_profiles: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de bx_charts_most_active_profiles: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de bx_charts_most_active_profiles.
  """
  def down do
    Logger.info("Removendo tabela de bx_charts_most_active_profiles...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS bx_charts_most_active_profiles
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de bx_charts_most_active_profiles removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de bx_charts_most_active_profiles: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de bx_charts_most_active_profiles: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
