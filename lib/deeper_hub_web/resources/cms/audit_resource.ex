defmodule DeeperHubWeb.Resources.CMS.AuditResource do
  @moduledoc """
  Recurso REST para auditoria do CMS.
  Fornece endpoints para consultar logs de auditoria.
  
  Endpoints disponíveis:
  - GET /api/cms/audit/logs - Lista todos os logs de auditoria
  - GET /api/cms/audit/logs/table/:table - Lista logs por tabela
  - GET /api/cms/audit/logs/record/:table/:record_id - Lista logs por registro
  - GET /api/cms/audit/logs/user/:user_id - Lista logs por usuário
  - GET /api/cms/audit/logs/action/:action - Lista logs por ação
  - GET /api/cms/audit/logs/period - Lista logs por período
  - GET /api/cms/audit/logs/:id - Obtém log específico
  - GET /api/cms/audit/statistics - Obtém estatísticas gerais
  - GET /api/cms/audit/statistics/tables - Obtém estatísticas por tabela
  - GET /api/cms/audit/activity/recent - Obtém atividade recente
  - POST /api/cms/audit/logs - Cria log manual (admin)
  - DELETE /api/cms/audit/cleanup - Remove logs antigos (admin)
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.CMS.Audit
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

  # ============================================================================
  # LOGS
  # ============================================================================

  # GET /api/cms/audit/logs - Lista todos os logs
  get "/logs" do
    Logger.info("Listando logs de auditoria", module: __MODULE__)
    
    # Parâmetros de paginação
    limit = get_query_param(conn, "limit", "100") |> String.to_integer()
    offset = get_query_param(conn, "offset", "0") |> String.to_integer()
    
    case Audit.list_audit_logs(limit: limit, offset: offset) do
      {:ok, logs} ->
        response = %{
          status: "success",
          data: logs,
          count: length(logs),
          pagination: %{
            limit: limit,
            offset: offset
          }
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar logs: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar logs de auditoria",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/audit/logs/table/:table - Lista logs por tabela
  get "/logs/table/:table" do
    table_name = conn.path_params["table"]
    Logger.info("Listando logs da tabela: #{table_name}", module: __MODULE__)
    
    limit = get_query_param(conn, "limit", "100") |> String.to_integer()
    offset = get_query_param(conn, "offset", "0") |> String.to_integer()
    
    case Audit.list_audit_logs_by_table(table_name, limit: limit, offset: offset) do
      {:ok, logs} ->
        response = %{
          status: "success",
          data: logs,
          count: length(logs),
          table_name: table_name,
          pagination: %{
            limit: limit,
            offset: offset
          }
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar logs da tabela #{table_name}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar logs da tabela",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/audit/logs/record/:table/:record_id - Lista logs por registro
  get "/logs/record/:table/:record_id" do
    table_name = conn.path_params["table"]
    record_id = conn.path_params["record_id"]
    Logger.info("Listando logs do registro #{record_id} da tabela #{table_name}", module: __MODULE__)
    
    limit = get_query_param(conn, "limit", "100") |> String.to_integer()
    offset = get_query_param(conn, "offset", "0") |> String.to_integer()
    
    case Audit.list_audit_logs_by_record(table_name, record_id, limit: limit, offset: offset) do
      {:ok, logs} ->
        response = %{
          status: "success",
          data: logs,
          count: length(logs),
          table_name: table_name,
          record_id: record_id,
          pagination: %{
            limit: limit,
            offset: offset
          }
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar logs do registro #{record_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar logs do registro",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/audit/logs/user/:user_id - Lista logs por usuário
  get "/logs/user/:user_id" do
    user_id = conn.path_params["user_id"]
    Logger.info("Listando logs do usuário: #{user_id}", module: __MODULE__)
    
    limit = get_query_param(conn, "limit", "100") |> String.to_integer()
    offset = get_query_param(conn, "offset", "0") |> String.to_integer()
    
    case Audit.list_audit_logs_by_user(user_id, limit: limit, offset: offset) do
      {:ok, logs} ->
        response = %{
          status: "success",
          data: logs,
          count: length(logs),
          user_id: user_id,
          pagination: %{
            limit: limit,
            offset: offset
          }
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar logs do usuário #{user_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar logs do usuário",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/audit/logs/action/:action - Lista logs por ação
  get "/logs/action/:action" do
    action = conn.path_params["action"]
    Logger.info("Listando logs da ação: #{action}", module: __MODULE__)
    
    limit = get_query_param(conn, "limit", "100") |> String.to_integer()
    offset = get_query_param(conn, "offset", "0") |> String.to_integer()
    
    case Audit.list_audit_logs_by_action(action, limit: limit, offset: offset) do
      {:ok, logs} ->
        response = %{
          status: "success",
          data: logs,
          count: length(logs),
          action: action,
          pagination: %{
            limit: limit,
            offset: offset
          }
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar logs da ação #{action}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar logs da ação",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/audit/logs/period - Lista logs por período
  get "/logs/period" do
    start_date = get_query_param(conn, "start_date")
    end_date = get_query_param(conn, "end_date")
    
    Logger.info("Listando logs do período: #{start_date} a #{end_date}", module: __MODULE__)
    
    if start_date && end_date do
      limit = get_query_param(conn, "limit", "100") |> String.to_integer()
      offset = get_query_param(conn, "offset", "0") |> String.to_integer()
      
      case Audit.list_audit_logs_by_period(start_date, end_date, limit: limit, offset: offset) do
        {:ok, logs} ->
          response = %{
            status: "success",
            data: logs,
            count: length(logs),
            period: %{
              start_date: start_date,
              end_date: end_date
            },
            pagination: %{
              limit: limit,
              offset: offset
            }
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(200, Jason.encode!(response))

        {:error, reason} ->
          Logger.error("Erro ao listar logs do período: #{inspect(reason)}", module: __MODULE__)
          
          error_response = %{
            status: "error",
            message: "Erro ao listar logs do período",
            details: inspect(reason)
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(500, Jason.encode!(error_response))
      end
    else
      error_response = %{
        status: "error",
        message: "Parâmetros start_date e end_date são obrigatórios"
      }
      
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/audit/logs/:id - Obtém log específico
  get "/logs/:id" do
    log_id = conn.path_params["id"]
    Logger.info("Buscando log com ID: #{log_id}", module: __MODULE__)
    
    case Audit.get_audit_log(log_id) do
      {:ok, log} ->
        response = %{
          status: "success",
          data: log
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Log de auditoria não encontrado"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar log #{log_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao buscar log de auditoria",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # ============================================================================
  # STATISTICS
  # ============================================================================

  # GET /api/cms/audit/statistics - Obtém estatísticas gerais
  get "/statistics" do
    Logger.info("Obtendo estatísticas de auditoria", module: __MODULE__)
    
    case Audit.get_audit_statistics() do
      {:ok, stats} ->
        response = %{
          status: "success",
          data: stats
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao obter estatísticas: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao obter estatísticas de auditoria",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/audit/statistics/tables - Obtém estatísticas por tabela
  get "/statistics/tables" do
    Logger.info("Obtendo estatísticas por tabela", module: __MODULE__)
    
    case Audit.get_table_statistics() do
      {:ok, stats} ->
        response = %{
          status: "success",
          data: stats
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao obter estatísticas por tabela: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao obter estatísticas por tabela",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # ============================================================================
  # ACTIVITY
  # ============================================================================

  # GET /api/cms/audit/activity/recent - Obtém atividade recente
  get "/activity/recent" do
    hours = get_query_param(conn, "hours", "24") |> String.to_integer()
    Logger.info("Obtendo atividade recente (#{hours}h)", module: __MODULE__)
    
    case Audit.get_recent_activity(hours) do
      {:ok, logs} ->
        response = %{
          status: "success",
          data: logs,
          count: length(logs),
          hours: hours
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao obter atividade recente: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao obter atividade recente",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end  # Handle CORS preflight requests
  options _ do
    conn
    |> put_resp_header("access-control-allow-origin", "*")
    |> put_resp_header("access-control-allow-methods", "GET, POST, PUT, DELETE, OPTIONS")
    |> put_resp_header("access-control-allow-headers", "content-type, authorization, x-requested-with")
    |> put_resp_header("access-control-max-age", "86400")
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{status: "ok"}))
  end



  # Fallback para rotas não encontradas
  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{erro: "Rota de auditoria não encontrada"}))
  end

  # Funções auxiliares privadas
  defp get_query_param(conn, param, default \\ nil) do
    case conn.query_params[param] do
      nil -> default
      value -> value
    end
  end
end
