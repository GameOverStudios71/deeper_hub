defmodule DeeperHubWeb.Resources.CMS.ThemeResource do
  @moduledoc """
  Resource para gerenciar temas do CMS via API REST.
  """

  use DeeperHubWeb, :resource

  alias DeeperHub.CMS.Settings

  # ============================================================================
  # ROUTES
  # ============================================================================

  # GET /api/cms/themes - Lista temas
  get "/" do
    params = conn.query_params
    case params["active"] do
      "true" ->
        case Settings.list_active_themes() do
          {:ok, themes} ->
            render_success(conn, %{
              themes: themes,
              total: length(themes),
              message: "Temas ativos listados com sucesso"
            })
          {:error, error} ->
            render_error(conn, "Erro ao listar temas ativos", error)
        end
      _ ->
        case Settings.list_themes() do
          {:ok, themes} ->
            render_success(conn, %{
              themes: themes,
              total: length(themes),
              message: "Temas listados com sucesso"
            })
          {:error, error} ->
            render_error(conn, "Erro ao listar temas", error)
        end
    end
  end

  # POST /api/cms/themes - Cria tema
  post "/" do
    case conn.body_params do
      %{"theme" => theme_params} ->
        case Settings.create_theme(theme_params) do
          {:ok, theme} ->
            conn
            |> put_status(201)
            |> render_success(%{
              theme: theme,
              message: "Tema criado com sucesso"
            })
          {:error, errors} when is_list(errors) ->
            render_validation_error(conn, "Dados inválidos", errors)
          {:error, error} ->
            render_error(conn, "Erro ao criar tema", error)
        end
      _ ->
        render_bad_request(conn, "Parâmetros 'theme' são obrigatórios")
    end
  end

  # GET /api/cms/themes/default - Tema padrão
  get "/default" do
    case Settings.get_default_theme() do
      {:ok, theme} ->
        render_success(conn, %{
          theme: theme,
          message: "Tema padrão encontrado com sucesso"
        })
      {:error, :not_found} ->
        render_not_found(conn, "Nenhum tema padrão configurado")
      {:error, error} ->
        render_error(conn, "Erro ao buscar tema padrão", error)
    end
  end

  # GET /api/cms/themes/by-name/:name - Busca por nome
  get "/by-name/:name" do
    case Settings.get_theme_by_name(name) do
      {:ok, theme} ->
        render_success(conn, %{
          theme: theme,
          message: "Tema encontrado com sucesso"
        })
      {:error, :not_found} ->
        render_not_found(conn, "Tema não encontrado")
      {:error, error} ->
        render_error(conn, "Erro ao buscar tema", error)
    end
  end

  # GET /api/cms/themes/:id - Busca por ID
  get "/:id" do
    case parse_id(id) do
      {:ok, theme_id} ->
        case Settings.get_theme(theme_id) do
          {:ok, theme} ->
            render_success(conn, %{
              theme: theme,
              message: "Tema encontrado com sucesso"
            })
          {:error, :not_found} ->
            render_not_found(conn, "Tema não encontrado")
          {:error, error} ->
            render_error(conn, "Erro ao buscar tema", error)
        end
      {:error, _} ->
        render_bad_request(conn, "ID inválido")
    end
  end

  # PUT /api/cms/themes/:id - Atualiza tema
  put "/:id" do
    case parse_id(id) do
      {:ok, theme_id} ->
        case conn.body_params do
          %{"theme" => theme_params} ->
            case Settings.update_theme(theme_id, theme_params) do
              {:ok, theme} ->
                render_success(conn, %{
                  theme: theme,
                  message: "Tema atualizado com sucesso"
                })
              {:error, :not_found} ->
                render_not_found(conn, "Tema não encontrado")
              {:error, errors} when is_list(errors) ->
                render_validation_error(conn, "Dados inválidos", errors)
              {:error, error} ->
                render_error(conn, "Erro ao atualizar tema", error)
            end
          _ ->
            render_bad_request(conn, "Parâmetros 'theme' são obrigatórios")
        end
      {:error, _} ->
        render_bad_request(conn, "ID inválido")
    end
  end

  # DELETE /api/cms/themes/:id - Deleta tema
  delete "/:id" do
    case parse_id(id) do
      {:ok, theme_id} ->
        case Settings.delete_theme(theme_id) do
          :ok ->
            render_success(conn, %{
              message: "Tema deletado com sucesso"
            })
          {:error, :not_found_or_system} ->
            render_bad_request(conn, "Tema não encontrado ou é um tema do sistema")
          {:error, error} ->
            render_error(conn, "Erro ao deletar tema", error)
        end
      {:error, _} ->
        render_bad_request(conn, "ID inválido")
    end
  end

  # ============================================================================
  # HELPERS PRIVADOS
  # ============================================================================

  defp parse_id(id) when is_binary(id) do
    case Integer.parse(id) do
      {int_id, ""} when int_id > 0 -> {:ok, int_id}
      _ -> {:error, :invalid_id}
    end
  end
  defp parse_id(id) when is_integer(id) and id > 0, do: {:ok, id}
  defp parse_id(_), do: {:error, :invalid_id}

  defp render_success(conn, data) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{
      success: true,
      data: data,
      timestamp: DateTime.utc_now()
    }))
  end

  defp render_error(conn, message, error) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(500, Jason.encode!(%{
      success: false,
      error: %{
        message: message,
        details: inspect(error)
      },
      timestamp: DateTime.utc_now()
    }))
  end

  defp render_not_found(conn, message) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(%{
      success: false,
      error: %{
        message: message
      },
      timestamp: DateTime.utc_now()
    }))
  end

  defp render_bad_request(conn, message) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(400, Jason.encode!(%{
      success: false,
      error: %{
        message: message
      },
      timestamp: DateTime.utc_now()
    }))
  end

  defp render_validation_error(conn, message, errors) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(422, Jason.encode!(%{
      success: false,
      error: %{
        message: message,
        validation_errors: errors
      },
      timestamp: DateTime.utc_now()
    }))
  end
end
