defmodule DeeperHub.Core.Data.Migrations.CreateSysRewriteRulesTable do
  @moduledoc """
  Migração para criar a tabela sys_rewrite_rules no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de regras de reescrita
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_rewrite_rules.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_rewrite_rules...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_rewrite_rules (
      id INTEGER PRIMARY KEY,
      module_name TEXT NOT NULL DEFAULT '',
      uri TEXT NOT NULL,
      replace TEXT NOT NULL
    );

    CREATE INDEX IF NOT EXISTS idx_sys_rewrite_rules_module_name ON sys_rewrite_rules(module_name);
    CREATE INDEX IF NOT EXISTS idx_sys_rewrite_rules_uri ON sys_rewrite_rules(uri);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_rewrite_rules criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_rewrite_rules: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_rewrite_rules.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_rewrite_rules...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_rewrite_rules;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_rewrite_rules removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_rewrite_rules: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
