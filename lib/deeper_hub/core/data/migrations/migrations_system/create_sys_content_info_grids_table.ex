defmodule DeeperHub.Core.Data.Migrations.CreateSysContentInfoGridsTable do
  @moduledoc """
  Migração para criar a tabela sys_content_info_grids no banco de dados.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_content_info_grids...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_content_info_grids (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      grid_object TEXT NOT NULL,
      content_info_object TEXT NOT NULL
    );

    CREATE UNIQUE INDEX IF NOT EXISTS idx_sys_content_info_grids_grid_content ON sys_content_info_grids(grid_object, content_info_object);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_content_info_grids criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_content_info_grids: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_content_info_grids...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_content_info_grids;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_content_info_grids removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_content_info_grids: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
