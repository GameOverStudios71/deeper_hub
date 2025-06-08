defmodule DeeperHub.Core.Data.Migrations.CreateSysPagesTypesTable do
  @moduledoc """
  Migração para criar a tabela sys_pages_types no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de tipos de páginas
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_pages_types.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_pages_types...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_pages_types (
      id INTEGER PRIMARY KEY,
      module_name TEXT NOT NULL DEFAULT '',
      type_name TEXT NOT NULL DEFAULT '',
      title TEXT NOT NULL,
      layout_id INTEGER NOT NULL DEFAULT 0,
      visible_for_levels INTEGER NOT NULL DEFAULT 2147483647,
      uri TEXT NOT NULL DEFAULT '',
      icon TEXT NOT NULL DEFAULT '',
      page_index INTEGER NOT NULL DEFAULT 0
    );

    CREATE INDEX IF NOT EXISTS idx_sys_pages_types_module_name ON sys_pages_types(module_name);
    CREATE INDEX IF NOT EXISTS idx_sys_pages_types_type_name ON sys_pages_types(type_name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_pages_types criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_pages_types: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_pages_types.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_pages_types...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_pages_types;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_pages_types removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_pages_types: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
