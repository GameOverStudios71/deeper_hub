defmodule DeeperHub.Core.Data.Migrations.CreateCmsFields do
  @moduledoc """
  Migration para criar a tabela fields do CMS dinâmico.
  Esta tabela define os campos (estrutura) de cada entidade.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela fields.
  """
  def up do
    Logger.info("Criando tabela fields do CMS dinâmico...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS fields (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      entity_id INTEGER NOT NULL,
      name VARCHAR(100) NOT NULL,
      display_name VARCHAR(200) NOT NULL,
      field_type VARCHAR(50) NOT NULL, -- text, number, date, boolean, file, relation, json, email, url
      is_required BOOLEAN DEFAULT 0,
      is_unique BOOLEAN DEFAULT 0,
      is_searchable BOOLEAN DEFAULT 1,
      default_value TEXT,
      validation_rules TEXT, -- JSON com regras de validação
      field_options TEXT, -- JSON com opções (para select, radio, etc)
      order_index INTEGER DEFAULT 0,
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      
      FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE,
      CONSTRAINT fields_entity_name_unique UNIQUE (entity_id, name)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela fields criada com sucesso.", module: __MODULE__)
        create_indexes()

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela fields: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela fields: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela fields.
  """
  def down do
    Logger.info("Removendo tabela fields...", module: __MODULE__)

    sql = "DROP TABLE IF EXISTS fields"

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela fields removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela fields: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela fields: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_fields_entity ON fields(entity_id) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_fields_type ON fields(field_type)",
      "CREATE INDEX IF NOT EXISTS idx_fields_searchable ON fields(is_searchable) WHERE is_searchable = 1",
      "CREATE INDEX IF NOT EXISTS idx_fields_order ON fields(entity_id, order_index)"
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
