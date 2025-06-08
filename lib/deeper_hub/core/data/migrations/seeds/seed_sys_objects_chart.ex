defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsChartSeed do
  @moduledoc """
  Seed para a tabela sys_objects_chart.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_chart_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_objects_chart já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_chart...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_chart (id, object, title, 'table', field_date_ts, field_date_dt, field_status, column_date, column_count, 'type', options, 'query', active, 'order', class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_accounts_growth", "_sys_chart_accounts_growth", "sys_accounts", "added", "", "", 0, 1, "", "", "", 1, 1, "BxDolChartGrowth", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_chart (id, object, title, 'table', field_date_ts, field_date_dt, field_status, column_date, column_count, 'type', options, 'query', active, 'order', class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_accounts_growth_speed", "_sys_chart_accounts_growth_speed", "sys_accounts", "added", "", "", 0, 1, "", "", "", 1, 1, "BxDolChartGrowthSpeed", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_chart (id, object, title, 'table', field_date_ts, field_date_dt, field_status, column_date, column_count, 'type', options, 'query', active, 'order', class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons_growth", "_bx_persons_chart_growth", "bx_persons_data", "added", "", "", 0, 1, "", "", "SELECT {field_date_formatted} AS `period`, COUNT(*) AS {object} FROM {table} LEFT JOIN `sys_profiles` AS `tp` ON {table}.`id` = `tp`.`content_id` AND `tp`.`type`='bx_persons' WHERE 1 AND `tp`.`status`='active' {where_inteval} GROUP BY `period` ORDER BY {table}.{field_date} ASC", 1, 2, "BxDolChartGrowth", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_chart (id, object, title, 'table', field_date_ts, field_date_dt, field_status, column_date, column_count, 'type', options, 'query', active, 'order', class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "bx_persons_growth_speed", "_bx_persons_chart_growth_speed", "bx_persons_data", "added", "", "", 0, 1, "", "", "SELECT {field_date_formatted} AS `period`, COUNT(*) AS {object} FROM {table} LEFT JOIN `sys_profiles` AS `tp` ON {table}.`id` = `tp`.`content_id` AND `tp`.`type`='bx_persons' WHERE 1 AND `tp`.`status`='active' {where_inteval} GROUP BY `period` ORDER BY {table}.{field_date} ASC", 1, 3, "BxDolChartGrowthSpeed", ""])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_objects_chart executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_objects_chart: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_chart...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_chart...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_chart")
    Logger.info("Tabela sys_objects_chart limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
