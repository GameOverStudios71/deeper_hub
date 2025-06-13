defmodule DeeperHubWeb.Resources.CMS.RelationshipResource do
  @moduledoc """
  Recurso REST para relacionamentos do CMS.
  Fornece endpoints para gerenciar relacionamentos entre entidades.
  
  Endpoints disponíveis:
  - GET /api/cms/relationships - Lista todos os relacionamentos
  - GET /api/cms/relationships/active - Lista relacionamentos ativos
  - GET /api/cms/relationships/type/:type - Lista relacionamentos por tipo
  - GET /api/cms/relationships/from/:entity_id - Lista relacionamentos de uma entidade
  - GET /api/cms/relationships/to/:entity_id - Lista relacionamentos para uma entidade
  - GET /api/cms/relationships/:id - Obtém relacionamento específico
  - POST /api/cms/relationships - Cria novo relacionamento
  - GET /api/cms/relationships/:id/entities - Lista relacionamentos de entidade
  - GET /api/cms/relationships/record/:record_id - Lista relacionamentos de um registro
  - POST /api/cms/relationships/:id/entities - Cria relacionamento entre registros
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.CMS.Relationships
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
  # RELATIONSHIPS
  # ============================================================================

  # GET /api/cms/relationships - Lista todos os relacionamentos
  get "/" do
    Logger.info("Listando todos os relacionamentos", module: __MODULE__)
    
    case Relationships.list_relationships() do
      {:ok, relationships} ->
        response = %{
          status: "success",
          data: relationships,
          count: length(relationships)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar relacionamentos: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar relacionamentos",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/relationships/active - Lista relacionamentos ativos
  get "/active" do
    Logger.info("Listando relacionamentos ativos", module: __MODULE__)
    
    case Relationships.list_active_relationships() do
      {:ok, relationships} ->
        response = %{
          status: "success",
          data: relationships,
          count: length(relationships)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar relacionamentos ativos: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar relacionamentos ativos",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/relationships/type/:type - Lista por tipo
  get "/type/:type" do
    relationship_type = conn.path_params["type"]
    Logger.info("Listando relacionamentos do tipo: #{relationship_type}", module: __MODULE__)
    
    case Relationships.list_relationships_by_type(relationship_type) do
      {:ok, relationships} ->
        response = %{
          status: "success",
          data: relationships,
          count: length(relationships),
          relationship_type: relationship_type
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar relacionamentos do tipo #{relationship_type}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar relacionamentos do tipo",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/relationships/from/:entity_id - Lista relacionamentos de uma entidade
  get "/from/:entity_id" do
    entity_id = conn.path_params["entity_id"]
    Logger.info("Listando relacionamentos da entidade: #{entity_id}", module: __MODULE__)
    
    case Relationships.list_relationships_from_entity(entity_id) do
      {:ok, relationships} ->
        response = %{
          status: "success",
          data: relationships,
          count: length(relationships),
          from_entity_id: entity_id
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar relacionamentos da entidade #{entity_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar relacionamentos da entidade",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/relationships/to/:entity_id - Lista relacionamentos para uma entidade
  get "/to/:entity_id" do
    entity_id = conn.path_params["entity_id"]
    Logger.info("Listando relacionamentos para a entidade: #{entity_id}", module: __MODULE__)
    
    case Relationships.list_relationships_to_entity(entity_id) do
      {:ok, relationships} ->
        response = %{
          status: "success",
          data: relationships,
          count: length(relationships),
          to_entity_id: entity_id
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar relacionamentos para a entidade #{entity_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar relacionamentos para a entidade",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/relationships/record/:record_id - Lista relacionamentos de um registro
  get "/record/:record_id" do
    record_id = conn.path_params["record_id"]
    Logger.info("Listando relacionamentos do registro: #{record_id}", module: __MODULE__)
    
    case Relationships.list_record_relationships(record_id) do
      {:ok, entity_relationships} ->
        response = %{
          status: "success",
          data: entity_relationships,
          count: length(entity_relationships),
          record_id: record_id
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar relacionamentos do registro #{record_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar relacionamentos do registro",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/relationships/:id/entities - Lista relacionamentos de entidade
  get "/:id/entities" do
    relationship_id = conn.path_params["id"]
    Logger.info("Listando relacionamentos de entidade para: #{relationship_id}", module: __MODULE__)
    
    case Relationships.list_entity_relationships(relationship_id) do
      {:ok, entity_relationships} ->
        response = %{
          status: "success",
          data: entity_relationships,
          count: length(entity_relationships),
          relationship_id: relationship_id
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar relacionamentos de entidade #{relationship_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao listar relacionamentos de entidade",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/relationships/:id - Obtém relacionamento específico
  get "/:id" do
    relationship_id = conn.path_params["id"]
    Logger.info("Buscando relacionamento com ID: #{relationship_id}", module: __MODULE__)
    
    case Relationships.get_relationship(relationship_id) do
      {:ok, relationship} ->
        response = %{
          status: "success",
          data: relationship
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Relacionamento não encontrado"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar relacionamento #{relationship_id}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao buscar relacionamento",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/relationships - Cria novo relacionamento
  post "/" do
    Logger.info("Criando novo relacionamento", module: __MODULE__)
    
    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        relationship_params = convert_keys_to_atoms(params)
        
        case Relationships.create_relationship(relationship_params) do
          {:ok, relationship} ->
            response = %{
              status: "success",
              message: "Relacionamento criado com sucesso",
              data: relationship
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar relacionamento: #{inspect(reason)}", module: __MODULE__)
            
            error_response = %{
              status: "error",
              message: "Erro ao criar relacionamento",
              details: inspect(reason)
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados do relacionamento são obrigatórios"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/relationships/:id/entities - Cria relacionamento entre registros
  post "/:id/entities" do
    relationship_id = conn.path_params["id"]
    Logger.info("Criando relacionamento entre registros para: #{relationship_id}", module: __MODULE__)
    
    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom e adicionar relationship_id
        entity_params = convert_keys_to_atoms(params)
        entity_params = Map.put(entity_params, :relationship_id, String.to_integer(relationship_id))
        
        case Relationships.create_entity_relationship(entity_params) do
          {:ok, entity_relationship} ->
            response = %{
              status: "success",
              message: "Relacionamento entre registros criado com sucesso",
              data: entity_relationship
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar relacionamento entre registros: #{inspect(reason)}", module: __MODULE__)
            
            error_response = %{
              status: "error",
              message: "Erro ao criar relacionamento entre registros",
              details: inspect(reason)
            }
            
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados do relacionamento entre registros são obrigatórios"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end  # Handle CORS preflight requests
  options _ do
    conn
    |> put_resp_header("access-control-allow-origin", "*")
    |> put_resp_header("access-control-allow-methods", "GET, POST, PUT, DELETE, OPTIONS")
    |> put_resp_header("access-control-allow-headers", "content-type, authorization, x-requested-with")
    |> put_resp_header("access-control-max-age", "86400")
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{status: "ok"}))
  end



  # Fallback para rotas não encontradas
  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{erro: "Rota de relacionamentos não encontrada"}))
  end

  # Funções auxiliares privadas
  defp convert_keys_to_atoms(map) when is_map(map) do
    Enum.into(map, %{}, fn {k, v} ->
      key = if is_binary(k), do: String.to_atom(k), else: k
      {key, v}
    end)
  end
end
