defmodule DeeperHub.CMS.Users do
  @moduledoc """
  Contexto para gerenciar usuários e permissões do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Users.{User, Permission}

  # ============================================================================
  # USERS
  # ============================================================================

  @doc """
  Lista todos os usuários.
  """
  def list_users do
    sql = """
    SELECT id, username, email, password_hash, full_name, is_active, is_admin,
           created_at, updated_at, last_login
    FROM users
    ORDER BY created_at DESC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        users = Enum.map(rows, &row_to_user/1)
        {:ok, users}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista usuários ativos.
  """
  def list_active_users do
    sql = """
    SELECT id, username, email, password_hash, full_name, is_active, is_admin,
           created_at, updated_at, last_login
    FROM users
    WHERE is_active = true
    ORDER BY created_at DESC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        users = Enum.map(rows, &row_to_user/1)
        {:ok, users}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista usuários administradores.
  """
  def list_admin_users do
    sql = """
    SELECT id, username, email, password_hash, full_name, is_active, is_admin,
           created_at, updated_at, last_login
    FROM users
    WHERE is_admin = true AND is_active = true
    ORDER BY created_at DESC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        users = Enum.map(rows, &row_to_user/1)
        {:ok, users}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca usuário por ID.
  """
  def get_user(id) do
    sql = """
    SELECT id, username, email, password_hash, full_name, is_active, is_admin,
           created_at, updated_at, last_login
    FROM users
    WHERE id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        user = row_to_user(row)
        {:ok, user}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca usuário por email.
  """
  def get_user_by_email(email) do
    sql = """
    SELECT id, username, email, password_hash, full_name, is_active, is_admin,
           created_at, updated_at, last_login
    FROM users
    WHERE email = $1
    """

    case Connection.query(sql, [email]) do
      {:ok, %{rows: [row]}} ->
        user = row_to_user(row)
        {:ok, user}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca usuário por username.
  """
  def get_user_by_username(username) do
    sql = """
    SELECT id, username, email, password_hash, full_name, is_active, is_admin,
           created_at, updated_at, last_login
    FROM users
    WHERE username = $1
    """

    case Connection.query(sql, [username]) do
      {:ok, %{rows: [row]}} ->
        user = row_to_user(row)
        {:ok, user}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo usuário.
  """
  def create_user(attrs) do
    case User.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        INSERT INTO users (
          username, email, password_hash, full_name, is_active, is_admin,
          created_at, updated_at
        ) VALUES (
          $1, $2, $3, $4, $5, $6, $7, $8
        ) RETURNING id
        """

        params = [
          validated_attrs[:username],
          validated_attrs[:email],
          validated_attrs[:password_hash],
          validated_attrs[:full_name] || "",
          validated_attrs[:is_active] || true,
          validated_attrs[:is_admin] || false,
          now,
          now
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_user(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Atualiza um usuário.
  """
  def update_user(id, attrs) do
    case User.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        UPDATE users SET
          username = $2, email = $3, full_name = $4, is_active = $5, is_admin = $6,
          updated_at = $7
        WHERE id = $1
        """

        params = [
          id,
          validated_attrs[:username],
          validated_attrs[:email],
          validated_attrs[:full_name] || "",
          validated_attrs[:is_active] || true,
          validated_attrs[:is_admin] || false,
          now
        ]

        case Connection.query(sql, params) do
          {:ok, _} ->
            get_user(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Atualiza senha do usuário.
  """
  def update_user_password(id, password_hash) do
    now = DateTime.utc_now()

    sql = """
    UPDATE users SET
      password_hash = $2, updated_at = $3
    WHERE id = $1
    """

    case Connection.query(sql, [id, password_hash, now]) do
      {:ok, %{num_rows: 1}} ->
        get_user(id)
      {:ok, %{num_rows: 0}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Atualiza último login do usuário.
  """
  def update_last_login(id) do
    now = DateTime.utc_now()

    sql = """
    UPDATE users SET
      last_login = $2, updated_at = $3
    WHERE id = $1
    """

    case Connection.query(sql, [id, now, now]) do
      {:ok, %{num_rows: 1}} ->
        get_user(id)
      {:ok, %{num_rows: 0}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Deleta um usuário.
  """
  def delete_user(id) do
    sql = "DELETE FROM users WHERE id = $1"

    case Connection.query(sql, [id]) do
      {:ok, %{num_rows: 1}} ->
        :ok
      {:ok, %{num_rows: 0}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # PERMISSIONS
  # ============================================================================

  @doc """
  Lista todas as permissões.
  """
  def list_permissions do
    sql = """
    SELECT p.id, p.user_id, p.entity_id, p.permission_type, p.created_at,
           u.username, u.email, e.name as entity_name
    FROM permissions p
    LEFT JOIN users u ON p.user_id = u.id
    LEFT JOIN entities e ON p.entity_id = e.id
    ORDER BY p.created_at DESC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        permissions = Enum.map(rows, &row_to_permission/1)
        {:ok, permissions}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista permissões de um usuário.
  """
  def list_user_permissions(user_id) do
    sql = """
    SELECT p.id, p.user_id, p.entity_id, p.permission_type, p.created_at,
           u.username, u.email, e.name as entity_name
    FROM permissions p
    LEFT JOIN users u ON p.user_id = u.id
    LEFT JOIN entities e ON p.entity_id = e.id
    WHERE p.user_id = $1
    ORDER BY p.created_at DESC
    """

    case Connection.query(sql, [user_id]) do
      {:ok, %{rows: rows}} ->
        permissions = Enum.map(rows, &row_to_permission/1)
        {:ok, permissions}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Verifica se usuário tem permissão específica.
  """
  def has_permission?(user_id, entity_id, permission_type) do
    sql = """
    SELECT COUNT(*) as count
    FROM permissions p
    JOIN users u ON p.user_id = u.id
    WHERE p.user_id = $1
      AND (p.entity_id = $2 OR p.entity_id IS NULL)
      AND p.permission_type = $3
      AND u.is_active = true
    """

    case Connection.query(sql, [user_id, entity_id, permission_type]) do
      {:ok, %{rows: [[count]]}} ->
        count > 0
      {:error, _} ->
        false
    end
  end

  @doc """
  Verifica se usuário é admin.
  """
  def is_admin?(user_id) do
    sql = """
    SELECT is_admin
    FROM users
    WHERE id = $1 AND is_active = true
    """

    case Connection.query(sql, [user_id]) do
      {:ok, %{rows: [[true]]}} ->
        true
      {:ok, %{rows: [[false]]}} ->
        false
      {:ok, %{rows: []}} ->
        false
      {:error, _} ->
        false
    end
  end

  @doc """
  Cria uma nova permissão.
  """
  def create_permission(attrs) do
    case Permission.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        INSERT INTO permissions (user_id, entity_id, permission_type, created_at)
        VALUES ($1, $2, $3, $4)
        RETURNING id
        """

        params = [
          validated_attrs[:user_id],
          validated_attrs[:entity_id],
          validated_attrs[:permission_type],
          now
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_permission(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Atualiza uma permissão.
  """
  def update_permission(id, attrs) do
    case Permission.validate(attrs) do
      {:ok, validated_attrs} ->
        sql = """
        UPDATE permissions SET
          user_id = $2, entity_id = $3, permission_type = $4
        WHERE id = $1
        """

        params = [
          id,
          validated_attrs[:user_id],
          validated_attrs[:entity_id],
          validated_attrs[:permission_type]
        ]

        case Connection.query(sql, params) do
          {:ok, _} ->
            get_permission(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Remove uma permissão.
  """
  def delete_permission(id) do
    sql = "DELETE FROM permissions WHERE id = $1"

    case Connection.query(sql, [id]) do
      {:ok, %{num_rows: 1}} ->
        {:ok, :deleted}
      {:ok, %{num_rows: 0}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Obtém uma permissão específica pelo ID.
  """
  def get_permission(id) do
    sql = """
    SELECT p.id, p.user_id, p.entity_id, p.permission_type, p.created_at,
           u.username, u.email, e.name as entity_name
    FROM permissions p
    LEFT JOIN users u ON p.user_id = u.id
    LEFT JOIN entities e ON p.entity_id = e.id
    WHERE p.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        permission = row_to_permission(row)
        {:ok, permission}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # HELPERS PRIVADOS
  # ============================================================================

  defp row_to_user([id, username, email, password_hash, full_name, is_active, is_admin,
                    created_at, updated_at, last_login]) do
    User.new(%{
      id: id,
      username: username,
      email: email,
      password_hash: password_hash,
      full_name: full_name,
      is_active: is_active,
      is_admin: is_admin,
      created_at: created_at,
      updated_at: updated_at,
      last_login: last_login
    })
  end

  defp row_to_permission([id, user_id, entity_id, permission_type, created_at,
                          username, email, entity_name]) do
    Permission.new(%{
      id: id,
      user_id: user_id,
      entity_id: entity_id,
      permission_type: permission_type,
      created_at: created_at,
      username: username,
      email: email,
      entity_name: entity_name
    })
  end
end
