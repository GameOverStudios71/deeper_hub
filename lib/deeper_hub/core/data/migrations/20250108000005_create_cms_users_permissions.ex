defmodule DeeperHub.Core.Data.Migrations.CreateCmsUsersPermissions do
  @moduledoc """
  Migration para criar as tabelas de usuários e permissões do CMS dinâmico.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria as tabelas de usuários e permissões.
  """
  def up do
    Logger.info("Criando tabelas de usuários e permissões do CMS dinâmico...", module: __MODULE__)

    # Tabela de usuários
    users_sql = """
    CREATE TABLE IF NOT EXISTS users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username VARCHAR(100) NOT NULL UNIQUE,
      email VARCHAR(255) NOT NULL UNIQUE,
      password_hash VARCHAR(255) NOT NULL,
      full_name VARCHAR(200),
      is_active BOOLEAN DEFAULT 1,
      is_admin BOOLEAN DEFAULT 0,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      last_login DATETIME
    );
    """

    # Tabela de permissões
    permissions_sql = """
    CREATE TABLE IF NOT EXISTS permissions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id INTEGER NOT NULL,
      entity_id INTEGER,
      permission_type VARCHAR(20) NOT NULL, -- create, read, update, delete, admin
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      
      FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
      FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE,
      CONSTRAINT unique_permission UNIQUE (user_id, entity_id, permission_type)
    );
    """

    case Repo.execute(users_sql) do
      {:ok, _} ->
        Logger.info("Tabela users criada com sucesso.", module: __MODULE__)
        
        case Repo.execute(permissions_sql) do
          {:ok, _} ->
            Logger.info("Tabela permissions criada com sucesso.", module: __MODULE__)
            create_indexes()
            create_triggers()

          {:error, %Exqlite.Error{message: message}} ->
            Logger.error("Falha ao criar tabela permissions: #{message}", module: __MODULE__)
            {:error, message}
            
          {:error, reason} ->
            Logger.error("Falha ao criar tabela permissions: #{inspect(reason)}", module: __MODULE__)
            {:error, reason}
        end

      {:error, %Exqlite.Error{message: message}} ->
        Logger.error("Falha ao criar tabela users: #{message}", module: __MODULE__)
        {:error, message}
        
      {:error, reason} ->
        Logger.error("Falha ao criar tabela users: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Remove as tabelas de usuários e permissões.
  """
  def down do
    Logger.info("Removendo tabelas de usuários e permissões...", module: __MODULE__)

    # Remover triggers primeiro
    drop_triggers()

    # Remover na ordem inversa devido às foreign keys
    sqls = [
      "DROP TABLE IF EXISTS permissions",
      "DROP TABLE IF EXISTS users"
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
      "CREATE INDEX IF NOT EXISTS idx_users_email ON users(email)",
      "CREATE INDEX IF NOT EXISTS idx_users_username ON users(username)",
      "CREATE INDEX IF NOT EXISTS idx_users_active ON users(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_permissions_user ON permissions(user_id)",
      "CREATE INDEX IF NOT EXISTS idx_permissions_entity ON permissions(entity_id)",
      "CREATE INDEX IF NOT EXISTS idx_permissions_type ON permissions(permission_type)"
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
    # Trigger para atualizar updated_at automaticamente na tabela users
    trigger_update = """
    CREATE TRIGGER IF NOT EXISTS update_users_timestamp 
        AFTER UPDATE ON users
    BEGIN
        UPDATE users SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
    END;
    """

    case Repo.execute(trigger_update) do
      {:ok, _} -> :ok
      {:error, reason} -> 
        Logger.warning("Falha ao criar trigger de users, erro: #{inspect(reason)}", module: __MODULE__)
    end
    
    :ok
  end

  defp drop_triggers do
    triggers = [
      "DROP TRIGGER IF EXISTS update_users_timestamp"
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
