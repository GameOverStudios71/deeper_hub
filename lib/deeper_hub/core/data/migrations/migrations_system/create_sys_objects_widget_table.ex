defmodule DeeperHub.Core.Data.Migrations.CreateSysObjectsWidgetTable do
  @moduledoc """
  Migração para criar a tabela sys_objects_widget no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de widgets de objetos
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_objects_widget.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_objects_widget...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_objects_widget (
      id INTEGER PRIMARY KEY,
      module_name TEXT NOT NULL DEFAULT '',
      widget_name TEXT NOT NULL DEFAULT '',
      title TEXT NOT NULL,
      widget_type TEXT NOT NULL DEFAULT '',
      deletable INTEGER NOT NULL DEFAULT 0,
      override_class_name TEXT NOT NULL DEFAULT '',
      override_class_file TEXT NOT NULL DEFAULT ''
    );

    CREATE INDEX IF NOT EXISTS idx_sys_objects_widget_module_name ON sys_objects_widget(module_name);
    CREATE INDEX IF NOT EXISTS idx_sys_objects_widget_widget_name ON sys_objects_widget(widget_name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_objects_widget criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_objects_widget: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_objects_widget.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_objects_widget...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_objects_widget;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_objects_widget removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_objects_widget: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
