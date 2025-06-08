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

    Repo.execute("INSERT INTO sys_rewrite_rules (id, preg, service, active) VALUES (?, ?)", [1, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
