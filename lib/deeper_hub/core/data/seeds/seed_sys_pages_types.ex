defmodule DeeperHub.Core.Data.Seeds.SeedSysPagesTypes do
  @doc """
  Executa o seed para a tabela sys_pages_types.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "_sys_page_type_default", "", 1],
      [2, "_sys_page_type_wo_hf", "pt_wo_hf.html", 2],
      [3, "_sys_page_type_standard", "pt_standard.html", 3],
      [4, "_sys_page_type_application", "pt_application.html", 4]
    ]
    
    table_name = "sys_pages_types"
    columns = ["id", "title", "template", "order"]
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