defmodule DeeperHub.Core.Data.Migrations.Seeds.SysSessionsSeed do
  @moduledoc """
  Seed para a tabela sys_sessions.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_sessions_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_sessions já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_sessions...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_sessions (id, user_id, data, date) VALUES (?, ?, ?, ?)", ["Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz", 1, "a:2:{s:18:\"sys_studio_history\";a:4:{s:5:\"store\";a:5:{s:4:\"name\";s:5:\"store\";s:4:\"icon\";s:12:\"wi-store.svg\";s:4:\"link\";s:21:\"{url_studio}store.php\";s:7:\"onclick\";s:0:\"\";s:5:\"title\";s:18:\"_adm_wgt_cpt_store\";}s:9:\"dashboard\";a:5:{s:4:\"name\";s:9:\"dashboard\";s:4:\"icon\";s:16:\"wi-dashboard.svg\";s:4:\"link\";s:25:\"{url_studio}dashboard.php\";s:7:\"onclick\";s:0:\"\";s:5:\"title\";s:22:\"_adm_wgt_cpt_dashboard\";}s:11:\"bx_profiler\";a:5:{s:4:\"name\";s:11:\"bx_profiler\";s:4:\"icon\";s:49:\"bx_profiler@modules/boonex/profiler/|std-icon.svg\";s:4:\"link\";s:39:\"{url_studio}module.php?name=bx_profiler\";s:7:\"onclick\";s:0:\"\";s:5:\"title\";s:12:\"_bx_profiler\";}s:8:\"settings\";a:5:{s:4:\"name\";s:8:\"settings\";s:4:\"icon\";s:15:\"wi-settings.svg\";s:4:\"link\";s:24:\"{url_studio}settings.php\";s:7:\"onclick\";s:0:\"\";s:5:\"title\";s:21:\"_adm_wgt_cpt_settings\";}}s:16:\"sys_entrance_url\";s:21:\"http://localhost/una/\";}", 1749385393])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_sessions executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_sessions: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_sessions...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_sessions será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_sessions...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_sessions")
    Logger.info("Tabela sys_sessions limpa com sucesso.", module: __MODULE__)
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
