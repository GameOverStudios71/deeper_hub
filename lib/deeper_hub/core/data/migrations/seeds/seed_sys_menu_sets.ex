defmodule DeeperHub.Core.Data.Migrations.Seeds.SysMenuSetsSeed do
  @moduledoc """
  Seed para a tabela sys_menu_sets.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_menu_sets...")

    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_site", "system", "_sys_menu_set_title_site", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_application", "system", "_sys_menu_set_title_application", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_homepage", "system", "_sys_menu_set_title_homepage", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_homepage_submenu", "system", "_sys_menu_set_title_homepage_submenu", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_site_panel", "system", "_sys_menu_set_title_panel", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_footer", "system", "_sys_menu_set_title_footer", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_toolbar_site", "system", "_sys_menu_set_title_toolbar_site", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_toolbar_member", "system", "_sys_menu_set_title_toolbar_member", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_account_popup", "system", "_sys_menu_set_title_account_popup", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_account_notifications", "system", "_sys_menu_set_title_account_notifications", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_add_content_links", "system", "_sys_menu_set_title_add_content", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_dashboard_content_manage", "system", "_sys_menu_set_title_dashboard_content_manage", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_dashboard_reports_manage", "system", "_sys_menu_set_title_dashboard_reports_manage", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_add_profile_links", "system", "_sys_menu_set_title_add_profile", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_account_dashboard", "system", "_sys_menu_set_title_account_dashboard", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_account_dashboard_manage_tools", "system", "_sys_menu_set_title_account_dashboard_manage_tools", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_account_settings", "system", "_sys_menu_set_title_account_settings", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_profiles_create", "system", "_sys_menu_set_title_profile_create_links", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_profile_stats", "system", "_sys_menu_set_title_profile_stats", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_profile_followings", "system", "_sys_menu_set_title_profile_followings", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_cmts_item_manage", "system", "_sys_menu_set_title_cmts_item_manage", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_cmts_item_actions", "system", "_sys_menu_set_title_cmts_item_actions", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_cmts_item_counters", "system", "_sys_menu_set_title_cmts_item_counters", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_cmts_item_meta", "system", "_sys_menu_set_title_cmts_item_meta", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_switch_language", "system", "_sys_menu_set_title_switch_language", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_switch_template", "system", "_sys_menu_set_title_switch_template", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_social_sharing", "system", "_sys_menu_set_title_sys_social_sharing", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_wiki", "system", "_sys_menu_set_title_sys_wiki", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_favorite_list", "system", "_sys_menu_set_title_sys_favorite_list", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_con_submenu", "system", "_sys_menu_set_title_con_submenu", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_studio_account_popup", "system", "_sys_menu_set_title_studio_account_popup", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_view_actions", "bx_persons", "_bx_persons_menu_set_title_view_profile_actions", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_view_actions_more", "bx_persons", "_bx_persons_menu_set_title_view_profile_actions_more", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_view_actions_all", "bx_persons", "_sys_menu_set_title_view_actions", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_view_meta", "bx_persons", "_bx_persons_menu_set_title_view_profile_meta", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_submenu", "bx_persons", "_bx_persons_menu_set_title_submenu", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_view_submenu", "bx_persons", "_bx_persons_menu_set_title_view_profile_submenu", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_snippet_meta", "bx_persons", "_sys_menu_set_title_snippet_meta", 0])
    Repo.execute("INSERT INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_menu_manage_tools", "bx_persons", "_bx_persons_menu_set_title_manage_tools", 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
