defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAlertsCacheTriggersSeed do
  @moduledoc """
  Seed para a tabela sys_alerts_cache_triggers.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_alerts_cache_triggers_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_alerts_cache_triggers já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_alerts_cache_triggers...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_alerts_cache_triggers (id, unit, 'action', cache_key) VALUES (?, ?, ?, ?)", [1, "sys_profiles_subscriptions", "connection_added", "menu_sys_profile_stats_profile-stats-subscribed-me_{content}_{_hash}.php"])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_alerts_cache_triggers executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_alerts_cache_triggers: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_alerts_cache_triggers...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_alerts_cache_triggers...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_alerts_cache_triggers")
    Logger.info("Tabela sys_alerts_cache_triggers limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
