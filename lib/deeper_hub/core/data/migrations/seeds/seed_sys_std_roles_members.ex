defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesMembersSeed do
  @moduledoc """
  Seed para a tabela sys_std_roles_members.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_std_roles_members...")

    Repo.execute("INSERT INTO sys_std_roles_members (id, account_id, role) VALUES (?, ?, ?)", [1, 1, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
