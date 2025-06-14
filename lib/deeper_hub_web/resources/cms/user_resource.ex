defmodule DeeperHubWeb.Resources.CMS.UserResource do
  @moduledoc """
  Recurso REST para usuários e permissões do CMS.
  Fornece endpoints para gerenciar usuários e suas permissões.

  Endpoints disponíveis:
  - GET /api/cms/users - Lista todos os usuários
  - GET /api/cms/users/active - Lista usuários ativos
  - GET /api/cms/users/admins - Lista usuários administradores
  - GET /api/cms/users/:id - Obtém usuário específico
  - GET /api/cms/users/email/:email - Busca usuário por email
  - GET /api/cms/users/username/:username - Busca usuário por username
  - POST /api/cms/users - Cria novo usuário
  - PUT /api/cms/users/:id - Atualiza usuário
  - PUT /api/cms/users/:id/password - Atualiza senha do usuário
  - PUT /api/cms/users/:id/login - Atualiza último login
  - DELETE /api/cms/users/:id - Remove usuário
  - GET /api/cms/users/:id/permissions - Lista permissões do usuário
  - GET /api/cms/users/permissions - Lista todas as permissões
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.CMS.Users
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

  # ============================================================================
  # USERS
  # ============================================================================

  # GET /api/cms/users - Lista todos os usuários
  get "/" do
    Logger.info("Listando todos os usuários", module: __MODULE__)

    case Users.list_users() do
      {:ok, users} ->
        # Remover dados sensíveis
        safe_users = Enum.map(users, fn user ->
          user
          |> Map.from_struct()
          |> Map.delete(:password_hash)
        end)

        response = %{
          status: "success",
          data: safe_users,
          count: length(safe_users)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar usuários: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar usuários",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/users/active - Lista usuários ativos
  get "/active" do
    Logger.info("Listando usuários ativos", module: __MODULE__)

    case Users.list_active_users() do
      {:ok, users} ->
        safe_users = Enum.map(users, fn user ->
          user
          |> Map.from_struct()
          |> Map.delete(:password_hash)
        end)

        response = %{
          status: "success",
          data: safe_users,
          count: length(safe_users)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar usuários ativos: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar usuários ativos",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/users/admins - Lista usuários administradores
  get "/admins" do
    Logger.info("Listando usuários administradores", module: __MODULE__)

    case Users.list_admin_users() do
      {:ok, users} ->
        safe_users = Enum.map(users, fn user ->
          user
          |> Map.from_struct()
          |> Map.delete(:password_hash)
        end)

        response = %{
          status: "success",
          data: safe_users,
          count: length(safe_users)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar administradores: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar usuários administradores",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/users/permissions - Lista todas as permissões
  get "/permissions" do
    Logger.info("Listando todas as permissões", module: __MODULE__)

    case Users.list_permissions() do
      {:ok, permissions} ->
        response = %{
          status: "success",
          data: permissions,
          count: length(permissions)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar permissões: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar permissões",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/users/email/:email - Busca usuário por email
  get "/email/:email" do
    email = conn.path_params["email"]
    Logger.info("Buscando usuário por email: #{email}", module: __MODULE__)

    case Users.get_user_by_email(email) do
      {:ok, user} ->
        safe_user = user
        |> Map.from_struct()
        |> Map.delete(:password_hash)

        response = %{
          status: "success",
          data: safe_user
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Usuário não encontrado para email: #{email}"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar usuário por email #{email}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar usuário",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/users/username/:username - Busca usuário por username
  get "/username/:username" do
    username = conn.path_params["username"]
    Logger.info("Buscando usuário por username: #{username}", module: __MODULE__)

    case Users.get_user_by_username(username) do
      {:ok, user} ->
        safe_user = user
        |> Map.from_struct()
        |> Map.delete(:password_hash)

        response = %{
          status: "success",
          data: safe_user
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Usuário não encontrado para username: #{username}"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar usuário por username #{username}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar usuário",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/users/:id/permissions - Lista permissões do usuário
  get "/:id/permissions" do
    user_id = conn.path_params["id"]
    Logger.info("Listando permissões do usuário: #{user_id}", module: __MODULE__)

    case Users.list_user_permissions(user_id) do
      {:ok, permissions} ->
        response = %{
          status: "success",
          data: permissions,
          count: length(permissions),
          user_id: user_id
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar permissões do usuário #{user_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar permissões do usuário",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/users/:id - Obtém usuário específico
  get "/:id" do
    user_id = conn.path_params["id"]
    Logger.info("Buscando usuário com ID: #{user_id}", module: __MODULE__)

    case Users.get_user(user_id) do
      {:ok, user} ->
        safe_user = user
        |> Map.from_struct()
        |> Map.delete(:password_hash)

        response = %{
          status: "success",
          data: safe_user
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Usuário não encontrado"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar usuário #{user_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar usuário",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/users - Cria novo usuário
  post "/" do
    Logger.info("Criando novo usuário", module: __MODULE__)

    case conn.body_params do
      %{} = params when map_size(params) > 0 ->
        # Converter chaves string para atom se necessário
        user_params = convert_keys_to_atoms(params)

        # Converter password para password_hash se fornecido
        user_params = if user_params[:password] do
          password_hash = DeeperHub.CMS.Users.User.hash_password(user_params[:password])
          user_params
          |> Map.put(:password_hash, password_hash)
          |> Map.delete(:password)
        else
          user_params
        end

        case Users.create_user(user_params) do
          {:ok, user} ->
            safe_user = user
            |> Map.from_struct()
            |> Map.delete(:password_hash)

            response = %{
              status: "success",
              message: "Usuário criado com sucesso",
              data: safe_user
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar usuário: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao criar usuário",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados do usuário são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ============================================================================
  # PERMISSIONS CRUD
  # ============================================================================

  # POST /api/cms/users/permissions - Cria nova permissão
  post "/permissions" do
    Logger.info("Criando nova permissão", module: __MODULE__)

    case conn.body_params do
      %{} = permission_data when map_size(permission_data) > 0 ->
        permission_attrs = convert_keys_to_atoms(permission_data)

        case Users.create_permission(permission_attrs) do
          {:ok, permission} ->
            response = %{
              status: "success",
              data: permission,
              message: "Permissão criada com sucesso"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar permissão: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao criar permissão",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados da permissão são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # PUT /api/cms/users/permissions/:id - Atualiza permissão
  put "/permissions/:id" do
    permission_id = conn.path_params["id"]
    Logger.info("Atualizando permissão com ID: #{permission_id}", module: __MODULE__)

    case conn.body_params do
      %{} = permission_data when map_size(permission_data) > 0 ->
        permission_attrs = convert_keys_to_atoms(permission_data)

        case Users.update_permission(permission_id, permission_attrs) do
          {:ok, permission} ->
            response = %{
              status: "success",
              data: permission,
              message: "Permissão atualizada com sucesso"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, :not_found} ->
            error_response = %{
              status: "error",
              message: "Permissão não encontrada"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(404, Jason.encode!(error_response))

          {:error, reason} ->
            Logger.error("Erro ao atualizar permissão #{permission_id}: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao atualizar permissão",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados da permissão são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # DELETE /api/cms/users/permissions/:id - Remove permissão
  delete "/permissions/:id" do
    permission_id = conn.path_params["id"]
    Logger.info("Removendo permissão com ID: #{permission_id}", module: __MODULE__)

    case Users.delete_permission(permission_id) do
      {:ok, _} ->
        response = %{
          status: "success",
          message: "Permissão removida com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Permissão não encontrada"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao remover permissão #{permission_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao remover permissão",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # Fallback para rotas não encontradas
  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{erro: "Rota de usuários não encontrada"}))
  end

  # Funções auxiliares privadas
  defp convert_keys_to_atoms(map) when is_map(map) do
    Enum.into(map, %{}, fn {k, v} ->
      key = if is_binary(k), do: String.to_atom(k), else: k
      {key, v}
    end)
  end
end
