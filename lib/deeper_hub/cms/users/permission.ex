defmodule DeeperHub.CMS.Users.Permission do
  @moduledoc """
  Schema para permissões de usuário do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "permissions"

  @derive Jason.Encoder
  defstruct [
    :id, :user_id, :entity_id, :permission_type, :created_at,
    :username, :email, :entity_name
  ]

  @doc """
  Valida dados da permissão.
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

    # Validação do user_id
    user_id = attrs[:user_id] || attrs["user_id"]
    errors = if not is_integer(user_id) or user_id <= 0 do
      ["user_id é obrigatório e deve ser um número inteiro positivo" | errors]
    else
      errors
    end

    # Validação do permission_type
    permission_type = attrs[:permission_type] || attrs["permission_type"]
    valid_types = ["create", "read", "update", "delete", "admin"]
    errors = if not is_binary(permission_type) or not Enum.member?(valid_types, permission_type) do
      ["permission_type deve ser um dos seguintes: #{Enum.join(valid_types, ", ")}" | errors]
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
  Cria uma nova permissão com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      user_id: attrs[:user_id],
      entity_id: attrs[:entity_id],
      permission_type: attrs[:permission_type],
      created_at: attrs[:created_at],
      username: attrs[:username],
      email: attrs[:email],
      entity_name: attrs[:entity_name]
    }
  end

  @doc """
  Verifica se é permissão de criação.
  """
  def create_permission?(%__MODULE__{permission_type: "create"}), do: true
  def create_permission?(_), do: false

  @doc """
  Verifica se é permissão de leitura.
  """
  def read_permission?(%__MODULE__{permission_type: "read"}), do: true
  def read_permission?(_), do: false

  @doc """
  Verifica se é permissão de atualização.
  """
  def update_permission?(%__MODULE__{permission_type: "update"}), do: true
  def update_permission?(_), do: false

  @doc """
  Verifica se é permissão de exclusão.
  """
  def delete_permission?(%__MODULE__{permission_type: "delete"}), do: true
  def delete_permission?(_), do: false

  @doc """
  Verifica se é permissão de administração.
  """
  def admin_permission?(%__MODULE__{permission_type: "admin"}), do: true
  def admin_permission?(_), do: false

  @doc """
  Verifica se é permissão global (sem entidade específica).
  """
  def global_permission?(%__MODULE__{entity_id: nil}), do: true
  def global_permission?(_), do: false

  @doc """
  Verifica se é permissão específica de entidade.
  """
  def entity_specific?(%__MODULE__{entity_id: entity_id}) when is_integer(entity_id), do: true
  def entity_specific?(_), do: false

  @doc """
  Retorna o nível de permissão (numérico para comparação).
  """
  def permission_level(%__MODULE__{permission_type: type}) do
    case type do
      "read" -> 1
      "create" -> 2
      "update" -> 3
      "delete" -> 4
      "admin" -> 5
      _ -> 0
    end
  end

  @doc """
  Verifica se uma permissão inclui outra (hierarquia).
  """
  def includes_permission?(%__MODULE__{} = higher, %__MODULE__{} = lower) do
    permission_level(higher) >= permission_level(lower)
  end

  def includes_permission?(%__MODULE__{} = permission, permission_type) when is_binary(permission_type) do
    permission_level(permission) >= permission_level(%__MODULE__{permission_type: permission_type})
  end

  @doc """
  Retorna descrição da permissão.
  """
  def permission_description(%__MODULE__{permission_type: type}) do
    case type do
      "create" -> "Criar novos registros"
      "read" -> "Visualizar registros"
      "update" -> "Editar registros existentes"
      "delete" -> "Excluir registros"
      "admin" -> "Administração completa"
      _ -> "Permissão desconhecida"
    end
  end

  @doc """
  Retorna informações resumidas da permissão.
  """
  def summary(%__MODULE__{} = permission) do
    %{
      id: permission.id,
      user_id: permission.user_id,
      entity_id: permission.entity_id,
      permission_type: permission.permission_type,
      permission_level: permission_level(permission),
      permission_description: permission_description(permission),
      is_global: global_permission?(permission),
      is_entity_specific: entity_specific?(permission),
      is_create: create_permission?(permission),
      is_read: read_permission?(permission),
      is_update: update_permission?(permission),
      is_delete: delete_permission?(permission),
      is_admin: admin_permission?(permission),
      username: permission.username,
      email: permission.email,
      entity_name: permission.entity_name,
      created_at: permission.created_at
    }
  end

  @doc """
  Retorna o escopo da permissão.
  """
  def permission_scope(%__MODULE__{entity_id: nil}), do: :global
  def permission_scope(%__MODULE__{entity_id: _}), do: :entity_specific

  @doc """
  Retorna descrição do escopo.
  """
  def scope_description(%__MODULE__{} = permission) do
    case permission_scope(permission) do
      :global -> "Permissão global (todas as entidades)"
      :entity_specific -> "Permissão específica para: #{permission.entity_name || "entidade #{permission.entity_id}"}"
    end
  end

  @doc """
  Verifica se a permissão é crítica (admin ou delete).
  """
  def critical_permission?(%__MODULE__{permission_type: type}) do
    type in ["admin", "delete"]
  end

  @doc """
  Verifica se a permissão é básica (read).
  """
  def basic_permission?(%__MODULE__{permission_type: "read"}), do: true
  def basic_permission?(_), do: false

  @doc """
  Verifica se a permissão é de escrita (create, update, delete).
  """
  def write_permission?(%__MODULE__{permission_type: type}) do
    type in ["create", "update", "delete"]
  end

  @doc """
  Retorna sugestões de segurança para a permissão.
  """
  def security_suggestions(%__MODULE__{} = permission) do
    suggestions = []

    suggestions = if critical_permission?(permission) do
      ["Esta é uma permissão crítica - use com cuidado" | suggestions]
    else
      suggestions
    end

    suggestions = if global_permission?(permission) do
      ["Permissão global - afeta todas as entidades" | suggestions]
    else
      suggestions
    end

    suggestions = if admin_permission?(permission) do
      ["Permissão de administração - concede acesso total" | suggestions]
    else
      suggestions
    end

    if length(suggestions) == 0 do
      ["Permissão configurada adequadamente"]
    else
      suggestions
    end
  end

  @doc """
  Retorna a cor/categoria da permissão para UI.
  """
  def permission_category(%__MODULE__{permission_type: type}) do
    case type do
      "read" -> %{category: "safe", color: "green", icon: "eye"}
      "create" -> %{category: "moderate", color: "blue", icon: "plus"}
      "update" -> %{category: "moderate", color: "yellow", icon: "edit"}
      "delete" -> %{category: "dangerous", color: "red", icon: "trash"}
      "admin" -> %{category: "critical", color: "purple", icon: "shield"}
      _ -> %{category: "unknown", color: "gray", icon: "question"}
    end
  end

  @doc """
  Agrupa permissões por tipo.
  """
  def group_by_type(permissions) when is_list(permissions) do
    Enum.group_by(permissions, fn permission -> permission.permission_type end)
  end

  @doc """
  Agrupa permissões por usuário.
  """
  def group_by_user(permissions) when is_list(permissions) do
    Enum.group_by(permissions, fn permission -> permission.user_id end)
  end

  @doc """
  Agrupa permissões por entidade.
  """
  def group_by_entity(permissions) when is_list(permissions) do
    Enum.group_by(permissions, fn permission -> permission.entity_id end)
  end

  @doc """
  Filtra permissões por tipo.
  """
  def filter_by_type(permissions, type) when is_list(permissions) and is_binary(type) do
    Enum.filter(permissions, fn permission -> permission.permission_type == type end)
  end

  @doc """
  Filtra permissões globais.
  """
  def filter_global(permissions) when is_list(permissions) do
    Enum.filter(permissions, &global_permission?/1)
  end

  @doc """
  Filtra permissões específicas de entidade.
  """
  def filter_entity_specific(permissions) when is_list(permissions) do
    Enum.filter(permissions, &entity_specific?/1)
  end

  @doc """
  Filtra permissões críticas.
  """
  def filter_critical(permissions) when is_list(permissions) do
    Enum.filter(permissions, &critical_permission?/1)
  end
end
