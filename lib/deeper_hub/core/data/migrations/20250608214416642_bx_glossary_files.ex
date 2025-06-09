defmodule DeeperHub.Core.Data.Migrations.BxGlossaryFiles do
  @moduledoc """
  Migration para criar e remover a tabela bx_glossary_files.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de bx_glossary_files.
  """
  def up do
    Logger.info("Criando tabela de bx_glossary_files...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS bx_glossary_files (
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
        Logger.info("Tabela de bx_glossary_files criada com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela de bx_glossary_files: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela de bx_glossary_files: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de bx_glossary_files.
  """
  def down do
    Logger.info("Removendo tabela de bx_glossary_files...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS bx_glossary_files
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela de bx_glossary_files removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela de bx_glossary_files: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela de bx_glossary_files: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
