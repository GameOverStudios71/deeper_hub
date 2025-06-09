defmodule DeeperHub.Core.Data.Migrations.Seeds.SysInjectionsSeed do
  @moduledoc """
  Seed para a tabela sys_injections.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_injections_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_injections já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_injections...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_injections (id, name, page_index, 'key', 'type', data, 'replace', active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "update_cache", 150, "injection_head", "service", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:17:\"get_cache_updater\";s:6:\"params\";a:0:{}s:5:\"class\";s:19:\"TemplStudioLauncher\";}", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_injections (id, name, page_index, 'key', 'type', data, 'replace', active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_head", 0, "injection_head", "text", "", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_injections (id, name, page_index, 'key', 'type', data, 'replace', active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_body_class", 0, "injection_body_class", "service", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:13:\"get_injection\";s:6:\"params\";a:1:{i:0;s:10:\"body_class\";}s:5:\"class\";s:21:\"TemplTemplateServices\";}", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_injections (id, name, page_index, 'key', 'type', data, 'replace', active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_body", 0, "injection_footer", "text", "", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_injections (id, name, page_index, 'key', 'type', data, 'replace', active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [5, "bx_artificer_head", 0, "injection_head", "service", "a:3:{s:6:\"module\";s:12:\"bx_artificer\";s:6:\"method\";s:14:\"include_css_js\";s:6:\"params\";a:1:{i:0;s:4:\"head\";}}", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_injections (id, name, page_index, 'key', 'type', data, 'replace', active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [6, "bx_artificer_footer", 0, "injection_footer", "service", "a:3:{s:6:\"module\";s:12:\"bx_artificer\";s:6:\"method\";s:14:\"include_css_js\";s:6:\"params\";a:1:{i:0;s:6:\"footer\";}}", 0, 1])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_injections executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_injections: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_injections...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_injections será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_injections...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_injections")
    Logger.info("Tabela sys_injections limpa com sucesso.", module: __MODULE__)
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
