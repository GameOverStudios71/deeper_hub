defmodule DeeperHub.Core.Data.Seeds.SeedSysStdPages do
  @doc """
  Executa o seed para a tabela sys_std_pages.
  """
  def run do
    # Inserir dados para sys_std_pages
    [
      %{ id: 1, index: 3, name: "home", header: "_adm_page_cpt_home", caption: "_adm_page_cpt_home", icon: "bc-home.svg" },
      %{ id: 2, index: 4, name: "dashboard", header: "_adm_page_cpt_dashboard", caption: "_adm_page_cpt_dashboard", icon: "wi-dashboard.svg" },
      %{ id: 3, index: 3, name: "settings", header: "_adm_page_cpt_settings", caption: "_adm_page_cpt_settings", icon: "wi-settings.svg" },
      %{ id: 4, index: 3, name: "store", header: "_adm_page_cpt_store", caption: "_adm_page_cpt_store", icon: "wi-store.svg" },
      %{ id: 5, index: 3, name: "designer", header: "_adm_page_cpt_designer", caption: "_adm_page_cpt_designer", icon: "wi-designer.svg" },
      %{ id: 6, index: 3, name: "polyglot", header: "_adm_page_cpt_polyglot", caption: "_adm_page_cpt_polyglot", icon: "wi-polyglot.svg" },
      %{ id: 7, index: 3, name: "builder_pages", header: "_adm_page_cpt_builder_pages", caption: "_adm_page_cpt_builder_pages", icon: "wi-bld-pages.svg" },
      %{ id: 8, index: 3, name: "builder_menus", header: "_adm_page_cpt_builder_menus", caption: "_adm_page_cpt_builder_menus", icon: "wi-bld-navigation.svg" },
      %{ id: 9, index: 3, name: "builder_forms", header: "_adm_page_cpt_builder_forms", caption: "_adm_page_cpt_builder_forms", icon: "wi-bld-forms.svg" },
      %{ id: 10, index: 3, name: "builder_permissions", header: "_adm_page_cpt_builder_permissions", caption: "_adm_page_cpt_builder_permissions", icon: "wi-bld-permissions.svg" },
      %{ id: 11, index: 3, name: "builder_roles", header: "_adm_page_cpt_builder_roles", caption: "_adm_page_cpt_builder_roles", icon: "wi-bld-roles.svg" },
      %{ id: 12, index: 3, name: "storages", header: "_adm_page_cpt_storages", caption: "_adm_page_cpt_storages", icon: "wi-storages.svg" },
      %{ id: 13, index: 3, name: "audit", header: "_adm_page_cpt_audit", caption: "_adm_page_cpt_audit", icon: "wi-audit.svg" },
      %{ id: 14, index: 3, name: "badges", header: "_adm_page_cpt_badges", caption: "_adm_page_cpt_badges", icon: "wi-badges.svg" },
      %{ id: 15, index: 3, name: "api", header: "_adm_page_cpt_api", caption: "_adm_page_cpt_api", icon: "wi-api.svg" },
      %{ id: 16, index: 3, name: "agents", header: "_adm_page_cpt_agents", caption: "_adm_page_cpt_agents", icon: "wi-agents.svg" },
      %{ id: 17, index: 3, name: "bx_en", header: "", caption: "", icon: "bx_en@modules/boonex/english/|std-icon.svg" },
      %{ id: 18, index: 3, name: "bx_artificer", header: "", caption: "", icon: "bx_artificer@modules/boonex/artificer/|std-icon.svg" },
      %{ id: 19, index: 3, name: "bx_persons", header: "_bx_persons", caption: "_bx_persons", icon: "bx_persons@modules/boonex/persons/|std-icon.svg" },
      %{ id: 20, index: 3, name: "bx_profiler", header: "_bx_profiler", caption: "_bx_profiler", icon: "bx_profiler@modules/boonex/profiler/|std-icon.svg" }
    ]
  end
end