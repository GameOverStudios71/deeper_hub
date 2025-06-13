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
end
