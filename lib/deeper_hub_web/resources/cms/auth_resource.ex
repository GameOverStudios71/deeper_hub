defmodule DeeperHubWeb.Resources.CMS.AuthResource do
  @moduledoc """
  Recurso REST para autenticação do CMS.
  Fornece endpoints para login, logout e gerenciamento de sessões.

  Endpoints disponíveis:
  - POST /api/cms/auth/login - Autenticação de usuário
  - POST /api/cms/auth/logout - Logout do usuário
  - GET /api/cms/auth/me - Obtém dados do usuário atual
  - POST /api/cms/auth/refresh - Renova token de acesso
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.CMS.Users
  alias DeeperHub.Core.Logger
  alias DeeperHub.Core.Auth.SimpleHash
  require DeeperHub.Core.Logger

  # Plugs
  plug(CORSPlug, origin: ["http://localhost:8080", "http://127.0.0.1:8080"])

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  # OPTIONS handler for CORS preflight
  options _ do
    conn
    |> put_resp_header("access-control-allow-origin", "*")
    |> put_resp_header("access-control-allow-methods", "GET, POST, PUT, DELETE, OPTIONS")
    |> put_resp_header("access-control-allow-headers", "content-type, authorization")
    |> send_resp(200, "")
  end

  # POST /api/cms/auth/login - Autenticação de usuário
  post "/login" do
    Logger.info("Tentativa de login", module: __MODULE__)

    case conn.body_params do
      %{"email" => email, "password" => password} when is_binary(email) and is_binary(password) ->
        case authenticate_user(email, password) do
          {:ok, user, token} ->
            # Atualizar último login
            Users.update_last_login(user.id)

            response = %{
              status: "success",
              message: "Login realizado com sucesso",
              data: %{
                token: token,
                user: sanitize_user(user)
              }
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, :invalid_credentials} ->
            Logger.warning("Tentativa de login com credenciais inválidas para: #{email}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Email ou senha inválidos"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(401, Jason.encode!(error_response))

          {:error, :user_inactive} ->
            Logger.warning("Tentativa de login com usuário inativo: #{email}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Usuário inativo"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(401, Jason.encode!(error_response))

          {:error, reason} ->
            Logger.error("Erro durante autenticação: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro interno durante autenticação"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(500, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Email e senha são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/auth/logout - Logout do usuário
  post "/logout" do
    Logger.info("Logout de usuário", module: __MODULE__)

    # Em uma implementação completa, aqui invalidaríamos o token
    # Por enquanto, apenas retornamos sucesso
    response = %{
      status: "success",
      message: "Logout realizado com sucesso"
    }

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(response))
  end

  # GET /api/cms/auth/me - Obtém dados do usuário atual
  get "/me" do
    Logger.info("Solicitação de dados do usuário atual", module: __MODULE__)

    case get_current_user_from_token(conn) do
      {:ok, user} ->
        response = %{
          status: "success",
          data: sanitize_user(user)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :no_token} ->
        error_response = %{
          status: "error",
          message: "Token de acesso não fornecido"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(401, Jason.encode!(error_response))

      {:error, :invalid_token} ->
        error_response = %{
          status: "error",
          message: "Token de acesso inválido"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(401, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao obter usuário atual: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro interno"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/auth/refresh - Renova token de acesso
  post "/refresh" do
    Logger.info("Solicitação de renovação de token", module: __MODULE__)

    case get_current_user_from_token(conn) do
      {:ok, user} ->
        {:ok, new_token} = generate_token(user)

        response = %{
          status: "success",
          message: "Token renovado com sucesso",
          data: %{
            token: new_token,
            user: sanitize_user(user)
          }
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, _reason} ->
        error_response = %{
          status: "error",
          message: "Token inválido para renovação"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(401, Jason.encode!(error_response))
    end
  end

  # Fallback para rotas não encontradas
  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{erro: "Rota de autenticação não encontrada"}))
  end

  # ============================================================================
  # FUNÇÕES PRIVADAS
  # ============================================================================

  # Autentica usuário com email e senha
  defp authenticate_user(email, password) do
    case Users.get_user_by_email(email) do
      {:ok, user} ->
        # Converter valores SQLite para booleanos
        is_active = to_boolean(user.is_active)

        if is_active and verify_password(password, user.password_hash) do
          {:ok, token} = generate_token(user)
          {:ok, user, token}
        else
          if not is_active do
            {:error, :user_inactive}
          else
            {:error, :invalid_credentials}
          end
        end

      {:error, :not_found} ->
        # Simular verificação de senha para evitar timing attacks
        SimpleHash.no_user_verify()
        {:error, :invalid_credentials}

      {:error, reason} ->
        {:error, reason}
    end
  end

  # Verifica senha usando SimpleHash
  defp verify_password(password, hash) do
    SimpleHash.verify_password(password, hash)
  end

  # Gera token JWT para o usuário
  defp generate_token(user) do
    claims = %{
      "sub" => to_string(user.id),
      "email" => user.email,
      "username" => user.username,
      "is_admin" => user.is_admin,
      "iat" => System.system_time(:second),
      "exp" => System.system_time(:second) + (24 * 60 * 60) # 24 horas
    }

    # Por enquanto, vamos usar uma implementação simples
    # Em produção, usar Guardian ou similar
    token = Base.encode64(Jason.encode!(claims))
    {:ok, token}
  end

  # Obtém usuário atual a partir do token
  defp get_current_user_from_token(conn) do
    case get_req_header(conn, "authorization") do
      ["Bearer " <> token] ->
        decode_and_get_user(token)

      _ ->
        {:error, :no_token}
    end
  end

  # Decodifica token e obtém usuário
  defp decode_and_get_user(token) do
    try do
      case Base.decode64(token) do
        {:ok, json_string} ->
          case Jason.decode(json_string) do
            {:ok, claims} ->
              user_id = claims["sub"]
              Users.get_user(user_id)

            {:error, _} ->
              {:error, :invalid_token}
          end

        :error ->
          {:error, :invalid_token}
      end
    rescue
      _ ->
        {:error, :invalid_token}
    end
  end

  # Remove dados sensíveis do usuário
  defp sanitize_user(user) do
    # Converter struct para mapa simples para serialização JSON
    user_map = if is_struct(user) do
      Map.from_struct(user)
    else
      user
    end

    user_map
    |> Map.drop([:password_hash, :password_salt, :__struct__])
    |> Map.put(:is_admin, to_boolean(user.is_admin))
    |> Map.put(:is_active, to_boolean(user.is_active))
    |> Map.put(:permissions, get_user_permissions(user))
  end

  # Obtém permissões do usuário (mock por enquanto)
  defp get_user_permissions(user) do
    is_admin = to_boolean(user.is_admin)

    if is_admin do
      ["admin", "pages:read", "pages:write", "forms:read", "forms:write",
       "widgets:read", "widgets:write", "media:read", "media:write",
       "menus:read", "menus:write", "users:read", "users:write",
       "settings:read", "settings:write", "audit:read"]
    else
      ["pages:read", "forms:read", "widgets:read", "media:read"]
    end
  end

  # Converte valores SQLite (0/1) para booleanos Elixir (false/true)
  defp to_boolean(1), do: true
  defp to_boolean(0), do: false
  defp to_boolean(true), do: true
  defp to_boolean(false), do: false
  defp to_boolean("1"), do: true
  defp to_boolean("0"), do: false
  defp to_boolean("true"), do: true
  defp to_boolean("false"), do: false
  defp to_boolean(nil), do: false
  defp to_boolean(_), do: false
end
