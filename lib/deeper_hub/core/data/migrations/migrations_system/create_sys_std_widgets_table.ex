defmodule DeeperHub.Core.Data.Migrations.CreateSysStdWidgetsTable do
  @moduledoc """
  Migração para criar a tabela sys_std_widgets no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de widgets padrão
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_std_widgets.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_std_widgets...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_std_widgets (
      id INTEGER PRIMARY KEY,
      module_name TEXT NOT NULL DEFAULT '',
      widget_name TEXT NOT NULL DEFAULT '',
      title TEXT NOT NULL,
      widget_type TEXT NOT NULL DEFAULT '',
      cover TEXT NOT NULL DEFAULT '',
      cover_title TEXT NOT NULL DEFAULT '',
      cover_image INTEGER NOT NULL DEFAULT 0,
      cover_position TEXT NOT NULL DEFAULT 'top',
      content TEXT NOT NULL
    );

    CREATE INDEX IF NOT EXISTS idx_sys_std_widgets_module_name ON sys_std_widgets(module_name);
    CREATE INDEX IF NOT EXISTS idx_sys_std_widgets_widget_name ON sys_std_widgets(widget_name);
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

  @doc """
  Reverte a migração, removendo a tabela sys_std_widgets.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
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
        Logger.error("Falha ao remover tabela sys_std_widgets: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
