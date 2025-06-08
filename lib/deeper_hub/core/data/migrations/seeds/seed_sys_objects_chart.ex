defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsChartSeed do
  @moduledoc """
  Seed para a tabela sys_objects_chart.
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
    Logger.info("Inserindo registros na tabela sys_objects_chart...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_chart (id, object, title, table, field_date_ts, field_date_dt, field_status, column_date, column_count, type, options, query, active, order, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_accounts_growth", "_sys_chart_accounts_growth", "sys_accounts", "added", "", "", 0, 1, "", "", "", 1, 1, "BxDolChartGrowth", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_chart (id, object, title, table, field_date_ts, field_date_dt, field_status, column_date, column_count, type, options, query, active, order, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_accounts_growth_speed", "_sys_chart_accounts_growth_speed", "sys_accounts", "added", "", "", 0, 1, "", "", "", 1, 1, "BxDolChartGrowthSpeed", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_chart (id, object, title, table, field_date_ts, field_date_dt, field_status, column_date, column_count, type, options, query, active, order, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons_growth", "_bx_persons_chart_growth", "bx_persons_data", "added", "", "", 0, 1, "", "", "SELECT {field_date_formatted} AS `period`, COUNT(*) AS {object} FROM {table} LEFT JOIN `sys_profiles` AS `tp` ON {table}.`id` = `tp`.`content_id` AND `tp`.`type`='bx_persons' WHERE 1 AND `tp`.`status`='active' {where_inteval} GROUP BY `period` ORDER BY {table}.{field_date} ASC", 1, 2, "BxDolChartGrowth", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_chart (id, object, title, table, field_date_ts, field_date_dt, field_status, column_date, column_count, type, options, query, active, order, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "bx_persons_growth_speed", "_bx_persons_chart_growth_speed", "bx_persons_data", "added", "", "", 0, 1, "", "", "SELECT {field_date_formatted} AS `period`, COUNT(*) AS {object} FROM {table} LEFT JOIN `sys_profiles` AS `tp` ON {table}.`id` = `tp`.`content_id` AND `tp`.`type`='bx_persons' WHERE 1 AND `tp`.`status`='active' {where_inteval} GROUP BY `period` ORDER BY {table}.{field_date} ASC", 1, 3, "BxDolChartGrowthSpeed", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_chart!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_chart: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_chart...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_chart")
    Logger.info("Tabela sys_objects_chart limpa com sucesso.", module: __MODULE__)
  end
end
