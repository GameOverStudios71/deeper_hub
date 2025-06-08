defmodule DeeperHub.Core.Data.Migrations.Seeds.SysRecommendationCriteriaSeed do
  @moduledoc """
  Seed para a tabela sys_recommendation_criteria.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_recommendation_criteria_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_recommendation_criteria já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_recommendation_criteria...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, 1, "mutual_friends", "sql", "SELECT `tff`.`initiator` AS `id`, SUM({points}) AS `value` FROM `sys_profiles_conn_friends` AS `tf` INNER JOIN `sys_profiles_conn_friends` AS `tff` ON `tf`.`content`=`tff`.`content` AND `tff`.`initiator`<>{profile_id} AND `tff`.`initiator` NOT IN (SELECT `content` FROM `sys_profiles_conn_friends` WHERE `initiator`={profile_id} AND `mutual`='1') AND `tff`.`mutual`='1' WHERE `tf`.`initiator`={profile_id} AND `tf`.`mutual`='1' GROUP BY `id`", "a:1:{s:6:\"points\";i:2;}", 0.5, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, 1, "shared_context", "service", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:44:\"get_friend_recommendations_by_shared_context\";s:6:\"params\";a:3:{i:0;s:12:\"{profile_id}\";i:1;s:12:\"{connection}\";i:2;s:8:\"{points}\";}s:5:\"class\";s:27:\"TemplServiceRecommendations\";}", "a:2:{s:6:\"points\";i:1;s:10:\"connection\";s:14:\"bx_groups_fans\";}", 0.2, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [3, 1, "shared_location", "service", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:45:\"get_friend_recommendations_by_shared_location\";s:6:\"params\";a:3:{i:0;s:12:\"{profile_id}\";i:1;s:8:\"{radius}\";i:2;s:8:\"{points}\";}s:5:\"class\";s:27:\"TemplServiceRecommendations\";}", "a:2:{s:6:\"radius\";i:10;s:6:\"points\";i:1;}", 0.2, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [4, 1, "last_active", "sql", "SELECT `tp`.`id` AS `id`, {points} AS `value` FROM `sys_profiles` AS `tp` INNER JOIN `sys_accounts` AS `ta` ON `tp`.`account_id`=`ta`.`id` LEFT JOIN `sys_sessions` AS `ts` ON `tp`.`account_id`=`ts`.`user_id` WHERE `tp`.`id`<>{profile_id} AND `tp`.`id` NOT IN (SELECT `content` FROM `sys_profiles_conn_friends` WHERE `initiator`={profile_id} AND `mutual`='1') AND `tp`.`type` IN ('bx_persons', 'bx_organizations') ORDER BY `ts`.`date` DESC, `ta`.`logged` DESC, {order_by}", "a:1:{s:6:\"points\";i:0;}", 0.1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [5, 2, "mutual_subscriptions", "sql", "SELECT `tff`.`content` AS `id`, SUM({points}) AS `value` FROM `sys_profiles_conn_subscriptions` AS `tf` INNER JOIN `sys_profiles_conn_subscriptions` AS `tff` ON `tf`.`content`=`tff`.`initiator` AND `tff`.`content`<>{profile_id} AND `tff`.`content` NOT IN (SELECT `content` FROM `sys_profiles_conn_subscriptions` WHERE `initiator`={profile_id}) WHERE `tf`.`initiator`={profile_id} GROUP BY `id`", "a:1:{s:6:\"points\";i:2;}", 0.5, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [6, 2, "shared_context", "service", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:50:\"get_subscription_recommendations_by_shared_context\";s:6:\"params\";a:3:{i:0;s:12:\"{profile_id}\";i:1;s:12:\"{connection}\";i:2;s:8:\"{points}\";}s:5:\"class\";s:27:\"TemplServiceRecommendations\";}", "a:2:{s:6:\"points\";i:1;s:10:\"connection\";s:14:\"bx_groups_fans\";}", 0.5, 1])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_recommendation_criteria executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_recommendation_criteria: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_recommendation_criteria...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_recommendation_criteria...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_recommendation_criteria")
    Logger.info("Tabela sys_recommendation_criteria limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
