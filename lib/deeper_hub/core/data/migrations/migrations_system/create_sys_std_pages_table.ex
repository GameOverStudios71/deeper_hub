defmodule DeeperHub.Core.Data.Migrations.CreateSysStdPagesTable do
  @moduledoc """
  Migração para criar a tabela sys_std_pages no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de páginas padrão
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_std_pages.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_std_pages...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_std_pages (
      id INTEGER PRIMARY KEY,
      page_index INTEGER NOT NULL DEFAULT 0,
      name TEXT NOT NULL,
      header TEXT NOT NULL,
      caption TEXT NOT NULL,
      icon TEXT NOT NULL,
      cover TEXT NOT NULL DEFAULT '',
      cover_title TEXT NOT NULL DEFAULT '',
      cover_image INTEGER NOT NULL DEFAULT 0,
      cover_position TEXT NOT NULL DEFAULT 'top'
    );

    CREATE INDEX IF NOT EXISTS idx_sys_std_pages_name ON sys_std_pages(name);
    CREATE INDEX IF NOT EXISTS idx_sys_std_pages_page_index ON sys_std_pages(page_index);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_std_pages criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_std_pages: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_std_pages.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_std_pages...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_std_pages;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_std_pages removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_std_pages: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
