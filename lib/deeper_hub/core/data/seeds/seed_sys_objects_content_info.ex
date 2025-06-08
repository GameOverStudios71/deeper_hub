defmodule DeeperHub.Core.Data.Seeds.SeedSysObjectsContentInfo do
  @doc """
  Executa o seed para a tabela sys_objects_content_info.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "bx_persons", "_bx_persons", "bx_persons", "added", "edited", "deleted", "", ""],
      [2, "bx_persons_cmts", "_bx_persons_cmts", "bx_persons", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""]
    ]
    
    table_name = "sys_objects_content_info"
    columns = ["id", "name", "title", "alert_unit", "alert_action_add", "alert_action_update", "alert_action_delete", "class_name", "class_file"]
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