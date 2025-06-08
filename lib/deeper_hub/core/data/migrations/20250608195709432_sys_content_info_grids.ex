defmodule DeeperHub.Core.Data.Migrations.SysContentInfoGrids do
  @moduledoc """
  Migration para criar e remover a tabela sys_content_info_grids.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de sys_content_info_grids.
  """
  def up do
    Logger.info("Criando tabela de sys_content_info_grids...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_content_info_grids (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    object TEXT NOT NULL,
    grid_object TEXT NOT NULL,
    grid_field_id TEXT NOT NULL,
    condition TEXT NOT NULL DEFAULT '''',
    selection TEXT NOT NULL,
      UNIQUE (grid_object)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_content_info_grids criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de sys_content_info_grids: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de sys_content_info_grids: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de sys_content_info_grids.
  """
  def down do
    Logger.info("Removendo tabela de sys_content_info_grids...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_content_info_grids
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_content_info_grids removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de sys_content_info_grids: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de sys_content_info_grids: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
