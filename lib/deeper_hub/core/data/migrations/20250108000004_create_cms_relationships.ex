defmodule DeeperHub.Core.Data.Migrations.CreateCmsRelationships do
  @moduledoc """
  Migration para criar as tabelas de relacionamentos do CMS dinâmico.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria as tabelas de relacionamentos.
  """
  def up do
    Logger.info("Criando tabelas de relacionamentos do CMS dinâmico...", module: __MODULE__)

    # Tabela de definição de relacionamentos
    relationships_sql = """
    CREATE TABLE IF NOT EXISTS relationships (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(100) NOT NULL,
      from_entity_id INTEGER NOT NULL,
      to_entity_id INTEGER NOT NULL,
      relationship_type VARCHAR(20) NOT NULL, -- one_to_one, one_to_many, many_to_many
      from_field_id INTEGER,
      to_field_id INTEGER,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      
      FOREIGN KEY (from_entity_id) REFERENCES entities(id) ON DELETE CASCADE,
      FOREIGN KEY (to_entity_id) REFERENCES entities(id) ON DELETE CASCADE,
      FOREIGN KEY (from_field_id) REFERENCES fields(id) ON DELETE SET NULL,
      FOREIGN KEY (to_field_id) REFERENCES fields(id) ON DELETE SET NULL
    );
    """

    # Tabela para relacionamentos Many-to-Many
    entity_relationships_sql = """
    CREATE TABLE IF NOT EXISTS entity_relationships (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      relationship_id INTEGER NOT NULL,
      from_record_id VARCHAR(36) NOT NULL,
      to_record_id VARCHAR(36) NOT NULL,
      order_index INTEGER DEFAULT 0,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      
      FOREIGN KEY (relationship_id) REFERENCES relationships(id) ON DELETE CASCADE,
      CONSTRAINT unique_relationship UNIQUE (relationship_id, from_record_id, to_record_id)
    );
    """

    case Repo.execute(relationships_sql) do
      {:ok, _} ->
        Logger.info("Tabela relationships criada com sucesso.", module: __MODULE__)
        
        case Repo.execute(entity_relationships_sql) do
          {:ok, _} ->
            Logger.info("Tabela entity_relationships criada com sucesso.", module: __MODULE__)
            create_indexes()

          {:error, %Exqlite.Error{message: message}} ->
            Logger.error("Falha ao criar tabela entity_relationships: #{message}", module: __MODULE__)
            {:error, message}
            
          {:error, reason} ->
            Logger.error("Falha ao criar tabela entity_relationships: #{inspect(reason)}", module: __MODULE__)
            {:error, reason}
        end

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela relationships: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela relationships: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove as tabelas de relacionamentos.
  """
  def down do
    Logger.info("Removendo tabelas de relacionamentos...", module: __MODULE__)

    # Remover na ordem inversa devido às foreign keys
    sqls = [
      "DROP TABLE IF EXISTS entity_relationships",
      "DROP TABLE IF EXISTS relationships"
    ]

    Enum.each(sqls, fn sql ->
      case Repo.execute(sql) do
        {:ok, _} ->
          Logger.info("Tabela removida com sucesso.", module: __MODULE__)

        {:error, %Exqlite.Error{message: message}} ->
          Logger.error("Falha ao remover tabela: #{message}", module: __MODULE__)
          
        {:error, reason} ->
          Logger.error("Falha ao remover tabela: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end

  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_relationships_from ON relationships(from_entity_id)",
      "CREATE INDEX IF NOT EXISTS idx_relationships_to ON relationships(to_entity_id)",
      "CREATE INDEX IF NOT EXISTS idx_relationships_type ON relationships(relationship_type)",
      "CREATE INDEX IF NOT EXISTS idx_entity_relationships_from ON entity_relationships(from_record_id)",
      "CREATE INDEX IF NOT EXISTS idx_entity_relationships_to ON entity_relationships(to_record_id)",
      "CREATE INDEX IF NOT EXISTS idx_entity_relationships_rel ON entity_relationships(relationship_id)"
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
