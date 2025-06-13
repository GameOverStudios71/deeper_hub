defmodule DeeperHub.CMS.Relationships do
  @moduledoc """
  Contexto para gerenciar relacionamentos entre entidades do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Relationships.{Relationship, EntityRelationship}

  # ============================================================================
  # RELATIONSHIPS
  # ============================================================================

  @doc """
  Lista todos os relacionamentos.
  """
  def list_relationships do
    sql = """
    SELECT r.id, r.name, r.from_entity_id, r.to_entity_id, r.relationship_type,
           r.from_field_id, r.to_field_id, r.is_active, r.created_at,
           fe.name as from_entity_name, te.name as to_entity_name,
           ff.name as from_field_name, tf.name as to_field_name
    FROM relationships r
    LEFT JOIN entities fe ON r.from_entity_id = fe.id
    LEFT JOIN entities te ON r.to_entity_id = te.id
    LEFT JOIN fields ff ON r.from_field_id = ff.id
    LEFT JOIN fields tf ON r.to_field_id = tf.id
    ORDER BY r.created_at DESC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        relationships = Enum.map(rows, &row_to_relationship/1)
        {:ok, relationships}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista relacionamentos ativos.
  """
  def list_active_relationships do
    sql = """
    SELECT r.id, r.name, r.from_entity_id, r.to_entity_id, r.relationship_type,
           r.from_field_id, r.to_field_id, r.is_active, r.created_at,
           fe.name as from_entity_name, te.name as to_entity_name,
           ff.name as from_field_name, tf.name as to_field_name
    FROM relationships r
    LEFT JOIN entities fe ON r.from_entity_id = fe.id
    LEFT JOIN entities te ON r.to_entity_id = te.id
    LEFT JOIN fields ff ON r.from_field_id = ff.id
    LEFT JOIN fields tf ON r.to_field_id = tf.id
    WHERE r.is_active = true
    ORDER BY r.created_at DESC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        relationships = Enum.map(rows, &row_to_relationship/1)
        {:ok, relationships}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista relacionamentos por entidade origem.
  """
  def list_relationships_from_entity(entity_id) do
    sql = """
    SELECT r.id, r.name, r.from_entity_id, r.to_entity_id, r.relationship_type,
           r.from_field_id, r.to_field_id, r.is_active, r.created_at,
           fe.name as from_entity_name, te.name as to_entity_name,
           ff.name as from_field_name, tf.name as to_field_name
    FROM relationships r
    LEFT JOIN entities fe ON r.from_entity_id = fe.id
    LEFT JOIN entities te ON r.to_entity_id = te.id
    LEFT JOIN fields ff ON r.from_field_id = ff.id
    LEFT JOIN fields tf ON r.to_field_id = tf.id
    WHERE r.from_entity_id = $1 AND r.is_active = true
    ORDER BY r.created_at DESC
    """

    case Connection.query(sql, [entity_id]) do
      {:ok, %{rows: rows}} ->
        relationships = Enum.map(rows, &row_to_relationship/1)
        {:ok, relationships}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista relacionamentos por entidade destino.
  """
  def list_relationships_to_entity(entity_id) do
    sql = """
    SELECT r.id, r.name, r.from_entity_id, r.to_entity_id, r.relationship_type,
           r.from_field_id, r.to_field_id, r.is_active, r.created_at,
           fe.name as from_entity_name, te.name as to_entity_name,
           ff.name as from_field_name, tf.name as to_field_name
    FROM relationships r
    LEFT JOIN entities fe ON r.from_entity_id = fe.id
    LEFT JOIN entities te ON r.to_entity_id = te.id
    LEFT JOIN fields ff ON r.from_field_id = ff.id
    LEFT JOIN fields tf ON r.to_field_id = tf.id
    WHERE r.to_entity_id = $1 AND r.is_active = true
    ORDER BY r.created_at DESC
    """

    case Connection.query(sql, [entity_id]) do
      {:ok, %{rows: rows}} ->
        relationships = Enum.map(rows, &row_to_relationship/1)
        {:ok, relationships}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista relacionamentos por tipo.
  """
  def list_relationships_by_type(relationship_type) do
    sql = """
    SELECT r.id, r.name, r.from_entity_id, r.to_entity_id, r.relationship_type,
           r.from_field_id, r.to_field_id, r.is_active, r.created_at,
           fe.name as from_entity_name, te.name as to_entity_name,
           ff.name as from_field_name, tf.name as to_field_name
    FROM relationships r
    LEFT JOIN entities fe ON r.from_entity_id = fe.id
    LEFT JOIN entities te ON r.to_entity_id = te.id
    LEFT JOIN fields ff ON r.from_field_id = ff.id
    LEFT JOIN fields tf ON r.to_field_id = tf.id
    WHERE r.relationship_type = $1 AND r.is_active = true
    ORDER BY r.created_at DESC
    """

    case Connection.query(sql, [relationship_type]) do
      {:ok, %{rows: rows}} ->
        relationships = Enum.map(rows, &row_to_relationship/1)
        {:ok, relationships}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca relacionamento por ID.
  """
  def get_relationship(id) do
    sql = """
    SELECT r.id, r.name, r.from_entity_id, r.to_entity_id, r.relationship_type,
           r.from_field_id, r.to_field_id, r.is_active, r.created_at,
           fe.name as from_entity_name, te.name as to_entity_name,
           ff.name as from_field_name, tf.name as to_field_name
    FROM relationships r
    LEFT JOIN entities fe ON r.from_entity_id = fe.id
    LEFT JOIN entities te ON r.to_entity_id = te.id
    LEFT JOIN fields ff ON r.from_field_id = ff.id
    LEFT JOIN fields tf ON r.to_field_id = tf.id
    WHERE r.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        relationship = row_to_relationship(row)
        {:ok, relationship}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo relacionamento.
  """
  def create_relationship(attrs) do
    case Relationship.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        INSERT INTO relationships (
          name, from_entity_id, to_entity_id, relationship_type, from_field_id,
          to_field_id, is_active, created_at
        ) VALUES (
          $1, $2, $3, $4, $5, $6, $7, $8
        ) RETURNING id
        """

        params = [
          validated_attrs[:name],
          validated_attrs[:from_entity_id],
          validated_attrs[:to_entity_id],
          validated_attrs[:relationship_type],
          validated_attrs[:from_field_id],
          validated_attrs[:to_field_id],
          validated_attrs[:is_active] || true,
          now
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_relationship(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  # ============================================================================
  # ENTITY RELATIONSHIPS
  # ============================================================================

  @doc """
  Lista relacionamentos de entidade por relacionamento.
  """
  def list_entity_relationships(relationship_id) do
    sql = """
    SELECT er.id, er.relationship_id, er.from_record_id, er.to_record_id,
           er.order_index, er.created_at,
           r.name as relationship_name, r.relationship_type
    FROM entity_relationships er
    LEFT JOIN relationships r ON er.relationship_id = r.id
    WHERE er.relationship_id = $1
    ORDER BY er.order_index ASC, er.created_at ASC
    """

    case Connection.query(sql, [relationship_id]) do
      {:ok, %{rows: rows}} ->
        entity_relationships = Enum.map(rows, &row_to_entity_relationship/1)
        {:ok, entity_relationships}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista relacionamentos de um registro específico.
  """
  def list_record_relationships(record_id) do
    sql = """
    SELECT er.id, er.relationship_id, er.from_record_id, er.to_record_id,
           er.order_index, er.created_at,
           r.name as relationship_name, r.relationship_type
    FROM entity_relationships er
    LEFT JOIN relationships r ON er.relationship_id = r.id
    WHERE er.from_record_id = $1 OR er.to_record_id = $1
    ORDER BY er.order_index ASC, er.created_at ASC
    """

    case Connection.query(sql, [record_id]) do
      {:ok, %{rows: rows}} ->
        entity_relationships = Enum.map(rows, &row_to_entity_relationship/1)
        {:ok, entity_relationships}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um relacionamento entre registros.
  """
  def create_entity_relationship(attrs) do
    case EntityRelationship.validate(attrs) do
      {:ok, validated_attrs} ->
        now = DateTime.utc_now()

        sql = """
        INSERT INTO entity_relationships (
          relationship_id, from_record_id, to_record_id, order_index, created_at
        ) VALUES (
          $1, $2, $3, $4, $5
        ) RETURNING id
        """

        params = [
          validated_attrs[:relationship_id],
          validated_attrs[:from_record_id],
          validated_attrs[:to_record_id],
          validated_attrs[:order_index] || 0,
          now
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_entity_relationship(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Busca relacionamento de entidade por ID.
  """
  def get_entity_relationship(id) do
    sql = """
    SELECT er.id, er.relationship_id, er.from_record_id, er.to_record_id,
           er.order_index, er.created_at,
           r.name as relationship_name, r.relationship_type
    FROM entity_relationships er
    LEFT JOIN relationships r ON er.relationship_id = r.id
    WHERE er.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        entity_relationship = row_to_entity_relationship(row)
        {:ok, entity_relationship}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # HELPERS PRIVADOS
  # ============================================================================

  defp row_to_relationship([id, name, from_entity_id, to_entity_id, relationship_type,
                            from_field_id, to_field_id, is_active, created_at,
                            from_entity_name, to_entity_name, from_field_name, to_field_name]) do
    Relationship.new(%{
      id: id,
      name: name,
      from_entity_id: from_entity_id,
      to_entity_id: to_entity_id,
      relationship_type: relationship_type,
      from_field_id: from_field_id,
      to_field_id: to_field_id,
      is_active: is_active,
      created_at: created_at,
      from_entity_name: from_entity_name,
      to_entity_name: to_entity_name,
      from_field_name: from_field_name,
      to_field_name: to_field_name
    })
  end

  defp row_to_entity_relationship([id, relationship_id, from_record_id, to_record_id,
                                   order_index, created_at, relationship_name, relationship_type]) do
    EntityRelationship.new(%{
      id: id,
      relationship_id: relationship_id,
      from_record_id: from_record_id,
      to_record_id: to_record_id,
      order_index: order_index,
      created_at: created_at,
      relationship_name: relationship_name,
      relationship_type: relationship_type
    })
  end
end
