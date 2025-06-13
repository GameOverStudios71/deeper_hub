defmodule DeeperHub.WebInterface.Router do
  @moduledoc """
  Roteador principal para a API REST do DeeperHub.
  Este módulo define as rotas e recursos disponíveis na API.
  """
  use Plug.Router
  use Plug.ErrorHandler

  # Plugs de depuração
  plug(Plug.Logger, log: :debug)

  # CORS Headers
  plug(:cors_headers)

  # Parsers para formatos diferentes
  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  # Pipeline principal
  plug(:match)
  plug(:dispatch)

  # API Routes

  # CMS Settings Routes (rotas específicas primeiro)
  forward("/api/cms/themes", to: DeeperHubWeb.Resources.CMS.ThemeResource)
  forward("/api/cms/pages", to: DeeperHubWeb.Resources.CMS.PageResource)
  forward("/api/cms/widgets", to: DeeperHubWeb.Resources.CMS.WidgetResource)
  forward("/api/cms/forms", to: DeeperHubWeb.Resources.CMS.FormResource)
  forward("/api/cms/menus", to: DeeperHubWeb.Resources.CMS.MenuResource)
  forward("/api/cms/media", to: DeeperHubWeb.Resources.CMS.MediaResource)
  forward("/api/cms/settings", to: DeeperHubWeb.Resources.CMS.SettingResource)
  forward("/api/cms/users", to: DeeperHubWeb.Resources.CMS.UserResource)
  forward("/api/cms/relationships", to: DeeperHubWeb.Resources.CMS.RelationshipResource)
  forward("/api/cms/audit", to: DeeperHubWeb.Resources.CMS.AuditResource)

  # CMS Dinâmico Routes
  forward("/api/entities", to: DeeperHub.WebInterface.Resources.EntitiesResource)
  forward("/api/fields", to: DeeperHub.WebInterface.Resources.FieldsResource)
  forward("/api/records", to: DeeperHub.WebInterface.Resources.RecordsResource)

  # CMS Admin genérico (deve vir por último para não capturar rotas específicas)
  # forward("/api/cms", to: DeeperHub.WebInterface.Resources.CmsAdminResource)

  # Sistema Routes
  forward("/api/terminal", to: DeeperHub.WebInterface.Resources.TerminalResource)
  forward("/api/console", to: DeeperHub.WebInterface.Resources.ConsoleResource)

  # Rota principal para verificação da API
  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{status: "ok", api: "DeeperHub API v1"}))
  end

  # Health check endpoint
  get "/api/cms/health" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{status: "healthy", timestamp: DateTime.utc_now()}))
  end

  # Handle CORS preflight requests
  options _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{status: "ok"}))
  end

  # Fallback para rotas não encontradas
  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{erro: "Rota não encontrada"}))
  end

  # CORS Headers
  defp cors_headers(conn, _opts) do
    conn
    |> put_resp_header("access-control-allow-origin", "*")
    |> put_resp_header("access-control-allow-methods", "GET, POST, PUT, DELETE, OPTIONS")
    |> put_resp_header("access-control-allow-headers", "content-type, authorization, x-requested-with")
    |> put_resp_header("access-control-max-age", "86400")
  end

  # Log de erros
  def handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.puts("Erro na API: #{inspect(kind)} - #{inspect(reason)}")
    IO.puts("Stack: #{inspect(stack)}")
    send_resp(conn, conn.status || 500, "Erro interno do servidor")
  end
end
