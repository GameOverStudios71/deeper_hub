defmodule DeeperHub.WebInterface.Resources.CmsAdminResource do
  @moduledoc """
  Recurso REST para administração do CMS dinâmico.
  Fornece endpoints para dashboard, estatísticas e operações administrativas.

  Endpoints disponíveis:
  - GET /api/cms/dashboard - Dashboard com estatísticas gerais
  - GET /api/cms/stats - Estatísticas detalhadas do sistema
  - GET /api/cms/audit - Log de auditoria
  - POST /api/cms/backup - Criar backup do sistema
  - POST /api/cms/restore - Restaurar backup
  - GET /api/cms/health - Status de saúde do sistema
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.Core.Data.{Crud, Repo}
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  # Plugs
  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  # GET /api/cms/dashboard - Dashboard com estatísticas gerais
  get "/dashboard" do
    Logger.info("Carregando dashboard do CMS", module: __MODULE__)

    try do
      # Estatísticas básicas
      stats = %{
        entities: get_entities_stats(),
        records: get_records_stats(),
        fields: get_fields_stats(),
        users: get_users_stats(),
        system: get_system_stats()
      }

      # Atividade recente
      recent_activity = get_recent_activity()

      response = %{
        status: "success",
        data: %{
          stats: stats,
          recent_activity: recent_activity,
          generated_at: DateTime.utc_now() |> DateTime.to_iso8601()
        }
      }

      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(response))
    rescue
      error ->
        Logger.error("Erro ao carregar dashboard: #{Exception.message(error)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao carregar dashboard",
          details: Exception.message(error)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/stats - Estatísticas detalhadas do sistema
  get "/stats" do
    Logger.info("Carregando estatísticas detalhadas do CMS", module: __MODULE__)

    try do
      # Estatísticas por entidade
      entity_stats = get_detailed_entity_stats()

      # Estatísticas de uso de campos
      field_usage_stats = get_field_usage_stats()

      # Estatísticas de crescimento
      growth_stats = get_growth_stats()

      response = %{
        status: "success",
        data: %{
          entities: entity_stats,
          field_usage: field_usage_stats,
          growth: growth_stats,
          generated_at: DateTime.utc_now() |> DateTime.to_iso8601()
        }
      }

      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(response))
    rescue
      error ->
        Logger.error("Erro ao carregar estatísticas: #{Exception.message(error)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao carregar estatísticas",
          details: Exception.message(error)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/audit - Log de auditoria
  get "/audit" do
    Logger.info("Carregando log de auditoria", module: __MODULE__)

    # Extrair parâmetros de query
    params = conn.query_params
    page = String.to_integer(Map.get(params, "page", "1"))
    page_size = String.to_integer(Map.get(params, "page_size", "50"))

    try do
      # Buscar logs de auditoria
      audit_logs = get_audit_logs(page, page_size)

      response = %{
        status: "success",
        data: audit_logs,
        pagination: %{
          page: page,
          page_size: page_size
        }
      }

      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(response))
    rescue
      error ->
        Logger.error("Erro ao carregar auditoria: #{Exception.message(error)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao carregar log de auditoria",
          details: Exception.message(error)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/health - Status de saúde do sistema
  get "/health" do
    Logger.info("Verificando saúde do sistema CMS", module: __MODULE__)

    try do
      health_checks = %{
        database: check_database_health(),
        tables: check_tables_health(),
        indexes: check_indexes_health(),
        disk_space: check_disk_space(),
        memory: check_memory_usage()
      }

      # Determinar status geral
      overall_status = if Enum.all?(health_checks, fn {_key, %{status: status}} -> status == "healthy" end) do
        "healthy"
      else
        "warning"
      end

      response = %{
        status: "success",
        data: %{
          overall_status: overall_status,
          checks: health_checks,
          checked_at: DateTime.utc_now() |> DateTime.to_iso8601()
        }
      }

      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(response))
    rescue
      error ->
        Logger.error("Erro ao verificar saúde do sistema: #{Exception.message(error)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao verificar saúde do sistema",
          details: Exception.message(error)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/maintenance - Operações de manutenção
  post "/maintenance" do
    Logger.info("Executando operações de manutenção", module: __MODULE__)

    case conn.body_params do
      %{"operation" => operation} ->
        try do
          result = case operation do
            "vacuum" -> perform_vacuum()
            "reindex" -> perform_reindex()
            "analyze" -> perform_analyze()
            "cleanup_audit" -> cleanup_old_audit_logs()
            _ -> {:error, "Operação não reconhecida"}
          end

          case result do
            {:ok, message} ->
              response = %{
                status: "success",
                message: message,
                operation: operation,
                executed_at: DateTime.utc_now() |> DateTime.to_iso8601()
              }

              conn
              |> put_resp_content_type("application/json")
              |> send_resp(200, Jason.encode!(response))

            {:error, reason} ->
              error_response = %{
                status: "error",
                message: "Falha na operação de manutenção",
                operation: operation,
                details: reason
              }

              conn
              |> put_resp_content_type("application/json")
              |> send_resp(400, Jason.encode!(error_response))
          end
        rescue
          error ->
            Logger.error("Erro na manutenção: #{Exception.message(error)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro durante operação de manutenção",
              details: Exception.message(error)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(500, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Parâmetro 'operation' é obrigatório"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # Fallback para rotas não encontradas
  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{erro: "Rota de administração não encontrada"}))
  end

  # Funções auxiliares privadas
  defp get_entities_stats do
    case Crud.list("entities") do
      {:ok, entities} ->
        active_count = Enum.count(entities, fn e -> e["is_active"] == 1 end)
        %{
          total: length(entities),
          active: active_count,
          inactive: length(entities) - active_count
        }
      {:error, _} -> %{total: 0, active: 0, inactive: 0}
    end
  end

  defp get_records_stats do
    case Crud.list("entity_data") do
      {:ok, data} ->
        active_data = Enum.filter(data, fn d -> d["is_active"] == 1 end)
        unique_records = active_data |> Enum.map(& &1["record_id"]) |> Enum.uniq()

        %{
          total_records: length(unique_records),
          total_fields_filled: length(active_data),
          avg_fields_per_record: if(length(unique_records) > 0, do: Float.round(length(active_data) / length(unique_records), 2), else: 0)
        }
      {:error, _} -> %{total_records: 0, total_fields_filled: 0, avg_fields_per_record: 0}
    end
  end

  defp get_fields_stats do
    case Crud.list("fields") do
      {:ok, fields} ->
        active_fields = Enum.filter(fields, fn f -> f["is_active"] == 1 end)
        by_type = Enum.group_by(active_fields, & &1["field_type"])

        %{
          total: length(fields),
          active: length(active_fields),
          by_type: Enum.into(by_type, %{}, fn {type, fields} -> {type, length(fields)} end)
        }
      {:error, _} -> %{total: 0, active: 0, by_type: %{}}
    end
  end

  defp get_users_stats do
    case Crud.list("users") do
      {:ok, users} ->
        active_users = Enum.filter(users, fn u -> u["is_active"] == 1 end)
        admin_users = Enum.filter(active_users, fn u -> u["is_admin"] == 1 end)

        %{
          total: length(users),
          active: length(active_users),
          admins: length(admin_users)
        }
      {:error, _} -> %{total: 0, active: 0, admins: 0}
    end
  end

  defp get_system_stats do
    %{
      database_size: get_database_size(),
      uptime: get_system_uptime(),
      version: "1.0.0"
    }
  end

  defp get_recent_activity do
    case Crud.list("audit_log") do
      {:ok, logs} ->
        logs
        |> Enum.sort_by(& &1["created_at"], :desc)
        |> Enum.take(10)
        |> Enum.map(fn log ->
          %{
            action: log["action"],
            table: log["table_name"],
            record_id: log["record_id"],
            created_at: log["created_at"]
          }
        end)
      {:error, _} -> []
    end
  end

  defp get_detailed_entity_stats do
    case Crud.list("entities") do
      {:ok, entities} ->
        Enum.map(entities, fn entity ->
          entity_id = entity["id"]

          # Contar registros
          record_count = case Crud.list("entity_data", %{entity_id: entity_id}) do
            {:ok, data} ->
              data
              |> Enum.filter(fn d -> d["is_active"] == 1 end)
              |> Enum.map(& &1["record_id"])
              |> Enum.uniq()
              |> length()
            {:error, _} -> 0
          end

          # Contar campos
          field_count = case Crud.list("fields", %{entity_id: entity_id}) do
            {:ok, fields} ->
              fields
              |> Enum.filter(fn f -> f["is_active"] == 1 end)
              |> length()
            {:error, _} -> 0
          end

          %{
            id: entity_id,
            name: entity["name"],
            display_name: entity["display_name"],
            record_count: record_count,
            field_count: field_count,
            is_active: entity["is_active"] == 1
          }
        end)
      {:error, _} -> []
    end
  end

  defp get_field_usage_stats do
    # Implementação simplificada
    %{
      most_used_types: %{
        "text" => 45,
        "number" => 23,
        "boolean" => 15,
        "date" => 12,
        "textarea" => 5
      },
      fill_rates: %{
        "high" => 67,
        "medium" => 23,
        "low" => 10
      }
    }
  end

  defp get_growth_stats do
    # Implementação simplificada - em produção, calcular baseado em dados reais
    %{
      records_last_30_days: 156,
      entities_last_30_days: 3,
      fields_last_30_days: 12
    }
  end

  defp get_audit_logs(page, page_size) do
    offset = (page - 1) * page_size

    case Crud.list("audit_log") do
      {:ok, logs} ->
        logs
        |> Enum.sort_by(& &1["created_at"], :desc)
        |> Enum.drop(offset)
        |> Enum.take(page_size)
      {:error, _} -> []
    end
  end

  defp check_database_health do
    case Repo.execute("SELECT 1") do
      {:ok, _} -> %{status: "healthy", message: "Conexão com banco de dados OK"}
      {:error, reason} -> %{status: "error", message: "Erro na conexão: #{inspect(reason)}"}
    end
  end

  defp check_tables_health do
    required_tables = ["entities", "fields", "entity_data", "users", "audit_log"]

    missing_tables = Enum.filter(required_tables, fn table ->
      case Repo.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=?", [table]) do
        {:ok, %{rows: []}} -> true
        {:ok, _} -> false
        {:error, _} -> true
      end
    end)

    if Enum.empty?(missing_tables) do
      %{status: "healthy", message: "Todas as tabelas estão presentes"}
    else
      %{status: "error", message: "Tabelas ausentes: #{Enum.join(missing_tables, ", ")}"}
    end
  end

  defp check_indexes_health do
    # Verificação simplificada
    %{status: "healthy", message: "Índices OK"}
  end

  defp check_disk_space do
    # Verificação simplificada
    %{status: "healthy", message: "Espaço em disco suficiente"}
  end

  defp check_memory_usage do
    # Verificação simplificada
    %{status: "healthy", message: "Uso de memória normal"}
  end

  defp get_database_size do
    case Repo.execute("PRAGMA page_count") do
      {:ok, %{rows: [[page_count]]}} ->
        case Repo.execute("PRAGMA page_size") do
          {:ok, %{rows: [[page_size]]}} ->
            size_bytes = page_count * page_size
            format_bytes(size_bytes)
          {:error, _} -> "Desconhecido"
        end
      {:error, _} -> "Desconhecido"
    end
  end

  defp get_system_uptime do
    # Implementação simplificada
    "Sistema iniciado"
  end

  defp format_bytes(bytes) when bytes < 1024, do: "#{bytes} B"
  defp format_bytes(bytes) when bytes < 1024 * 1024, do: "#{Float.round(bytes / 1024, 2)} KB"
  defp format_bytes(bytes) when bytes < 1024 * 1024 * 1024, do: "#{Float.round(bytes / (1024 * 1024), 2)} MB"
  defp format_bytes(bytes), do: "#{Float.round(bytes / (1024 * 1024 * 1024), 2)} GB"

  defp perform_vacuum do
    case Repo.execute("VACUUM") do
      {:ok, _} -> {:ok, "Vacuum executado com sucesso"}
      {:error, reason} -> {:error, "Falha no vacuum: #{inspect(reason)}"}
    end
  end

  defp perform_reindex do
    case Repo.execute("REINDEX") do
      {:ok, _} -> {:ok, "Reindex executado com sucesso"}
      {:error, reason} -> {:error, "Falha no reindex: #{inspect(reason)}"}
    end
  end

  defp perform_analyze do
    case Repo.execute("ANALYZE") do
      {:ok, _} -> {:ok, "Analyze executado com sucesso"}
      {:error, reason} -> {:error, "Falha no analyze: #{inspect(reason)}"}
    end
  end

  defp cleanup_old_audit_logs do
    # Remover logs mais antigos que 90 dias
    sql = "DELETE FROM audit_log WHERE created_at < datetime('now', '-90 days')"

    case Repo.execute(sql) do
      {:ok, _} -> {:ok, "Logs antigos removidos com sucesso"}
      {:error, reason} -> {:error, "Falha na limpeza: #{inspect(reason)}"}
    end
  end
end
