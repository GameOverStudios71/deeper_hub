defmodule DeeperHub.Core.Data.Schemas.EntityData do
  @moduledoc """
  Schema para a tabela entity_data do CMS dinâmico.
  Gerencia os dados reais armazenados usando padrão EAV (Entity-Attribute-Value).
  """

  use DeeperHub.Core.Data.SchemaBase,
    table_name: "entity_data",
    primary_key: :id

  alias DeeperHub.Core.Data.Crud
  alias DeeperHub.Core.Data.Schemas.{Entities, Fields}
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria um novo registro completo para uma entidade.
  Recebe um mapa com os dados do registro e cria múltiplas entradas na entity_data.
  """
  def create_record(entity_id, record_data, user_id \\ nil) do
    # Gerar UUID para o record_id
    record_id = UUID.uuid4()

    Logger.info("Criando novo registro para entidade #{entity_id} com record_id #{record_id}", module: __MODULE__)

    with {:ok, _entity} <- Entities.get(entity_id),
         {:ok, %{data: fields}} <- Fields.list_by_entity(entity_id) do

      # Validar dados obrigatórios
      case validate_required_fields(fields, record_data) do
        :ok ->
          # Criar entradas para cada campo
          results = Enum.map(record_data, fn {field_name, value} ->
            case find_field_by_name(fields, field_name) do
              {:ok, field} ->
                create_field_data(entity_id, field["id"], record_id, value, user_id)
              {:error, reason} ->
                Logger.warning("Campo #{field_name} não encontrado na entidade #{entity_id}: #{reason}", module: __MODULE__)
                {:error, "Campo #{field_name} não encontrado"}
            end
          end)

          # Verificar se todas as criações foram bem-sucedidas
          errors = Enum.filter(results, fn
            {:error, _} -> true
            _ -> false
          end)

          if Enum.empty?(errors) do
            {:ok, %{record_id: record_id, entity_id: entity_id, created_fields: length(results)}}
          else
            {:error, "Falha ao criar alguns campos: #{inspect(errors)}"}
          end

        {:error, reason} -> {:error, reason}
      end
    else
      {:error, reason} -> {:error, "Falha ao validar entidade: #{inspect(reason)}"}
    end
  end

  @doc """
  Busca um registro completo pelo record_id.
  Retorna um mapa com todos os campos do registro.
  """
  def get_record(record_id) do
    case search(%{record_id: record_id, is_active: 1}) do
      {:ok, %{data: field_data}} when field_data != [] ->
        # Buscar informações dos campos
        record = build_record_from_field_data(field_data)
        {:ok, record}

      {:ok, %{data: []}} ->
        {:error, :not_found}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Atualiza um registro existente.
  """
  def update_record(record_id, record_data, user_id \\ nil) do
    Logger.info("Atualizando registro #{record_id}", module: __MODULE__)

    # Buscar dados existentes do registro
    case get_record(record_id) do
      {:ok, existing_record} ->
        entity_id = existing_record["entity_id"]

        # Buscar campos da entidade
        case Fields.list_by_entity(entity_id) do
          {:ok, %{data: fields}} ->
            # Atualizar cada campo fornecido
            results = Enum.map(record_data, fn {field_name, value} ->
              case find_field_by_name(fields, field_name) do
                {:ok, field} ->
                  update_field_data(entity_id, field["id"], record_id, value, user_id)
                {:error, reason} ->
                  Logger.warning("Campo #{field_name} não encontrado: #{reason}", module: __MODULE__)
                  {:error, "Campo #{field_name} não encontrado"}
              end
            end)

            # Verificar resultados
            errors = Enum.filter(results, fn
              {:error, _} -> true
              _ -> false
            end)

            if Enum.empty?(errors) do
              {:ok, %{record_id: record_id, updated_fields: length(results)}}
            else
              {:error, "Falha ao atualizar alguns campos: #{inspect(errors)}"}
            end

          {:error, reason} -> {:error, "Falha ao buscar campos: #{inspect(reason)}"}
        end

      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Remove um registro (soft delete).
  """
  def delete_record(record_id) do
    Logger.info("Removendo registro #{record_id}", module: __MODULE__)

    # Buscar todas as entradas do registro
    case search(%{record_id: record_id}) do
      {:ok, %{data: field_data}} ->
        # Desativar todas as entradas
        results = Enum.map(field_data, fn data ->
          update(data["id"], %{is_active: 0, updated_at: DateTime.utc_now() |> DateTime.to_iso8601()})
        end)

        # Verificar resultados
        errors = Enum.filter(results, fn
          {:error, _} -> true
          _ -> false
        end)

        if Enum.empty?(errors) do
          {:ok, %{record_id: record_id, deleted_fields: length(results)}}
        else
          {:error, "Falha ao remover alguns campos: #{inspect(errors)}"}
        end

      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Lista registros de uma entidade com paginação.
  """
  def list_records_by_entity(entity_id, opts \\ []) do
    case search(%{entity_id: entity_id, is_active: 1}, opts) do
      {:ok, %{data: field_data, metadata: metadata}} ->
        # Agrupar por record_id
        records_by_id = Enum.group_by(field_data, & &1["record_id"])

        # Construir registros completos
        records = Enum.map(records_by_id, fn {_record_id, data} ->
          build_record_from_field_data(data)
        end)

        {:ok, %{data: records, metadata: metadata}}

      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Busca registros com filtros avançados.
  """
  def search_records(entity_id, filters, opts \\ []) do
    Logger.info("Buscando registros da entidade #{entity_id} com filtros: #{inspect(filters)}", module: __MODULE__)

    # Implementação básica - pode ser expandida para filtros mais complexos
    base_filters = %{entity_id: entity_id, is_active: 1}
    combined_filters = Map.merge(base_filters, filters)

    list_records_by_entity(entity_id, Keyword.put(opts, :filters, combined_filters))
  end

  # Funções privadas
  defp create_field_data(entity_id, field_id, record_id, value, user_id) do
    attrs = %{
      entity_id: entity_id,
      field_id: field_id,
      record_id: record_id,
      value: to_string(value),
      is_active: 1,
      created_at: DateTime.utc_now() |> DateTime.to_iso8601(),
      updated_at: DateTime.utc_now() |> DateTime.to_iso8601(),
      created_by: user_id
    }

    create(attrs)
  end

  defp update_field_data(entity_id, field_id, record_id, value, user_id) do
    # Buscar entrada existente
    case search(%{entity_id: entity_id, field_id: field_id, record_id: record_id}) do
      {:ok, %{data: [existing | _]}} ->
        # Atualizar entrada existente
        update(existing["id"], %{
          value: to_string(value),
          updated_at: DateTime.utc_now() |> DateTime.to_iso8601(),
          created_by: user_id
        })

      {:ok, %{data: []}} ->
        # Criar nova entrada se não existir
        create_field_data(entity_id, field_id, record_id, value, user_id)

      {:error, reason} -> {:error, reason}
    end
  end

  defp find_field_by_name(fields, field_name) do
    case Enum.find(fields, fn field -> field["name"] == field_name end) do
      nil -> {:error, :not_found}
      field -> {:ok, field}
    end
  end

  defp validate_required_fields(fields, record_data) do
    required_fields = Enum.filter(fields, fn field ->
      field["is_required"] == 1 or field["is_required"] == true
    end)

    missing_fields = Enum.filter(required_fields, fn field ->
      field_name = field["name"]
      value = record_data[field_name] || record_data[String.to_atom(field_name)]
      is_nil(value) or value == ""
    end)

    if Enum.empty?(missing_fields) do
      :ok
    else
      field_names = Enum.map(missing_fields, & &1["display_name"])
      {:error, "Campos obrigatórios ausentes: #{Enum.join(field_names, ", ")}"}
    end
  end

  defp build_record_from_field_data(field_data) when is_list(field_data) and length(field_data) > 0 do
    # Pegar informações básicas do primeiro item
    first_item = List.first(field_data)

    # Construir mapa com os dados do registro
    record_fields = Enum.reduce(field_data, %{}, fn data, acc ->
      # Aqui precisaríamos buscar o nome do campo, mas por simplicidade vamos usar o field_id
      field_key = "field_#{data["field_id"]}"
      Map.put(acc, field_key, data["value"])
    end)

    # Adicionar metadados
    Map.merge(record_fields, %{
      "record_id" => first_item["record_id"],
      "entity_id" => first_item["entity_id"],
      "created_at" => first_item["created_at"],
      "updated_at" => first_item["updated_at"]
    })
  end
  defp build_record_from_field_data([]), do: %{}
end
