defmodule DeeperHub.Core.Data.Migrations.Seeds.SysLocalizationCategoriesSeed do
  @moduledoc """
  Seed para a tabela sys_localization_categories.
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
    Logger.info("Inserindo registros na tabela sys_localization_categories...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [1, "System"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [2, "Custom"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [3, "BoonEx English"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [4, "Boonex Artificer Template"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [5, "Persons"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [6, "Boonex Profiler"])
      Logger.info("Registros inseridos com sucesso na tabela sys_localization_categories!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_localization_categories: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_localization_categories...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_localization_categories")
    Logger.info("Tabela sys_localization_categories limpa com sucesso.", module: __MODULE__)
  end
end
