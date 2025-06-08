defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPermalinksSeed do
  @moduledoc """
  Seed para a tabela sys_permalinks.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_permalinks...")

    Repo.execute("INSERT INTO sys_permalinks (id, standard, permalink, check, compare_by_prefix) VALUES (?, ?, ?, ?, ?)", [1, "page.php?i=", "page/", "permalinks_pages", 1])
    Repo.execute("INSERT INTO sys_permalinks (id, standard, permalink, check, compare_by_prefix) VALUES (?, ?, ?, ?, ?)", [2, "modules/?r=", "m/", "permalinks_modules", 1])
    Repo.execute("INSERT INTO sys_permalinks (id, standard, permalink, check, compare_by_prefix) VALUES (?, ?, ?, ?, ?)", [3, "storage.php?o=", "s/", "permalinks_storage", 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
