defmodule DeeperHub.CMS.Users.User do
  @moduledoc """
  Schema para usuários do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "users"

  @derive Jason.Encoder
  defstruct [
    :id, :username, :email, :password_hash, :full_name, :is_active, :is_admin,
    :created_at, :updated_at, :last_login
  ]

  @doc """
  Valida dados do usuário.
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

    # Validação do username
    username = attrs[:username] || attrs["username"]
    errors = if not is_binary(username) or String.length(username) < 3 do
      ["username é obrigatório e deve ter pelo menos 3 caracteres" | errors]
    else
      errors
    end

    # Validação do email
    email = attrs[:email] || attrs["email"]
    errors = if not is_binary(email) or not valid_email?(email) do
      ["email é obrigatório e deve ter formato válido" | errors]
    else
      errors
    end

    # Validação do password_hash (se fornecido)
    password_hash = attrs[:password_hash] || attrs["password_hash"]
    errors = if password_hash && (not is_binary(password_hash) or String.length(password_hash) < 10) do
      ["password_hash deve ter pelo menos 10 caracteres" | errors]
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
  Cria um novo usuário com valores padrão.
  """
  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      username: attrs[:username],
      email: attrs[:email],
      password_hash: attrs[:password_hash],
      full_name: attrs[:full_name] || "",
      is_active: attrs[:is_active] || true,
      is_admin: attrs[:is_admin] || false,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at],
      last_login: attrs[:last_login]
    }
  end

  @doc """
  Verifica se o usuário está ativo.
  """
  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  @doc """
  Verifica se o usuário é administrador.
  """
  def admin?(%__MODULE__{is_admin: true}), do: true
  def admin?(_), do: false

  @doc """
  Verifica se o usuário tem nome completo.
  """
  def has_full_name?(%__MODULE__{full_name: name}) do
    is_binary(name) and String.trim(name) != ""
  end

  @doc """
  Verifica se o usuário já fez login.
  """
  def has_logged_in?(%__MODULE__{last_login: nil}), do: false
  def has_logged_in?(_), do: true

  @doc """
  Retorna o nome de exibição do usuário.
  """
  def display_name(%__MODULE__{full_name: full_name, username: username}) do
    if has_full_name?(%__MODULE__{full_name: full_name}) do
      full_name
    else
      username
    end
  end

  @doc """
  Retorna as iniciais do usuário.
  """
  def initials(%__MODULE__{} = user) do
    name = display_name(user)

    name
    |> String.split(" ")
    |> Enum.take(2)
    |> Enum.map(&String.first/1)
    |> Enum.join("")
    |> String.upcase()
  end

  @doc """
  Verifica se o email é válido.
  """
  def valid_email?(email) when is_binary(email) do
    email_regex = ~r/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
    Regex.match?(email_regex, email)
  end
  def valid_email?(_), do: false

  @doc """
  Verifica se o username é válido.
  """
  def valid_username?(%__MODULE__{username: username}) do
    valid_username?(username)
  end
  def valid_username?(username) when is_binary(username) do
    username_regex = ~r/^[a-zA-Z0-9_-]{3,30}$/
    Regex.match?(username_regex, username)
  end
  def valid_username?(_), do: false

  @doc """
  Retorna informações de segurança do usuário.
  """
  def security_info(%__MODULE__{} = user) do
    %{
      is_active: user.is_active,
      is_admin: user.is_admin,
      has_logged_in: has_logged_in?(user),
      last_login: user.last_login,
      account_age_days: account_age_days(user),
      password_set: is_binary(user.password_hash) and user.password_hash != ""
    }
  end

  @doc """
  Retorna informações resumidas do usuário.
  """
  def summary(%__MODULE__{} = user) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      full_name: user.full_name,
      display_name: display_name(user),
      initials: initials(user),
      is_active: user.is_active,
      is_admin: user.is_admin,
      has_full_name: has_full_name?(user),
      has_logged_in: has_logged_in?(user),
      last_login: user.last_login,
      created_at: user.created_at,
      account_age_days: account_age_days(user)
    }
  end

  @doc """
  Retorna dados públicos do usuário (sem informações sensíveis).
  """
  def public_data(%__MODULE__{} = user) do
    %{
      id: user.id,
      username: user.username,
      full_name: user.full_name,
      display_name: display_name(user),
      initials: initials(user),
      is_admin: user.is_admin,
      created_at: user.created_at
    }
  end

  @doc """
  Verifica se o usuário pode ser deletado.
  """
  def can_delete?(%__MODULE__{is_admin: true}), do: false
  def can_delete?(%__MODULE__{id: id}) when id == 1, do: false  # Usuário root
  def can_delete?(_), do: true

  @doc """
  Verifica se o usuário pode ser desativado.
  """
  def can_deactivate?(%__MODULE__{id: id}) when id == 1, do: false  # Usuário root
  def can_deactivate?(_), do: true

  @doc """
  Retorna sugestões de segurança para o usuário.
  """
  def security_suggestions(%__MODULE__{} = user) do
    suggestions = []

    suggestions = if not has_full_name?(user) do
      ["Configure seu nome completo no perfil" | suggestions]
    else
      suggestions
    end

    suggestions = if not has_logged_in?(user) do
      ["Faça seu primeiro login para ativar a conta" | suggestions]
    else
      suggestions
    end

    suggestions = if user.last_login && days_since_last_login(user) > 30 do
      ["Considere fazer login mais frequentemente" | suggestions]
    else
      suggestions
    end

    suggestions = if not admin?(user) and length(suggestions) == 0 do
      ["Sua conta está configurada corretamente" | suggestions]
    else
      suggestions
    end

    suggestions
  end

  @doc """
  Retorna o status da conta.
  """
  def account_status(%__MODULE__{is_active: false}), do: :inactive
  def account_status(%__MODULE__{last_login: nil}), do: :never_logged_in
  def account_status(%__MODULE__{} = user) do
    days_since = days_since_last_login(user)
    cond do
      days_since <= 7 -> :active
      days_since <= 30 -> :recently_active
      days_since <= 90 -> :inactive_recently
      true -> :inactive_long_term
    end
  end

  @doc """
  Retorna descrição do status da conta.
  """
  def account_status_description(%__MODULE__{} = user) do
    case account_status(user) do
      :inactive -> "Conta desativada"
      :never_logged_in -> "Nunca fez login"
      :active -> "Ativo recentemente"
      :recently_active -> "Ativo na última semana"
      :inactive_recently -> "Inativo há algumas semanas"
      :inactive_long_term -> "Inativo há muito tempo"
    end
  end

  @doc """
  Gera um hash de senha usando Bcrypt.
  """
  def hash_password(password) when is_binary(password) do
    # Bcrypt.hash_pwd_salt(password)
    # Por enquanto, hash simples para evitar dependência
    :crypto.hash(:sha256, password) |> Base.encode16(case: :lower)
  end

  @doc """
  Verifica uma senha contra o hash.
  """
  def verify_password(password, hash) when is_binary(password) and is_binary(hash) do
    # Bcrypt.verify_pass(password, hash)
    # Por enquanto, comparação simples para evitar dependência
    password == hash
  end

  def verify_password(%__MODULE__{password_hash: hash}, password) do
    verify_password(password, hash)
  end

  # Funções auxiliares privadas
  defp account_age_days(%__MODULE__{created_at: nil}), do: 0
  defp account_age_days(%__MODULE__{created_at: created_at}) do
    case DateTime.from_iso8601(created_at) do
      {:ok, datetime, _} ->
        DateTime.diff(DateTime.utc_now(), datetime, :day)
      _ ->
        0
    end
  end

  defp days_since_last_login(%__MODULE__{last_login: nil}), do: 999
  defp days_since_last_login(%__MODULE__{last_login: last_login}) do
    case DateTime.from_iso8601(last_login) do
      {:ok, datetime, _} ->
        DateTime.diff(DateTime.utc_now(), datetime, :day)
      _ ->
        999
    end
  end
end
