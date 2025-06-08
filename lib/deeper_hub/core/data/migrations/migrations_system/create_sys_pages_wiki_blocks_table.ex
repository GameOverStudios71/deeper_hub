defmodule DeeperHub.Core.Data.Migrations.CreateSysPagesWikiBlocksTable do
  @moduledoc """
  Migração para criar a tabela sys_pages_wiki_blocks no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de blocos de wiki de páginas
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_pages_wiki_blocks.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_pages_wiki_blocks...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_pages_wiki_blocks (
      id INTEGER PRIMARY KEY,
      page_id INTEGER NOT NULL,
      block_id INTEGER NOT NULL,
      revision INTEGER NOT NULL DEFAULT 0,
      profile_id INTEGER NOT NULL,
      content TEXT NOT NULL,
      added INTEGER NOT NULL
    );

    CREATE INDEX IF NOT EXISTS idx_sys_pages_wiki_blocks_page_id ON sys_pages_wiki_blocks(page_id);
    CREATE INDEX IF NOT EXISTS idx_sys_pages_wiki_blocks_block_id ON sys_pages_wiki_blocks(block_id);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_pages_wiki_blocks criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_pages_wiki_blocks: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_pages_wiki_blocks.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_pages_wiki_blocks...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_pages_wiki_blocks;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_pages_wiki_blocks removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_pages_wiki_blocks: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
