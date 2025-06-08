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

    Repo.execute("INSERT INTO sys_objects_search (ID, ObjectName, Title, Order, GlobalSearch, ClassName, ClassPath) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, "sys_pages", "_sys_pages", 1, 1, "BxTemplPagesSearchResult", ""])
    Repo.execute("INSERT INTO sys_objects_search (ID, ObjectName, Title, Order, GlobalSearch, ClassName, ClassPath) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "_bx_persons", 2, 1, "BxPersonsSearchResult", "modules/boonex/persons/classes/BxPersonsSearchResult.php"])
    Repo.execute("INSERT INTO sys_objects_search (ID, ObjectName, Title, Order, GlobalSearch, ClassName, ClassPath) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons_cmts", "_bx_persons_cmts", 3, 1, "BxPersonsCmtsSearchResult", "modules/boonex/persons/classes/BxPersonsCmtsSearchResult.php"])

    IO.puts("Registros inseridos com sucesso!")
  end
end
