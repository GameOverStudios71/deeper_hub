defmodule DeeperHub.Core.Data.Migrations.SysCmtsImagesPreview do
  @moduledoc """
  Migration para criar e remover a tabela sys_cmts_images_preview.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de sys_cmts_images_preview.
  """
  def up do
    Logger.info("Criando tabela de sys_cmts_images_preview...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_cmts_images_preview (
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
        Logger.info("Tabela de sys_cmts_images_preview criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de sys_cmts_images_preview: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de sys_cmts_images_preview: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de sys_cmts_images_preview.
  """
  def down do
    Logger.info("Removendo tabela de sys_cmts_images_preview...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_cmts_images_preview
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de sys_cmts_images_preview removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de sys_cmts_images_preview: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de sys_cmts_images_preview: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
