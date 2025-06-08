defmodule DeeperHub.Core.Data.Migrations.Seeds.SysRewriteRulesSeed do
  @moduledoc """
  Seed para a tabela sys_rewrite_rules.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_rewrite_rules...")

    Repo.execute("INSERT INTO sys_rewrite_rules (id, preg, service, active) VALUES (?, ?, ?, ?)", [1, "^sys-action/(.*)$", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"wiki_action\";s:6:\"params\";a:2:{i:0;s:3:\"sys\";i:1;s:3:\"{1}\";}s:5:\"class\";s:16:\"TemplServiceWiki\";}", 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
