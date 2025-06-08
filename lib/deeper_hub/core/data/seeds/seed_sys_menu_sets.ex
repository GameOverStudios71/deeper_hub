defmodule DeeperHub.Core.Data.Seeds.SeedSysMenuSets do
  @doc """
  Executa o seed para a tabela sys_menu_sets.
  """
  def run do
    # Inserir dados para sys_menu_sets
    [
      %{ set_name: "sys_site", module: "system", title: "_sys_menu_set_title_site", deletable: 0 },
      %{ set_name: "sys_application", module: "system", title: "_sys_menu_set_title_application", deletable: 0 },
      %{ set_name: "sys_homepage", module: "system", title: "_sys_menu_set_title_homepage", deletable: 0 },
      %{ set_name: "sys_homepage_submenu", module: "system", title: "_sys_menu_set_title_homepage_submenu", deletable: 0 },
      %{ set_name: "sys_site_panel", module: "system", title: "_sys_menu_set_title_panel", deletable: 0 },
      %{ set_name: "sys_footer", module: "system", title: "_sys_menu_set_title_footer", deletable: 0 },
      %{ set_name: "sys_toolbar_site", module: "system", title: "_sys_menu_set_title_toolbar_site", deletable: 0 },
      %{ set_name: "sys_toolbar_member", module: "system", title: "_sys_menu_set_title_toolbar_member", deletable: 0 },
      %{ set_name: "sys_account_popup", module: "system", title: "_sys_menu_set_title_account_popup", deletable: 0 },
      %{ set_name: "sys_account_notifications", module: "system", title: "_sys_menu_set_title_account_notifications", deletable: 0 },
      %{ set_name: "sys_add_content_links", module: "system", title: "_sys_menu_set_title_add_content", deletable: 0 },
      %{ set_name: "sys_dashboard_content_manage", module: "system", title: "_sys_menu_set_title_dashboard_content_manage", deletable: 0 },
      %{ set_name: "sys_dashboard_reports_manage", module: "system", title: "_sys_menu_set_title_dashboard_reports_manage", deletable: 0 },
      %{ set_name: "sys_add_profile_links", module: "system", title: "_sys_menu_set_title_add_profile", deletable: 0 },
      %{ set_name: "sys_account_dashboard", module: "system", title: "_sys_menu_set_title_account_dashboard", deletable: 0 },
      %{ set_name: "sys_account_dashboard_manage_tools", module: "system", title: "_sys_menu_set_title_account_dashboard_manage_tools", deletable: 0 },
      %{ set_name: "sys_account_settings", module: "system", title: "_sys_menu_set_title_account_settings", deletable: 0 },
      %{ set_name: "sys_profiles_create", module: "system", title: "_sys_menu_set_title_profile_create_links", deletable: 0 },
      %{ set_name: "sys_profile_stats", module: "system", title: "_sys_menu_set_title_profile_stats", deletable: 0 },
      %{ set_name: "sys_profile_followings", module: "system", title: "_sys_menu_set_title_profile_followings", deletable: 0 },
      %{ set_name: "sys_cmts_item_manage", module: "system", title: "_sys_menu_set_title_cmts_item_manage", deletable: 0 },
      %{ set_name: "sys_cmts_item_actions", module: "system", title: "_sys_menu_set_title_cmts_item_actions", deletable: 0 },
      %{ set_name: "sys_cmts_item_counters", module: "system", title: "_sys_menu_set_title_cmts_item_counters", deletable: 0 },
      %{ set_name: "sys_cmts_item_meta", module: "system", title: "_sys_menu_set_title_cmts_item_meta", deletable: 0 },
      %{ set_name: "sys_switch_language", module: "system", title: "_sys_menu_set_title_switch_language", deletable: 0 },
      %{ set_name: "sys_switch_template", module: "system", title: "_sys_menu_set_title_switch_template", deletable: 0 },
      %{ set_name: "sys_social_sharing", module: "system", title: "_sys_menu_set_title_sys_social_sharing", deletable: 0 },
      %{ set_name: "sys_wiki", module: "system", title: "_sys_menu_set_title_sys_wiki", deletable: 0 },
      %{ set_name: "sys_favorite_list", module: "system", title: "_sys_menu_set_title_sys_favorite_list", deletable: 0 },
      %{ set_name: "sys_con_submenu", module: "system", title: "_sys_menu_set_title_con_submenu", deletable: 0 },
      %{ set_name: "sys_studio_account_popup", module: "system", title: "_sys_menu_set_title_studio_account_popup", deletable: 0 },
      %{ set_name: "bx_persons_view_actions", module: "bx_persons", title: "_bx_persons_menu_set_title_view_profile_actions", deletable: 0 },
      %{ set_name: "bx_persons_view_actions_more", module: "bx_persons", title: "_bx_persons_menu_set_title_view_profile_actions_more", deletable: 0 },
      %{ set_name: "bx_persons_view_actions_all", module: "bx_persons", title: "_sys_menu_set_title_view_actions", deletable: 0 },
      %{ set_name: "bx_persons_view_meta", module: "bx_persons", title: "_bx_persons_menu_set_title_view_profile_meta", deletable: 0 },
      %{ set_name: "bx_persons_submenu", module: "bx_persons", title: "_bx_persons_menu_set_title_submenu", deletable: 0 },
      %{ set_name: "bx_persons_view_submenu", module: "bx_persons", title: "_bx_persons_menu_set_title_view_profile_submenu", deletable: 0 },
      %{ set_name: "bx_persons_snippet_meta", module: "bx_persons", title: "_sys_menu_set_title_snippet_meta", deletable: 0 },
      %{ set_name: "bx_persons_menu_manage_tools", module: "bx_persons", title: "_bx_persons_menu_set_title_manage_tools", deletable: 0 }
    ]
  end
end