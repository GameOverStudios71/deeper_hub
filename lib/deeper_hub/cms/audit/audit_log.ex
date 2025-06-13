defmodule DeeperHub.CMS.Audit.AuditLog do
  @moduledoc """
  Schema para logs de auditoria do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "audit_log"

  @derive Jason.Encoder
  defstruct [
    :id, :table_name, :record_id, :action, :old_values, :new_values,
    :user_id, :created_at, :username
  ]

  @doc """
  Valida dados do log de auditoria.
  """
  def validate(attrs) do
    errors = []

    # Converte chaves string para atom se necessário
    attrs = case attrs do
      %{} = map when is_map(map) ->
        for {key, value} <- map, into: %{} do
          key_atom = if is_binary(key), do: String.to_atom(key), else: key
          {key_atom, value}
        end
      _ -> attrs
    end

    # Validação do table_name
    table_name = attrs[:table_name] || attrs["table_name"]
    errors = if not is_binary(table_name) or String.length(table_name) < 1 do
      ["table_name é obrigatório" | errors]
    else
      errors
    end

    # Validação do record_id
    record_id = attrs[:record_id] || attrs["record_id"]
    errors = if not is_binary(record_id) or String.length(record_id) < 1 do
      ["record_id é obrigatório" | errors]
    else
      errors
    end

    # Validação do action
    action = attrs[:action] || attrs["action"]
    valid_actions = ["INSERT", "UPDATE", "DELETE"]
    errors = if not is_binary(action) or not Enum.member?(valid_actions, action) do
      ["action deve ser um dos seguintes: #{Enum.join(valid_actions, ", ")}" | errors]
    else
      errors
    end

    if length(errors) == 0 do
      {:ok, attrs}
    else
      {:error, errors}
    end
  end

  @doc """
  Cria um novo log de auditoria com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      table_name: attrs[:table_name],
      record_id: attrs[:record_id],
      action: attrs[:action],
      old_values: attrs[:old_values],
      new_values: attrs[:new_values],
      user_id: attrs[:user_id],
      created_at: attrs[:created_at],
      username: attrs[:username]
    }
  end

  @doc """
  Verifica se é uma ação de inserção.
  """
  def insert_action?(%__MODULE__{action: "INSERT"}), do: true
  def insert_action?(_), do: false

  @doc """
  Verifica se é uma ação de atualização.
  """
  def update_action?(%__MODULE__{action: "UPDATE"}), do: true
  def update_action?(_), do: false

  @doc """
  Verifica se é uma ação de exclusão.
  """
  def delete_action?(%__MODULE__{action: "DELETE"}), do: true
  def delete_action?(_), do: false

  @doc """
  Verifica se tem valores antigos.
  """
  def has_old_values?(%__MODULE__{old_values: values}) do
    is_binary(values) and String.trim(values) != "" and values != "null"
  end

  @doc """
  Verifica se tem valores novos.
  """
  def has_new_values?(%__MODULE__{new_values: values}) do
    is_binary(values) and String.trim(values) != "" and values != "null"
  end

  @doc """
  Verifica se tem usuário associado.
  """
  def has_user?(%__MODULE__{user_id: user_id}) when is_integer(user_id), do: true
  def has_user?(_), do: false

  @doc """
  Retorna valores antigos como mapa.
  """
  def old_values_map(%__MODULE__{old_values: values}) when is_binary(values) and values != "" do
    case Jason.decode(values) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def old_values_map(_), do: %{}

  @doc """
  Retorna valores novos como mapa.
  """
  def new_values_map(%__MODULE__{new_values: values}) when is_binary(values) and values != "" do
    case Jason.decode(values) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def new_values_map(_), do: %{}

  @doc """
  Retorna as mudanças entre valores antigos e novos.
  """
  def changes(%__MODULE__{} = log) do
    old_map = old_values_map(log)
    new_map = new_values_map(log)
    
    changes = %{}
    
    # Campos que foram adicionados ou modificados
    changes = Enum.reduce(new_map, changes, fn {key, new_value}, acc ->
      old_value = Map.get(old_map, key)
      if old_value != new_value do
        Map.put(acc, key, %{from: old_value, to: new_value})
      else
        acc
      end
    end)
    
    # Campos que foram removidos
    changes = Enum.reduce(old_map, changes, fn {key, old_value}, acc ->
      if not Map.has_key?(new_map, key) do
        Map.put(acc, key, %{from: old_value, to: nil})
      else
        acc
      end
    end)
    
    changes
  end

  @doc """
  Retorna informações resumidas do log.
  """
  def summary(%__MODULE__{} = log) do
    %{
      id: log.id,
      table_name: log.table_name,
      record_id: log.record_id,
      action: log.action,
      user_id: log.user_id,
      username: log.username,
      created_at: log.created_at,
      is_insert: insert_action?(log),
      is_update: update_action?(log),
      is_delete: delete_action?(log),
      has_old_values: has_old_values?(log),
      has_new_values: has_new_values?(log),
      has_user: has_user?(log),
      changes_count: map_size(changes(log))
    }
  end

  @doc """
  Retorna descrição da ação.
  """
  def action_description(%__MODULE__{action: action, table_name: table}) do
    case action do
      "INSERT" -> "Criou registro em #{table}"
      "UPDATE" -> "Atualizou registro em #{table}"
      "DELETE" -> "Removeu registro de #{table}"
      _ -> "Ação desconhecida em #{table}"
    end
  end

  @doc """
  Retorna a cor/categoria da ação para UI.
  """
  def action_category(%__MODULE__{action: action}) do
    case action do
      "INSERT" -> %{category: "creation", color: "green", icon: "plus"}
      "UPDATE" -> %{category: "modification", color: "blue", icon: "edit"}
      "DELETE" -> %{category: "deletion", color: "red", icon: "trash"}
      _ -> %{category: "unknown", color: "gray", icon: "question"}
    end
  end

  @doc """
  Verifica se é uma ação crítica.
  """
  def critical_action?(%__MODULE__{action: "DELETE"}), do: true
  def critical_action?(_), do: false

  @doc """
  Verifica se é uma ação de modificação.
  """
  def modification_action?(%__MODULE__{action: action}) do
    action in ["UPDATE", "DELETE"]
  end

  @doc """
  Retorna o tempo decorrido desde a ação.
  """
  def time_ago(%__MODULE__{created_at: created_at}) when is_binary(created_at) do
    case DateTime.from_iso8601(created_at) do
      {:ok, datetime, _} ->
        diff_seconds = DateTime.diff(DateTime.utc_now(), datetime, :second)
        format_time_ago(diff_seconds)
      _ ->
        "Tempo desconhecido"
    end
  end
  def time_ago(_), do: "Tempo desconhecido"

  @doc """
  Agrupa logs por ação.
  """
  def group_by_action(logs) when is_list(logs) do
    Enum.group_by(logs, fn log -> log.action end)
  end

  @doc """
  Agrupa logs por tabela.
  """
  def group_by_table(logs) when is_list(logs) do
    Enum.group_by(logs, fn log -> log.table_name end)
  end

  @doc """
  Agrupa logs por usuário.
  """
  def group_by_user(logs) when is_list(logs) do
    Enum.group_by(logs, fn log -> log.user_id end)
  end

  @doc """
  Filtra logs por ação.
  """
  def filter_by_action(logs, action) when is_list(logs) and is_binary(action) do
    Enum.filter(logs, fn log -> log.action == action end)
  end

  @doc """
  Filtra logs por tabela.
  """
  def filter_by_table(logs, table_name) when is_list(logs) and is_binary(table_name) do
    Enum.filter(logs, fn log -> log.table_name == table_name end)
  end

  @doc """
  Filtra logs críticos.
  """
  def filter_critical(logs) when is_list(logs) do
    Enum.filter(logs, &critical_action?/1)
  end

  @doc """
  Filtra logs com usuário.
  """
  def filter_with_user(logs) when is_list(logs) do
    Enum.filter(logs, &has_user?/1)
  end

  @doc """
  Filtra logs sem usuário.
  """
  def filter_without_user(logs) when is_list(logs) do
    Enum.filter(logs, fn log -> not has_user?(log) end)
  end

  @doc """
  Ordena logs por data (mais recente primeiro).
  """
  def sort_by_date(logs) when is_list(logs) do
    Enum.sort_by(logs, fn log -> log.created_at end, :desc)
  end

  @doc """
  Retorna estatísticas de uma lista de logs.
  """
  def statistics(logs) when is_list(logs) do
    total = length(logs)
    by_action = group_by_action(logs)
    by_table = group_by_table(logs)
    
    %{
      total: total,
      by_action: Enum.map(by_action, fn {action, action_logs} -> {action, length(action_logs)} end) |> Enum.into(%{}),
      by_table: Enum.map(by_table, fn {table, table_logs} -> {table, length(table_logs)} end) |> Enum.into(%{}),
      inserts: length(filter_by_action(logs, "INSERT")),
      updates: length(filter_by_action(logs, "UPDATE")),
      deletes: length(filter_by_action(logs, "DELETE")),
      critical_actions: length(filter_critical(logs)),
      with_user: length(filter_with_user(logs)),
      without_user: length(filter_without_user(logs))
    }
  end

  @doc """
  Retorna timeline de atividades.
  """
  def timeline(logs) when is_list(logs) do
    logs
    |> sort_by_date()
    |> Enum.map(fn log ->
      %{
        id: log.id,
        timestamp: log.created_at,
        action: log.action,
        description: action_description(log),
        table: log.table_name,
        record: log.record_id,
        user: log.username || "Sistema",
        category: action_category(log),
        is_critical: critical_action?(log),
        time_ago: time_ago(log)
      }
    end)
  end

  @doc """
  Valida integridade de logs.
  """
  def validate_integrity(logs) when is_list(logs) do
    errors = []
    
    # Verificar logs sem ação
    invalid_actions = Enum.filter(logs, fn log ->
      log.action not in ["INSERT", "UPDATE", "DELETE"]
    end)
    
    errors = if length(invalid_actions) > 0 do
      ["#{length(invalid_actions)} logs com ações inválidas" | errors]
    else
      errors
    end
    
    # Verificar logs sem tabela
    invalid_tables = Enum.filter(logs, fn log ->
      not is_binary(log.table_name) or String.trim(log.table_name) == ""
    end)
    
    errors = if length(invalid_tables) > 0 do
      ["#{length(invalid_tables)} logs sem nome de tabela" | errors]
    else
      errors
    end
    
    if length(errors) == 0 do
      {:ok, logs}
    else
      {:error, errors}
    end
  end

  # Funções auxiliares privadas
  defp format_time_ago(seconds) when seconds < 60, do: "#{seconds} segundos atrás"
  defp format_time_ago(seconds) when seconds < 3600 do
    minutes = div(seconds, 60)
    "#{minutes} minuto#{if minutes > 1, do: "s"} atrás"
  end
  defp format_time_ago(seconds) when seconds < 86400 do
    hours = div(seconds, 3600)
    "#{hours} hora#{if hours > 1, do: "s"} atrás"
  end
  defp format_time_ago(seconds) do
    days = div(seconds, 86400)
    "#{days} dia#{if days > 1, do: "s"} atrás"
  end
end
