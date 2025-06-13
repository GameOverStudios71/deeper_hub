defmodule DeeperHub.CMS.Forms.FormDisplayField do
  @moduledoc """
  Schema para campos por modo de exibição do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_form_display_fields"

  @derive Jason.Encoder
  defstruct [
    :id, :display_id, :field_id, :order_index, :column_index, :row_index,
    :css_class, :wrapper_class, :width, :is_visible, :is_readonly, :is_collapsed, :created_at
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      display_id: attrs[:display_id],
      field_id: attrs[:field_id],
      order_index: attrs[:order_index] || 0,
      column_index: attrs[:column_index] || 1,
      row_index: attrs[:row_index] || 0,
      css_class: attrs[:css_class] || "",
      wrapper_class: attrs[:wrapper_class] || "",
      width: attrs[:width] || "auto",
      is_visible: attrs[:is_visible] || true,
      is_readonly: attrs[:is_readonly] || false,
      is_collapsed: attrs[:is_collapsed] || false,
      created_at: attrs[:created_at]
    }
  end

  def visible?(%__MODULE__{is_visible: true}), do: true
  def visible?(_), do: false

  def readonly?(%__MODULE__{is_readonly: true}), do: true
  def readonly?(_), do: false

  def collapsed?(%__MODULE__{is_collapsed: true}), do: true
  def collapsed?(_), do: false
end
