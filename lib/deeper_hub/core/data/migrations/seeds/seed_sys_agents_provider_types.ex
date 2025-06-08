defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAgentsProviderTypesSeed do
  @moduledoc """
  Seed para a tabela sys_agents_provider_types.
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
    Logger.info("Inserindo registros na tabela sys_agents_provider_types...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_agents_provider_types (id, name, title, option_prefix, active, order, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "shopify_admin", "_sys_agents_pvd_cpt_shopify_admin", "shf_adm_", 1, 1, "BxDolAIProviderShopifyAdmin", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_agents_provider_types!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_agents_provider_types: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_agents_provider_types...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_agents_provider_types")
    Logger.info("Tabela sys_agents_provider_types limpa com sucesso.", module: __MODULE__)
  end
end
