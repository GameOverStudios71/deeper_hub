defmodule DeeperHub.Core.Data.Seeds.SeedSysObjectsView do
  @doc """
  Executa o seed para a tabela sys_objects_view.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "bx_persons", "bx_persons", "bx_persons_views_track", 86400, 31536000, 1, "bx_persons_data", "id", "author", "views", "", ""]
    ]
    
    table_name = "sys_objects_view"
    columns = ["id", "name", "module", "table_track", "period", "pruning", "is_on", "trigger_table", "trigger_field_id", "trigger_field_author", "trigger_field_count", "class_name", "class_file"]
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