defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsChartSeed do
  @moduledoc """
  Seed para a tabela sys_objects_chart.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_chart...")

    Repo.execute("INSERT INTO sys_objects_chart (id, object, title, table, field_date_ts, field_date_dt, field_status, column_date, column_count, type, options, query, active, order, class_name, class_file) VALUES (?, ?, ?, ?, ?)", [1, 0, 1, 1, 1])
    Repo.execute("INSERT INTO sys_objects_chart (id, object, title, table, field_date_ts, field_date_dt, field_status, column_date, column_count, type, options, query, active, order, class_name, class_file) VALUES (?, ?, ?, ?, ?)", [2, 0, 1, 1, 1])
    Repo.execute("INSERT INTO sys_objects_chart (id, object, title, table, field_date_ts, field_date_dt, field_status, column_date, column_count, type, options, query, active, order, class_name, class_file) VALUES (?, ?, ?, ?, ?)", [3, 0, 1, 1, 2])
    Repo.execute("INSERT INTO sys_objects_chart (id, object, title, table, field_date_ts, field_date_dt, field_status, column_date, column_count, type, options, query, active, order, class_name, class_file) VALUES (?, ?, ?, ?, ?)", [4, 0, 1, 1, 3])

    IO.puts("Registros inseridos com sucesso!")
  end
end
