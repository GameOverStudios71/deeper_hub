defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAgentsProviderOptionsSeed do
  @moduledoc """
  Seed para a tabela sys_agents_provider_options.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_agents_provider_options_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_agents_provider_options já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_agents_provider_options...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_agents_provider_options (id, provider_type_id, name, 'type', title, description, extra, check_type, check_params, check_error, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, 1, "shf_adm_shop_domain", "text", "_sys_agents_pvd_opt_cpt_shop_domain", "_sys_agents_pvd_opt_dsc_shop_domain", "", "", "", "", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_agents_provider_options (id, provider_type_id, name, 'type', title, description, extra, check_type, check_params, check_error, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, 1, "shf_adm_access_token", "text", "_sys_agents_pvd_opt_cpt_access_token", "_sys_agents_pvd_opt_dsc_access_token", "", "", "", "", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_agents_provider_options (id, provider_type_id, name, 'type', title, description, extra, check_type, check_params, check_error, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, 1, "shf_adm_secret_key", "text", "_sys_agents_pvd_opt_cpt_secret_key", "_sys_agents_pvd_opt_dsc_secret_key", "", "", "", "", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_agents_provider_options (id, provider_type_id, name, 'type', title, description, extra, check_type, check_params, check_error, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, 1, "shf_adm_webhook_url", "value", "_sys_agents_pvd_opt_cpt_webhook_url", "_sys_agents_pvd_opt_dsc_webhook_url", "", "", "", "", 4])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_agents_provider_options executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_agents_provider_options: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_agents_provider_options...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_agents_provider_options será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_agents_provider_options...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_agents_provider_options")
    Logger.info("Tabela sys_agents_provider_options limpa com sucesso.", module: __MODULE__)
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
