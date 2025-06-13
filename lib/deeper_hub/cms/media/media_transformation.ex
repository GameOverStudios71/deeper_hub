defmodule DeeperHub.CMS.Media.MediaTransformation do
  @moduledoc """
  Schema para transformações de mídia do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_media_transformations"

  @derive Jason.Encoder
  defstruct [
    :id, :name, :title, :description, :transformation_type, :config, :applicable_types,
    :is_active, :is_automatic, :created_at, :order_index
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      name: attrs[:name],
      title: attrs[:title],
      description: attrs[:description] || "",
      transformation_type: attrs[:transformation_type],
      config: attrs[:config] || "{}",
      applicable_types: attrs[:applicable_types] || "[]",
      is_active: attrs[:is_active] || true,
      is_automatic: attrs[:is_automatic] || false,
      created_at: attrs[:created_at],
      order_index: attrs[:order_index] || 0
    }
  end

  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  def automatic?(%__MODULE__{is_automatic: true}), do: true
  def automatic?(_), do: false

  def resize?(%__MODULE__{transformation_type: "resize"}), do: true
  def resize?(_), do: false

  def crop?(%__MODULE__{transformation_type: "crop"}), do: true
  def crop?(_), do: false

  def watermark?(%__MODULE__{transformation_type: "watermark"}), do: true
  def watermark?(_), do: false

  def compress?(%__MODULE__{transformation_type: "compress"}), do: true
  def compress?(_), do: false

  def config_map(%__MODULE__{config: config}) when is_binary(config) and config != "" do
    case Jason.decode(config) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def config_map(_), do: %{}

  def applicable_types_list(%__MODULE__{applicable_types: types}) when is_binary(types) and types != "" do
    case Jason.decode(types) do
      {:ok, list} when is_list(list) -> list
      {:error, _} -> []
    end
  end
  def applicable_types_list(_), do: []

  def applies_to_type?(%__MODULE__{} = transformation, mime_type) do
    types = applicable_types_list(transformation)
    length(types) == 0 or mime_type in types
  end

  def summary(%__MODULE__{} = transformation) do
    %{
      id: transformation.id,
      name: transformation.name,
      title: transformation.title,
      transformation_type: transformation.transformation_type,
      is_active: transformation.is_active,
      is_automatic: transformation.is_automatic,
      order_index: transformation.order_index,
      applicable_types: applicable_types_list(transformation),
      config: config_map(transformation)
    }
  end
end
