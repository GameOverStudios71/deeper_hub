defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesSeed do
  @moduledoc """
  Seed para a tabela sys_std_roles.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_std_roles...")

    Repo.execute("INSERT INTO sys_std_roles (id, name, title, description, active, order) VALUES (?, ?, ?)", [1, 1, 1])
    Repo.execute("INSERT INTO sys_std_roles (id, name, title, description, active, order) VALUES (?, ?, ?)", [2, 1, 2])

    IO.puts("Registros inseridos com sucesso!")
  end
end
