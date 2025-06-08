defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsSearchSeed do
  @moduledoc """
  Seed para a tabela sys_objects_search.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_search...")

    Repo.execute("INSERT INTO sys_objects_search (ID, ObjectName, Title, Order, GlobalSearch, ClassName, ClassPath) VALUES (?, ?, ?)", [1, 1, 1])
    Repo.execute("INSERT INTO sys_objects_search (ID, ObjectName, Title, Order, GlobalSearch, ClassName, ClassPath) VALUES (?, ?, ?)", [2, 2, 1])
    Repo.execute("INSERT INTO sys_objects_search (ID, ObjectName, Title, Order, GlobalSearch, ClassName, ClassPath) VALUES (?, ?, ?)", [3, 3, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
