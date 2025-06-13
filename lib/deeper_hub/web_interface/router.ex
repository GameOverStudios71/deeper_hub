defmodule DeeperHub.WebInterface.Router do
  @moduledoc """
  Roteador principal para a API REST do DeeperHub.
  Este módulo define as rotas e recursos disponíveis na API.
  """
  use Plug.Router
  use Plug.ErrorHandler

  # Plugs de depuração
  plug(Plug.Logger, log: :debug)

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

  # CMS Settings Routes
  forward("/api/cms/themes", to: DeeperHubWeb.Resources.CMS.ThemeResource)
  forward("/api/cms/pages", to: DeeperHubWeb.Resources.CMS.PageResource)
  forward("/api/cms/widgets", to: DeeperHubWeb.Resources.CMS.WidgetResource)
  forward("/api/cms/forms", to: DeeperHubWeb.Resources.CMS.FormResource)
  forward("/api/cms/menus", to: DeeperHubWeb.Resources.CMS.MenuResource)
  forward("/api/cms/media", to: DeeperHubWeb.Resources.CMS.MediaResource)
  forward("/api/cms/settings", to: DeeperHubWeb.Resources.CMS.SettingResource)

  # CMS Dinâmico Routes
  forward("/api/entities", to: DeeperHub.WebInterface.Resources.EntitiesResource)
  forward("/api/fields", to: DeeperHub.WebInterface.Resources.FieldsResource)
  forward("/api/records", to: DeeperHub.WebInterface.Resources.RecordsResource)
  forward("/api/cms", to: DeeperHub.WebInterface.Resources.CmsAdminResource)

  # Sistema Routes
  forward("/api/terminal", to: DeeperHub.WebInterface.Resources.TerminalResource)
  forward("/api/console", to: DeeperHub.WebInterface.Resources.ConsoleResource)

  # Rota principal para verificação da API
  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{status: "ok", api: "DeeperHub API v1"}))
  end

  # Fallback para rotas não encontradas
  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{erro: "Rota não encontrada"}))
  end

  # Log de erros
  def handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.puts("Erro na API: #{inspect(kind)} - #{inspect(reason)}")
    IO.puts("Stack: #{inspect(stack)}")
    send_resp(conn, conn.status || 500, "Erro interno do servidor")
  end
end
