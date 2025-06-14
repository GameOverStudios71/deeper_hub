defmodule DeeperHubWeb.Resources.CMS.MenuResource do
  @moduledoc """
  Recurso REST para menus do CMS.
  Fornece endpoints para gerenciar menus do sistema.

  Endpoints disponíveis:
  - GET /api/cms/menus - Lista todos os conjuntos de menu
  - GET /api/cms/menus/:id - Obtém um conjunto específico pelo ID
  - POST /api/cms/menus - Cria um novo conjunto de menu
  - PUT /api/cms/menus/:id - Atualiza um conjunto existente
  - DELETE /api/cms/menus/:id - Remove um conjunto existente
  - GET /api/cms/menus/active - Lista conjuntos ativos
  - GET /api/cms/menus/templates - Lista templates de menu
  - GET /api/cms/menus/name/:name - Busca conjunto por nome
  - GET /api/cms/menus/:id/items - Lista itens de um conjunto
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.CMS.Menus
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

  # GET /api/cms/menus - Lista todos os conjuntos de menu
  get "/" do
    Logger.info("Listando todos os conjuntos de menu", module: __MODULE__)

    case Menus.list_menu_sets() do
      {:ok, menu_sets} ->
        response = %{
          status: "success",
          data: menu_sets,
          count: length(menu_sets)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar conjuntos de menu: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar conjuntos de menu",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/menus/active - Lista conjuntos ativos
  get "/active" do
    Logger.info("Listando conjuntos de menu ativos", module: __MODULE__)

    case Menus.list_active_menu_sets() do
      {:ok, menu_sets} ->
        response = %{
          status: "success",
          data: menu_sets,
          count: length(menu_sets)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar conjuntos ativos: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar conjuntos de menu ativos",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # ===== MENU TEMPLATES ROUTES =====

  # GET /api/cms/menus/templates - Lista templates de menu
  get "/templates" do
    Logger.info("Listando templates de menu", module: __MODULE__)

    case Menus.list_menu_templates() do
      {:ok, templates} ->
        response = %{
          status: "success",
          data: templates,
          count: length(templates)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar templates: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar templates de menu",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/menus/templates - Cria um novo template
  post "/templates" do
    Logger.info("Criando novo template de menu", module: __MODULE__)

    template_data = convert_keys_to_atoms(conn.body_params)

    case Menus.create_menu_template(template_data) do
      {:ok, template} ->
        response = %{
          status: "success",
          data: template,
          message: "Template de menu criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar template: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar template de menu",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ===== MENU ITEMS ROUTES =====

  # GET /api/cms/menus/items - Lista todos os itens de menu
  get "/items" do
    Logger.info("Listando todos os itens de menu", module: __MODULE__)

    case Menus.list_menu_items() do
      {:ok, items} ->
        response = %{
          status: "success",
          data: items,
          count: length(items)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar itens: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar itens de menu",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/menus/items - Cria um novo item de menu
  post "/items" do
    Logger.info("Criando novo item de menu", module: __MODULE__)

    item_data = convert_keys_to_atoms(conn.body_params)

    case Menus.create_menu_item(item_data) do
      {:ok, item} ->
        response = %{
          status: "success",
          data: item,
          message: "Item de menu criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar item: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar item de menu",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/menus/name/:name - Busca conjunto por nome
  get "/name/:name" do
    menu_name = conn.path_params["name"]
    Logger.info("Buscando conjunto por nome: #{menu_name}", module: __MODULE__)

    case Menus.get_menu_set_by_name(menu_name) do
      {:ok, menu_set} ->
        response = %{
          status: "success",
          data: menu_set
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Conjunto de menu não encontrado para nome: #{menu_name}"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar conjunto por nome #{menu_name}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar conjunto de menu",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/menus/:id/items - Lista itens de um conjunto
  get "/:id/items" do
    menu_set_id = conn.path_params["id"]
    Logger.info("Listando itens do conjunto: #{menu_set_id}", module: __MODULE__)

    case Menus.list_menu_items(menu_set_id) do
      {:ok, items} ->
        response = %{
          status: "success",
          data: items,
          count: length(items),
          menu_set_id: menu_set_id
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar itens do conjunto #{menu_set_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar itens do conjunto",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/menus/:id - Obtém um conjunto específico
  get "/:id" do
    menu_set_id = conn.path_params["id"]
    Logger.info("Buscando conjunto com ID: #{menu_set_id}", module: __MODULE__)

    case Menus.get_menu_set(menu_set_id) do
      {:ok, menu_set} ->
        response = %{
          status: "success",
          data: menu_set
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Conjunto de menu não encontrado"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar conjunto #{menu_set_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar conjunto de menu",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/menus - Cria um novo conjunto de menu
  post "/" do
    Logger.info("Criando novo conjunto de menu", module: __MODULE__)

    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        menu_params = convert_keys_to_atoms(params)

        case Menus.create_menu_set(menu_params) do
          {:ok, menu_set} ->
            response = %{
              status: "success",
              message: "Conjunto de menu criado com sucesso",
              data: menu_set
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar conjunto: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao criar conjunto de menu",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados do conjunto de menu são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # PUT /api/cms/menus/:id - Atualiza um conjunto existente
  put "/:id" do
    menu_set_id = conn.path_params["id"]
    Logger.info("Atualizando conjunto com ID: #{menu_set_id}", module: __MODULE__)

    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        menu_params = convert_keys_to_atoms(params)

        case Menus.update_menu_set(menu_set_id, menu_params) do
          {:ok, menu_set} ->
            response = %{
              status: "success",
              message: "Conjunto de menu atualizado com sucesso",
              data: menu_set
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, :not_found} ->
            error_response = %{
              status: "error",
              message: "Conjunto de menu não encontrado"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(404, Jason.encode!(error_response))

          {:error, reason} ->
            Logger.error("Erro ao atualizar conjunto #{menu_set_id}: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao atualizar conjunto de menu",
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

  # DELETE /api/cms/menus/:id - Remove um conjunto
  delete "/:id" do
    menu_set_id = conn.path_params["id"]
    Logger.info("Removendo conjunto com ID: #{menu_set_id}", module: __MODULE__)

    case Menus.delete_menu_set(menu_set_id) do
      :ok ->
        response = %{
          status: "success",
          message: "Conjunto de menu removido com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found_or_system} ->
        error_response = %{
          status: "error",
          message: "Conjunto não encontrado ou é um conjunto do sistema"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao remover conjunto #{menu_set_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao remover conjunto de menu",
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
    |> send_resp(404, Jason.encode!(%{erro: "Rota de menus não encontrada"}))
  end

  # Funções auxiliares privadas
  defp convert_keys_to_atoms(map) when is_map(map) do
    Enum.into(map, %{}, fn {k, v} ->
      key = if is_binary(k), do: String.to_atom(k), else: k
      {key, v}
    end)
  end
end
