defmodule DeeperHub.Core.Data.Schemas.Entities do
  @moduledoc """
  Schema para a tabela entities do CMS dinâmico.
  Gerencia os tipos de conteúdo (entidades) que podem ser criados no sistema.
  """

  use DeeperHub.Core.Data.SchemaBase,
    table_name: "entities",
    primary_key: :id

  alias DeeperHub.Core.Data.Crud
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Busca uma entidade pelo nome.
  """
  def find_by_name(name, opts \\ []) do
    get_by(:name, name, opts)
  end

  @doc """
  Lista apenas entidades ativas.
  """
  def list_active(opts \\ []) do
    search(%{is_active: 1}, opts)
  end

  @doc """
  Cria uma nova entidade com validação.
  """
  def create_entity(attrs) do
    # Validações básicas
    with :ok <- validate_required_fields(attrs),
         :ok <- validate_unique_name(attrs[:name]) do

      # Adicionar timestamps e valores padrão
      attrs_with_defaults = Map.merge(attrs, %{
        is_active: Map.get(attrs, :is_active, 1),
        created_at: DateTime.utc_now() |> DateTime.to_iso8601(),
        updated_at: DateTime.utc_now() |> DateTime.to_iso8601()
      })

      create(attrs_with_defaults)
    else
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Atualiza uma entidade existente.
  """
  def update_entity(id, attrs) do
    # Adicionar timestamp de atualização
    attrs_with_timestamp = Map.put(attrs, :updated_at, DateTime.utc_now() |> DateTime.to_iso8601())

    update(id, attrs_with_timestamp)
  end

  @doc """
  Desativa uma entidade (soft delete).
  """
  def deactivate(id) do
    update_entity(id, %{is_active: 0})
  end

  @doc """
  Reativa uma entidade.
  """
  def activate(id) do
    update_entity(id, %{is_active: 1})
  end

  @doc """
  Busca entidades com seus campos relacionados.
  """
  def get_with_fields(entity_id) do
    case get(entity_id) do
      {:ok, entity} ->
        # Buscar campos relacionados
        case Crud.list("fields", %{entity_id: entity_id}) do
          {:ok, fields} ->
            entity_with_fields = Map.put(entity, "fields", fields)
            {:ok, entity_with_fields}

          {:error, reason} ->
            Logger.warning("Falha ao buscar campos da entidade #{entity_id}: #{inspect(reason)}", module: __MODULE__)
            {:ok, Map.put(entity, "fields", [])}
        end

      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Lista entidades com estatísticas de uso.
  """
  def list_with_stats(opts \\ []) do
    case all(opts) do
      {:ok, %{data: entities, metadata: metadata}} ->
        entities_with_stats = Enum.map(entities, fn entity ->
          stats = get_entity_stats(entity["id"])
          Map.put(entity, "stats", stats)
        end)

        {:ok, %{data: entities_with_stats, metadata: metadata}}

      {:error, reason} -> {:error, reason}
    end
  end

  # Funções privadas de validação
  defp validate_required_fields(attrs) do
    required_fields = [:name, :display_name]

    missing_fields = Enum.filter(required_fields, fn field ->
      is_nil(attrs[field]) or attrs[field] == ""
    end)

    if Enum.empty?(missing_fields) do
      :ok
    else
      {:error, "Campos obrigatórios ausentes: #{Enum.join(missing_fields, ", ")}"}
    end
  end

  defp validate_unique_name(name) when is_nil(name), do: {:error, "Nome é obrigatório"}
  defp validate_unique_name(name) do
    case find_by_name(name) do
      {:ok, %{data: []}} -> :ok
      {:ok, %{data: [_entity | _]}} -> {:error, "Nome já está em uso"}
      {:error, _} -> :ok # Se houve erro na busca, assumimos que não existe
    end
  end

  defp get_entity_stats(entity_id) do
    # Contar registros e campos usando o módulo Crud

    record_count = case Crud.list("entity_data", %{entity_id: entity_id}) do
      {:ok, data} ->
        data
        |> Enum.map(& &1["record_id"])
        |> Enum.uniq()
        |> length()
      {:error, _} -> 0
    end

    field_count = case Crud.list("fields", %{entity_id: entity_id}) do
      {:ok, data} -> length(data)
      {:error, _} -> 0
    end

    %{
      record_count: record_count,
      field_count: field_count,
      last_updated: DateTime.utc_now() |> DateTime.to_iso8601()
    }
  end
end
