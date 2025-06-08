defmodule DeeperHub.Core.Data.Migrations.CreateSysObjectsViewTable do
  @moduledoc """
  Migração para criar a tabela sys_objects_view no banco de dados.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_objects_view...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_objects_view (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      object TEXT NOT NULL UNIQUE,
      module TEXT,
      title TEXT,
      class_name TEXT,
      class_file TEXT
    );

    CREATE INDEX IF NOT EXISTS idx_sys_objects_view_object ON sys_objects_view(object);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_objects_view criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_objects_view: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_objects_view...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_objects_view;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_objects_view removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_objects_view: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
