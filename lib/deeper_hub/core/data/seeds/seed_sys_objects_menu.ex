defmodule DeeperHub.Core.Data.Seeds.SeedSysObjectsMenu do
  @doc """
  Executa o seed para a tabela sys_objects_menu.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "sys_site", "_sys_menu_title_main", "sys_site", "system", 28, "", 0, 0, 1, "BxTemplMenuSite", ""],
      [2, "sys_site_in_panel", "_sys_menu_title_main_in_panel", "sys_site", "system", 31, "", 0, 0, 1, "BxTemplMenuSite", ""],
      [3, "sys_application", "_sys_menu_title_application", "sys_application", "system", 28, "", 0, 0, 1, "BxTemplMenuSite", ""],
      [4, "sys_homepage", "_sys_menu_title_homepage", "sys_homepage", "system", 7, "", 0, 0, 1, "BxTemplMenuHomepage", ""],
      [5, "sys_homepage_submenu", "_sys_menu_title_homepage_submenu", "sys_homepage_submenu", "system", 8, "", 0, 0, 1, "", ""],
      [6, "sys_site_submenu", "_sys_menu_title_submenu", "sys_site", "system", 1, "", 0, 0, 1, "BxTemplMenuSubmenu", ""],
      [7, "sys_site_manage", "_sys_menu_title_manage", "", "system", 1, "", 0, 0, 1, "BxTemplMenuManage", ""],
      [8, "sys_site_panel", "_sys_menu_title_panel", "sys_site_panel", "system", 30, "", 0, 0, 1, "BxTemplMenuPanel", ""],
      [9, "sys_footer", "_sys_menu_title_footer", "sys_footer", "system", 2, "", 0, 0, 1, "BxTemplMenuFooter", ""],
      [10, "sys_toolbar_site", "_sys_menu_title_toolbar_site", "sys_toolbar_site", "system", 5, "", 0, 0, 1, "BxTemplMenuToolbar", ""],
      [11, "sys_toolbar_member", "_sys_menu_title_toolbar_member", "sys_toolbar_member", "system", 5, "", 0, 0, 1, "BxTemplMenuToolbar", ""],
      [12, "sys_add_content", "_sys_menu_title_add_content", "sys_add_content_links", "system", 29, "", 0, 0, 1, "BxTemplMenuSite", ""],
      [13, "sys_add_profile", "_sys_menu_title_add_profile", "sys_add_profile_links", "system", 14, "", 0, 0, 1, "BxTemplMenuProfileAdd", ""],
      [14, "sys_add_profile_vertical", "_sys_menu_title_add_profile_vertical", "sys_add_profile_links", "system", 6, "", 0, 0, 1, "BxTemplMenuProfileAdd", ""],
      [15, "sys_account_dashboard", "_sys_menu_title_account_dashboard", "sys_account_dashboard", "system", 8, "", 0, 0, 1, "BxTemplMenuAccountDashboard", ""],
      [16, "sys_account_dashboard_manage_tools", "_sys_menu_title_account_dashboard_manage_tools", "sys_account_dashboard_manage_tools", "system", 24, "", 0, 0, 1, "BxTemplMenuDashboardManageTools", ""],
      [17, "sys_account_settings_submenu", "_sys_menu_title_account_settings", "sys_account_settings", "system", 8, "", 0, 0, 1, "", ""],
      [18, "sys_profiles_create", "_sys_menu_title_profiles_create", "sys_profiles_create", "system", 4, "", 0, 0, 1, "", ""],
      [19, "sys_cmts_item_manage", "_sys_menu_title_cmts_item_manage", "sys_cmts_item_manage", "system", 20, "", 0, 0, 1, "BxTemplCmtsMenuManage", ""],
      [20, "sys_cmts_item_actions", "_sys_menu_title_cmts_item_actions", "sys_cmts_item_actions", "system", 15, "", 0, 0, 1, "BxTemplCmtsMenuActions", ""],
      [21, "sys_cmts_item_counters", "_sys_menu_title_cmts_item_counters", "sys_cmts_item_counters", "system", 15, "", 0, 0, 1, "BxTemplCmtsMenuActions", ""],
      [22, "sys_cmts_item_meta", "_sys_menu_title_cmts_item_meta", "sys_cmts_item_meta", "system", 15, "", 0, 0, 1, "BxTemplCmtsMenuUnitMeta", ""],
      [23, "sys_account_popup", "_sys_menu_title_account_popup", "sys_account_popup", "system", 12, "", 0, 0, 1, "BxTemplMenuAccountPopup", ""],
      [24, "sys_account_notifications", "_sys_menu_title_account_notifications", "sys_account_notifications", "system", 19, "", 0, 0, 1, "BxTemplMenuAccountNotifications", ""],
      [25, "sys_profile_stats", "_sys_menu_title_profile_stats", "sys_profile_stats", "system", 21, "", 0, 0, 1, "BxTemplMenuProfileStats", ""],
      [26, "sys_tags_cloud", "_sys_menu_title_tags_cloud", "", "system", 21, "", 0, 0, 1, "BxBaseMenuTagsCloud", ""],
      [27, "sys_profile_followings", "_sys_menu_title_profile_followings", "sys_profile_followings", "system", 27, "", 0, 0, 1, "BxTemplMenuProfileFollowings", ""],
      [28, "sys_switch_language_popup", "_sys_menu_title_switch_language_popup", "sys_switch_language", "system", 6, "", 0, 0, 1, "BxTemplMenuSwitchLanguage", ""],
      [29, "sys_switch_language_inline", "_sys_menu_title_switch_language_inline", "sys_switch_language", "system", 3, "", 0, 0, 1, "BxTemplMenuSwitchLanguage", ""],
      [30, "sys_switch_template", "_sys_menu_title_switch_template", "sys_switch_template", "system", 6, "", 0, 0, 1, "BxTemplMenuSwitchTemplate", ""],
      [31, "sys_set_acl_level", "_sys_menu_title_set_acl_level", "", "system", 6, "", 0, 0, 1, "BxTemplMenuSetAclLevel", ""],
      [32, "sys_set_badges", "_sys_menu_title_set_badges", "", "system", 6, "", 0, 0, 1, "BxTemplMenuSetBadges", ""],
      [33, "sys_social_sharing", "_sys_menu_title_social_sharing", "sys_social_sharing", "system", 23, "", 0, 0, 1, "BxTemplMenuSocialSharing", ""],
      [34, "sys_create_post", "_sys_menu_title_create_post", "sys_add_content_links", "system", 15, "", 0, 0, 1, "BxTemplMenuCreatePost", ""],
      [35, "sys_dashboard_content", "_sys_menu_title_dashboard_content_manage", "sys_dashboard_content_manage", "system", 15, "", 0, 0, 1, "BxTemplMenuDashboardContentManage", ""],
      [36, "sys_dashboard_reports", "_sys_menu_title_dashboard_reports_manage", "sys_dashboard_reports_manage", "system", 15, "", 0, 0, 1, "BxTemplMenuDashboardReportsManage", ""],
      [37, "sys_add_relation", "_sys_menu_title_add_relation", "", "system", 6, "", 0, 0, 1, "BxTemplMenuAddRelation", ""],
      [38, "sys_vote_reactions_do", "_sys_menu_title_vote_reactions_do", "", "system", 3, "", 0, 0, 1, "BxTemplVoteReactionsMenuDo", ""],
      [39, "sys_wiki", "_sys_menu_title_wiki", "sys_wiki", "system", 6, "", 0, 0, 1, "BxTemplMenuWiki", ""],
      [40, "sys_favorite_list", "_sys_menu_title_favorite_list", "sys_favorite_list", "system", 9, "", 0, 0, 1, "", ""],
      [41, "sys_con_submenu", "_sys_menu_title_con_submenu", "sys_con_submenu", "system", 8, "", 0, 0, 1, "BxTemplMenuSubmenuWithAddons", ""],
      [42, "sys_studio_account_popup", "_sys_menu_title_studio_account_popup", "sys_studio_account_popup", "system", 4, "", 0, 0, 1, "BxTemplStudioMenuAccountPopup", ""],
      [43, "bx_artificer_sidebar_site", "_bx_artificer_menu_title_sidebar_site", "sys_site", "bx_artificer", 5893, "", 0, 0, 1, "BxTemplMenuSidebarSite", ""],
      [44, "bx_persons_view_actions", "_bx_persons_menu_title_view_profile_actions", "bx_persons_view_actions", "bx_persons", 9, "", 0, 0, 1, "BxPersonsMenuViewActions", "modules/boonex/persons/classes/BxPersonsMenuViewActions.php"],
      [45, "bx_persons_view_actions_more", "_bx_persons_menu_title_view_profile_actions_more", "bx_persons_view_actions_more", "bx_persons", 6, "", 0, 0, 1, "BxPersonsMenuViewActions", "modules/boonex/persons/classes/BxPersonsMenuViewActions.php"],
      [46, "bx_persons_view_actions_all", "_sys_menu_title_view_actions", "bx_persons_view_actions_all", "bx_persons", 15, "", 1, 0, 1, "BxPersonsMenuViewActionsAll", "modules/boonex/persons/classes/BxPersonsMenuViewActionsAll.php"],
      [47, "bx_persons_view_meta", "_bx_persons_menu_title_view_profile_meta", "bx_persons_view_meta", "bx_persons", 15, "", 0, 0, 1, "BxPersonsMenuViewMeta", "modules/boonex/persons/classes/BxPersonsMenuViewMeta.php"],
      [48, "bx_persons_submenu", "_bx_persons_menu_title_submenu", "bx_persons_submenu", "bx_persons", 8, "", 0, 0, 1, "", ""],
      [49, "bx_persons_view_submenu", "_bx_persons_menu_title_view_profile_submenu", "bx_persons_view_submenu", "bx_persons", 18, "", 0, 0, 1, "BxPersonsMenuView", "modules/boonex/persons/classes/BxPersonsMenuView.php"],
      [50, "bx_persons_snippet_meta", "_sys_menu_title_snippet_meta", "bx_persons_snippet_meta", "bx_persons", 15, "", 0, 0, 1, "BxPersonsMenuSnippetMeta", "modules/boonex/persons/classes/BxPersonsMenuSnippetMeta.php"],
      [51, "bx_persons_menu_manage_tools", "_bx_persons_menu_title_manage_tools", "bx_persons_menu_manage_tools", "bx_persons", 6, "", 0, 0, 1, "BxPersonsMenuManageTools", "modules/boonex/persons/classes/BxPersonsMenuManageTools.php"]
    ]
    
    table_name = "sys_objects_menu"
    columns = ["id", "object", "title", "set_name", "module", "template_id", "config_api", "persistent", "deletable", "active", "override_class_name", "override_class_file"]
    placeholders = Enum.map(1..length(columns), fn _i -> "?" end) |> Enum.join(", ")
    sql = "INSERT INTO #{table_name} (#{Enum.join(columns, ", ")}) VALUES (#{placeholders})"
    
    Enum.each(data, fn record ->
      case DeeperHub.Core.Data.Repo.execute(sql, record) do
        { :ok, result } ->
          DeeperHub.Core.Logger.info("Registro inserido com sucesso na tabela #{table_name}: #{inspect(result)}")
        { :error, reason } ->
          DeeperHub.Core.Logger.warning("Erro ao inserir registro na tabela #{table_name}: #{inspect(reason)}", [])
      end
    end)
    
    data
  end
end