defmodule DeeperHubWeb.Resources.CMS.PageResource do
  @moduledoc """
  Recurso REST para páginas do CMS.
  Fornece endpoints para gerenciar páginas do sistema.

  Endpoints disponíveis:
  - GET /api/cms/pages - Lista todas as páginas
  - GET /api/cms/pages/:id - Obtém uma página específica pelo ID
  - POST /api/cms/pages - Cria uma nova página
  - PUT /api/cms/pages/:id - Atualiza uma página existente
  - DELETE /api/cms/pages/:id - Remove uma página existente
  - GET /api/cms/pages/uri/:uri - Busca página por URI
  - GET /api/cms/pages/home - Obtém a página inicial
  - GET /api/cms/pages/active - Lista páginas ativas
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.CMS.Pages
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

  # GET /api/cms/pages - Lista todas as páginas
  get "/" do
    Logger.info("Listando todas as páginas", module: __MODULE__)

    case Pages.list_pages() do
      {:ok, pages} ->
        response = %{
          status: "success",
          data: pages,
          count: length(pages)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar páginas: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar páginas",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/pages/active - Lista páginas ativas
  get "/active" do
    Logger.info("Listando páginas ativas", module: __MODULE__)

    case Pages.list_active_pages() do
      {:ok, pages} ->
        response = %{
          status: "success",
          data: pages,
          count: length(pages)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar páginas ativas: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar páginas ativas",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/pages/home - Obtém a página inicial
  get "/home" do
    Logger.info("Buscando página inicial", module: __MODULE__)

    case Pages.get_home_page() do
      {:ok, page} ->
        response = %{
          status: "success",
          data: page
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Página inicial não encontrada"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar página inicial: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar página inicial",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/pages/uri/:uri - Busca página por URI
  get "/uri/*uri_path" do
    uri = "/" <> Enum.join(uri_path, "/")
    Logger.info("Buscando página por URI: #{uri}", module: __MODULE__)

    case Pages.get_page_by_uri(uri) do
      {:ok, page} ->
        response = %{
          status: "success",
          data: page
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Página não encontrada para URI: #{uri}"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar página por URI #{uri}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar página",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/pages/:id - Obtém uma página específica
  get "/:id" do
    page_id = conn.path_params["id"]
    Logger.info("Buscando página com ID: #{page_id}", module: __MODULE__)

    case Pages.get_page(page_id) do
      {:ok, page} ->
        response = %{
          status: "success",
          data: page
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Página não encontrada"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar página #{page_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar página",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/pages - Cria uma nova página
  post "/" do
    Logger.info("Criando nova página", module: __MODULE__)

    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        page_params = convert_keys_to_atoms(params)

        case Pages.create_page(page_params) do
          {:ok, page} ->
            response = %{
              status: "success",
              message: "Página criada com sucesso",
              data: page
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar página: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao criar página",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados da página são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # PUT /api/cms/pages/:id - Atualiza uma página existente
  put "/:id" do
    page_id = conn.path_params["id"]
    Logger.info("Atualizando página com ID: #{page_id}", module: __MODULE__)

    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        page_params = convert_keys_to_atoms(params)

        case Pages.update_page(page_id, page_params) do
          {:ok, page} ->
            response = %{
              status: "success",
              message: "Página atualizada com sucesso",
              data: page
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, :not_found} ->
            error_response = %{
              status: "error",
              message: "Página não encontrada"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(404, Jason.encode!(error_response))

          {:error, reason} ->
            Logger.error("Erro ao atualizar página #{page_id}: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao atualizar página",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados para atualização são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # DELETE /api/cms/pages/:id - Remove uma página
  delete "/:id" do
    page_id = conn.path_params["id"]
    Logger.info("Removendo página com ID: #{page_id}", module: __MODULE__)

    case Pages.delete_page(page_id) do
      :ok ->
        response = %{
          status: "success",
          message: "Página removida com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found_or_system} ->
        error_response = %{
          status: "error",
          message: "Página não encontrada ou é uma página do sistema"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao remover página #{page_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao remover página",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # Fallback para rotas não encontradas
  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{erro: "Rota de páginas não encontrada"}))
  end

  # Funções auxiliares privadas
  defp convert_keys_to_atoms(map) when is_map(map) do
    Enum.into(map, %{}, fn {k, v} ->
      key = if is_binary(k), do: String.to_atom(k), else: k
      {key, v}
    end)
  end
end
