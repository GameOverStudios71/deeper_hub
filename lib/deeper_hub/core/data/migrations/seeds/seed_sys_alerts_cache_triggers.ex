defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAlertsCacheTriggersSeed do
  @moduledoc """
  Seed para a tabela sys_alerts_cache_triggers.
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
    Logger.info("Inserindo registros na tabela sys_alerts_cache_triggers...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_alerts_cache_triggers (id, unit, 'action', cache_key) VALUES (?, ?, ?, ?)", [1, "sys_profiles_subscriptions", "connection_added", "menu_sys_profile_stats_profile-stats-subscribed-me_{content}_{_hash}.php"])
      Logger.info("Registros inseridos com sucesso na tabela sys_alerts_cache_triggers!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_alerts_cache_triggers: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_alerts_cache_triggers...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_alerts_cache_triggers")
    Logger.info("Tabela sys_alerts_cache_triggers limpa com sucesso.", module: __MODULE__)
  end
end
