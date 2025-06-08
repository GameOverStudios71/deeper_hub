defmodule DeeperHub.Core.Data.Seeds.SeedSysContentInfoGrids do
  @doc """
  Executa o seed para a tabela sys_content_info_grids.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "bx_persons", "bx_persons_administration", "td`.`id", "", ""],
      [2, "bx_persons", "bx_persons_common", "td`.`id", "", ""]
    ]
    
    table_name = "sys_content_info_grids"
    columns = ["id", "object", "grid_object", "grid_field_id", "condition", "selection"]
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