defmodule DeeperHub.CMS.Forms.FormSubmissionData do
  @moduledoc """
  Schema para dados de submissões de formulário do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_form_submission_data"

  @derive Jason.Encoder
  defstruct [
    :id, :submission_id, :field_id, :field_name, :field_value, :field_type, :created_at
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      submission_id: attrs[:submission_id],
      field_id: attrs[:field_id],
      field_name: attrs[:field_name],
      field_value: attrs[:field_value] || "",
      field_type: attrs[:field_type] || "text",
      created_at: attrs[:created_at]
    }
  end

  def has_value?(%__MODULE__{field_value: value}) do
    is_binary(value) and String.trim(value) != ""
  end

  def typed_value(%__MODULE__{field_value: value, field_type: type}) do
    case type do
      "number" ->
        case Float.parse(value) do
          {num, ""} -> num
          _ -> 0
        end
      "boolean" ->
        value in ["true", "1", "yes", "on"]
      "json" ->
        case Jason.decode(value) do
          {:ok, parsed} -> parsed
          {:error, _} -> %{}
        end
      _ ->
        value
    end
  end
end
