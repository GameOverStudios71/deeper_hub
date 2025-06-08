defmodule DeeperHub.Core.Data.Seeds.SeedSysRewriteRules do
  @doc """
  Executa o seed para a tabela sys_rewrite_rules.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "^sys-action/(.*)$", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"wiki_action\";s:6:\"params\";a:2:{i:0;s:3:\"sys\";i:1;s:3:\"{1}\";}s:5:\"class\";s:16:\"TemplServiceWiki\";}", 1]
    ]
    
    table_name = "sys_rewrite_rules"
    columns = ["id", "preg", "service", "active"]
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