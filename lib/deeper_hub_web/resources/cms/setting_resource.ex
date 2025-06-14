defmodule DeeperHubWeb.Resources.CMS.SettingResource do
  @moduledoc """
  Recurso REST para configurações do CMS.
  Fornece endpoints para gerenciar configurações do sistema.

  Endpoints disponíveis:
  - GET /api/cms/settings/categories - Lista categorias de configuração
  - GET /api/cms/settings/categories/active - Lista categorias ativas
  - GET /api/cms/settings/types - Lista tipos de configuração
  - GET /api/cms/settings - Lista todas as configurações
  - GET /api/cms/settings/category/:id - Lista configurações por categoria
  - GET /api/cms/settings/name/:name - Busca configuração por nome
  - PUT /api/cms/settings/name/:name - Atualiza valor de configuração
  - GET /api/cms/settings/themes - Lista temas
  - GET /api/cms/settings/themes/active - Lista temas ativos
  - GET /api/cms/settings/themes/default - Obtém tema padrão
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.CMS.Settings
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
  # CATEGORIES
  # ============================================================================

  # ===== SETTING CATEGORIES ROUTES =====

  # GET /api/cms/settings/categories - Lista categorias
  get "/categories" do
    Logger.info("Listando categorias de configuração", module: __MODULE__)

    case Settings.list_setting_categories() do
      {:ok, categories} ->
        response = %{
          status: "success",
          data: categories,
          count: length(categories)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar categorias: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar categorias de configuração",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/settings/categories - Cria uma nova categoria
  post "/categories" do
    Logger.info("Criando nova categoria de configuração", module: __MODULE__)

    category_data = convert_keys_to_atoms(conn.body_params)

    case Settings.create_setting_category(category_data) do
      {:ok, category} ->
        response = %{
          status: "success",
          data: category,
          message: "Categoria criada com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar categoria: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar categoria",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/settings/categories/active - Lista categorias ativas
  get "/categories/active" do
    Logger.info("Listando categorias ativas", module: __MODULE__)

    case Settings.list_active_setting_categories() do
      {:ok, categories} ->
        response = %{
          status: "success",
          data: categories,
          count: length(categories)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar categorias ativas: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar categorias ativas",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # ============================================================================
  # TYPES
  # ============================================================================

  # ===== SETTING TYPES ROUTES =====

  # GET /api/cms/settings/types - Lista tipos
  get "/types" do
    Logger.info("Listando tipos de configuração", module: __MODULE__)

    case Settings.list_setting_types() do
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
          message: "Erro ao listar tipos de configuração",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/settings/types - Cria um novo tipo
  post "/types" do
    Logger.info("Criando novo tipo de configuração", module: __MODULE__)

    type_data = convert_keys_to_atoms(conn.body_params)

    case Settings.create_setting_type(type_data) do
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

  # ============================================================================
  # SETTINGS
  # ============================================================================

  # ===== SETTINGS ROUTES =====

  # GET /api/cms/settings - Lista todas as configurações
  get "/" do
    Logger.info("Listando todas as configurações", module: __MODULE__)

    case Settings.list_settings() do
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

  # POST /api/cms/settings - Cria uma nova configuração
  post "/" do
    Logger.info("Criando nova configuração", module: __MODULE__)

    setting_data = convert_keys_to_atoms(conn.body_params)

    case Settings.create_setting(setting_data) do
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

  # GET /api/cms/settings/category/:id - Lista por categoria
  get "/category/:id" do
    category_id = conn.path_params["id"]
    Logger.info("Listando configurações da categoria: #{category_id}", module: __MODULE__)

    case Settings.list_settings_by_category(category_id) do
      {:ok, settings} ->
        response = %{
          status: "success",
          data: settings,
          count: length(settings),
          category_id: category_id
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar configurações da categoria #{category_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar configurações da categoria",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/settings/name/:name - Busca por nome
  get "/name/:name" do
    setting_name = conn.path_params["name"]
    Logger.info("Buscando configuração por nome: #{setting_name}", module: __MODULE__)

    case Settings.get_setting_by_name(setting_name) do
      {:ok, setting} ->
        response = %{
          status: "success",
          data: setting
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Configuração não encontrada para nome: #{setting_name}"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar configuração #{setting_name}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar configuração",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # PUT /api/cms/settings/name/:name - Atualiza valor
  put "/name/:name" do
    setting_name = conn.path_params["name"]
    Logger.info("Atualizando configuração: #{setting_name}", module: __MODULE__)

    case conn.body_params do
      %{"value" => value} ->
        case Settings.update_setting_value(setting_name, value) do
          {:ok, setting} ->
            response = %{
              status: "success",
              message: "Configuração atualizada com sucesso",
              data: setting
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, :not_found} ->
            error_response = %{
              status: "error",
              message: "Configuração não encontrada"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(404, Jason.encode!(error_response))

          {:error, reason} ->
            Logger.error("Erro ao atualizar configuração #{setting_name}: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao atualizar configuração",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Valor é obrigatório"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ============================================================================
  # THEMES
  # ============================================================================

  # ===== THEMES ROUTES =====

  # GET /api/cms/settings/themes - Lista temas
  get "/themes" do
    Logger.info("Listando temas", module: __MODULE__)

    case Settings.list_themes() do
      {:ok, themes} ->
        response = %{
          status: "success",
          data: themes,
          count: length(themes)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar temas: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar temas",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/settings/themes - Cria um novo tema
  post "/themes" do
    Logger.info("Criando novo tema", module: __MODULE__)

    theme_data = convert_keys_to_atoms(conn.body_params)

    case Settings.create_theme(theme_data) do
      {:ok, theme} ->
        response = %{
          status: "success",
          data: theme,
          message: "Tema criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar tema: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar tema",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/settings/themes/settings - Lista configurações de tema
  get "/themes/settings" do
    Logger.info("Listando configurações de tema", module: __MODULE__)

    case Settings.list_theme_settings() do
      {:ok, theme_settings} ->
        response = %{
          status: "success",
          data: theme_settings,
          count: length(theme_settings)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar configurações de tema: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar configurações de tema",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/settings/themes/settings - Cria uma nova configuração de tema
  post "/themes/settings" do
    Logger.info("Criando nova configuração de tema", module: __MODULE__)

    theme_setting_data = convert_keys_to_atoms(conn.body_params)

    case Settings.create_theme_setting(theme_setting_data) do
      {:ok, theme_setting} ->
        response = %{
          status: "success",
          data: theme_setting,
          message: "Configuração de tema criada com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar configuração de tema: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar configuração de tema",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/settings/themes/active - Lista temas ativos
  get "/themes/active" do
    Logger.info("Listando temas ativos", module: __MODULE__)

    case Settings.list_active_themes() do
      {:ok, themes} ->
        response = %{
          status: "success",
          data: themes,
          count: length(themes)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar temas ativos: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar temas ativos",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/settings/themes/default - Obtém tema padrão
  get "/themes/default" do
    Logger.info("Buscando tema padrão", module: __MODULE__)

    case Settings.get_default_theme() do
      {:ok, theme} ->
        response = %{
          status: "success",
          data: theme
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Tema padrão não encontrado"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar tema padrão: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar tema padrão",
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
    |> send_resp(404, Jason.encode!(%{erro: "Rota de configurações não encontrada"}))
  end

  # Funções auxiliares privadas
  defp convert_keys_to_atoms(map) when is_map(map) do
    Enum.into(map, %{}, fn {k, v} ->
      key = if is_binary(k), do: String.to_atom(k), else: k
      {key, v}
    end)
  end
end
