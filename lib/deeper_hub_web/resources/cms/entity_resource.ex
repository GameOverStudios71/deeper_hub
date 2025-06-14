defmodule DeeperHubWeb.Resources.CMS.EntityResource do
  @moduledoc """
  Recurso REST para o sistema dinâmico de entidades do CMS.
  Fornece endpoints para gerenciar entidades, campos, dados e relacionamentos.
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.Core.Data.Schemas.{Entities, Fields, EntityData}
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

  # ===== ENTITIES ROUTES =====

  # GET /api/cms/entities - Lista todas as entidades
  get "/" do
    Logger.info("Listando todas as entidades", module: __MODULE__)

    case Entities.list_with_stats() do
      {:ok, %{data: entities, metadata: metadata}} ->
        response = %{
          status: "success",
          data: entities,
          count: length(entities),
          pagination: metadata
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

  # POST /api/cms/entities - Cria uma nova entidade
  post "/" do
    Logger.info("Criando nova entidade", module: __MODULE__)

    entity_data = convert_keys_to_atoms(conn.body_params)

    case Entities.create_entity(entity_data) do
      {:ok, entity} ->
        response = %{
          status: "success",
          data: entity,
          message: "Entidade criada com sucesso"
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
  end

  # ===== FIELDS ROUTES =====

  # GET /api/cms/entities/fields - Lista todos os campos
  get "/fields" do
    Logger.info("Listando todos os campos", module: __MODULE__)

    case Fields.all() do
      {:ok, %{data: fields, metadata: metadata}} ->
        # Adicionar nome da entidade para cada campo
        fields_with_entity = Enum.map(fields, fn field ->
          case Entities.get(field["entity_id"]) do
            {:ok, entity} ->
              Map.put(field, "entity_name", entity["name"])
            {:error, _} ->
              Map.put(field, "entity_name", "Unknown")
          end
        end)

        response = %{
          status: "success",
          data: fields_with_entity,
          count: length(fields_with_entity),
          pagination: metadata
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

  # POST /api/cms/entities/fields - Cria um novo campo
  post "/fields" do
    Logger.info("Criando novo campo", module: __MODULE__)

    field_data = convert_keys_to_atoms(conn.body_params)

    case Fields.create_field(field_data) do
      {:ok, field} ->
        response = %{
          status: "success",
          data: field,
          message: "Campo criado com sucesso"
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
  end

  # ===== ENTITY DATA ROUTES =====

  # GET /api/cms/entities/data - Lista todos os dados de entidade
  get "/data" do
    Logger.info("Listando todos os dados de entidade", module: __MODULE__)

    case EntityData.all() do
      {:ok, %{data: entity_data, metadata: metadata}} ->
        # Adicionar nomes de entidade e campo para cada registro
        data_with_names = Enum.map(entity_data, fn data ->
          entity_name = case Entities.get(data["entity_id"]) do
            {:ok, entity} -> entity["name"]
            {:error, _} -> "Unknown"
          end

          field_name = case Fields.get(data["field_id"]) do
            {:ok, field} -> field["name"]
            {:error, _} -> "Unknown"
          end

          data
          |> Map.put("entity_name", entity_name)
          |> Map.put("field_name", field_name)
        end)

        response = %{
          status: "success",
          data: data_with_names,
          count: length(data_with_names),
          pagination: metadata
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar dados de entidade: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar dados de entidade",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/entities/data - Cria um novo dado de entidade
  post "/data" do
    Logger.info("Criando novo dado de entidade", module: __MODULE__)

    data_params = convert_keys_to_atoms(conn.body_params)

    case EntityData.create(data_params) do
      {:ok, entity_data} ->
        response = %{
          status: "success",
          data: entity_data,
          message: "Dado de entidade criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar dado de entidade: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar dado de entidade",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ===== RELATIONSHIPS ROUTES =====

  # GET /api/cms/entities/relationships - Lista definições de relacionamento
  get "/relationships" do
    Logger.info("Listando definições de relacionamento", module: __MODULE__)

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

  # POST /api/cms/entities/relationships - Cria uma nova definição de relacionamento
  post "/relationships" do
    Logger.info("Criando nova definição de relacionamento", module: __MODULE__)

    relationship_data = convert_keys_to_atoms(conn.body_params)

    case Relationships.create_relationship(relationship_data) do
      {:ok, relationship} ->
        response = %{
          status: "success",
          data: relationship,
          message: "Relacionamento criado com sucesso"
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
  end

  # ===== ENTITY RELATIONSHIPS ROUTES =====

  # GET /api/cms/entities/entity-relationships - Lista relacionamentos entre entidades
  get "/entity-relationships" do
    Logger.info("Listando relacionamentos entre entidades", module: __MODULE__)

    # Para listar todos os relacionamentos de entidade, vamos usar uma consulta direta
    sql = """
    SELECT er.id, er.relationship_id, er.from_record_id, er.to_record_id,
           er.order_index, er.created_at,
           r.name as relationship_name, r.relationship_type
    FROM entity_relationships er
    LEFT JOIN relationships r ON er.relationship_id = r.id
    ORDER BY er.created_at DESC
    """

    case DeeperHub.Core.Data.Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        entity_relationships = Enum.map(rows, fn [id, relationship_id, from_record_id, to_record_id, order_index, created_at, relationship_name, relationship_type] ->
          %{
            id: id,
            relationship_id: relationship_id,
            from_record_id: from_record_id,
            to_record_id: to_record_id,
            order_index: order_index,
            created_at: created_at,
            relationship_name: relationship_name,
            relationship_type: relationship_type
          }
        end)

        response = %{
          status: "success",
          data: entity_relationships,
          count: length(entity_relationships)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar relacionamentos entre entidades: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar relacionamentos entre entidades",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/entities/entity-relationships - Cria um novo relacionamento entre entidades
  post "/entity-relationships" do
    Logger.info("Criando novo relacionamento entre entidades", module: __MODULE__)

    entity_relationship_data = convert_keys_to_atoms(conn.body_params)

    case Relationships.create_entity_relationship(entity_relationship_data) do
      {:ok, entity_relationship} ->
        response = %{
          status: "success",
          data: entity_relationship,
          message: "Relacionamento entre entidades criado com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao criar relacionamento entre entidades: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao criar relacionamento entre entidades",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # Fallback para rotas não encontradas
  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{erro: "Rota de entidades não encontrada"}))
  end

  # Funções auxiliares privadas
  defp convert_keys_to_atoms(map) when is_map(map) do
    Enum.into(map, %{}, fn {k, v} ->
      key = if is_binary(k), do: String.to_atom(k), else: k
      {key, v}
    end)
  end
end
