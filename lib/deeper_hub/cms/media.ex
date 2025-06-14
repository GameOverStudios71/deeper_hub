defmodule DeeperHub.CMS.Media do
  @moduledoc """
  Contexto para gerenciar mídia do CMS usando db_connection.
  """

  alias DeeperHub.Core.Data.Connection
  alias DeeperHub.CMS.Media.{MediaStorage, MediaFolder, MediaFile, MediaTransformation}

  # ============================================================================
  # MEDIA STORAGE
  # ============================================================================

  @doc """
  Lista todos os storages de mídia.
  """
  def list_media_storages do
    sql = """
    SELECT id, name, title, description, storage_type, config, base_url, base_path,
           max_file_size, allowed_extensions, quota_limit, quota_used, is_active,
           is_default, is_public, created_at, updated_at
    FROM cms_media_storage
    ORDER BY is_default DESC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        storages = Enum.map(rows, &row_to_media_storage/1)
        {:ok, storages}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista storages ativos.
  """
  def list_active_media_storages do
    sql = """
    SELECT id, name, title, description, storage_type, config, base_url, base_path,
           max_file_size, allowed_extensions, quota_limit, quota_used, is_active,
           is_default, is_public, created_at, updated_at
    FROM cms_media_storage
    WHERE is_active = true
    ORDER BY is_default DESC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        storages = Enum.map(rows, &row_to_media_storage/1)
        {:ok, storages}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca storage por ID.
  """
  def get_media_storage(id) do
    sql = """
    SELECT id, name, title, description, storage_type, config, base_url, base_path,
           max_file_size, allowed_extensions, quota_limit, quota_used, is_active,
           is_default, is_public, created_at, updated_at
    FROM cms_media_storage
    WHERE id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        storage = row_to_media_storage(row)
        {:ok, storage}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Busca storage padrão.
  """
  def get_default_media_storage do
    sql = """
    SELECT id, name, title, description, storage_type, config, base_url, base_path,
           max_file_size, allowed_extensions, quota_limit, quota_used, is_active,
           is_default, is_public, created_at, updated_at
    FROM cms_media_storage
    WHERE is_default = true AND is_active = true
    LIMIT 1
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: [row]}} ->
        storage = row_to_media_storage(row)
        {:ok, storage}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo storage de mídia.
  """
  def create_media_storage(attrs) do
    case MediaStorage.validate(attrs) do
      {:ok, validated_attrs} ->
        sql = """
        INSERT INTO cms_media_storage
        (name, title, description, storage_type, config, base_url, base_path,
         max_file_size, allowed_extensions, quota_limit, quota_used, is_active,
         is_default, is_public, created_at, updated_at)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16)
        RETURNING id
        """

        now = DateTime.utc_now() |> DateTime.to_iso8601()

        params = [
          validated_attrs[:name],
          validated_attrs[:title],
          validated_attrs[:description] || "",
          validated_attrs[:storage_type],
          validated_attrs[:config] || "{}",
          validated_attrs[:base_url] || "",
          validated_attrs[:base_path] || "",
          validated_attrs[:max_file_size] || 10485760,
          validated_attrs[:allowed_extensions] || "[]",
          validated_attrs[:quota_limit] || 0,
          validated_attrs[:quota_used] || 0,
          validated_attrs[:is_active] || true,
          validated_attrs[:is_default] || false,
          validated_attrs[:is_public] || true,
          now,
          now
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_media_storage(id)
          {:error, error} ->
            {:error, error}
        end

      {:error, errors} ->
        {:error, errors}
    end
  end

  @doc """
  Atualiza um storage de mídia.
  """
  def update_media_storage(id, attrs) do
    case get_media_storage(id) do
      {:ok, _storage} ->
        case MediaStorage.validate(attrs) do
          {:ok, validated_attrs} ->
            sql = """
            UPDATE cms_media_storage
            SET name = $2, title = $3, description = $4, storage_type = $5,
                config = $6, base_url = $7, base_path = $8, max_file_size = $9,
                allowed_extensions = $10, quota_limit = $11, quota_used = $12,
                is_active = $13, is_default = $14, is_public = $15, updated_at = $16
            WHERE id = $1
            """

            now = DateTime.utc_now() |> DateTime.to_iso8601()

            params = [
              id,
              validated_attrs[:name],
              validated_attrs[:title],
              validated_attrs[:description] || "",
              validated_attrs[:storage_type],
              validated_attrs[:config] || "{}",
              validated_attrs[:base_url] || "",
              validated_attrs[:base_path] || "",
              validated_attrs[:max_file_size] || 10485760,
              validated_attrs[:allowed_extensions] || "[]",
              validated_attrs[:quota_limit] || 0,
              validated_attrs[:quota_used] || 0,
              validated_attrs[:is_active] || true,
              validated_attrs[:is_default] || false,
              validated_attrs[:is_public] || true,
              now
            ]

            case Connection.query(sql, params) do
              {:ok, _} ->
                get_media_storage(id)
              {:error, error} ->
                {:error, error}
            end

          {:error, errors} ->
            {:error, errors}
        end

      {:error, :not_found} ->
        {:error, :not_found}
    end
  end

  @doc """
  Remove um storage de mídia.
  """
  def delete_media_storage(id) do
    case get_media_storage(id) do
      {:ok, storage} ->
        sql = "DELETE FROM cms_media_storage WHERE id = $1"

        case Connection.query(sql, [id]) do
          {:ok, _} ->
            {:ok, storage}
          {:error, error} ->
            {:error, error}
        end

      {:error, :not_found} ->
        {:error, :not_found}
    end
  end

  # ============================================================================
  # MEDIA FOLDERS
  # ============================================================================

  @doc """
  Lista todas as pastas de mídia.
  """
  def list_media_folders do
    sql = """
    SELECT mf.id, mf.parent_id, mf.storage_id, mf.name, mf.path, mf.full_path,
           mf.description, mf.is_public, mf.visible_for_levels, mf.is_active,
           mf.is_system, mf.created_at, mf.updated_at, mf.created_by,
           ms.title as storage_title
    FROM cms_media_folders mf
    LEFT JOIN cms_media_storage ms ON mf.storage_id = ms.id
    ORDER BY mf.parent_id ASC, mf.name ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        folders = Enum.map(rows, &row_to_media_folder/1)
        {:ok, folders}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista pastas de um storage específico.
  """
  def list_media_folders_by_storage(storage_id) do
    sql = """
    SELECT mf.id, mf.parent_id, mf.storage_id, mf.name, mf.path, mf.full_path,
           mf.description, mf.is_public, mf.visible_for_levels, mf.is_active,
           mf.is_system, mf.created_at, mf.updated_at, mf.created_by,
           ms.title as storage_title
    FROM cms_media_folders mf
    LEFT JOIN cms_media_storage ms ON mf.storage_id = ms.id
    WHERE mf.storage_id = $1 AND mf.is_active = true
    ORDER BY mf.parent_id ASC, mf.name ASC
    """

    case Connection.query(sql, [storage_id]) do
      {:ok, %{rows: rows}} ->
        folders = Enum.map(rows, &row_to_media_folder/1)
        {:ok, folders}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria uma nova pasta de mídia.
  """
  def create_media_folder(attrs) do
    # Validação básica
    name = attrs[:name]
    storage_id = attrs[:storage_id]

    cond do
      not is_binary(name) or String.trim(name) == "" ->
        {:error, ["Nome da pasta é obrigatório"]}

      not is_integer(storage_id) and not is_binary(storage_id) ->
        {:error, ["Storage ID é obrigatório"]}

      true ->
        sql = """
        INSERT INTO cms_media_folders
        (parent_id, storage_id, name, path, full_path, description, is_public, is_active, created_at, updated_at)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
        RETURNING id
        """

        now = DateTime.utc_now() |> DateTime.to_iso8601()
        parent_id = attrs[:parent_id]

        # Construir path e full_path baseado no parent
        {path, full_path} = if parent_id do
          case get_media_folder(parent_id) do
            {:ok, parent_folder} ->
              path = "#{parent_folder.path}/#{name}"
              full_path = "#{parent_folder.full_path}/#{name}"
              {path, full_path}
            _ ->
              {name, name}
          end
        else
          {name, name}
        end

        params = [
          parent_id,
          storage_id,
          name,
          path,
          full_path,
          attrs[:description] || "",
          attrs[:is_public] || true,
          attrs[:is_active] || true,
          now,
          now
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_media_folder(id)
          {:error, error} ->
            {:error, error}
        end
    end
  end

  @doc """
  Busca pasta por ID.
  """
  def get_media_folder(id) do
    sql = """
    SELECT f.id, f.parent_id, f.storage_id, f.name, f.path, f.full_path,
           f.description, f.is_public, f.visible_for_levels, f.is_active,
           f.is_system, f.created_at, f.updated_at, f.created_by,
           s.title as storage_title
    FROM cms_media_folders f
    LEFT JOIN cms_media_storage s ON f.storage_id = s.id
    WHERE f.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        folder = row_to_media_folder(row)
        {:ok, folder}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # MEDIA FILES
  # ============================================================================

  @doc """
  Lista todos os arquivos de mídia.
  """
  def list_media_files do
    sql = """
    SELECT mf.id, mf.folder_id, mf.storage_id, mf.original_name, mf.file_name,
           mf.file_path, mf.full_path, mf.file_size, mf.mime_type, mf.file_extension,
           mf.file_hash, mf.image_width, mf.image_height, mf.video_duration,
           mf.audio_duration, mf.title, mf.description, mf.alt_text, mf.caption,
           mf.seo_title, mf.seo_description, mf.is_public, mf.visible_for_levels,
           mf.download_count, mf.view_count, mf.is_active, mf.is_featured,
           mf.created_at, mf.updated_at, mf.uploaded_by,
           ms.title as storage_title, folder.name as folder_name
    FROM cms_media_files mf
    LEFT JOIN cms_media_storage ms ON mf.storage_id = ms.id
    LEFT JOIN cms_media_folders folder ON mf.folder_id = folder.id
    ORDER BY mf.created_at DESC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        files = Enum.map(rows, &row_to_media_file/1)
        {:ok, files}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista arquivos por pasta.
  """
  def list_media_files_by_folder(folder_id) do
    sql = """
    SELECT mf.id, mf.folder_id, mf.storage_id, mf.original_name, mf.file_name,
           mf.file_path, mf.full_path, mf.file_size, mf.mime_type, mf.file_extension,
           mf.file_hash, mf.image_width, mf.image_height, mf.video_duration,
           mf.audio_duration, mf.title, mf.description, mf.alt_text, mf.caption,
           mf.seo_title, mf.seo_description, mf.is_public, mf.visible_for_levels,
           mf.download_count, mf.view_count, mf.is_active, mf.is_featured,
           mf.created_at, mf.updated_at, mf.uploaded_by,
           ms.title as storage_title, folder.name as folder_name
    FROM cms_media_files mf
    LEFT JOIN cms_media_storage ms ON mf.storage_id = ms.id
    LEFT JOIN cms_media_folders folder ON mf.folder_id = folder.id
    WHERE mf.folder_id = $1 AND mf.is_active = true
    ORDER BY mf.created_at DESC
    """

    case Connection.query(sql, [folder_id]) do
      {:ok, %{rows: rows}} ->
        files = Enum.map(rows, &row_to_media_file/1)
        {:ok, files}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Cria um novo arquivo de mídia.
  """
  def create_media_file(attrs) do
    # Validação básica
    original_name = attrs[:original_name]
    storage_id = attrs[:storage_id]
    file_size = attrs[:file_size]
    mime_type = attrs[:mime_type]

    cond do
      not is_binary(original_name) or String.trim(original_name) == "" ->
        {:error, ["Nome do arquivo é obrigatório"]}

      not is_integer(storage_id) and not is_binary(storage_id) ->
        {:error, ["Storage ID é obrigatório"]}

      not is_integer(file_size) and not is_binary(file_size) ->
        {:error, ["Tamanho do arquivo é obrigatório"]}

      not is_binary(mime_type) or String.trim(mime_type) == "" ->
        {:error, ["Tipo MIME é obrigatório"]}

      true ->
        sql = """
        INSERT INTO cms_media_files
        (folder_id, storage_id, original_name, file_name, file_path, full_path, file_size,
         mime_type, file_extension, file_hash, title, description, alt_text, caption,
         seo_title, seo_description, is_public, is_active, is_featured, created_at, updated_at, uploaded_by)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22)
        RETURNING id
        """

        now = DateTime.utc_now() |> DateTime.to_iso8601()

        # Gerar nome do arquivo e extensão
        file_name = attrs[:file_name] || original_name
        file_extension = attrs[:file_extension] || Path.extname(original_name) |> String.trim_leading(".")

        # Gerar paths
        file_path = attrs[:file_path] || "/uploads/#{file_name}"
        full_path = attrs[:full_path] || file_path

        # Gerar hash (simulado)
        file_hash = attrs[:file_hash] || :crypto.hash(:sha256, original_name <> now) |> Base.encode16(case: :lower)

        params = [
          attrs[:folder_id],
          storage_id,
          original_name,
          file_name,
          file_path,
          full_path,
          file_size,
          mime_type,
          file_extension,
          file_hash,
          attrs[:title] || "",
          attrs[:description] || "",
          attrs[:alt_text] || "",
          attrs[:caption] || "",
          attrs[:seo_title] || "",
          attrs[:seo_description] || "",
          attrs[:is_public] || true,
          attrs[:is_active] || true,
          attrs[:is_featured] || false,
          now,
          now,
          attrs[:uploaded_by] || 1
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_media_file(id)
          {:error, error} ->
            {:error, error}
        end
    end
  end

  @doc """
  Busca arquivo por ID.
  """
  def get_media_file(id) do
    sql = """
    SELECT mf.id, mf.folder_id, mf.storage_id, mf.original_name, mf.file_name,
           mf.file_path, mf.full_path, mf.file_size, mf.mime_type, mf.file_extension,
           mf.file_hash, mf.image_width, mf.image_height, mf.video_duration,
           mf.audio_duration, mf.title, mf.description, mf.alt_text, mf.caption,
           mf.seo_title, mf.seo_description, mf.is_public, mf.visible_for_levels,
           mf.download_count, mf.view_count, mf.is_active, mf.is_featured,
           mf.created_at, mf.updated_at, mf.uploaded_by,
           ms.title as storage_title, folder.name as folder_name
    FROM cms_media_files mf
    LEFT JOIN cms_media_storage ms ON mf.storage_id = ms.id
    LEFT JOIN cms_media_folders folder ON mf.folder_id = folder.id
    WHERE mf.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        file = row_to_media_file(row)
        {:ok, file}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # MEDIA TRANSFORMATIONS
  # ============================================================================

  @doc """
  Cria uma nova transformação de mídia.
  """
  def create_media_transformation(attrs) do
    # Validação básica
    name = attrs[:name]
    title = attrs[:title]
    transformation_type = attrs[:transformation_type]

    cond do
      not is_binary(name) or String.trim(name) == "" ->
        {:error, ["Nome da transformação é obrigatório"]}

      not is_binary(title) or String.trim(title) == "" ->
        {:error, ["Título da transformação é obrigatório"]}

      not is_binary(transformation_type) or String.trim(transformation_type) == "" ->
        {:error, ["Tipo de transformação é obrigatório"]}

      true ->
        sql = """
        INSERT INTO cms_media_transformations
        (name, title, description, transformation_type, config, applicable_types, is_active, is_automatic, order_index, created_at)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
        RETURNING id
        """

        now = DateTime.utc_now() |> DateTime.to_iso8601()

        params = [
          name,
          title,
          attrs[:description] || "",
          transformation_type,
          attrs[:config] || "{}",
          attrs[:applicable_types] || "[\"*/*\"]",
          attrs[:is_active] || true,
          attrs[:is_automatic] || false,
          attrs[:order_index] || 0,
          now
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_media_transformation(id)
          {:error, error} ->
            {:error, error}
        end
    end
  end

  @doc """
  Busca transformação por ID.
  """
  def get_media_transformation(id) do
    sql = """
    SELECT id, name, title, description, transformation_type, config, applicable_types,
           is_active, is_automatic, created_at, order_index
    FROM cms_media_transformations
    WHERE id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        transformation = row_to_media_transformation(row)
        {:ok, transformation}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista todas as transformações.
  """
  def list_media_transformations do
    sql = """
    SELECT id, name, title, description, transformation_type, config, applicable_types,
           is_active, is_automatic, created_at, order_index
    FROM cms_media_transformations
    ORDER BY order_index ASC, title ASC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        transformations = Enum.map(rows, &row_to_media_transformation/1)
        {:ok, transformations}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # MEDIA FILE TRANSFORMATIONS
  # ============================================================================

  @doc """
  Cria uma nova transformação aplicada a arquivo.
  """
  def create_media_file_transformation(attrs) do
    # Validação básica
    original_file_id = attrs[:original_file_id]
    transformation_id = attrs[:transformation_id]

    cond do
      not is_integer(original_file_id) and not is_binary(original_file_id) ->
        {:error, ["ID do arquivo original é obrigatório"]}

      not is_integer(transformation_id) and not is_binary(transformation_id) ->
        {:error, ["ID da transformação é obrigatório"]}

      true ->
        sql = """
        INSERT INTO cms_media_file_transformations
        (original_file_id, transformation_id, file_name, file_path, full_path, file_size, status, created_at)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
        RETURNING id
        """

        now = DateTime.utc_now() |> DateTime.to_iso8601()

        # Valores padrão para campos obrigatórios
        file_name = attrs[:file_name] || "pending_transformation"
        file_path = attrs[:file_path] || "/tmp/pending"
        full_path = attrs[:full_path] || "/tmp/pending_transformation"
        file_size = attrs[:file_size] || 0

        params = [
          original_file_id,
          transformation_id,
          file_name,
          file_path,
          full_path,
          file_size,
          attrs[:status] || "pending",
          now
        ]

        case Connection.query(sql, params) do
          {:ok, %{rows: [[id]]}} ->
            get_media_file_transformation(id)
          {:error, error} ->
            {:error, error}
        end
    end
  end

  @doc """
  Busca transformação de arquivo por ID.
  """
  def get_media_file_transformation(id) do
    sql = """
    SELECT ft.id, ft.original_file_id, ft.transformation_id, ft.file_path,
           ft.file_size, ft.status, ft.error_message, ft.created_at, ft.completed_at,
           f.original_name as file_name, t.name as transformation_name
    FROM cms_media_file_transformations ft
    LEFT JOIN cms_media_files f ON ft.original_file_id = f.id
    LEFT JOIN cms_media_transformations t ON ft.transformation_id = t.id
    WHERE ft.id = $1
    """

    case Connection.query(sql, [id]) do
      {:ok, %{rows: [row]}} ->
        file_transformation = row_to_media_file_transformation(row)
        {:ok, file_transformation}
      {:ok, %{rows: []}} ->
        {:error, :not_found}
      {:error, error} ->
        {:error, error}
    end
  end

  @doc """
  Lista todas as transformações aplicadas a arquivos.
  """
  def list_media_file_transformations do
    sql = """
    SELECT ft.id, ft.original_file_id, ft.transformation_id, ft.file_path,
           ft.file_size, ft.status, ft.error_message, ft.created_at, ft.completed_at,
           f.original_name as file_name, t.name as transformation_name
    FROM cms_media_file_transformations ft
    LEFT JOIN cms_media_files f ON ft.original_file_id = f.id
    LEFT JOIN cms_media_transformations t ON ft.transformation_id = t.id
    ORDER BY ft.created_at DESC
    """

    case Connection.query(sql, []) do
      {:ok, %{rows: rows}} ->
        file_transformations = Enum.map(rows, &row_to_media_file_transformation/1)
        {:ok, file_transformations}
      {:error, error} ->
        {:error, error}
    end
  end

  # ============================================================================
  # HELPERS PRIVADOS
  # ============================================================================

  defp row_to_media_storage([id, name, title, description, storage_type, config, base_url, base_path,
                             max_file_size, allowed_extensions, quota_limit, quota_used, is_active,
                             is_default, is_public, created_at, updated_at]) do
    MediaStorage.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      storage_type: storage_type,
      config: config,
      base_url: base_url,
      base_path: base_path,
      max_file_size: max_file_size,
      allowed_extensions: allowed_extensions,
      quota_limit: quota_limit,
      quota_used: quota_used,
      is_active: is_active,
      is_default: is_default,
      is_public: is_public,
      created_at: created_at,
      updated_at: updated_at
    })
  end

  defp row_to_media_folder([id, parent_id, storage_id, name, path, full_path,
                            description, is_public, visible_for_levels, is_active,
                            is_system, created_at, updated_at, created_by, storage_title]) do
    MediaFolder.new(%{
      id: id,
      parent_id: parent_id,
      storage_id: storage_id,
      name: name,
      path: path,
      full_path: full_path,
      description: description,
      is_public: is_public,
      visible_for_levels: visible_for_levels,
      is_active: is_active,
      is_system: is_system,
      created_at: created_at,
      updated_at: updated_at,
      created_by: created_by,
      storage_title: storage_title
    })
  end

  defp row_to_media_file([id, folder_id, storage_id, original_name, file_name,
                          file_path, full_path, file_size, mime_type, file_extension,
                          file_hash, image_width, image_height, video_duration,
                          audio_duration, title, description, alt_text, caption,
                          seo_title, seo_description, is_public, visible_for_levels,
                          download_count, view_count, is_active, is_featured,
                          created_at, updated_at, uploaded_by, storage_title, folder_name]) do
    MediaFile.new(%{
      id: id,
      folder_id: folder_id,
      storage_id: storage_id,
      original_name: original_name,
      file_name: file_name,
      file_path: file_path,
      full_path: full_path,
      file_size: file_size,
      mime_type: mime_type,
      file_extension: file_extension,
      file_hash: file_hash,
      image_width: image_width,
      image_height: image_height,
      video_duration: video_duration,
      audio_duration: audio_duration,
      title: title,
      description: description,
      alt_text: alt_text,
      caption: caption,
      seo_title: seo_title,
      seo_description: seo_description,
      is_public: is_public,
      visible_for_levels: visible_for_levels,
      download_count: download_count,
      view_count: view_count,
      is_active: is_active,
      is_featured: is_featured,
      created_at: created_at,
      updated_at: updated_at,
      uploaded_by: uploaded_by,
      storage_title: storage_title,
      folder_name: folder_name
    })
  end

  defp row_to_media_transformation([id, name, title, description, transformation_type, config, applicable_types,
                                    is_active, is_automatic, created_at, order_index]) do
    MediaTransformation.new(%{
      id: id,
      name: name,
      title: title,
      description: description,
      transformation_type: transformation_type,
      config: config,
      applicable_types: applicable_types,
      is_active: is_active,
      is_automatic: is_automatic,
      created_at: created_at,
      order_index: order_index
    })
  end

  defp row_to_media_file_transformation([id, original_file_id, transformation_id, file_path,
                                         file_size, status, error_message, created_at, completed_at,
                                         file_name, transformation_name]) do
    %{
      id: id,
      original_file_id: original_file_id,
      transformation_id: transformation_id,
      output_path: file_path,
      file_size: file_size,
      status: status,
      error_message: error_message,
      created_at: created_at,
      completed_at: completed_at,
      file_name: file_name,
      transformation_name: transformation_name
    }
  end
end
