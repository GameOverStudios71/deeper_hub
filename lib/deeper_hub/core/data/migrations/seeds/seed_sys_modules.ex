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

    Repo.execute("INSERT INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?)", [1, 0, 1749379445, 1, 0, 0])
    Repo.execute("INSERT INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?)", [2, 0, 1749379454, 1, 0, 0])
    Repo.execute("INSERT INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?)", [3, 0, 1749379454, 1, 0, 0])
    Repo.execute("INSERT INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?)", [4, 2, 1749379456, 1, 0, 0])
    Repo.execute("INSERT INTO sys_modules (id, type, subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?)", [5, 0, 1749379496, 1, 0, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
