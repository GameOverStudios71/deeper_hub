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

  # ===== PAGE LAYOUTS ROUTES =====

  # GET /api/cms/pages/layouts - Lista todos os layouts
  get "/layouts" do
    Logger.info("Listando layouts de página", module: __MODULE__)

    case Pages.list_page_layouts() do
      {:ok, layouts} ->
        response = %{
          status: "success",
          data: layouts,
          count: length(layouts)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar layouts: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar layouts",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/pages/layouts - Cria um novo layout
  post "/layouts" do
    Logger.info("Criando novo layout", module: __MODULE__)

    layout_data = convert_keys_to_atoms(conn.body_params)

    case Pages.create_page_layout(layout_data) do
      {:ok, layout} ->
        response = %{
          status: "success",
          data: layout,
          message: "Layout criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar layout: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar layout",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ===== PAGE TYPES ROUTES =====

  # GET /api/cms/pages/types - Lista todos os tipos
  get "/types" do
    Logger.info("Listando tipos de página", module: __MODULE__)

    case Pages.list_page_types() do
      {:ok, types} ->
        response = %{
          status: "success",
          data: types,
          count: length(types)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar tipos: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar tipos",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/pages/types - Cria um novo tipo
  post "/types" do
    Logger.info("Criando novo tipo", module: __MODULE__)

    type_data = convert_keys_to_atoms(conn.body_params)

    case Pages.create_page_type(type_data) do
      {:ok, type} ->
        response = %{
          status: "success",
          data: type,
          message: "Tipo criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar tipo: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar tipo",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ===== DESIGN BOXES ROUTES =====

  # GET /api/cms/pages/design-boxes - Lista todas as design boxes
  get "/design-boxes" do
    Logger.info("Listando design boxes", module: __MODULE__)

    case Pages.list_design_boxes() do
      {:ok, boxes} ->
        response = %{
          status: "success",
          data: boxes,
          count: length(boxes)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar design boxes: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar design boxes",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/pages/design-boxes - Cria uma nova design box
  post "/design-boxes" do
    Logger.info("Criando nova design box", module: __MODULE__)

    box_data = convert_keys_to_atoms(conn.body_params)

    case Pages.create_design_box(box_data) do
      {:ok, box} ->
        response = %{
          status: "success",
          data: box,
          message: "Design box criada com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar design box: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar design box",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ===== PAGE BLOCKS ROUTES =====

  # GET /api/cms/pages/blocks - Lista todos os blocos
  get "/blocks" do
    Logger.info("Listando blocos de página", module: __MODULE__)

    case Pages.list_page_blocks() do
      {:ok, blocks} ->
        response = %{
          status: "success",
          data: blocks,
          count: length(blocks)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar blocos: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar blocos",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/pages/blocks - Cria um novo bloco
  post "/blocks" do
    Logger.info("Criando novo bloco", module: __MODULE__)

    block_data = convert_keys_to_atoms(conn.body_params)

    case Pages.create_page_block(block_data) do
      {:ok, block} ->
        response = %{
          status: "success",
          data: block,
          message: "Bloco criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar bloco: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar bloco",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ===== CONTENT PLACEHOLDERS ROUTES =====

  # GET /api/cms/pages/placeholders - Lista todos os placeholders
  get "/placeholders" do
    Logger.info("Listando placeholders de conteúdo", module: __MODULE__)

    case Pages.list_content_placeholders() do
      {:ok, placeholders} ->
        response = %{
          status: "success",
          data: placeholders,
          count: length(placeholders)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar placeholders: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar placeholders",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/pages/placeholders - Cria um novo placeholder
  post "/placeholders" do
    Logger.info("Criando novo placeholder", module: __MODULE__)

    placeholder_data = convert_keys_to_atoms(conn.body_params)

    case Pages.create_content_placeholder(placeholder_data) do
      {:ok, placeholder} ->
        response = %{
          status: "success",
          data: placeholder,
          message: "Placeholder criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar placeholder: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar placeholder",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
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

  # Adicionar rotas POST, PUT, DELETE para layouts e types aqui se necessário

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
