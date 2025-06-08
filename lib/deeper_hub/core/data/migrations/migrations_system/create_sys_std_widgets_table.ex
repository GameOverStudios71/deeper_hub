defmodule DeeperHub.Core.Data.Migrations.CreateSysStdWidgetsTable do
  @moduledoc """
  Migração para criar a tabela sys_std_widgets no banco de dados.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_std_widgets...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_std_widgets (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      module TEXT NOT NULL,
      type TEXT NOT NULL,
      url TEXT,
      caption TEXT,
      icon TEXT
    );

    CREATE INDEX IF NOT EXISTS idx_sys_std_widgets_module_type ON sys_std_widgets(module, type);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_std_widgets criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_std_widgets: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_std_widgets...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_std_widgets;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_std_widgets removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_std_widgets: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
