defmodule DeeperHub.Core.Data.Schemas.Fields do
  @moduledoc """
  Schema para a tabela fields do CMS dinâmico.
  Gerencia os campos (estrutura) de cada entidade.
  """

  use DeeperHub.Core.Data.SchemaBase,
    table_name: "fields",
    primary_key: :id

  alias DeeperHub.Core.Data.Crud
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  # Tipos de campo suportados
  @valid_field_types [
    "text", "textarea", "number", "integer", "decimal", "boolean", 
    "date", "datetime", "timestamp", "email", "url", "file", 
    "image", "json", "relation", "select", "radio", "checkbox"
  ]

  @doc """
  Lista campos de uma entidade específica.
  """
  def list_by_entity(entity_id, opts \\ []) do
    search(%{entity_id: entity_id, is_active: 1}, opts)
  end

  @doc """
  Busca um campo pelo nome dentro de uma entidade.
  """
  def find_by_entity_and_name(entity_id, field_name, opts \\ []) do
    search(%{entity_id: entity_id, name: field_name, is_active: 1}, opts)
  end

  @doc """
  Lista apenas campos pesquisáveis de uma entidade.
  """
  def list_searchable_by_entity(entity_id, opts \\ []) do
    search(%{entity_id: entity_id, is_searchable: 1, is_active: 1}, opts)
  end

  @doc """
  Cria um novo campo com validação.
  """
  def create_field(attrs) do
    with :ok <- validate_required_fields(attrs),
         :ok <- validate_field_type(attrs[:field_type]),
         :ok <- validate_unique_name_in_entity(attrs[:entity_id], attrs[:name]),
         :ok <- validate_json_fields(attrs) do
      
      # Adicionar valores padrão
      attrs_with_defaults = Map.merge(attrs, %{
        is_required: Map.get(attrs, :is_required, 0),
        is_unique: Map.get(attrs, :is_unique, 0),
        is_searchable: Map.get(attrs, :is_searchable, 1),
        is_active: Map.get(attrs, :is_active, 1),
        order_index: Map.get(attrs, :order_index, 0),
        created_at: DateTime.utc_now() |> DateTime.to_iso8601(),
        updated_at: DateTime.utc_now() |> DateTime.to_iso8601()
      })

      create(attrs_with_defaults)
    else
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Atualiza um campo existente.
  """
  def update_field(id, attrs) do
    with :ok <- validate_field_type_if_present(attrs[:field_type]),
         :ok <- validate_json_fields(attrs) do
      
      # Adicionar timestamp de atualização
      attrs_with_timestamp = Map.put(attrs, :updated_at, DateTime.utc_now() |> DateTime.to_iso8601())
      
      update(id, attrs_with_timestamp)
    else
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Desativa um campo (soft delete).
  """
  def deactivate(id) do
    update_field(id, %{is_active: 0})
  end

  @doc """
  Reativa um campo.
  """
  def activate(id) do
    update_field(id, %{is_active: 1})
  end

  @doc """
  Reordena campos de uma entidade.
  """
  def reorder_fields(entity_id, field_orders) when is_list(field_orders) do
    Logger.info("Reordenando campos da entidade #{entity_id}", module: __MODULE__)
    
    results = Enum.map(field_orders, fn %{field_id: field_id, order_index: order_index} ->
      update_field(field_id, %{order_index: order_index})
    end)
    
    # Verificar se todas as atualizações foram bem-sucedidas
    errors = Enum.filter(results, fn
      {:error, _} -> true
      _ -> false
    end)
    
    if Enum.empty?(errors) do
      {:ok, "Campos reordenados com sucesso"}
    else
      {:error, "Falha ao reordenar alguns campos: #{inspect(errors)}"}
    end
  end

  @doc """
  Busca campos com estatísticas de uso.
  """
  def get_with_usage_stats(field_id) do
    case get(field_id) do
      {:ok, field} ->
        stats = get_field_usage_stats(field_id)
        field_with_stats = Map.put(field, "usage_stats", stats)
        {:ok, field_with_stats}
      
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Retorna os tipos de campo válidos.
  """
  def valid_field_types, do: @valid_field_types

  # Funções privadas de validação
  defp validate_required_fields(attrs) do
    required_fields = [:entity_id, :name, :display_name, :field_type]
    
    missing_fields = Enum.filter(required_fields, fn field ->
      is_nil(attrs[field]) or attrs[field] == ""
    end)
    
    if Enum.empty?(missing_fields) do
      :ok
    else
      {:error, "Campos obrigatórios ausentes: #{Enum.join(missing_fields, ", ")}"}
    end
  end

  defp validate_field_type(field_type) when field_type in @valid_field_types, do: :ok
  defp validate_field_type(field_type) do
    {:error, "Tipo de campo inválido: #{field_type}. Tipos válidos: #{Enum.join(@valid_field_types, ", ")}"}
  end

  defp validate_field_type_if_present(nil), do: :ok
  defp validate_field_type_if_present(field_type), do: validate_field_type(field_type)

  defp validate_unique_name_in_entity(entity_id, field_name) when is_nil(entity_id) or is_nil(field_name) do
    {:error, "entity_id e name são obrigatórios"}
  end
  defp validate_unique_name_in_entity(entity_id, field_name) do
    case find_by_entity_and_name(entity_id, field_name) do
      {:ok, %{data: []}} -> :ok
      {:ok, %{data: [_field | _]}} -> {:error, "Nome do campo já existe nesta entidade"}
      {:error, _} -> :ok # Se houve erro na busca, assumimos que não existe
    end
  end

  defp validate_json_fields(attrs) do
    json_fields = [:validation_rules, :field_options]
    
    Enum.reduce_while(json_fields, :ok, fn field, _acc ->
      case attrs[field] do
        nil -> {:cont, :ok}
        value when is_binary(value) ->
          case Jason.decode(value) do
            {:ok, _} -> {:cont, :ok}
            {:error, _} -> {:halt, {:error, "Campo #{field} deve conter JSON válido"}}
          end
        _ -> {:cont, :ok} # Se não é string, assumimos que está ok
      end
    end)
  end

  defp get_field_usage_stats(field_id) do
    # Contar quantos registros usam este campo
    case Crud.list("entity_data", %{field_id: field_id, is_active: 1}) do
      {:ok, data} ->
        total_usage = length(data)
        filled_usage = Enum.count(data, fn record -> 
          value = record["value"]
          not is_nil(value) and value != ""
        end)
        
        fill_percentage = if total_usage > 0 do
          Float.round(filled_usage / total_usage * 100, 2)
        else
          0.0
        end

        %{
          total_usage: total_usage,
          filled_usage: filled_usage,
          fill_percentage: fill_percentage,
          last_updated: DateTime.utc_now() |> DateTime.to_iso8601()
        }
      
      {:error, _} ->
        %{
          total_usage: 0,
          filled_usage: 0,
          fill_percentage: 0.0,
          last_updated: DateTime.utc_now() |> DateTime.to_iso8601()
        }
    end
  end
end
