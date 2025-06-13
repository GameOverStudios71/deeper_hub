defmodule DeeperHub.Core.Data.Migrations.CreateCmsEntityData do
  @moduledoc """
  Migration para criar a tabela entity_data do CMS dinâmico.
  Esta tabela armazena os dados reais usando padrão EAV (Entity-Attribute-Value).
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela entity_data.
  """
  def up do
    Logger.info("Criando tabela entity_data do CMS dinâmico...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS entity_data (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      entity_id INTEGER NOT NULL,
      field_id INTEGER NOT NULL,
      record_id VARCHAR(36) NOT NULL, -- UUID para agrupar campos do mesmo registro
      value TEXT, -- Valor armazenado como texto
      value_numeric REAL, -- Valor numérico para ordenação/filtros
      value_date DATETIME, -- Valor de data para ordenação/filtros
      is_active BOOLEAN DEFAULT 1,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      created_by INTEGER,
      
      FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE,
      FOREIGN KEY (field_id) REFERENCES fields(id) ON DELETE CASCADE
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela entity_data criada com sucesso.", module: __MODULE__)
        create_indexes()
        create_triggers()

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela entity_data: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela entity_data: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela entity_data.
  """
  def down do
    Logger.info("Removendo tabela entity_data...", module: __MODULE__)

    # Remover triggers primeiro
    drop_triggers()

    sql = "DROP TABLE IF EXISTS entity_data"

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela entity_data removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela entity_data: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela entity_data: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_entity_data_entity_record ON entity_data(entity_id, record_id)",
      "CREATE INDEX IF NOT EXISTS idx_entity_data_field_value ON entity_data(field_id, value)",
      "CREATE INDEX IF NOT EXISTS idx_entity_data_numeric ON entity_data(value_numeric) WHERE value_numeric IS NOT NULL",
      "CREATE INDEX IF NOT EXISTS idx_entity_data_date ON entity_data(value_date) WHERE value_date IS NOT NULL",
      "CREATE INDEX IF NOT EXISTS idx_entity_data_search ON entity_data(entity_id, value) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_entity_data_created ON entity_data(created_at)",
      "CREATE INDEX IF NOT EXISTS idx_entity_data_record_id ON entity_data(record_id)"
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

  defp create_triggers do
    # Trigger para atualizar updated_at automaticamente
    trigger_update = """
    CREATE TRIGGER IF NOT EXISTS update_entity_data_timestamp 
        AFTER UPDATE ON entity_data
    BEGIN
        UPDATE entity_data SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
    END;
    """

    # Trigger para popular campos value_numeric e value_date automaticamente
    trigger_typed_values = """
    CREATE TRIGGER IF NOT EXISTS populate_typed_values
        AFTER INSERT ON entity_data
    BEGIN
        UPDATE entity_data 
        SET 
            value_numeric = CASE 
                WHEN (SELECT field_type FROM fields WHERE id = NEW.field_id) IN ('number', 'integer', 'decimal') 
                THEN CAST(NEW.value AS REAL) 
                ELSE NULL 
            END,
            value_date = CASE 
                WHEN (SELECT field_type FROM fields WHERE id = NEW.field_id) IN ('date', 'datetime', 'timestamp') 
                THEN datetime(NEW.value) 
                ELSE NULL 
            END
        WHERE id = NEW.id;
    END;
    """

    triggers = [trigger_update, trigger_typed_values]

    Enum.each(triggers, fn sql ->
      case Repo.execute(sql) do
        {:ok, _} -> :ok
        {:error, reason} -> 
          Logger.warning("Falha ao criar trigger, erro: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end

  defp drop_triggers do
    triggers = [
      "DROP TRIGGER IF EXISTS update_entity_data_timestamp",
      "DROP TRIGGER IF EXISTS populate_typed_values"
    ]

    Enum.each(triggers, fn sql ->
      case Repo.execute(sql) do
        {:ok, _} -> :ok
        {:error, reason} -> 
          Logger.warning("Falha ao remover trigger, erro: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end
end
