defmodule DeeperHub.WebInterface.Resources.EntitiesResource do
  @moduledoc """
  Recurso REST para entidades do CMS dinâmico.
  Fornece endpoints para gerenciar tipos de conteúdo (entidades).
  
  Endpoints disponíveis:
  - GET /api/entities - Lista todas as entidades com suporte a paginação e ordenação
  - GET /api/entities/:id - Obtém uma entidade específica pelo ID
  - POST /api/entities - Cria uma nova entidade
  - PUT /api/entities/:id - Atualiza uma entidade existente
  - DELETE /api/entities/:id - Remove uma entidade existente
  - POST /api/entities/search - Busca avançada com filtros
  - GET /api/entities/:id/fields - Lista campos de uma entidade
  - GET /api/entities/:id/stats - Obtém estatísticas de uma entidade
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.Core.Data.Schemas.{Entities, Fields}
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

  # GET /api/entities - Lista todas as entidades
  get "/" do
    Logger.info("Listando todas as entidades", module: __MODULE__)
    
    # Extrair parâmetros de query
    params = conn.query_params
    opts = build_query_opts(params)
    
    case Entities.list_with_stats(opts) do
      {:ok, %{data: entities, metadata: metadata}} ->
        response = %{
          status: "success",
          data: entities,
          metadata: metadata
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar entidades: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar entidades",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/entities/:id - Obtém uma entidade específica
  get "/:id" do
    entity_id = conn.path_params["id"]
    Logger.info("Buscando entidade com ID: #{entity_id}", module: __MODULE__)
    
    case Entities.get_with_fields(entity_id) do
      {:ok, entity} ->
        response = %{
          status: "success",
          data: entity
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Entidade não encontrada"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar entidade #{entity_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao buscar entidade",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/entities - Cria uma nova entidade
  post "/" do
    Logger.info("Criando nova entidade", module: __MODULE__)
    
    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        entity_params = convert_keys_to_atoms(params)
        
        case Entities.create_entity(entity_params) do
          {:ok, entity} ->
            response = %{
              status: "success",
              message: "Entidade criada com sucesso",
              data: entity
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar entidade: #{inspect(reason)}", module: __MODULE__)
            
            error_response = %{
              status: "error",
              message: "Erro ao criar entidade",
              details: inspect(reason)
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados da entidade são obrigatórios"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # PUT /api/entities/:id - Atualiza uma entidade existente
  put "/:id" do
    entity_id = conn.path_params["id"]
    Logger.info("Atualizando entidade com ID: #{entity_id}", module: __MODULE__)
    
    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        entity_params = convert_keys_to_atoms(params)
        
        case Entities.update_entity(entity_id, entity_params) do
          {:ok, entity} ->
            response = %{
              status: "success",
              message: "Entidade atualizada com sucesso",
              data: entity
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, :not_found} ->
            error_response = %{
              status: "error",
              message: "Entidade não encontrada"
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(404, Jason.encode!(error_response))

          {:error, reason} ->
            Logger.error("Erro ao atualizar entidade #{entity_id}: #{inspect(reason)}", module: __MODULE__)
            
            error_response = %{
              status: "error",
              message: "Erro ao atualizar entidade",
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

  # DELETE /api/entities/:id - Remove uma entidade (soft delete)
  delete "/:id" do
    entity_id = conn.path_params["id"]
    Logger.info("Removendo entidade com ID: #{entity_id}", module: __MODULE__)
    
    case Entities.deactivate(entity_id) do
      {:ok, entity} ->
        response = %{
          status: "success",
          message: "Entidade removida com sucesso",
          data: entity
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Entidade não encontrada"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao remover entidade #{entity_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao remover entidade",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/entities/search - Busca avançada
  post "/search" do
    Logger.info("Realizando busca avançada de entidades", module: __MODULE__)
    
    filters = Map.get(conn.body_params, "filters", %{})
    options = Map.get(conn.body_params, "options", %{})
    
    opts = build_query_opts(options)
    
    case Entities.search(filters, opts) do
      {:ok, %{data: entities, metadata: metadata}} ->
        response = %{
          status: "success",
          data: entities,
          metadata: metadata,
          filters: filters
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro na busca avançada de entidades: #{inspect(reason)}", module: __MODULE__)
        
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

  # GET /api/entities/:id/fields - Lista campos de uma entidade
  get "/:id/fields" do
    entity_id = conn.path_params["id"]
    Logger.info("Listando campos da entidade #{entity_id}", module: __MODULE__)
    
    params = conn.query_params
    opts = build_query_opts(params)
    
    case Fields.list_by_entity(entity_id, opts) do
      {:ok, %{data: fields, metadata: metadata}} ->
        response = %{
          status: "success",
          data: fields,
          metadata: metadata,
          entity_id: entity_id
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar campos da entidade #{entity_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar campos da entidade",
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
    |> send_resp(404, Jason.encode!(%{erro: "Rota de entidades não encontrada"}))
  end

  # Funções auxiliares privadas
  defp build_query_opts(params) do
    [
      page: String.to_integer(Map.get(params, "page", "1")),
      page_size: String.to_integer(Map.get(params, "page_size", "20")),
      order_by: String.to_atom(Map.get(params, "order_by", "id")),
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
