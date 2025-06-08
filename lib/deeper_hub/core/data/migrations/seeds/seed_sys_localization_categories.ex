defmodule DeeperHub.Core.Data.Migrations.Seeds.SysLocalizationCategoriesSeed do
  @moduledoc """
  Seed para a tabela sys_localization_categories.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_localization_categories...")

    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [1, "System"])
    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [2, "Custom"])
    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [3, "BoonEx English"])
    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [4, "Boonex Artificer Template"])
    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [5, "Persons"])
    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [6, "Boonex Profiler"])

    IO.puts("Registros inseridos com sucesso!")
  end
end
