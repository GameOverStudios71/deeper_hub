defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAgentsProviderOptionsSeed do
  @moduledoc """
  Seed para a tabela sys_agents_provider_options.
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
    Logger.info("Inserindo registros na tabela sys_agents_provider_options...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_agents_provider_options (id, provider_type_id, name, type, title, description, extra, check_type, check_params, check_error, order) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, 1, "shf_adm_shop_domain", "text", "_sys_agents_pvd_opt_cpt_shop_domain", "_sys_agents_pvd_opt_dsc_shop_domain", "", "", "", "", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_agents_provider_options (id, provider_type_id, name, type, title, description, extra, check_type, check_params, check_error, order) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, 1, "shf_adm_access_token", "text", "_sys_agents_pvd_opt_cpt_access_token", "_sys_agents_pvd_opt_dsc_access_token", "", "", "", "", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_agents_provider_options (id, provider_type_id, name, type, title, description, extra, check_type, check_params, check_error, order) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, 1, "shf_adm_secret_key", "text", "_sys_agents_pvd_opt_cpt_secret_key", "_sys_agents_pvd_opt_dsc_secret_key", "", "", "", "", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_agents_provider_options (id, provider_type_id, name, type, title, description, extra, check_type, check_params, check_error, order) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, 1, "shf_adm_webhook_url", "value", "_sys_agents_pvd_opt_cpt_webhook_url", "_sys_agents_pvd_opt_dsc_webhook_url", "", "", "", "", 4])
      Logger.info("Registros inseridos com sucesso na tabela sys_agents_provider_options!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_agents_provider_options: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_agents_provider_options...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_agents_provider_options")
    Logger.info("Tabela sys_agents_provider_options limpa com sucesso.", module: __MODULE__)
  end
end
