defmodule DeeperHub.Core.Data.Migrations.Seeds.SysRewriteRulesSeed do
  @moduledoc """
  Seed para a tabela sys_rewrite_rules.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_rewrite_rules_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_rewrite_rules já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_rewrite_rules...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_rewrite_rules (id, preg, service, active) VALUES (?, ?, ?, ?)", [1, "^sys-action/(.*)$", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"wiki_action\";s:6:\"params\";a:2:{i:0;s:3:\"sys\";i:1;s:3:\"{1}\";}s:5:\"class\";s:16:\"TemplServiceWiki\";}", 1])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_rewrite_rules executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_rewrite_rules: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_rewrite_rules...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_rewrite_rules será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_rewrite_rules...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_rewrite_rules")
    Logger.info("Tabela sys_rewrite_rules limpa com sucesso.", module: __MODULE__)
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
