defmodule DeeperHubWeb.Resources.CMS.FormResource do
  @moduledoc """
  Recurso REST para formulários do CMS.
  Fornece endpoints para gerenciar formulários do sistema.
  
  Endpoints disponíveis:
  - GET /api/cms/forms - Lista todos os formulários
  - GET /api/cms/forms/:id - Obtém um formulário específico pelo ID
  - POST /api/cms/forms - Cria um novo formulário
  - PUT /api/cms/forms/:id - Atualiza um formulário existente
  - DELETE /api/cms/forms/:id - Remove um formulário existente
  - GET /api/cms/forms/active - Lista formulários ativos
  - GET /api/cms/forms/field-types - Lista tipos de campo
  - GET /api/cms/forms/name/:name - Busca formulário por nome
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.CMS.Forms
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

  # GET /api/cms/forms - Lista todos os formulários
  get "/" do
    Logger.info("Listando todos os formulários", module: __MODULE__)
    
    case Forms.list_forms() do
      {:ok, forms} ->
        response = %{
          status: "success",
          data: forms,
          count: length(forms)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar formulários: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar formulários",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/forms/active - Lista formulários ativos
  get "/active" do
    Logger.info("Listando formulários ativos", module: __MODULE__)
    
    case Forms.list_active_forms() do
      {:ok, forms} ->
        response = %{
          status: "success",
          data: forms,
          count: length(forms)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar formulários ativos: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar formulários ativos",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/forms/field-types - Lista tipos de campo
  get "/field-types" do
    Logger.info("Listando tipos de campo", module: __MODULE__)
    
    case Forms.list_form_field_types() do
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
        Logger.error("Erro ao listar tipos de campo: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar tipos de campo",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/forms/name/:name - Busca formulário por nome
  get "/name/:name" do
    form_name = conn.path_params["name"]
    Logger.info("Buscando formulário por nome: #{form_name}", module: __MODULE__)
    
    case Forms.get_form_by_name(form_name) do
      {:ok, form} ->
        response = %{
          status: "success",
          data: form
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Formulário não encontrado para nome: #{form_name}"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar formulário por nome #{form_name}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao buscar formulário",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/forms/:id - Obtém um formulário específico
  get "/:id" do
    form_id = conn.path_params["id"]
    Logger.info("Buscando formulário com ID: #{form_id}", module: __MODULE__)
    
    case Forms.get_form(form_id) do
      {:ok, form} ->
        response = %{
          status: "success",
          data: form
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Formulário não encontrado"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar formulário #{form_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao buscar formulário",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/forms - Cria um novo formulário
  post "/" do
    Logger.info("Criando novo formulário", module: __MODULE__)
    
    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        form_params = convert_keys_to_atoms(params)
        
        case Forms.create_form(form_params) do
          {:ok, form} ->
            response = %{
              status: "success",
              message: "Formulário criado com sucesso",
              data: form
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar formulário: #{inspect(reason)}", module: __MODULE__)
            
            error_response = %{
              status: "error",
              message: "Erro ao criar formulário",
              details: inspect(reason)
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados do formulário são obrigatórios"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # PUT /api/cms/forms/:id - Atualiza um formulário existente
  put "/:id" do
    form_id = conn.path_params["id"]
    Logger.info("Atualizando formulário com ID: #{form_id}", module: __MODULE__)
    
    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        form_params = convert_keys_to_atoms(params)
        
        case Forms.update_form(form_id, form_params) do
          {:ok, form} ->
            response = %{
              status: "success",
              message: "Formulário atualizado com sucesso",
              data: form
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, :not_found} ->
            error_response = %{
              status: "error",
              message: "Formulário não encontrado"
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(404, Jason.encode!(error_response))

          {:error, reason} ->
            Logger.error("Erro ao atualizar formulário #{form_id}: #{inspect(reason)}", module: __MODULE__)
            
            error_response = %{
              status: "error",
              message: "Erro ao atualizar formulário",
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

  # DELETE /api/cms/forms/:id - Remove um formulário
  delete "/:id" do
    form_id = conn.path_params["id"]
    Logger.info("Removendo formulário com ID: #{form_id}", module: __MODULE__)
    
    case Forms.delete_form(form_id) do
      :ok ->
        response = %{
          status: "success",
          message: "Formulário removido com sucesso"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found_or_system} ->
        error_response = %{
          status: "error",
          message: "Formulário não encontrado ou é um formulário do sistema"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao remover formulário #{form_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao remover formulário",
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
    |> send_resp(404, Jason.encode!(%{erro: "Rota de formulários não encontrada"}))
  end

  # Funções auxiliares privadas
  defp convert_keys_to_atoms(map) when is_map(map) do
    Enum.into(map, %{}, fn {k, v} ->
      key = if is_binary(k), do: String.to_atom(k), else: k
      {key, v}
    end)
  end
end
