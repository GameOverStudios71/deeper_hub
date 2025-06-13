defmodule DeeperHub.CMS.Relationships.EntityRelationship do
  @moduledoc """
  Schema para relacionamentos entre registros específicos de entidades do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "entity_relationships"

  @derive Jason.Encoder
  defstruct [
    :id, :relationship_id, :from_record_id, :to_record_id, :order_index,
    :created_at, :relationship_name, :relationship_type
  ]

  @doc """
  Valida dados do relacionamento de entidade.
  """
  def validate(attrs) do
    errors = []

    # Converte chaves string para atom se necessário
    attrs = case attrs do
      %{} = map when is_map(map) ->
        for {key, value} <- map, into: %{} do
          key_atom = if is_binary(key), do: String.to_atom(key), else: key
          {key_atom, value}
        end
      _ -> attrs
    end

    # Validação do relationship_id
    relationship_id = attrs[:relationship_id] || attrs["relationship_id"]
    errors = if not is_integer(relationship_id) or relationship_id <= 0 do
      ["relationship_id é obrigatório e deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    # Validação do from_record_id
    from_record_id = attrs[:from_record_id] || attrs["from_record_id"]
    errors = if not is_binary(from_record_id) or String.length(from_record_id) < 1 do
      ["from_record_id é obrigatório" | errors]
    else
      errors
    end

    # Validação do to_record_id
    to_record_id = attrs[:to_record_id] || attrs["to_record_id"]
    errors = if not is_binary(to_record_id) or String.length(to_record_id) < 1 do
      ["to_record_id é obrigatório" | errors]
    else
      errors
    end

    # Validação de auto-relacionamento
    errors = if from_record_id == to_record_id do
      ["Auto-relacionamentos de registro não são permitidos" | errors]
    else
      errors
    end

    if length(errors) == 0 do
      {:ok, attrs}
    else
      {:error, errors}
    end
  end

  @doc """
  Cria um novo relacionamento de entidade com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      relationship_id: attrs[:relationship_id],
      from_record_id: attrs[:from_record_id],
      to_record_id: attrs[:to_record_id],
      order_index: attrs[:order_index] || 0,
      created_at: attrs[:created_at],
      relationship_name: attrs[:relationship_name],
      relationship_type: attrs[:relationship_type]
    }
  end

  @doc """
  Verifica se é relacionamento um-para-um.
  """
  def one_to_one?(%__MODULE__{relationship_type: "one_to_one"}), do: true
  def one_to_one?(_), do: false

  @doc """
  Verifica se é relacionamento um-para-muitos.
  """
  def one_to_many?(%__MODULE__{relationship_type: "one_to_many"}), do: true
  def one_to_many?(_), do: false

  @doc """
  Verifica se é relacionamento muitos-para-muitos.
  """
  def many_to_many?(%__MODULE__{relationship_type: "many_to_many"}), do: true
  def many_to_many?(_), do: false

  @doc """
  Verifica se tem ordem específica.
  """
  def has_order?(%__MODULE__{order_index: order}) when is_integer(order) and order > 0, do: true
  def has_order?(_), do: false

  @doc """
  Verifica se é o primeiro na ordem.
  """
  def first_in_order?(%__MODULE__{order_index: 0}), do: true
  def first_in_order?(_), do: false

  @doc """
  Retorna informações de ordenação.
  """
  def order_info(%__MODULE__{order_index: order}) do
    %{
      order_index: order,
      has_order: has_order?(%__MODULE__{order_index: order}),
      is_first: order == 0,
      position: order + 1
    }
  end

  @doc """
  Retorna informações resumidas do relacionamento.
  """
  def summary(%__MODULE__{} = entity_relationship) do
    %{
      id: entity_relationship.id,
      relationship_id: entity_relationship.relationship_id,
      relationship_name: entity_relationship.relationship_name,
      relationship_type: entity_relationship.relationship_type,
      from_record_id: entity_relationship.from_record_id,
      to_record_id: entity_relationship.to_record_id,
      order_index: entity_relationship.order_index,
      has_order: has_order?(entity_relationship),
      is_one_to_one: one_to_one?(entity_relationship),
      is_one_to_many: one_to_many?(entity_relationship),
      is_many_to_many: many_to_many?(entity_relationship),
      created_at: entity_relationship.created_at
    }
  end

  @doc """
  Retorna o relacionamento inverso.
  """
  def inverse(%__MODULE__{} = entity_relationship) do
    %{
      relationship_id: entity_relationship.relationship_id,
      from_record_id: entity_relationship.to_record_id,
      to_record_id: entity_relationship.from_record_id,
      order_index: entity_relationship.order_index
    }
  end

  @doc """
  Verifica se dois relacionamentos são equivalentes.
  """
  def equivalent?(%__MODULE__{} = rel1, %__MODULE__{} = rel2) do
    rel1.relationship_id == rel2.relationship_id and
    ((rel1.from_record_id == rel2.from_record_id and rel1.to_record_id == rel2.to_record_id) or
     (rel1.from_record_id == rel2.to_record_id and rel1.to_record_id == rel2.from_record_id))
  end

  @doc """
  Verifica se é um relacionamento direto (A -> B).
  """
  def direct_relationship?(%__MODULE__{} = entity_relationship, from_id, to_id) do
    entity_relationship.from_record_id == from_id and entity_relationship.to_record_id == to_id
  end

  @doc """
  Verifica se é um relacionamento inverso (B -> A).
  """
  def inverse_relationship?(%__MODULE__{} = entity_relationship, from_id, to_id) do
    entity_relationship.from_record_id == to_id and entity_relationship.to_record_id == from_id
  end

  @doc """
  Verifica se envolve um registro específico.
  """
  def involves_record?(%__MODULE__{} = entity_relationship, record_id) do
    entity_relationship.from_record_id == record_id or entity_relationship.to_record_id == record_id
  end

  @doc """
  Retorna o outro registro no relacionamento.
  """
  def other_record(%__MODULE__{} = entity_relationship, record_id) do
    cond do
      entity_relationship.from_record_id == record_id ->
        entity_relationship.to_record_id
      entity_relationship.to_record_id == record_id ->
        entity_relationship.from_record_id
      true ->
        nil
    end
  end

  @doc """
  Retorna a direção do relacionamento em relação a um registro.
  """
  def direction_from_record(%__MODULE__{} = entity_relationship, record_id) do
    cond do
      entity_relationship.from_record_id == record_id ->
        :outgoing
      entity_relationship.to_record_id == record_id ->
        :incoming
      true ->
        :none
    end
  end

  @doc """
  Agrupa relacionamentos por tipo.
  """
  def group_by_type(entity_relationships) when is_list(entity_relationships) do
    Enum.group_by(entity_relationships, fn rel -> rel.relationship_type end)
  end

  @doc """
  Agrupa relacionamentos por relacionamento.
  """
  def group_by_relationship(entity_relationships) when is_list(entity_relationships) do
    Enum.group_by(entity_relationships, fn rel -> rel.relationship_id end)
  end

  @doc """
  Filtra relacionamentos por tipo.
  """
  def filter_by_type(entity_relationships, type) when is_list(entity_relationships) and is_binary(type) do
    Enum.filter(entity_relationships, fn rel -> rel.relationship_type == type end)
  end

  @doc """
  Filtra relacionamentos que envolvem um registro específico.
  """
  def filter_involving_record(entity_relationships, record_id) when is_list(entity_relationships) and is_binary(record_id) do
    Enum.filter(entity_relationships, fn rel -> involves_record?(rel, record_id) end)
  end

  @doc """
  Filtra relacionamentos de saída de um registro.
  """
  def filter_outgoing(entity_relationships, record_id) when is_list(entity_relationships) and is_binary(record_id) do
    Enum.filter(entity_relationships, fn rel -> rel.from_record_id == record_id end)
  end

  @doc """
  Filtra relacionamentos de entrada para um registro.
  """
  def filter_incoming(entity_relationships, record_id) when is_list(entity_relationships) and is_binary(record_id) do
    Enum.filter(entity_relationships, fn rel -> rel.to_record_id == record_id end)
  end

  @doc """
  Ordena relacionamentos por ordem de índice.
  """
  def sort_by_order(entity_relationships) when is_list(entity_relationships) do
    Enum.sort_by(entity_relationships, fn rel -> rel.order_index end)
  end

  @doc """
  Ordena relacionamentos por data de criação.
  """
  def sort_by_created_at(entity_relationships) when is_list(entity_relationships) do
    Enum.sort_by(entity_relationships, fn rel -> rel.created_at end, :desc)
  end

  @doc """
  Retorna estatísticas de relacionamentos.
  """
  def statistics(entity_relationships) when is_list(entity_relationships) do
    total = length(entity_relationships)
    by_type = group_by_type(entity_relationships)
    
    %{
      total: total,
      by_type: Enum.map(by_type, fn {type, rels} -> {type, length(rels)} end) |> Enum.into(%{}),
      one_to_one_count: length(filter_by_type(entity_relationships, "one_to_one")),
      one_to_many_count: length(filter_by_type(entity_relationships, "one_to_many")),
      many_to_many_count: length(filter_by_type(entity_relationships, "many_to_many")),
      with_order: length(Enum.filter(entity_relationships, &has_order?/1)),
      without_order: length(Enum.filter(entity_relationships, fn rel -> not has_order?(rel) end))
    }
  end

  @doc """
  Verifica se há relacionamentos duplicados.
  """
  def has_duplicates?(entity_relationships) when is_list(entity_relationships) do
    unique_count = entity_relationships
    |> Enum.map(fn rel -> {rel.relationship_id, rel.from_record_id, rel.to_record_id} end)
    |> Enum.uniq()
    |> length()
    
    unique_count != length(entity_relationships)
  end

  @doc """
  Remove relacionamentos duplicados.
  """
  def remove_duplicates(entity_relationships) when is_list(entity_relationships) do
    entity_relationships
    |> Enum.uniq_by(fn rel -> {rel.relationship_id, rel.from_record_id, rel.to_record_id} end)
  end

  @doc """
  Valida consistência de relacionamentos.
  """
  def validate_consistency(entity_relationships) when is_list(entity_relationships) do
    errors = []
    
    # Verificar duplicatas
    errors = if has_duplicates?(entity_relationships) do
      ["Relacionamentos duplicados encontrados" | errors]
    else
      errors
    end
    
    # Verificar auto-relacionamentos
    self_relations = Enum.filter(entity_relationships, fn rel ->
      rel.from_record_id == rel.to_record_id
    end)
    
    errors = if length(self_relations) > 0 do
      ["Auto-relacionamentos encontrados" | errors]
    else
      errors
    end
    
    if length(errors) == 0 do
      {:ok, entity_relationships}
    else
      {:error, errors}
    end
  end
end
