defmodule DeeperHub.CMS.Media.MediaFileTransformation do
  @moduledoc """
  Schema para transformações aplicadas a arquivos de mídia do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_media_file_transformations"

  @derive Jason.Encoder
  defstruct [
    :id, :file_id, :transformation_id, :output_file_path, :output_file_size,
    :transformation_params, :status, :error_message, :processing_time,
    :created_at, :completed_at
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      file_id: attrs[:file_id],
      transformation_id: attrs[:transformation_id],
      output_file_path: attrs[:output_file_path] || "",
      output_file_size: attrs[:output_file_size] || 0,
      transformation_params: attrs[:transformation_params] || "{}",
      status: attrs[:status] || "pending",
      error_message: attrs[:error_message] || "",
      processing_time: attrs[:processing_time] || 0,
      created_at: attrs[:created_at],
      completed_at: attrs[:completed_at]
    }
  end

  def pending?(%__MODULE__{status: "pending"}), do: true
  def pending?(_), do: false

  def processing?(%__MODULE__{status: "processing"}), do: true
  def processing?(_), do: false

  def completed?(%__MODULE__{status: "completed"}), do: true
  def completed?(_), do: false

  def failed?(%__MODULE__{status: "failed"}), do: true
  def failed?(_), do: false

  def has_output?(%__MODULE__{output_file_path: path}) do
    is_binary(path) and path != ""
  end

  def has_error?(%__MODULE__{error_message: message}) do
    is_binary(message) and message != ""
  end

  def params_map(%__MODULE__{transformation_params: params}) when is_binary(params) and params != "" do
    case Jason.decode(params) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def params_map(_), do: %{}

  def summary(%__MODULE__{} = transformation) do
    %{
      id: transformation.id,
      file_id: transformation.file_id,
      transformation_id: transformation.transformation_id,
      status: transformation.status,
      has_output: has_output?(transformation),
      has_error: has_error?(transformation),
      processing_time: transformation.processing_time,
      output_file_size: transformation.output_file_size,
      created_at: transformation.created_at,
      completed_at: transformation.completed_at
    }
  end
end
