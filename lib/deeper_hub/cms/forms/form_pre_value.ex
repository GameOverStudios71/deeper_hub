defmodule DeeperHub.CMS.Forms.FormPreValue do
  @moduledoc """
  Schema para valores de listas pré-definidas do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_form_pre_values"

  @derive Jason.Encoder
  defstruct [
    :id, :list_id, :value, :label, :description, :is_active, :is_default,
    :order_index, :extra_data, :created_at
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      list_id: attrs[:list_id],
      value: attrs[:value],
      label: attrs[:label],
      description: attrs[:description] || "",
      is_active: attrs[:is_active] || true,
      is_default: attrs[:is_default] || false,
      order_index: attrs[:order_index] || 0,
      extra_data: attrs[:extra_data] || "",
      created_at: attrs[:created_at]
    }
  end

  def active?(%__MODULE__{is_active: true}), do: true
  def active?(_), do: false

  def default?(%__MODULE__{is_default: true}), do: true
  def default?(_), do: false

  def extra_data_map(%__MODULE__{extra_data: data}) when is_binary(data) and data != "" do
    case Jason.decode(data) do
      {:ok, parsed} -> parsed
      {:error, _} -> %{}
    end
  end
  def extra_data_map(_), do: %{}
end
