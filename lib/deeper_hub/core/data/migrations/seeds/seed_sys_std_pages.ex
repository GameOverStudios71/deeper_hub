defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdPagesSeed do
  @moduledoc """
  Seed para a tabela sys_std_pages.
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
    Logger.info("Inserindo registros na tabela sys_std_pages...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [1, 3, "home", "_adm_page_cpt_home", "_adm_page_cpt_home", "bc-home.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [2, 4, "dashboard", "_adm_page_cpt_dashboard", "_adm_page_cpt_dashboard", "wi-dashboard.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [3, 3, "settings", "_adm_page_cpt_settings", "_adm_page_cpt_settings", "wi-settings.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [4, 3, "store", "_adm_page_cpt_store", "_adm_page_cpt_store", "wi-store.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [5, 3, "designer", "_adm_page_cpt_designer", "_adm_page_cpt_designer", "wi-designer.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [6, 3, "polyglot", "_adm_page_cpt_polyglot", "_adm_page_cpt_polyglot", "wi-polyglot.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [7, 3, "builder_pages", "_adm_page_cpt_builder_pages", "_adm_page_cpt_builder_pages", "wi-bld-pages.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [8, 3, "builder_menus", "_adm_page_cpt_builder_menus", "_adm_page_cpt_builder_menus", "wi-bld-navigation.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [9, 3, "builder_forms", "_adm_page_cpt_builder_forms", "_adm_page_cpt_builder_forms", "wi-bld-forms.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [10, 3, "builder_permissions", "_adm_page_cpt_builder_permissions", "_adm_page_cpt_builder_permissions", "wi-bld-permissions.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [11, 3, "builder_roles", "_adm_page_cpt_builder_roles", "_adm_page_cpt_builder_roles", "wi-bld-roles.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [12, 3, "storages", "_adm_page_cpt_storages", "_adm_page_cpt_storages", "wi-storages.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [13, 3, "audit", "_adm_page_cpt_audit", "_adm_page_cpt_audit", "wi-audit.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [14, 3, "badges", "_adm_page_cpt_badges", "_adm_page_cpt_badges", "wi-badges.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [15, 3, "api", "_adm_page_cpt_api", "_adm_page_cpt_api", "wi-api.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [16, 3, "agents", "_adm_page_cpt_agents", "_adm_page_cpt_agents", "wi-agents.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [17, 3, "bx_en", "", "", "bx_en@modules/boonex/english/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [18, 3, "bx_artificer", "", "", "bx_artificer@modules/boonex/artificer/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [19, 3, "bx_persons", "_bx_persons", "_bx_persons", "bx_persons@modules/boonex/persons/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [20, 3, "bx_profiler", "_bx_profiler", "_bx_profiler", "bx_profiler@modules/boonex/profiler/|std-icon.svg"])
      Logger.info("Registros inseridos com sucesso na tabela sys_std_pages!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_std_pages: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_std_pages...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_std_pages")
    Logger.info("Tabela sys_std_pages limpa com sucesso.", module: __MODULE__)
  end
end
