defmodule DeeperHub.Core.Data.Seeds.SeedSysPermalinks do
  @doc """
  Executa o seed para a tabela sys_permalinks.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "page.php?i=", "page/", "permalinks_pages", 1],
      [2, "modules/?r=", "m/", "permalinks_modules", 1],
      [3, "storage.php?o=", "s/", "permalinks_storage", 1]
    ]
    
    table_name = "sys_permalinks"
    columns = ["id", "standard", "permalink", "check", "compare_by_prefix"]
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