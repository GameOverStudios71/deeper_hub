defmodule DeeperHub.CMS.Audit do
  @moduledoc """
  Contexto para gerenciar auditoria do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Audit.AuditLog

  # ============================================================================
  # AUDIT LOG
  # ============================================================================

  @doc """
  Lista todos os logs de auditoria.
  """
  def list_audit_logs(opts \\ []) do
    limit = Keyword.get(opts, :limit, 100)
    offset = Keyword.get(opts, :offset, 0)

    sql = """
    SELECT al.id, al.table_name, al.record_id, al.action, al.old_values,
           al.new_values, al.user_id, al.created_at, u.username
    FROM audit_log al
    LEFT JOIN users u ON al.user_id = u.id
    ORDER BY al.created_at DESC
    LIMIT $1 OFFSET $2
    """

    case Connection.query(sql, [limit, offset]) do
      {:ok, %{rows: rows}} ->
        logs = Enum.map(rows, &row_to_audit_log/1)
        {:ok, logs}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista logs de auditoria por tabela.
  """
  def list_audit_logs_by_table(table_name, opts \\ []) do
    limit = Keyword.get(opts, :limit, 100)
    offset = Keyword.get(opts, :offset, 0)

    sql = """
    SELECT al.id, al.table_name, al.record_id, al.action, al.old_values,
           al.new_values, al.user_id, al.created_at, u.username
    FROM audit_log al
    LEFT JOIN users u ON al.user_id = u.id
    WHERE al.table_name = $1
    ORDER BY al.created_at DESC
    LIMIT $2 OFFSET $3
    """

    case Connection.query(sql, [table_name, limit, offset]) do
      {:ok, %{rows: rows}} ->
        logs = Enum.map(rows, &row_to_audit_log/1)
        {:ok, logs}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista logs de auditoria por registro.
  """
  def list_audit_logs_by_record(table_name, record_id, opts \\ []) do
    limit = Keyword.get(opts, :limit, 100)
    offset = Keyword.get(opts, :offset, 0)

    sql = """
    SELECT al.id, al.table_name, al.record_id, al.action, al.old_values,
           al.new_values, al.user_id, al.created_at, u.username
    FROM audit_log al
    LEFT JOIN users u ON al.user_id = u.id
    WHERE al.table_name = $1 AND al.record_id = $2
    ORDER BY al.created_at DESC
    LIMIT $3 OFFSET $4
    """

    case Connection.query(sql, [table_name, record_id, limit, offset]) do
      {:ok, %{rows: rows}} ->
        logs = Enum.map(rows, &row_to_audit_log/1)
        {:ok, logs}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista logs de auditoria por usuário.
  """
  def list_audit_logs_by_user(user_id, opts \\ []) do
    limit = Keyword.get(opts, :limit, 100)
    offset = Keyword.get(opts, :offset, 0)

    sql = """
    SELECT al.id, al.table_name, al.record_id, al.action, al.old_values,
           al.new_values, al.user_id, al.created_at, u.username
    FROM audit_log al
    LEFT JOIN users u ON al.user_id = u.id
    WHERE al.user_id = $1
    ORDER BY al.created_at DESC
    LIMIT $2 OFFSET $3
    """

    case Connection.query(sql, [user_id, limit, offset]) do
      {:ok, %{rows: rows}} ->
        logs = Enum.map(rows, &row_to_audit_log/1)
        {:ok, logs}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista logs de auditoria por ação.
  """
  def list_audit_logs_by_action(action, opts \\ []) do
    limit = Keyword.get(opts, :limit, 100)
    offset = Keyword.get(opts, :offset, 0)

    sql = """
    SELECT al.id, al.table_name, al.record_id, al.action, al.old_values,
           al.new_values, al.user_id, al.created_at, u.username
    FROM audit_log al
    LEFT JOIN users u ON al.user_id = u.id
    WHERE al.action = $1
    ORDER BY al.created_at DESC
    LIMIT $2 OFFSET $3
    """

    case Connection.query(sql, [action, limit, offset]) do
      {:ok, %{rows: rows}} ->
        logs = Enum.map(rows, &row_to_audit_log/1)
        {:ok, logs}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista logs de auditoria por período.
  """
  def list_audit_logs_by_period(start_date, end_date, opts \\ []) do
    limit = Keyword.get(opts, :limit, 100)
    offset = Keyword.get(opts, :offset, 0)

    sql = """
    SELECT al.id, al.table_name, al.record_id, al.action, al.old_values,
           al.new_values, al.user_id, al.created_at, u.username
    FROM audit_log al
    LEFT JOIN users u ON al.user_id = u.id
    WHERE al.created_at >= $1 AND al.created_at <= $2
    ORDER BY al.created_at DESC
    LIMIT $3 OFFSET $4
    """

    case Connection.query(sql, [start_date, end_date, limit, offset]) do
      {:ok, %{rows: rows}} ->
        logs = Enum.map(rows, &row_to_audit_log/1)
        {:ok, logs}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca log de auditoria por ID.
  """
  def get_audit_log(id) do
    sql = """
    SELECT al.id, al.table_name, al.record_id, al.action, al.old_values,
           al.new_values, al.user_id, al.created_at, u.username
    FROM audit_log al
    LEFT JOIN users u ON al.user_id = u.id
    WHERE al.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        log = row_to_audit_log(row)
        {:ok, log}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um log de auditoria manual.
  """
  def create_audit_log(attrs) do
    case AuditLog.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        INSERT INTO audit_log (
          table_name, record_id, action, old_values, new_values, user_id, created_at
        ) VALUES (
          $1, $2, $3, $4, $5, $6, $7
        ) RETURNING id
        """

        params = [
          validated_attrs[:table_name],
          validated_attrs[:record_id],
          validated_attrs[:action],
          validated_attrs[:old_values],
          validated_attrs[:new_values],
          validated_attrs[:user_id],
          now
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_audit_log(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Retorna estatísticas de auditoria.
  """
  def get_audit_statistics do
    sql = """
    SELECT 
      COUNT(*) as total_logs,
      COUNT(DISTINCT table_name) as tables_audited,
      COUNT(DISTINCT user_id) as users_active,
      COUNT(CASE WHEN action = 'INSERT' THEN 1 END) as inserts,
      COUNT(CASE WHEN action = 'UPDATE' THEN 1 END) as updates,
      COUNT(CASE WHEN action = 'DELETE' THEN 1 END) as deletes,
      MIN(created_at) as first_log,
      MAX(created_at) as last_log
    FROM audit_log
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: [[total, tables, users, inserts, updates, deletes, first_log, last_log]]}} ->
        stats = %{
          total_logs: total,
          tables_audited: tables,
          users_active: users,
          actions: %{
            inserts: inserts,
            updates: updates,
            deletes: deletes
          },
          first_log: first_log,
          last_log: last_log
        }
        {:ok, stats}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Retorna estatísticas por tabela.
  """
  def get_table_statistics do
    sql = """
    SELECT 
      table_name,
      COUNT(*) as total_logs,
      COUNT(CASE WHEN action = 'INSERT' THEN 1 END) as inserts,
      COUNT(CASE WHEN action = 'UPDATE' THEN 1 END) as updates,
      COUNT(CASE WHEN action = 'DELETE' THEN 1 END) as deletes,
      MIN(created_at) as first_log,
      MAX(created_at) as last_log
    FROM audit_log
    GROUP BY table_name
    ORDER BY total_logs DESC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        stats = Enum.map(rows, fn [table, total, inserts, updates, deletes, first_log, last_log] ->
          %{
            table_name: table,
            total_logs: total,
            actions: %{
              inserts: inserts,
              updates: updates,
              deletes: deletes
            },
            first_log: first_log,
            last_log: last_log
          }
        end)
        {:ok, stats}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Retorna atividade recente.
  """
  def get_recent_activity(hours \\ 24) do
    cutoff_time = DateTime.utc_now() |> DateTime.add(-hours * 3600, :second)

    sql = """
    SELECT al.id, al.table_name, al.record_id, al.action, al.old_values,
           al.new_values, al.user_id, al.created_at, u.username
    FROM audit_log al
    LEFT JOIN users u ON al.user_id = u.id
    WHERE al.created_at >= $1
    ORDER BY al.created_at DESC
    LIMIT 50
    """

    case Connection.query(sql, [cutoff_time]) do
      {:ok, %{rows: rows}} ->
        logs = Enum.map(rows, &row_to_audit_log/1)
        {:ok, logs}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Remove logs antigos de auditoria.
  """
  def cleanup_old_logs(days_to_keep \\ 90) do
    cutoff_date = DateTime.utc_now() |> DateTime.add(-days_to_keep * 24 * 3600, :second)

    sql = """
    DELETE FROM audit_log 
    WHERE created_at < $1
    """

    case Connection.query(sql, [cutoff_date]) do
      {:ok, %{num_rows: deleted_count}} ->
        {:ok, deleted_count}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # HELPERS PRIVADOS
  # ============================================================================

  defp row_to_audit_log([id, table_name, record_id, action, old_values,
                         new_values, user_id, created_at, username]) do
    AuditLog.new(%{
      id: id,
      table_name: table_name,
      record_id: record_id,
      action: action,
      old_values: old_values,
      new_values: new_values,
      user_id: user_id,
      created_at: created_at,
      username: username
    })
  end
end
