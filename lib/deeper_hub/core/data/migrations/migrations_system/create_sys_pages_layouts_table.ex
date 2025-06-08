defmodule DeeperHub.Core.Data.Migrations.CreateSysPagesLayoutsTable do
  @moduledoc """
  Migração para criar a tabela sys_pages_layouts no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de layouts de páginas
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_pages_layouts.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_pages_layouts...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_pages_layouts (
      id INTEGER PRIMARY KEY,
      module_name TEXT NOT NULL DEFAULT '',
      layout_name TEXT NOT NULL DEFAULT '',
      title TEXT NOT NULL,
      template TEXT NOT NULL,
      cells_number INTEGER NOT NULL DEFAULT 1
    );

    CREATE INDEX IF NOT EXISTS idx_sys_pages_layouts_module_name ON sys_pages_layouts(module_name);
    CREATE INDEX IF NOT EXISTS idx_sys_pages_layouts_layout_name ON sys_pages_layouts(layout_name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_pages_layouts criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_pages_layouts: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_pages_layouts.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_pages_layouts...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_pages_layouts;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_pages_layouts removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_pages_layouts: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
