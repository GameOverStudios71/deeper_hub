defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAgentsModelsSeed do
  @moduledoc """
  Seed para a tabela sys_agents_models.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_agents_models_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_agents_models já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_agents_models...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_agents_models (id, name, title, 'key', params, for_asst, active, hidden, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "gpt-3.5-turbo", "GPT-3.5-TURBO", "", "{\"call\":{\"temperature\":0.1}}", 0, 1, 0, "BxDolAIModelGpt35", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_agents_models (id, name, title, 'key', params, for_asst, active, hidden, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "gpt-4o", "GPT-4.O", "", "{\"call\":{},\"assistants\":{\"event_init\":\"asst_HcEyaghqWZefkAyoEML40joY\",\"event\":\"asst_wqaXtKjcsBKceMtJ2NxID2LT\",\"scheduler_init\":\"asst_kEbDH1hUy2Y45nOKk9jaSTB8\",\"scheduler\":\"asst_M6zOv4osQwZmRItaiYptjjOS\",\"webhook_init\":\"asst_sSkOblPyXmYovS5IiEiVW17n\",\"webhook\":\"asst_w7F3RiylJfdDEb9Eaa4RvO1q\"}}", 1, 1, 0, "BxDolAIModelGpt40", ""])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_agents_models executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_agents_models: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_agents_models...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_agents_models será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_agents_models...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_agents_models")
    Logger.info("Tabela sys_agents_models limpa com sucesso.", module: __MODULE__)
  end

  # Funções privadas para controle de execução
  defp seed_already_executed? do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.exists?(seed_file)
  end

  defp mark_seed_executed do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    File.write(seed_file, "executed_at: #{timestamp}")
  end

  defp ensure_seeds_dir do
    unless File.exists?(@seeds_dir) do
      File.mkdir_p(@seeds_dir)
    end
  end
end
