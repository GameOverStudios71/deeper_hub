defmodule DeeperHub.CMS.Media.MediaFile do
  @moduledoc """
  Schema para arquivos de mídia do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_media_files"

  @derive Jason.Encoder
  defstruct [
    :id, :folder_id, :storage_id, :original_name, :file_name, :file_path, :full_path,
    :file_size, :mime_type, :file_extension, :file_hash, :image_width, :image_height,
    :video_duration, :audio_duration, :title, :description, :alt_text, :caption,
    :seo_title, :seo_description, :is_public, :visible_for_levels, :download_count,
    :view_count, :is_active, :is_featured, :created_at, :updated_at, :uploaded_by,
    :storage_title, :folder_name
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      folder_id: attrs[:folder_id],
      storage_id: attrs[:storage_id],
      original_name: attrs[:original_name],
      file_name: attrs[:file_name],
      file_path: attrs[:file_path],
      full_path: attrs[:full_path],
      file_size: attrs[:file_size],
      mime_type: attrs[:mime_type],
      file_extension: attrs[:file_extension],
      file_hash: attrs[:file_hash],
      image_width: attrs[:image_width],
      image_height: attrs[:image_height],
      video_duration: attrs[:video_duration],
      audio_duration: attrs[:audio_duration],
      title: attrs[:title] || "",
      description: attrs[:description] || "",
      alt_text: attrs[:alt_text] || "",
      caption: attrs[:caption] || "",
      seo_title: attrs[:seo_title] || "",
      seo_description: attrs[:seo_description] || "",
      is_public: attrs[:is_public] || true,
      visible_for_levels: attrs[:visible_for_levels] || 2147483647,
      download_count: attrs[:download_count] || 0,
      view_count: attrs[:view_count] || 0,
      is_active: attrs[:is_active] || true,
      is_featured: attrs[:is_featured] || false,
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at],
      uploaded_by: attrs[:uploaded_by],
      storage_title: attrs[:storage_title],
      folder_name: attrs[:folder_name]
    }
  end

  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  def public?(%__MODULE__{is_public: true}), do: true
  def public?(_), do: false

  def featured?(%__MODULE__{is_featured: true}), do: true
  def featured?(_), do: false

  def image?(%__MODULE__{mime_type: mime}) do
    String.starts_with?(mime, "image/")
  end

  def video?(%__MODULE__{mime_type: mime}) do
    String.starts_with?(mime, "video/")
  end

  def audio?(%__MODULE__{mime_type: mime}) do
    String.starts_with?(mime, "audio/")
  end

  def document?(%__MODULE__{mime_type: mime}) do
    mime in ["application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
             "application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/vnd.ms-powerpoint", "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "text/plain", "text/csv"]
  end

  def has_dimensions?(%__MODULE__{image_width: width, image_height: height}) do
    not is_nil(width) and not is_nil(height) and width > 0 and height > 0
  end

  def format_file_size(%__MODULE__{file_size: size}) do
    cond do
      size >= 1_073_741_824 -> "#{Float.round(size / 1_073_741_824, 2)} GB"
      size >= 1_048_576 -> "#{Float.round(size / 1_048_576, 2)} MB"
      size >= 1024 -> "#{Float.round(size / 1024, 2)} KB"
      true -> "#{size} bytes"
    end
  end

  def summary(%__MODULE__{} = file) do
    %{
      id: file.id,
      folder_id: file.folder_id,
      storage_id: file.storage_id,
      original_name: file.original_name,
      file_name: file.file_name,
      file_size: file.file_size,
      file_size_formatted: format_file_size(file),
      mime_type: file.mime_type,
      file_extension: file.file_extension,
      is_active: file.is_active,
      is_public: file.is_public,
      is_featured: file.is_featured,
      is_image: image?(file),
      is_video: video?(file),
      is_audio: audio?(file),
      is_document: document?(file),
      has_dimensions: has_dimensions?(file),
      download_count: file.download_count,
      view_count: file.view_count,
      storage_title: file.storage_title,
      folder_name: file.folder_name
    }
  end
end
