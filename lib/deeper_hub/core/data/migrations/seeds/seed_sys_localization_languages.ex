defmodule DeeperHub.Core.Data.Migrations.Seeds.SysLocalizationLanguagesSeed do
  @moduledoc """
  Seed para a tabela sys_localization_languages.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Insere os registros na tabela.
  Usa INSERT OR REPLACE para evitar erros de UNIQUE CONSTRAINT.
  """
  def run do
    Logger.info("Inserindo registros na tabela sys_localization_languages...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_localization_languages (ID, Name, Flag, Title, Direction, LanguageCountry, Enabled) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, "en", "gb", "English", "LTR", "", 1])
      Logger.info("Registros inseridos com sucesso na tabela sys_localization_languages!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_localization_languages: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_localization_languages...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_localization_languages")
    Logger.info("Tabela sys_localization_languages limpa com sucesso.", module: __MODULE__)
  end
end
