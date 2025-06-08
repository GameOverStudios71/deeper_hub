defmodule DeeperHub.Core.Data.Migrations.CreateSysSeoUriRewritesTable do
  @moduledoc """
  Migração para criar a tabela sys_seo_uri_rewrites no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de reescritas de URI de SEO
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_seo_uri_rewrites.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_seo_uri_rewrites...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_seo_uri_rewrites (
      id INTEGER PRIMARY KEY,
      module_name TEXT NOT NULL DEFAULT '',
      rewrite_name TEXT NOT NULL DEFAULT '',
      title TEXT NOT NULL,
      uri_from TEXT NOT NULL DEFAULT '',
      uri_to TEXT NOT NULL DEFAULT ''
    );

    CREATE INDEX IF NOT EXISTS idx_sys_seo_uri_rewrites_module_name ON sys_seo_uri_rewrites(module_name);
    CREATE INDEX IF NOT EXISTS idx_sys_seo_uri_rewrites_rewrite_name ON sys_seo_uri_rewrites(rewrite_name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_seo_uri_rewrites criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_seo_uri_rewrites: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_seo_uri_rewrites.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_seo_uri_rewrites...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_seo_uri_rewrites;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_seo_uri_rewrites removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_seo_uri_rewrites: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
