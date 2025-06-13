defmodule DeeperHub.WebInterface.Resources.FieldsResource do
  @moduledoc """
  Recurso REST para campos do CMS dinâmico.
  Fornece endpoints para gerenciar campos (estrutura) das entidades.
  
  Endpoints disponíveis:
  - GET /api/fields - Lista todos os campos com suporte a paginação e ordenação
  - GET /api/fields/:id - Obtém um campo específico pelo ID
  - POST /api/fields - Cria um novo campo
  - PUT /api/fields/:id - Atualiza um campo existente
  - DELETE /api/fields/:id - Remove um campo existente
  - POST /api/fields/search - Busca avançada com filtros
  - POST /api/fields/reorder - Reordena campos de uma entidade
  - GET /api/fields/types - Lista tipos de campo disponíveis
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.Core.Data.Schemas.Fields
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

  # GET /api/fields - Lista todos os campos
  get "/" do
    Logger.info("Listando todos os campos", module: __MODULE__)
    
    # Extrair parâmetros de query
    params = conn.query_params
    opts = build_query_opts(params)
    
    case Fields.all(opts) do
      {:ok, %{data: fields, metadata: metadata}} ->
        response = %{
          status: "success",
          data: fields,
          metadata: metadata
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar campos: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar campos",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/fields/:id - Obtém um campo específico
  get "/:id" do
    field_id = conn.path_params["id"]
    Logger.info("Buscando campo com ID: #{field_id}", module: __MODULE__)
    
    case Fields.get_with_usage_stats(field_id) do
      {:ok, field} ->
        response = %{
          status: "success",
          data: field
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Campo não encontrado"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar campo #{field_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao buscar campo",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/fields - Cria um novo campo
  post "/" do
    Logger.info("Criando novo campo", module: __MODULE__)
    
    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        field_params = convert_keys_to_atoms(params)
        
        case Fields.create_field(field_params) do
          {:ok, field} ->
            response = %{
              status: "success",
              message: "Campo criado com sucesso",
              data: field
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar campo: #{inspect(reason)}", module: __MODULE__)
            
            error_response = %{
              status: "error",
              message: "Erro ao criar campo",
              details: inspect(reason)
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados do campo são obrigatórios"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # PUT /api/fields/:id - Atualiza um campo existente
  put "/:id" do
    field_id = conn.path_params["id"]
    Logger.info("Atualizando campo com ID: #{field_id}", module: __MODULE__)
    
    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        field_params = convert_keys_to_atoms(params)
        
        case Fields.update_field(field_id, field_params) do
          {:ok, field} ->
            response = %{
              status: "success",
              message: "Campo atualizado com sucesso",
              data: field
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, :not_found} ->
            error_response = %{
              status: "error",
              message: "Campo não encontrado"
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(404, Jason.encode!(error_response))

          {:error, reason} ->
            Logger.error("Erro ao atualizar campo #{field_id}: #{inspect(reason)}", module: __MODULE__)
            
            error_response = %{
              status: "error",
              message: "Erro ao atualizar campo",
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

  # DELETE /api/fields/:id - Remove um campo (soft delete)
  delete "/:id" do
    field_id = conn.path_params["id"]
    Logger.info("Removendo campo com ID: #{field_id}", module: __MODULE__)
    
    case Fields.deactivate(field_id) do
      {:ok, field} ->
        response = %{
          status: "success",
          message: "Campo removido com sucesso",
          data: field
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Campo não encontrado"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao remover campo #{field_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao remover campo",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/fields/search - Busca avançada
  post "/search" do
    Logger.info("Realizando busca avançada de campos", module: __MODULE__)
    
    filters = Map.get(conn.body_params, "filters", %{})
    options = Map.get(conn.body_params, "options", %{})
    
    opts = build_query_opts(options)
    
    case Fields.search(filters, opts) do
      {:ok, %{data: fields, metadata: metadata}} ->
        response = %{
          status: "success",
          data: fields,
          metadata: metadata,
          filters: filters
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro na busca avançada de campos: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro na busca avançada",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/fields/reorder - Reordena campos de uma entidade
  post "/reorder" do
    Logger.info("Reordenando campos", module: __MODULE__)
    
    case conn.body_params do
      %{"entity_id" => entity_id, "field_orders" => field_orders} when is_list(field_orders) ->
        # Converter para o formato esperado
        formatted_orders = Enum.map(field_orders, fn order ->
          %{
            field_id: order["field_id"],
            order_index: order["order_index"]
          }
        end)
        
        case Fields.reorder_fields(entity_id, formatted_orders) do
          {:ok, message} ->
            response = %{
              status: "success",
              message: message
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao reordenar campos: #{inspect(reason)}", module: __MODULE__)
            
            error_response = %{
              status: "error",
              message: "Erro ao reordenar campos",
              details: inspect(reason)
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "entity_id e field_orders são obrigatórios"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # GET /api/fields/types - Lista tipos de campo disponíveis
  get "/types" do
    Logger.info("Listando tipos de campo disponíveis", module: __MODULE__)
    
    types = Fields.valid_field_types()
    
    response = %{
      status: "success",
      data: types,
      count: length(types)
    }
    
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(response))
  end

  # Fallback para rotas não encontradas
  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{erro: "Rota de campos não encontrada"}))
  end

  # Funções auxiliares privadas
  defp build_query_opts(params) do
    [
      page: String.to_integer(Map.get(params, "page", "1")),
      page_size: String.to_integer(Map.get(params, "page_size", "20")),
      order_by: String.to_atom(Map.get(params, "order_by", "order_index")),
      order_direction: String.to_atom(Map.get(params, "order_direction", "asc"))
    ]
  end

  defp convert_keys_to_atoms(map) when is_map(map) do
    Enum.into(map, %{}, fn {k, v} ->
      key = if is_binary(k), do: String.to_atom(k), else: k
      {key, v}
    end)
  end
end
