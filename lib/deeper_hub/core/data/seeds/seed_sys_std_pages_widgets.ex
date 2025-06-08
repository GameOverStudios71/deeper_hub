defmodule DeeperHub.Core.Data.Seeds.SeedSysStdPagesWidgets do
  @doc """
  Executa o seed para a tabela sys_std_pages_widgets.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, 1, 1, 3],
      [2, 1, 2, 2],
      [3, 1, 3, 1],
      [4, 1, 4, 6],
      [5, 1, 5, 5],
      [6, 1, 6, 7],
      [7, 1, 7, 8],
      [8, 1, 8, 9],
      [9, 1, 9, 10],
      [10, 1, 10, 11],
      [11, 1, 11, 4],
      [12, 1, 12, 12],
      [13, 1, 13, 13],
      [14, 1, 14, 14],
      [15, 1, 15, 15],
      [16, 1, 16, 16],
      [17, 1, 17, 17],
      [18, 1, 18, 18],
      [19, 1, 19, 19]
    ]
    
    table_name = "sys_std_pages_widgets"
    columns = ["id", "page_id", "widget_id", "order"]
    placeholders = Enum.map(1..length(columns), fn _i -> "?" end) |> Enum.join(", ")
    sql = "INSERT INTO #{table_name} (#{Enum.join(columns, ", ")}) VALUES (#{placeholders})"
    
    Enum.each(data, fn record ->
      case DeeperHub.Core.Data.Repo.execute(sql, record) do
        { :ok, result } ->
          DeeperHub.Core.Logger.info("Registro inserido com sucesso na tabela #{table_name}: #{inspect(result)}")
        { :error, reason } ->
          DeeperHub.Core.Logger.warning("Erro ao inserir registro na tabela #{table_name}: #{inspect(reason)}", [])
      end
    end)
    
    data
  end
end