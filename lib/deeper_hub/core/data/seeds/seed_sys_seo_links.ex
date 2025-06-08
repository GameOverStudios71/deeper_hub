defmodule DeeperHub.Core.Data.Seeds.SeedSysSeoLinks do
  @doc """
  Executa o seed para a tabela sys_seo_links.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "bx_persons", "persons-profile-friends", "profile_id", "1", "admin", 1749379473]
    ]
    
    table_name = "sys_seo_links"
    columns = ["id", "module", "page_uri", "param_name", "param_value", "uri", "added"]
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