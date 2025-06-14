defmodule DeeperHubWeb.Resources.CMS.WidgetResource do
  @moduledoc """
  Recurso REST para widgets do CMS.
  Fornece endpoints para gerenciar widgets do sistema.

  Endpoints disponíveis:
  - GET /api/cms/widgets - Lista todos os widgets
  - GET /api/cms/widgets/:id - Obtém um widget específico pelo ID
  - POST /api/cms/widgets - Cria um novo widget
  - PUT /api/cms/widgets/:id - Atualiza um widget existente
  - DELETE /api/cms/widgets/:id - Remove um widget existente
  - GET /api/cms/widgets/active - Lista widgets ativos
  - GET /api/cms/widgets/featured - Lista widgets em destaque
  - GET /api/cms/widgets/by-type/:type_id - Lista widgets por tipo
  - GET /api/cms/widgets/types - Lista tipos de widget
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.CMS.Widgets
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

  # GET /api/cms/widgets - Lista todos os widgets
  get "/" do
    Logger.info("Listando todos os widgets", module: __MODULE__)

    case Widgets.list_widgets() do
      {:ok, widgets} ->
        response = %{
          status: "success",
          data: widgets,
          count: length(widgets)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar widgets: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar widgets",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/widgets/active - Lista widgets ativos
  get "/active" do
    Logger.info("Listando widgets ativos", module: __MODULE__)

    case Widgets.list_active_widgets() do
      {:ok, widgets} ->
        response = %{
          status: "success",
          data: widgets,
          count: length(widgets)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar widgets ativos: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar widgets ativos",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/widgets/featured - Lista widgets em destaque
  get "/featured" do
    Logger.info("Listando widgets em destaque", module: __MODULE__)

    case Widgets.list_featured_widgets() do
      {:ok, widgets} ->
        response = %{
          status: "success",
          data: widgets,
          count: length(widgets)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar widgets em destaque: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar widgets em destaque",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # ===== WIDGET TYPES ROUTES =====

  # GET /api/cms/widgets/types - Lista tipos de widget
  get "/types" do
    Logger.info("Listando tipos de widget", module: __MODULE__)

    case Widgets.list_widget_types() do
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
        Logger.error("Erro ao listar tipos de widget: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar tipos de widget",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/widgets/types - Cria um novo tipo de widget
  post "/types" do
    Logger.info("Criando novo tipo de widget", module: __MODULE__)

    type_data = convert_keys_to_atoms(conn.body_params)

    case Widgets.create_widget_type(type_data) do
      {:ok, type} ->
        response = %{
          status: "success",
          data: type,
          message: "Tipo de widget criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar tipo de widget: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar tipo de widget",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ===== WIDGET INSTANCES ROUTES =====

  # GET /api/cms/widgets/instances - Lista instâncias de widget
  get "/instances" do
    Logger.info("Listando instâncias de widget", module: __MODULE__)

    case Widgets.list_widget_instances() do
      {:ok, instances} ->
        response = %{
          status: "success",
          data: instances,
          count: length(instances)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar instâncias: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar instâncias",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/widgets/instances - Cria uma nova instância
  post "/instances" do
    Logger.info("Criando nova instância de widget", module: __MODULE__)

    instance_data = convert_keys_to_atoms(conn.body_params)

    case Widgets.create_widget_instance(instance_data) do
      {:ok, instance} ->
        response = %{
          status: "success",
          data: instance,
          message: "Instância criada com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar instância: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar instância",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ===== WIDGET SETTINGS ROUTES =====

  # GET /api/cms/widgets/settings - Lista configurações de widget
  get "/settings" do
    Logger.info("Listando configurações de widget", module: __MODULE__)

    case Widgets.list_widget_settings() do
      {:ok, settings} ->
        response = %{
          status: "success",
          data: settings,
          count: length(settings)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar configurações: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar configurações",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/widgets/settings - Cria uma nova configuração
  post "/settings" do
    Logger.info("Criando nova configuração de widget", module: __MODULE__)

    setting_data = convert_keys_to_atoms(conn.body_params)

    case Widgets.create_widget_setting(setting_data) do
      {:ok, setting} ->
        response = %{
          status: "success",
          data: setting,
          message: "Configuração criada com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar configuração: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar configuração",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ===== WIDGET BOOKMARKS ROUTES =====

  # GET /api/cms/widgets/bookmarks - Lista favoritos de widget
  get "/bookmarks" do
    Logger.info("Listando favoritos de widget", module: __MODULE__)

    case Widgets.list_widget_bookmarks() do
      {:ok, bookmarks} ->
        response = %{
          status: "success",
          data: bookmarks,
          count: length(bookmarks)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar favoritos: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar favoritos",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/widgets/bookmarks - Cria um novo favorito
  post "/bookmarks" do
    Logger.info("Criando novo favorito de widget", module: __MODULE__)

    bookmark_data = convert_keys_to_atoms(conn.body_params)

    case Widgets.create_widget_bookmark(bookmark_data) do
      {:ok, bookmark} ->
        response = %{
          status: "success",
          data: bookmark,
          message: "Favorito criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar favorito: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar favorito",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/widgets/by-type/:type_id - Lista widgets por tipo
  get "/by-type/:type_id" do
    type_id = conn.path_params["type_id"]
    Logger.info("Listando widgets do tipo: #{type_id}", module: __MODULE__)

    case Widgets.list_widgets_by_type(type_id) do
      {:ok, widgets} ->
        response = %{
          status: "success",
          data: widgets,
          count: length(widgets),
          widget_type_id: type_id
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar widgets do tipo #{type_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar widgets do tipo",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/widgets/:id - Obtém um widget específico
  get "/:id" do
    widget_id = conn.path_params["id"]
    Logger.info("Buscando widget com ID: #{widget_id}", module: __MODULE__)

    case Widgets.get_widget(widget_id) do
      {:ok, widget} ->
        response = %{
          status: "success",
          data: widget
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Widget não encontrado"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar widget #{widget_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar widget",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/widgets - Cria um novo widget
  post "/" do
    Logger.info("Criando novo widget", module: __MODULE__)

    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        widget_params = convert_keys_to_atoms(params)

        case Widgets.create_widget(widget_params) do
          {:ok, widget} ->
            response = %{
              status: "success",
              message: "Widget criado com sucesso",
              data: widget
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar widget: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao criar widget",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados do widget são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # PUT /api/cms/widgets/:id - Atualiza um widget existente
  put "/:id" do
    widget_id = conn.path_params["id"]
    Logger.info("Atualizando widget com ID: #{widget_id}", module: __MODULE__)

    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        widget_params = convert_keys_to_atoms(params)

        case Widgets.update_widget(widget_id, widget_params) do
          {:ok, widget} ->
            response = %{
              status: "success",
              message: "Widget atualizado com sucesso",
              data: widget
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, :not_found} ->
            error_response = %{
              status: "error",
              message: "Widget não encontrado"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(404, Jason.encode!(error_response))

          {:error, reason} ->
            Logger.error("Erro ao atualizar widget #{widget_id}: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao atualizar widget",
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

  # DELETE /api/cms/widgets/:id - Remove um widget
  delete "/:id" do
    widget_id = conn.path_params["id"]
    Logger.info("Removendo widget com ID: #{widget_id}", module: __MODULE__)

    case Widgets.delete_widget(widget_id) do
      :ok ->
        response = %{
          status: "success",
          message: "Widget removido com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Widget não encontrado"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao remover widget #{widget_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao remover widget",
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
    |> send_resp(404, Jason.encode!(%{erro: "Rota de widgets não encontrada"}))
  end

  # Funções auxiliares privadas
  defp convert_keys_to_atoms(map) when is_map(map) do
    Enum.into(map, %{}, fn {k, v} ->
      key = if is_binary(k), do: String.to_atom(k), else: k
      {key, v}
    end)
  end
end
