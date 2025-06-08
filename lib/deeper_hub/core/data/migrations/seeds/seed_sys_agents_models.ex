defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAgentsModelsSeed do
  @moduledoc """
  Seed para a tabela sys_agents_models.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Insere os registros na tabela.
  Usa INSERT OR REPLACE para evitar erros de UNIQUE CONSTRAINT.
  """
  def run do
    Logger.info("Inserindo registros na tabela sys_agents_models...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_agents_models (id, name, title, key, params, for_asst, active, hidden, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "gpt-3.5-turbo", "GPT-3.5-TURBO", "", "{\"call\":{\"temperature\":0.1}}", 0, 1, 0, "BxDolAIModelGpt35", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_agents_models (id, name, title, key, params, for_asst, active, hidden, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "gpt-4o", "GPT-4.O", "", "{\"call\":{},\"assistants\":{\"event_init\":\"asst_HcEyaghqWZefkAyoEML40joY\",\"event\":\"asst_wqaXtKjcsBKceMtJ2NxID2LT\",\"scheduler_init\":\"asst_kEbDH1hUy2Y45nOKk9jaSTB8\",\"scheduler\":\"asst_M6zOv4osQwZmRItaiYptjjOS\",\"webhook_init\":\"asst_sSkOblPyXmYovS5IiEiVW17n\",\"webhook\":\"asst_w7F3RiylJfdDEb9Eaa4RvO1q\"}}", 1, 1, 0, "BxDolAIModelGpt40", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_agents_models!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_agents_models: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_agents_models...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_agents_models")
    Logger.info("Tabela sys_agents_models limpa com sucesso.", module: __MODULE__)
  end
end
