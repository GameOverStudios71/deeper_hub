defmodule DeeperHub.Core.Data.Migrations.SysObjectsCategory do
  @moduledoc """
  Migration para criar e remover a tabela sys_objects_category.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de sys_objects_category.
  """
  def up do
    Logger.info("Criando tabela de sys_objects_category...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_objects_category (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    object TEXT NOT NULL,
    module TEXT NOT NULL,
    search_object TEXT NOT NULL,
    form_object TEXT NOT NULL,
    list_name TEXT NOT NULL,
    'table' TEXT NOT NULL,
    field TEXT NOT NULL,
    'join' TEXT NOT NULL,
    'where' TEXT NOT NULL,
    override_class_name TEXT NOT NULL,
    override_class_file TEXT NOT NULL,
      UNIQUE (form_object, list_name),
      UNIQUE (object)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_objects_category criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de sys_objects_category: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de sys_objects_category: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de sys_objects_category.
  """
  def down do
    Logger.info("Removendo tabela de sys_objects_category...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_objects_category
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_objects_category removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de sys_objects_category: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de sys_objects_category: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
