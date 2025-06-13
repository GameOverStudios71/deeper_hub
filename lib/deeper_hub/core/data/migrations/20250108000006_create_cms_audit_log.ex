defmodule DeeperHub.Core.Data.Migrations.CreateCmsAuditLog do
  @moduledoc """
  Migration para criar a tabela de auditoria do CMS dinâmico.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria a tabela de auditoria.
  """
  def up do
    Logger.info("Criando tabela de auditoria do CMS dinâmico...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS audit_log (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      table_name VARCHAR(100) NOT NULL,
      record_id VARCHAR(36) NOT NULL,
      action VARCHAR(20) NOT NULL, -- INSERT, UPDATE, DELETE
      old_values TEXT, -- JSON
      new_values TEXT, -- JSON
      user_id INTEGER,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      
      FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela audit_log criada com sucesso.", module: __MODULE__)
        create_indexes()
        create_audit_triggers()

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela audit_log: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela audit_log: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove a tabela de auditoria.
  """
  def down do
    Logger.info("Removendo tabela de auditoria...", module: __MODULE__)

    # Remover triggers primeiro
    drop_audit_triggers()

    sql = "DROP TABLE IF EXISTS audit_log"

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela audit_log removida com sucesso.", module: __MODULE__)
        :ok

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao remover tabela audit_log: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao remover tabela audit_log: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_audit_table_record ON audit_log(table_name, record_id)",
      "CREATE INDEX IF NOT EXISTS idx_audit_created ON audit_log(created_at)",
      "CREATE INDEX IF NOT EXISTS idx_audit_user ON audit_log(user_id)",
      "CREATE INDEX IF NOT EXISTS idx_audit_action ON audit_log(action)"
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

  defp create_audit_triggers do
    # Trigger para auditoria em entity_data - INSERT
    trigger_insert = """
    CREATE TRIGGER IF NOT EXISTS audit_entity_data_insert
        AFTER INSERT ON entity_data
    BEGIN
        INSERT INTO audit_log (table_name, record_id, action, new_values, user_id)
        VALUES ('entity_data', NEW.record_id, 'INSERT', 
                json_object('field_id', NEW.field_id, 'value', NEW.value), NEW.created_by);
    END;
    """

    # Trigger para auditoria em entity_data - UPDATE
    trigger_update = """
    CREATE TRIGGER IF NOT EXISTS audit_entity_data_update
        AFTER UPDATE ON entity_data
    BEGIN
        INSERT INTO audit_log (table_name, record_id, action, old_values, new_values, user_id)
        VALUES ('entity_data', NEW.record_id, 'UPDATE',
                json_object('field_id', OLD.field_id, 'value', OLD.value),
                json_object('field_id', NEW.field_id, 'value', NEW.value), NEW.created_by);
    END;
    """

    # Trigger para auditoria em entity_data - DELETE
    trigger_delete = """
    CREATE TRIGGER IF NOT EXISTS audit_entity_data_delete
        AFTER DELETE ON entity_data
    BEGIN
        INSERT INTO audit_log (table_name, record_id, action, old_values)
        VALUES ('entity_data', OLD.record_id, 'DELETE',
                json_object('field_id', OLD.field_id, 'value', OLD.value));
    END;
    """

    triggers = [trigger_insert, trigger_update, trigger_delete]

    Enum.each(triggers, fn sql ->
      case Repo.execute(sql) do
        {:ok, _} -> :ok
        {:error, reason} -> 
          Logger.warning("Falha ao criar trigger de auditoria, erro: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end

  defp drop_audit_triggers do
    triggers = [
      "DROP TRIGGER IF EXISTS audit_entity_data_insert",
      "DROP TRIGGER IF EXISTS audit_entity_data_update",
      "DROP TRIGGER IF EXISTS audit_entity_data_delete"
    ]

    Enum.each(triggers, fn sql ->
      case Repo.execute(sql) do
        {:ok, _} -> :ok
        {:error, reason} -> 
          Logger.warning("Falha ao remover trigger de auditoria, erro: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end
end
