defmodule DeeperHub.Core.Data.Migrations.CreateSysObjectsContentInfoTable do
  @moduledoc """
  Migração para criar a tabela sys_objects_content_info no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de conteúdo de objetos
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_objects_content_info.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_objects_content_info...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_objects_content_info (
      id INTEGER PRIMARY KEY,
      content_name TEXT NOT NULL DEFAULT '',
      title TEXT NOT NULL,
      content_type TEXT NOT NULL DEFAULT '',
      module_name TEXT NOT NULL DEFAULT '',
      deletable INTEGER NOT NULL DEFAULT 0,
      override_class_name TEXT NOT NULL DEFAULT '',
      override_class_file TEXT NOT NULL DEFAULT ''
    );

    CREATE INDEX IF NOT EXISTS idx_sys_objects_content_info_content_name ON sys_objects_content_info(content_name);
    CREATE INDEX IF NOT EXISTS idx_sys_objects_content_info_module_name ON sys_objects_content_info(module_name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_objects_content_info criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_objects_content_info: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_objects_content_info.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_objects_content_info...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_objects_content_info;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_objects_content_info removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_objects_content_info: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
