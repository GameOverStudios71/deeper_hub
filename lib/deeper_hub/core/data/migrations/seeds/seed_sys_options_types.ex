defmodule DeeperHub.Core.Data.Migrations.Seeds.SysOptionsTypesSeed do
  @moduledoc """
  Seed para a tabela sys_options_types.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_options_types...")

    Repo.execute("INSERT INTO sys_options_types (id, group, name, caption, icon, order) VALUES (?, ?)", [1, 1])
    Repo.execute("INSERT INTO sys_options_types (id, group, name, caption, icon, order) VALUES (?, ?)", [2, 2])
    Repo.execute("INSERT INTO sys_options_types (id, group, name, caption, icon, order) VALUES (?, ?)", [3, 2])
    Repo.execute("INSERT INTO sys_options_types (id, group, name, caption, icon, order) VALUES (?, ?)", [4, 1])
    Repo.execute("INSERT INTO sys_options_types (id, group, name, caption, icon, order) VALUES (?, ?)", [5, 2])

    IO.puts("Registros inseridos com sucesso!")
  end
end
