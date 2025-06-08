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

    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?)", [1])
    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?)", [2])
    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?)", [3])
    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?)", [4])
    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?)", [5])
    Repo.execute("INSERT INTO sys_localization_categories (ID, Name) VALUES (?)", [6])

    IO.puts("Registros inseridos com sucesso!")
  end
end
