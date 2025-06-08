defmodule DeeperHub.Core.Data.Migrations.CreateSysPagesBlocksTable do
  @moduledoc """
  Migração para criar a tabela sys_pages_blocks no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de blocos de páginas
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_pages_blocks.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_pages_blocks...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_pages_blocks (
      id INTEGER PRIMARY KEY,
      object TEXT NOT NULL DEFAULT '',
      cell_id INTEGER NOT NULL DEFAULT 0,
      module_name TEXT NOT NULL DEFAULT '',
      title_system TEXT NOT NULL DEFAULT '',
      title TEXT NOT NULL DEFAULT '',
      designbox_id INTEGER NOT NULL DEFAULT 0,
      visible_for_levels INTEGER NOT NULL DEFAULT 2147483647,
      block_type TEXT NOT NULL DEFAULT '',
      content TEXT NOT NULL,
      deletable INTEGER NOT NULL DEFAULT 1,
      copyable INTEGER NOT NULL DEFAULT 1,
      active INTEGER NOT NULL DEFAULT 1,
      block_order INTEGER NOT NULL DEFAULT 0
    );

    CREATE INDEX IF NOT EXISTS idx_sys_pages_blocks_module_name ON sys_pages_blocks(module_name);
    CREATE INDEX IF NOT EXISTS idx_sys_pages_blocks_object ON sys_pages_blocks(object);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_pages_blocks criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_pages_blocks: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_pages_blocks.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_pages_blocks...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_pages_blocks;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_pages_blocks removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_pages_blocks: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
