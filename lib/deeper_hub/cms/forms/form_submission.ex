defmodule DeeperHub.CMS.Forms.FormSubmission do
  @moduledoc """
  Schema para submissões de formulário do sistema usando db_connection.
  """

  use DeeperHub.Core.Data.SchemaBase, table_name: "cms_form_submissions"

  @derive Jason.Encoder
  defstruct [
    :id, :form_id, :submission_uuid, :user_id, :user_ip, :user_agent, :status,
    :processed_at, :processed_by, :referrer, :utm_source, :utm_medium, :utm_campaign,
    :created_at, :updated_at
  ]

  def new(attrs \\ %{}) do
    %__MODULE__{
      id: attrs[:id],
      form_id: attrs[:form_id],
      submission_uuid: attrs[:submission_uuid],
      user_id: attrs[:user_id],
      user_ip: attrs[:user_ip],
      user_agent: attrs[:user_agent] || "",
      status: attrs[:status] || "pending",
      processed_at: attrs[:processed_at],
      processed_by: attrs[:processed_by],
      referrer: attrs[:referrer] || "",
      utm_source: attrs[:utm_source] || "",
      utm_medium: attrs[:utm_medium] || "",
      utm_campaign: attrs[:utm_campaign] || "",
      created_at: attrs[:created_at],
      updated_at: attrs[:updated_at]
    }
  end

  def pending?(%__MODULE__{status: "pending"}), do: true
  def pending?(_), do: false

  def approved?(%__MODULE__{status: "approved"}), do: true
  def approved?(_), do: false

  def rejected?(%__MODULE__{status: "rejected"}), do: true
  def rejected?(_), do: false

  def spam?(%__MODULE__{status: "spam"}), do: true
  def spam?(_), do: false

  def processed?(%__MODULE__{processed_at: nil}), do: false
  def processed?(_), do: true

  def has_utm?(%__MODULE__{utm_source: source}) do
    is_binary(source) and source != ""
  end
end
