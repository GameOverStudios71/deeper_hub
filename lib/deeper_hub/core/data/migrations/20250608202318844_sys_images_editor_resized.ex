defmodule DeeperHub.Core.Data.Migrations.SysImagesEditorResized do
  @moduledoc """
  Migration para criar e remover a tabela sys_images_editor_resized.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de sys_images_editor_resized.
  """
  def up do
    Logger.info("Criando tabela de sys_images_editor_resized...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_images_editor_resized (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    profile_id INTEGER NOT NULL,
    remote_id TEXT NOT NULL,
    path TEXT NOT NULL,
    file_name TEXT NOT NULL,
    mime_type TEXT NOT NULL,
    ext TEXT NOT NULL,
    size INTEGER NOT NULL,
    added INTEGER NOT NULL,
    modified INTEGER NOT NULL,
    private INTEGER NOT NULL,
      UNIQUE (remote_id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_images_editor_resized criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de sys_images_editor_resized: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de sys_images_editor_resized: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de sys_images_editor_resized.
  """
  def down do
    Logger.info("Removendo tabela de sys_images_editor_resized...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_images_editor_resized
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_images_editor_resized removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de sys_images_editor_resized: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de sys_images_editor_resized: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
