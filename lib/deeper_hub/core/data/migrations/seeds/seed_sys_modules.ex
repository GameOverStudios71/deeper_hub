defmodule DeeperHub.Core.Data.Migrations.Seeds.SysModulesSeed do
  @moduledoc """
  Seed para a tabela sys_modules.
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
    Logger.info("Inserindo registros na tabela sys_modules...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "module", 0, "system", "System", "UNA, Inc", "15.0.0-DEV1", "", "", "system", "Bx", "sys_", "System", "", 1749379445, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "language", 0, "bx_en", "English", "UNA INC", "14.0.10.DEV", "http://feed.una.io/?section={module_name}", "boonex/english/", "en", "BxEng", "bx_eng_", "BoonEx English", "", 1749379454, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "template", 0, "bx_artificer", "Artificer", "UNA INC", "14.0.10.DEV", "http://feed.una.io/?section={module_name}", "boonex/artificer/", "artificer", "BxArtificer", "bx_artificer_", "Boonex Artificer Template", "", 1749379454, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "module", 2, "bx_persons", "Persons", "UNA INC", "14.0.7.DEV", "http://feed.una.io/?section={module_name}", "boonex/persons/", "persons", "BxPersons", "bx_persons_", "Persons", "", 1749379456, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "module", 0, "bx_profiler", "Profiler", "Boonex", "13.0.5.DEV", "http://feed.una.io/?section={module_name}", "boonex/profiler/", "profiler", "BxProfiler", "bx_profiler_", "Boonex Profiler", "", 1749379496, 1, 0, "", 0])
      Logger.info("Registros inseridos com sucesso na tabela sys_modules!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_modules: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_modules...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_modules")
    Logger.info("Tabela sys_modules limpa com sucesso.", module: __MODULE__)
  end
end
