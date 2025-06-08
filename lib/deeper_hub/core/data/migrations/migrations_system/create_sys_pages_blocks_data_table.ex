defmodule DeeperHub.Core.Data.Migrations.CreateSysPagesBlocksDataTable do
  @moduledoc """
  Migração para criar a tabela sys_pages_blocks_data no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de dados de blocos de páginas
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_pages_blocks_data.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_pages_blocks_data...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_pages_blocks_data (
      id INTEGER PRIMARY KEY,
      block_id INTEGER NOT NULL DEFAULT 0,
      system INTEGER NOT NULL DEFAULT 0,
      data_key TEXT NOT NULL DEFAULT '',
      value TEXT NOT NULL
    );

    CREATE INDEX IF NOT EXISTS idx_sys_pages_blocks_data_block_id ON sys_pages_blocks_data(block_id);
    CREATE INDEX IF NOT EXISTS idx_sys_pages_blocks_data_data_key ON sys_pages_blocks_data(data_key);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_pages_blocks_data criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_pages_blocks_data: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_pages_blocks_data.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_pages_blocks_data...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_pages_blocks_data;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_pages_blocks_data removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_pages_blocks_data: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
