defmodule DeeperHubWeb.Resources.CMS.MediaResource do
  @moduledoc """
  Recurso REST para mídia do CMS.
  Fornece endpoints para gerenciar arquivos e storages de mídia.

  Endpoints disponíveis:
  - GET /api/cms/media/storages - Lista todos os storages
  - GET /api/cms/media/storages/active - Lista storages ativos
  - GET /api/cms/media/storages/default - Obtém storage padrão
  - GET /api/cms/media/storages/:id - Obtém storage específico
  - GET /api/cms/media/folders - Lista todas as pastas
  - GET /api/cms/media/folders/storage/:id - Lista pastas por storage
  - GET /api/cms/media/files - Lista todos os arquivos
  - GET /api/cms/media/files/folder/:id - Lista arquivos por pasta
  - GET /api/cms/media/files/:id - Obtém arquivo específico
  - GET /api/cms/media/transformations - Lista transformações
  """
  use Plug.Router
  use Plug.ErrorHandler

  alias DeeperHub.CMS.Media
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
  # STORAGES
  # ============================================================================

  # GET /api/cms/media/storages - Lista todos os storages
  get "/storages" do
    Logger.info("Listando todos os storages de mídia", module: __MODULE__)

    case Media.list_media_storages() do
      {:ok, storages} ->
        response = %{
          status: "success",
          data: storages,
          count: length(storages)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar storages: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar storages de mídia",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/media/storages/active - Lista storages ativos
  get "/storages/active" do
    Logger.info("Listando storages ativos", module: __MODULE__)

    case Media.list_active_media_storages() do
      {:ok, storages} ->
        response = %{
          status: "success",
          data: storages,
          count: length(storages)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar storages ativos: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar storages ativos",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/media/storages/default - Obtém storage padrão
  get "/storages/default" do
    Logger.info("Buscando storage padrão", module: __MODULE__)

    case Media.get_default_media_storage() do
      {:ok, storage} ->
        response = %{
          status: "success",
          data: storage
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Storage padrão não encontrado"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar storage padrão: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar storage padrão",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/media/storages/:id - Obtém storage específico
  get "/storages/:id" do
    storage_id = conn.path_params["id"]
    Logger.info("Buscando storage com ID: #{storage_id}", module: __MODULE__)

    case Media.get_media_storage(storage_id) do
      {:ok, storage} ->
        response = %{
          status: "success",
          data: storage
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Storage não encontrado"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar storage #{storage_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar storage",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/media/storages - Cria novo storage
  post "/storages" do
    Logger.info("Criando novo storage de mídia", module: __MODULE__)

    case conn.body_params do
      %{} = storage_data when map_size(storage_data) > 0 ->
        storage_attrs = convert_keys_to_atoms(storage_data)

        case Media.create_media_storage(storage_attrs) do
          {:ok, storage} ->
            response = %{
              status: "success",
              message: "Storage criado com sucesso",
              data: storage
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar storage: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao criar storage",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados do storage são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # PUT /api/cms/media/storages/:id - Atualiza storage
  put "/storages/:id" do
    storage_id = conn.path_params["id"]
    Logger.info("Atualizando storage #{storage_id}", module: __MODULE__)

    case conn.body_params do
      %{} = storage_data when map_size(storage_data) > 0 ->
        storage_attrs = convert_keys_to_atoms(storage_data)

        case Media.update_media_storage(storage_id, storage_attrs) do
          {:ok, storage} ->
            response = %{
              status: "success",
              message: "Storage atualizado com sucesso",
              data: storage
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Jason.encode!(response))

          {:error, :not_found} ->
            error_response = %{
              status: "error",
              message: "Storage não encontrado"
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(404, Jason.encode!(error_response))

          {:error, reason} ->
            Logger.error("Erro ao atualizar storage #{storage_id}: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao atualizar storage",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados para atualização são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # DELETE /api/cms/media/storages/:id - Remove storage
  delete "/storages/:id" do
    storage_id = conn.path_params["id"]
    Logger.info("Removendo storage #{storage_id}", module: __MODULE__)

    case Media.delete_media_storage(storage_id) do
      {:ok, _} ->
        response = %{
          status: "success",
          message: "Storage removido com sucesso"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Storage não encontrado"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao remover storage #{storage_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao remover storage",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # ============================================================================
  # FOLDERS
  # ============================================================================

  # GET /api/cms/media/folders - Lista todas as pastas
  get "/folders" do
    Logger.info("Listando todas as pastas de mídia", module: __MODULE__)

    case Media.list_media_folders() do
      {:ok, folders} ->
        response = %{
          status: "success",
          data: folders,
          count: length(folders)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar pastas: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar pastas de mídia",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/media/folders/storage/:id - Lista pastas por storage
  get "/folders/storage/:id" do
    storage_id = conn.path_params["id"]
    Logger.info("Listando pastas do storage: #{storage_id}", module: __MODULE__)

    case Media.list_media_folders_by_storage(storage_id) do
      {:ok, folders} ->
        response = %{
          status: "success",
          data: folders,
          count: length(folders),
          storage_id: storage_id
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar pastas do storage #{storage_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar pastas do storage",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # POST /api/cms/media/folders - Cria nova pasta
  post "/folders" do
    Logger.info("Criando nova pasta de mídia", module: __MODULE__)

    case conn.body_params do
      %{} = folder_data when map_size(folder_data) > 0 ->
        folder_attrs = convert_keys_to_atoms(folder_data)

        case Media.create_media_folder(folder_attrs) do
          {:ok, folder} ->
            response = %{
              status: "success",
              message: "Pasta criada com sucesso",
              data: folder
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(201, Jason.encode!(response))

          {:error, reason} ->
            Logger.error("Erro ao criar pasta: #{inspect(reason)}", module: __MODULE__)

            error_response = %{
              status: "error",
              message: "Erro ao criar pasta",
              details: inspect(reason)
            }

            conn
            |> put_resp_content_type("application/json")
            |> send_resp(400, Jason.encode!(error_response))
        end

      _ ->
        error_response = %{
          status: "error",
          message: "Dados da pasta são obrigatórios"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(400, Jason.encode!(error_response))
    end
  end

  # ============================================================================
  # FILES
  # ============================================================================

  # GET /api/cms/media/files - Lista todos os arquivos
  get "/files" do
    Logger.info("Listando todos os arquivos de mídia", module: __MODULE__)

    case Media.list_media_files() do
      {:ok, files} ->
        response = %{
          status: "success",
          data: files,
          count: length(files)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar arquivos: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar arquivos de mídia",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/media/files/folder/:id - Lista arquivos por pasta
  get "/files/folder/:id" do
    folder_id = conn.path_params["id"]
    Logger.info("Listando arquivos da pasta: #{folder_id}", module: __MODULE__)

    case Media.list_media_files_by_folder(folder_id) do
      {:ok, files} ->
        response = %{
          status: "success",
          data: files,
          count: length(files),
          folder_id: folder_id
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar arquivos da pasta #{folder_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar arquivos da pasta",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/media/files/:id - Obtém arquivo específico
  get "/files/:id" do
    file_id = conn.path_params["id"]
    Logger.info("Buscando arquivo com ID: #{file_id}", module: __MODULE__)

    case Media.get_media_file(file_id) do
      {:ok, file} ->
        response = %{
          status: "success",
          data: file
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, :not_found} ->
        error_response = %{
          status: "error",
          message: "Arquivo não encontrado"
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(404, Jason.encode!(error_response))

      {:error, reason} ->
        Logger.error("Erro ao buscar arquivo #{file_id}: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao buscar arquivo",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # ============================================================================
  # TRANSFORMATIONS
  # ============================================================================

  # GET /api/cms/media/transformations - Lista transformações
  get "/transformations" do
    Logger.info("Listando transformações de mídia", module: __MODULE__)

    case Media.list_media_transformations() do
      {:ok, transformations} ->
        response = %{
          status: "success",
          data: transformations,
          count: length(transformations)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar transformações: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar transformações",
          details: inspect(reason)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(500, Jason.encode!(error_response))
    end
  end

  # GET /api/cms/media/file-transformations - Lista transformações aplicadas a arquivos
  get "/file-transformations" do
    Logger.info("Listando transformações aplicadas a arquivos", module: __MODULE__)

    case Media.list_media_file_transformations() do
      {:ok, file_transformations} ->
        response = %{
          status: "success",
          data: file_transformations,
          count: length(file_transformations)
        }

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, Jason.encode!(response))

      {:error, reason} ->
        Logger.error("Erro ao listar transformações de arquivos: #{inspect(reason)}", module: __MODULE__)

        error_response = %{
          status: "error",
          message: "Erro ao listar transformações de arquivos",
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
    |> send_resp(404, Jason.encode!(%{erro: "Rota de mídia não encontrada"}))
  end

  # ============================================================================
  # HELPERS PRIVADOS
  # ============================================================================

  defp convert_keys_to_atoms(map) when is_map(map) do
    Map.new(map, fn {key, value} ->
      atom_key = if is_binary(key), do: String.to_atom(key), else: key
      {atom_key, value}
    end)
  end
end
