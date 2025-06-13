defmodule DeeperHub.WebInterface.Resources.RecordsResource do
  @moduledoc """
  Recurso REST para registros do CMS dinâmico.
  Fornece endpoints para gerenciar dados (registros) das entidades.
  
  Endpoints disponíveis:
  - GET /api/records/:entity_name - Lista registros de uma entidade
  - GET /api/records/:entity_name/:record_id - Obtém um registro específico
  - POST /api/records/:entity_name - Cria um novo registro
  - PUT /api/records/:entity_name/:record_id - Atualiza um registro existente
  - DELETE /api/records/:entity_name/:record_id - Remove um registro
  - POST /api/records/:entity_name/search - Busca avançada em registros
  - POST /api/records/:entity_name/batch - Operações em lote
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.Core.Data.Schemas.{Entities, EntityData}
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

  # GET /api/records/:entity_name - Lista registros de uma entidade
  get "/:entity_name" do
    entity_name = conn.path_params["entity_name"]
    Logger.info("Listando registros da entidade: #{entity_name}", module: __MODULE__)
    
    with {:ok, entity} <- get_entity_by_name(entity_name) do
      # Extrair parâmetros de query
      params = conn.query_params
      opts = build_query_opts(params)
      
      case EntityData.list_records_by_entity(entity["id"], opts) do
        {:ok, %{data: records, metadata: metadata}} ->
          response = %{
            status: "success",
            data: records,
            metadata: metadata,
            entity: %{
              id: entity["id"],
              name: entity["name"],
              display_name: entity["display_name"]
            }
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(200, Jason.encode!(response))

        {:error, reason} ->
          Logger.error("Erro ao listar registros da entidade #{entity_name}: #{inspect(reason)}", module: __MODULE__)
          
          error_response = %{
            status: "error",
            message: "Erro ao listar registros",
            details: inspect(reason)
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(500, Jason.encode!(error_response))
      end
    else
      {:error, :entity_not_found} ->
        error_response = %{
          status: "error",
          message: "Entidade '#{entity_name}' não encontrada"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar entidade #{entity_name}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao processar solicitação",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/records/:entity_name/:record_id - Obtém um registro específico
  get "/:entity_name/:record_id" do
    entity_name = conn.path_params["entity_name"]
    record_id = conn.path_params["record_id"]
    Logger.info("Buscando registro #{record_id} da entidade #{entity_name}", module: __MODULE__)
    
    with {:ok, entity} <- get_entity_by_name(entity_name) do
      case EntityData.get_record(record_id) do
        {:ok, record} ->
          response = %{
            status: "success",
            data: record,
            entity: %{
              id: entity["id"],
              name: entity["name"],
              display_name: entity["display_name"]
            }
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(200, Jason.encode!(response))

        {:error, :not_found} ->
          error_response = %{
            status: "error",
            message: "Registro não encontrado"
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(404, Jason.encode!(error_response))

        {:error, reason} ->
          Logger.error("Erro ao buscar registro #{record_id}: #{inspect(reason)}", module: __MODULE__)
          
          error_response = %{
            status: "error",
            message: "Erro ao buscar registro",
            details: inspect(reason)
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(500, Jason.encode!(error_response))
      end
    else
      {:error, :entity_not_found} ->
        error_response = %{
          status: "error",
          message: "Entidade '#{entity_name}' não encontrada"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar entidade #{entity_name}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao processar solicitação",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/records/:entity_name - Cria um novo registro
  post "/:entity_name" do
    entity_name = conn.path_params["entity_name"]
    Logger.info("Criando novo registro para entidade: #{entity_name}", module: __MODULE__)
    
    with {:ok, entity} <- get_entity_by_name(entity_name) do
      case conn.body_params do
        %{} = record_data when map_size(record_data) > 0 ->
          # Extrair user_id se fornecido
          user_id = Map.get(record_data, "user_id")
          
          # Remover metadados dos dados do registro
          clean_record_data = Map.drop(record_data, ["user_id"])
          
          case EntityData.create_record(entity["id"], clean_record_data, user_id) do
            {:ok, result} ->
              response = %{
                status: "success",
                message: "Registro criado com sucesso",
                data: result,
                entity: %{
                  id: entity["id"],
                  name: entity["name"],
                  display_name: entity["display_name"]
                }
              }
              
              conn
              |> put_resp_content_type("application/json")
              |> send_resp(201, Jason.encode!(response))

            {:error, reason} ->
              Logger.error("Erro ao criar registro para #{entity_name}: #{inspect(reason)}", module: __MODULE__)
              
              error_response = %{
                status: "error",
                message: "Erro ao criar registro",
                details: inspect(reason)
              }
              
              conn
              |> put_resp_content_type("application/json")
              |> send_resp(400, Jason.encode!(error_response))
          end

        _ ->
          error_response = %{
            status: "error",
            message: "Dados do registro são obrigatórios"
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(400, Jason.encode!(error_response))
      end
    else
      {:error, :entity_not_found} ->
        error_response = %{
          status: "error",
          message: "Entidade '#{entity_name}' não encontrada"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar entidade #{entity_name}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao processar solicitação",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # PUT /api/records/:entity_name/:record_id - Atualiza um registro existente
  put "/:entity_name/:record_id" do
    entity_name = conn.path_params["entity_name"]
    record_id = conn.path_params["record_id"]
    Logger.info("Atualizando registro #{record_id} da entidade #{entity_name}", module: __MODULE__)
    
    with {:ok, entity} <- get_entity_by_name(entity_name) do
      case conn.body_params do
        %{} = record_data when map_size(record_data) > 0 ->
          # Extrair user_id se fornecido
          user_id = Map.get(record_data, "user_id")
          
          # Remover metadados dos dados do registro
          clean_record_data = Map.drop(record_data, ["user_id"])
          
          case EntityData.update_record(record_id, clean_record_data, user_id) do
            {:ok, result} ->
              response = %{
                status: "success",
                message: "Registro atualizado com sucesso",
                data: result,
                entity: %{
                  id: entity["id"],
                  name: entity["name"],
                  display_name: entity["display_name"]
                }
              }
              
              conn
              |> put_resp_content_type("application/json")
              |> send_resp(200, Jason.encode!(response))

            {:error, :not_found} ->
              error_response = %{
                status: "error",
                message: "Registro não encontrado"
              }
              
              conn
              |> put_resp_content_type("application/json")
              |> send_resp(404, Jason.encode!(error_response))

            {:error, reason} ->
              Logger.error("Erro ao atualizar registro #{record_id}: #{inspect(reason)}", module: __MODULE__)
              
              error_response = %{
                status: "error",
                message: "Erro ao atualizar registro",
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
    else
      {:error, :entity_not_found} ->
        error_response = %{
          status: "error",
          message: "Entidade '#{entity_name}' não encontrada"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar entidade #{entity_name}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao processar solicitação",
          details: inspect(reason)
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # DELETE /api/records/:entity_name/:record_id - Remove um registro
  delete "/:entity_name/:record_id" do
    entity_name = conn.path_params["entity_name"]
    record_id = conn.path_params["record_id"]
    Logger.info("Removendo registro #{record_id} da entidade #{entity_name}", module: __MODULE__)
    
    with {:ok, entity} <- get_entity_by_name(entity_name) do
      case EntityData.delete_record(record_id) do
        {:ok, result} ->
          response = %{
            status: "success",
            message: "Registro removido com sucesso",
            data: result,
            entity: %{
              id: entity["id"],
              name: entity["name"],
              display_name: entity["display_name"]
            }
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(200, Jason.encode!(response))

        {:error, :not_found} ->
          error_response = %{
            status: "error",
            message: "Registro não encontrado"
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(404, Jason.encode!(error_response))

        {:error, reason} ->
          Logger.error("Erro ao remover registro #{record_id}: #{inspect(reason)}", module: __MODULE__)
          
          error_response = %{
            status: "error",
            message: "Erro ao remover registro",
            details: inspect(reason)
          }
          
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(500, Jason.encode!(error_response))
      end
    else
      {:error, :entity_not_found} ->
        error_response = %{
          status: "error",
          message: "Entidade '#{entity_name}' não encontrada"
        }
        
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar entidade #{entity_name}: #{inspect(reason)}", module: __MODULE__)
        
        error_response = %{
          status: "error",
          message: "Erro ao processar solicitação",
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
    |> send_resp(404, Jason.encode!(%{erro: "Rota de registros não encontrada"}))
  end

  # Funções auxiliares privadas
  defp get_entity_by_name(entity_name) do
    case Entities.find_by_name(entity_name) do
      {:ok, %{data: [entity | _]}} -> {:ok, entity}
      {:ok, %{data: []}} -> {:error, :entity_not_found}
      {:error, reason} -> {:error, reason}
    end
  end

  defp build_query_opts(params) do
    [
      page: String.to_integer(Map.get(params, "page", "1")),
      page_size: String.to_integer(Map.get(params, "page_size", "20")),
      order_by: String.to_atom(Map.get(params, "order_by", "created_at")),
      order_direction: String.to_atom(Map.get(params, "order_direction", "desc"))
    ]
  end
end
