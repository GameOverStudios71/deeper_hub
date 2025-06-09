defmodule DeeperHub.Core.Data.Migrations.BxChartsMostFollowedProfiles do
  @moduledoc """
  Migration para criar e remover a tabela bx_charts_most_followed_profiles.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de bx_charts_most_followed_profiles.
  """
  def up do
    Logger.info("Criando tabela de bx_charts_most_followed_profiles...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS bx_charts_most_followed_profiles (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    object_id INTEGER NOT NULL DEFAULT 0,
    profile_module TEXT NOT NULL,
    followers_count INTEGER NOT NULL DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de bx_charts_most_followed_profiles criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de bx_charts_most_followed_profiles: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de bx_charts_most_followed_profiles: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de bx_charts_most_followed_profiles.
  """
  def down do
    Logger.info("Removendo tabela de bx_charts_most_followed_profiles...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS bx_charts_most_followed_profiles
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de bx_charts_most_followed_profiles removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de bx_charts_most_followed_profiles: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de bx_charts_most_followed_profiles: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
