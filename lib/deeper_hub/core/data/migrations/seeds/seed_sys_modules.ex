defmodule DeeperHub.Core.Data.Migrations.Seeds.SysModulesSeed do
  @moduledoc """
  Seed para a tabela sys_modules.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_modules...")

    Repo.execute("INSERT INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "module", 0, "system", "System", "UNA, Inc", "15.0.0-DEV1", "", "", "system", "Bx", "sys_", "System", "", 1749379445, 1, 0, "", 0])
    Repo.execute("INSERT INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "language", 0, "bx_en", "English", "UNA INC", "14.0.10.DEV", "http://feed.una.io/?section={module_name}", "boonex/english/", "en", "BxEng", "bx_eng_", "BoonEx English", "", 1749379454, 1, 0, "", 0])
    Repo.execute("INSERT INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "template", 0, "bx_artificer", "Artificer", "UNA INC", "14.0.10.DEV", "http://feed.una.io/?section={module_name}", "boonex/artificer/", "artificer", "BxArtificer", "bx_artificer_", "Boonex Artificer Template", "", 1749379454, 1, 0, "", 0])
    Repo.execute("INSERT INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "module", 2, "bx_persons", "Persons", "UNA INC", "14.0.7.DEV", "http://feed.una.io/?section={module_name}", "boonex/persons/", "persons", "BxPersons", "bx_persons_", "Persons", "", 1749379456, 1, 0, "", 0])
    Repo.execute("INSERT INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "module", 0, "bx_profiler", "Profiler", "Boonex", "13.0.5.DEV", "http://feed.una.io/?section={module_name}", "boonex/profiler/", "profiler", "BxProfiler", "bx_profiler_", "Boonex Profiler", "", 1749379496, 1, 0, "", 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
