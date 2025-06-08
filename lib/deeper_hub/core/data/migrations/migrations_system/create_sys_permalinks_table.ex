defmodule DeeperHub.Core.Data.Migrations.CreateSysPermalinksTable do
  @moduledoc """
  Migração para criar a tabela sys_permalinks no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de permalinks
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_permalinks.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_permalinks...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_permalinks (
      id INTEGER PRIMARY KEY,
      standard TEXT NOT NULL,
      permalink TEXT NOT NULL,
      view TEXT NOT NULL,
      module_name TEXT NOT NULL,
      check_value TEXT NOT NULL,
      active INTEGER NOT NULL DEFAULT 1
    );

    CREATE INDEX IF NOT EXISTS idx_sys_permalinks_standard ON sys_permalinks(standard);
    CREATE INDEX IF NOT EXISTS idx_sys_permalinks_permalink ON sys_permalinks(permalink);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_permalinks criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_permalinks: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_permalinks.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_permalinks...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_permalinks;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_permalinks removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_permalinks: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
