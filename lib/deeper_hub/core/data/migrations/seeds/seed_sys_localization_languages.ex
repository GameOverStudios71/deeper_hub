defmodule DeeperHub.Core.Data.Migrations.Seeds.SysLocalizationLanguagesSeed do
  @moduledoc """
  Seed para a tabela sys_localization_languages.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_localization_languages...")

    Repo.execute("INSERT INTO sys_localization_languages (ID, Name, Flag, Title, Direction, LanguageCountry, Enabled) VALUES (?, ?)", [1, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
