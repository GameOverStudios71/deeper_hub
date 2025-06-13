defmodule DeeperHub.CMS.Relationships.Relationship do
  @moduledoc """
  Schema para definições de relacionamento entre entidades do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "relationships"

  @derive Jason.Encoder
  defstruct [
    :id, :name, :from_entity_id, :to_entity_id, :relationship_type, :from_field_id,
    :to_field_id, :is_active, :created_at, :from_entity_name, :to_entity_name,
    :from_field_name, :to_field_name
  ]

  @doc """
  Valida dados do relacionamento.
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

    # Validação do name
    name = attrs[:name] || attrs["name"]
    errors = if not is_binary(name) or String.length(name) < 2 do
      ["name é obrigatório e deve ter pelo menos 2 caracteres" | errors]
    else
      errors
    end

    # Validação do from_entity_id
    from_entity_id = attrs[:from_entity_id] || attrs["from_entity_id"]
    errors = if not is_integer(from_entity_id) or from_entity_id <= 0 do
      ["from_entity_id é obrigatório e deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    # Validação do to_entity_id
    to_entity_id = attrs[:to_entity_id] || attrs["to_entity_id"]
    errors = if not is_integer(to_entity_id) or to_entity_id <= 0 do
      ["to_entity_id é obrigatório e deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    # Validação do relationship_type
    relationship_type = attrs[:relationship_type] || attrs["relationship_type"]
    valid_types = ["one_to_one", "one_to_many", "many_to_many"]
    errors = if not is_binary(relationship_type) or not Enum.member?(valid_types, relationship_type) do
      ["relationship_type deve ser um dos seguintes: #{Enum.join(valid_types, ", ")}" | errors]
    else
      errors
    end

    # Validação de auto-relacionamento
    errors = if from_entity_id == to_entity_id do
      ["Auto-relacionamentos não são permitidos" | errors]
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
  Cria um novo relacionamento com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      from_entity_id: attrs[:from_entity_id],
      to_entity_id: attrs[:to_entity_id],
      relationship_type: attrs[:relationship_type],
      from_field_id: attrs[:from_field_id],
      to_field_id: attrs[:to_field_id],
      is_active: attrs[:is_active] || true,
      created_at: attrs[:created_at],
      from_entity_name: attrs[:from_entity_name],
      to_entity_name: attrs[:to_entity_name],
      from_field_name: attrs[:from_field_name],
      to_field_name: attrs[:to_field_name]
    }
  end

  @doc """
  Verifica se o relacionamento está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

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
  Verifica se tem campo de origem específico.
  """
  def has_from_field?(%__MODULE__{from_field_id: field_id}) when is_integer(field_id), do: true
  def has_from_field?(_), do: false

  @doc """
  Verifica se tem campo de destino específico.
  """
  def has_to_field?(%__MODULE__{to_field_id: field_id}) when is_integer(field_id), do: true
  def has_to_field?(_), do: false

  @doc """
  Verifica se é relacionamento bidirecional.
  """
  def bidirectional?(%__MODULE__{relationship_type: type}) do
    type in ["one_to_one", "many_to_many"]
  end

  @doc """
  Verifica se é relacionamento unidirecional.
  """
  def unidirectional?(%__MODULE__{relationship_type: "one_to_many"}), do: true
  def unidirectional?(_), do: false

  @doc """
  Retorna a cardinalidade do relacionamento.
  """
  def cardinality(%__MODULE__{relationship_type: type}) do
    case type do
      "one_to_one" -> {1, 1}
      "one_to_many" -> {1, :many}
      "many_to_many" -> {:many, :many}
      _ -> {:unknown, :unknown}
    end
  end

  @doc """
  Retorna descrição do tipo de relacionamento.
  """
  def type_description(%__MODULE__{relationship_type: type}) do
    case type do
      "one_to_one" -> "Um para Um - Cada registro se relaciona com exatamente um registro"
      "one_to_many" -> "Um para Muitos - Um registro se relaciona com vários registros"
      "many_to_many" -> "Muitos para Muitos - Vários registros se relacionam com vários registros"
      _ -> "Tipo de relacionamento desconhecido"
    end
  end

  @doc """
  Retorna características do relacionamento.
  """
  def characteristics(%__MODULE__{} = relationship) do
    %{
      is_active: relationship.is_active,
      is_bidirectional: bidirectional?(relationship),
      is_unidirectional: unidirectional?(relationship),
      cardinality: cardinality(relationship),
      has_from_field: has_from_field?(relationship),
      has_to_field: has_to_field?(relationship),
      type_description: type_description(relationship),
      complexity: get_complexity(relationship)
    }
  end

  @doc """
  Retorna informações resumidas do relacionamento.
  """
  def summary(%__MODULE__{} = relationship) do
    %{
      id: relationship.id,
      name: relationship.name,
      from_entity_id: relationship.from_entity_id,
      to_entity_id: relationship.to_entity_id,
      from_entity_name: relationship.from_entity_name,
      to_entity_name: relationship.to_entity_name,
      relationship_type: relationship.relationship_type,
      is_active: relationship.is_active,
      is_one_to_one: one_to_one?(relationship),
      is_one_to_many: one_to_many?(relationship),
      is_many_to_many: many_to_many?(relationship),
      is_bidirectional: bidirectional?(relationship),
      cardinality: cardinality(relationship),
      complexity: get_complexity(relationship),
      created_at: relationship.created_at
    }
  end

  @doc """
  Retorna o relacionamento inverso (para relacionamentos bidirecionais).
  """
  def inverse_relationship(%__MODULE__{} = relationship) do
    if bidirectional?(relationship) do
      %{
        name: "#{relationship.name}_inverse",
        from_entity_id: relationship.to_entity_id,
        to_entity_id: relationship.from_entity_id,
        from_entity_name: relationship.to_entity_name,
        to_entity_name: relationship.from_entity_name,
        relationship_type: relationship.relationship_type,
        from_field_id: relationship.to_field_id,
        to_field_id: relationship.from_field_id
      }
    else
      nil
    end
  end

  @doc """
  Retorna sugestões de configuração baseadas no tipo.
  """
  def configuration_suggestions(%__MODULE__{relationship_type: type}) do
    case type do
      "one_to_one" ->
        [
          "Configure campos únicos em ambas as entidades",
          "Considere usar foreign key com UNIQUE constraint",
          "Valide que não há duplicatas",
          "Use para relacionamentos exclusivos"
        ]
      "one_to_many" ->
        [
          "Configure foreign key na entidade 'muitos'",
          "Considere índices para performance",
          "Valide integridade referencial",
          "Use para hierarquias e categorização"
        ]
      "many_to_many" ->
        [
          "Use tabela de junção (entity_relationships)",
          "Configure índices compostos",
          "Considere campos adicionais na junção",
          "Valide relacionamentos únicos"
        ]
      _ ->
        [
          "Configure tipo de relacionamento adequado",
          "Valide integridade dos dados",
          "Teste performance com dados reais",
          "Documente o relacionamento"
        ]
    end
  end

  @doc """
  Retorna exemplos de uso para o tipo de relacionamento.
  """
  def usage_examples(%__MODULE__{relationship_type: type}) do
    case type do
      "one_to_one" ->
        [
          "Usuário ↔ Perfil",
          "Produto ↔ Especificação Técnica",
          "Empresa ↔ Configuração",
          "Documento ↔ Metadados"
        ]
      "one_to_many" ->
        [
          "Categoria → Produtos",
          "Autor → Artigos",
          "Cliente → Pedidos",
          "Pasta → Arquivos"
        ]
      "many_to_many" ->
        [
          "Produtos ↔ Tags",
          "Usuários ↔ Grupos",
          "Artigos ↔ Categorias",
          "Estudantes ↔ Cursos"
        ]
      _ ->
        ["Exemplos não disponíveis para este tipo"]
    end
  end

  @doc """
  Verifica se o relacionamento é válido para criação.
  """
  def valid_for_creation?(%__MODULE__{} = relationship) do
    errors = []

    errors = if not active?(relationship) do
      ["Relacionamento deve estar ativo" | errors]
    else
      errors
    end

    errors = if relationship.from_entity_id == relationship.to_entity_id do
      ["Auto-relacionamentos não são permitidos" | errors]
    else
      errors
    end

    errors = if not is_binary(relationship.name) or String.length(relationship.name) < 2 do
      ["Nome do relacionamento é obrigatório" | errors]
    else
      errors
    end

    length(errors) == 0
  end

  @doc """
  Retorna a complexidade do relacionamento.
  """
  def get_complexity(%__MODULE__{relationship_type: type, from_field_id: from_field, to_field_id: to_field}) do
    base_complexity = case type do
      "one_to_one" -> :low
      "one_to_many" -> :medium
      "many_to_many" -> :high
      _ -> :unknown
    end

    # Aumenta complexidade se usa campos específicos
    if from_field || to_field do
      case base_complexity do
        :low -> :medium
        :medium -> :high
        :high -> :very_high
        _ -> :unknown
      end
    else
      base_complexity
    end
  end

  @doc """
  Retorna a cor/categoria do relacionamento para UI.
  """
  def relationship_category(%__MODULE__{relationship_type: type}) do
    case type do
      "one_to_one" -> %{category: "simple", color: "green", icon: "link"}
      "one_to_many" -> %{category: "moderate", color: "blue", icon: "arrow-right"}
      "many_to_many" -> %{category: "complex", color: "purple", icon: "shuffle"}
      _ -> %{category: "unknown", color: "gray", icon: "question"}
    end
  end

  @doc """
  Verifica se precisa de tabela de junção.
  """
  def needs_junction_table?(%__MODULE__{relationship_type: "many_to_many"}), do: true
  def needs_junction_table?(_), do: false

  @doc """
  Verifica se pode ter registros órfãos.
  """
  def allows_orphans?(%__MODULE__{relationship_type: type}) do
    type in ["one_to_many", "many_to_many"]
  end

  @doc """
  Retorna estratégias de deleção recomendadas.
  """
  def deletion_strategies(%__MODULE__{relationship_type: type}) do
    case type do
      "one_to_one" ->
        %{
          cascade: "Deletar registro relacionado junto",
          set_null: "Remover relacionamento (set NULL)",
          restrict: "Impedir deleção se há relacionamento"
        }
      "one_to_many" ->
        %{
          cascade: "Deletar todos os registros filhos",
          set_null: "Remover relacionamento dos filhos",
          restrict: "Impedir deleção se há filhos"
        }
      "many_to_many" ->
        %{
          cascade: "Remover todos os relacionamentos",
          restrict: "Impedir deleção se há relacionamentos"
        }
      _ ->
        %{}
    end
  end
end
