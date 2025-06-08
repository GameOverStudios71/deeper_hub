defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAgentsModelsSeed do
  @moduledoc """
  Seed para a tabela sys_agents_models.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_agents_models...")

    Repo.execute("INSERT INTO sys_agents_models (id, name, title, key, params, for_asst, active, hidden, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "gpt-3.5-turbo", "GPT-3.5-TURBO", "", "{\"call\":{\"temperature\":0.1}}", 0, 1, 0, "BxDolAIModelGpt35", ""])
    Repo.execute("INSERT INTO sys_agents_models (id, name, title, key, params, for_asst, active, hidden, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "gpt-4o", "GPT-4.O", "", "{\"call\":{},\"assistants\":{\"event_init\":\"asst_HcEyaghqWZefkAyoEML40joY\",\"event\":\"asst_wqaXtKjcsBKceMtJ2NxID2LT\",\"scheduler_init\":\"asst_kEbDH1hUy2Y45nOKk9jaSTB8\",\"scheduler\":\"asst_M6zOv4osQwZmRItaiYptjjOS\",\"webhook_init\":\"asst_sSkOblPyXmYovS5IiEiVW17n\",\"webhook\":\"asst_w7F3RiylJfdDEb9Eaa4RvO1q\"}}", 1, 1, 0, "BxDolAIModelGpt40", ""])

    IO.puts("Registros inseridos com sucesso!")
  end
end
