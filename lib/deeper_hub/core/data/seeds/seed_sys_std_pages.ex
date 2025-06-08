defmodule DeeperHub.Core.Data.Seeds.SeedSysStdPages do
  @doc """
  Executa o seed para a tabela sys_std_pages.
  """
  def run do
    data = [
      [1, 3, "home", "_adm_page_cpt_home", "_adm_page_cpt_home", "bc-home.svg"],
      [2, 4, "dashboard", "_adm_page_cpt_dashboard", "_adm_page_cpt_dashboard", "wi-dashboard.svg"],
      [3, 3, "settings", "_adm_page_cpt_settings", "_adm_page_cpt_settings", "wi-settings.svg"],
      [4, 3, "store", "_adm_page_cpt_store", "_adm_page_cpt_store", "wi-store.svg"],
      [5, 3, "designer", "_adm_page_cpt_designer", "_adm_page_cpt_designer", "wi-designer.svg"],
      [6, 3, "polyglot", "_adm_page_cpt_polyglot", "_adm_page_cpt_polyglot", "wi-polyglot.svg"],
      [7, 3, "builder_pages", "_adm_page_cpt_builder_pages", "_adm_page_cpt_builder_pages", "wi-bld-pages.svg"],
      [8, 3, "builder_menus", "_adm_page_cpt_builder_menus", "_adm_page_cpt_builder_menus", "wi-bld-navigation.svg"],
      [9, 3, "builder_forms", "_adm_page_cpt_builder_forms", "_adm_page_cpt_builder_forms", "wi-bld-forms.svg"],
      [10, 3, "builder_permissions", "_adm_page_cpt_builder_permissions", "_adm_page_cpt_builder_permissions", "wi-bld-permissions.svg"],
      [11, 3, "builder_roles", "_adm_page_cpt_builder_roles", "_adm_page_cpt_builder_roles", "wi-bld-roles.svg"],
      [12, 3, "storages", "_adm_page_cpt_storages", "_adm_page_cpt_storages", "wi-storages.svg"],
      [13, 3, "audit", "_adm_page_cpt_audit", "_adm_page_cpt_audit", "wi-audit.svg"],
      [14, 3, "badges", "_adm_page_cpt_badges", "_adm_page_cpt_badges", "wi-badges.svg"],
      [15, 3, "api", "_adm_page_cpt_api", "_adm_page_cpt_api", "wi-api.svg"],
      [16, 3, "agents", "_adm_page_cpt_agents", "_adm_page_cpt_agents", "wi-agents.svg"],
      [17, 3, "bx_en", "", "", "bx_en@modules/boonex/english/|std-icon.svg"],
      [18, 3, "bx_artificer", "", "", "bx_artificer@modules/boonex/artificer/|std-icon.svg"],
      [19, 3, "bx_persons", "_bx_persons", "_bx_persons", "bx_persons@modules/boonex/persons/|std-icon.svg"],
      [20, 3, "bx_profiler", "_bx_profiler", "_bx_profiler", "bx_profiler@modules/boonex/profiler/|std-icon.svg"]
    ]
    
    data
  end
end