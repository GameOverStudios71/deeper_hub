defmodule DeeperHub.Core.Data.Migrations.CreateCmsEntities do
  @moduledoc """
  Migration para criar a tabela entities do CMS dinâmico.
  Esta tabela define os tipos de conteúdo (entidades) que podem ser criados.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela entities.
  """
  def up do
    Logger.info("Criando tabela entities do CMS dinâmico...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS entities (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(100) NOT NULL UNIQUE,
      display_name VARCHAR(200) NOT NULL,
      description TEXT,
      icon VARCHAR(50),
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      created_by INTEGER,
      
      CONSTRAINT entities_name_unique UNIQUE (name)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela entities criada com sucesso.", module: __MODULE__)
        create_indexes()

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela entities: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela entities: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela entities.
  """
  def down do
    Logger.info("Removendo tabela entities...", module: __MODULE__)

    sql = "DROP TABLE IF EXISTS entities"

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela entities removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela entities: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela entities: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_entities_name ON entities(name)",
      "CREATE INDEX IF NOT EXISTS idx_entities_active ON entities(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_entities_created ON entities(created_at)"
    ]

    Enum.each(indexes, fn sql ->
      case Repo.execute(sql) do
        {:ok, _} -> :ok
        {:error, reason} -> 
          Logger.warning("Falha ao criar índice: #{sql}, erro: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end
end
