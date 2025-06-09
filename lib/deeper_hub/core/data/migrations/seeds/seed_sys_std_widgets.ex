defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdWidgetsSeed do
  @moduledoc """
  Seed para a tabela sys_std_widgets.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_std_widgets_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_std_widgets já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_std_widgets...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "3", "system", "configuration", "{url_studio}settings.php", "", "wi-settings.svg", "_adm_wgt_cpt_settings", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "4", "system", "extensions", "{url_studio}store.php", "", "wi-store.svg", "_adm_wgt_cpt_store", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "2", "system", "", "{url_studio}dashboard.php", "", "wi-dashboard.svg", "_adm_wgt_cpt_dashboard", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:18:\"get_widget_notices\";s:6:\"params\";a:0:{}s:5:\"class\";s:20:\"TemplStudioDashboard\";}", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "5", "system", "appearance", "{url_studio}designer.php", "", "wi-designer.svg", "_adm_wgt_cpt_designer", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "6", "system", "appearance", "{url_studio}polyglot.php", "", "wi-polyglot.svg", "_adm_wgt_cpt_polyglot", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "7", "system", "structure", "{url_studio}builder_page.php", "", "wi-bld-pages.svg", "_adm_wgt_cpt_builder_pages", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, "8", "system", "structure", "{url_studio}builder_menu.php", "", "wi-bld-navigation.svg", "_adm_wgt_cpt_builder_menus", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, "9", "system", "structure", "{url_studio}builder_forms.php", "", "wi-bld-forms.svg", "_adm_wgt_cpt_builder_forms", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, "10", "system", "configuration", "{url_studio}builder_permissions.php", "", "wi-bld-permissions.svg", "_adm_wgt_cpt_builder_permissions", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [10, "11", "system", "configuration", "{url_studio}builder_roles.php", "", "wi-bld-roles.svg", "_adm_wgt_cpt_builder_roles", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [11, "12", "system", "content", "{url_studio}storages.php", "", "wi-storages.svg", "_adm_wgt_cpt_storages", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, "13", "system", "extensions", "{url_studio}audit.php", "", "wi-audit.svg", "_adm_wgt_cpt_audit", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, "14", "system", "structure", "{url_studio}badges.php", "", "wi-badges.svg", "_adm_wgt_cpt_badges", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, "15", "system", "configuration", "{url_studio}api.php", "", "wi-api.svg", "_adm_wgt_cpt_api", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, "16", "system", "configuration", "{url_studio}agents.php", "", "wi-agents.svg", "_adm_wgt_cpt_agents", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [16, "17", "bx_en", "appearance", "{url_studio}language.php?name=bx_en", "", "bx_en@modules/boonex/english/|std-icon.svg", "_bx_eng_wgt_cpt", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:20:\"TemplStudioLanguages\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [17, "18", "bx_artificer", "appearance", "{url_studio}design.php?name=bx_artificer", "", "bx_artificer@modules/boonex/artificer/|std-icon.svg", "_bx_artificer_wgt_cpt", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioDesigns\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [18, "19", "bx_persons", "users", "{url_studio}module.php?name=bx_persons", "", "bx_persons@modules/boonex/persons/|std-icon.svg", "_bx_persons", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [19, "20", "bx_profiler", "extensions", "{url_studio}module.php?name=bx_profiler", "", "bx_profiler@modules/boonex/profiler/|std-icon.svg", "_bx_profiler", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [20, "21", "bx_accounts", "users", "{url_studio}module.php?name=bx_accounts", "", "bx_accounts@modules/boonex/accounts/|std-icon.svg", "_bx_accnt", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [48, "49", "bx_events", "content", "{url_studio}module.php?name=bx_events", "", "bx_events@modules/boonex/events/|std-icon.svg", "_bx_events", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [47, "48", "bx_groups", "content", "{url_studio}module.php?name=bx_groups", "", "bx_groups@modules/boonex/groups/|std-icon.svg", "_bx_groups", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [23, "24", "bx_analytics", "extensions", "{url_studio}module.php?name=bx_analytics", "", "bx_analytics@modules/boonex/analytics/|std-icon.svg", "_bx_analytics", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [24, "25", "bx_anon_follow", "extensions", "{url_studio}module.php?name=bx_anon_follow", "", "bx_anon_follow@modules/boonex/anon_follow/|std-icon.svg", "_bx_anon_follow", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [25, "26", "bx_antispam", "extensions", "{url_studio}module.php?name=bx_antispam", "", "bx_antispam@modules/boonex/antispam/|std-icon.svg", "_bx_antispam", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [26, "27", "bx_attendant", "extensions", "{url_studio}module.php?name=bx_attendant", "", "bx_attendant@modules/boonex/attendant/|std-icon.svg", "_bx_attendant", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [30, "31", "bx_charts", "extensions", "{url_studio}module.php?name=bx_charts", "", "bx_charts@modules/boonex/charts/|std-icon.svg", "_bx_charts", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [59, "60", "bx_classes", "content", "{url_studio}module.php?name=bx_classes", "", "bx_classes@modules/boonex/classes/|std-icon.svg", "_bx_classes", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [53, "54", "bx_ads", "content", "{url_studio}module.php?name=bx_ads", "", "bx_ads@modules/boonex/ads/|std-icon.svg", "_bx_ads", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [49, "50", "bx_reviews", "content", "{url_studio}module.php?name=bx_reviews", "", "bx_reviews@modules/boonex/reviews/|std-icon.svg", "_bx_reviews", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [33, "34", "bx_contact", "extensions", "{url_studio}module.php?name=bx_contact", "", "bx_contact@modules/boonex/contact/|std-icon.svg", "_bx_contact", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [56, "57", "bx_credits", "extensions", "{url_studio}module.php?name=bx_credits", "", "bx_credits@modules/boonex/credits/|std-icon.svg", "_bx_credits", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [61, "62", "bx_convos", "content", "{url_studio}module.php?name=bx_convos", "", "bx_convos@modules/boonex/convos/|std-icon.svg", "_bx_cnv", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [39, "40", "bx_forum", "content", "{url_studio}module.php?name=bx_forum", "", "bx_forum@modules/boonex/forum/|std-icon.svg", "_bx_forum", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [40, "41", "bx_googletagman", "integrations", "{url_studio}module.php?name=bx_googletagman", "", "bx_googletagman@modules/boonex/google_tagmanager/|std-icon.svg", "_bx_googletagman", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [41, "42", "bx_feedback", "content", "{url_studio}module.php?name=bx_feedback", "", "bx_feedback@modules/boonex/feedback/|std-icon.svg", "_bx_feedback", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [42, "43", "bx_donations", "", "{url_studio}module.php?name=bx_donations", "", "bx_donations@modules/boonex/donations/|std-icon.svg", "_bx_donations", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [43, "44", "bx_reminders", "extensions", "{url_studio}module.php?name=bx_reminders", "", "bx_reminders@modules/boonex/reminders/|std-icon.svg", "_bx_reminders", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [44, "45", "bx_massmailer", "extensions", "{url_studio}module.php?name=bx_massmailer", "", "bx_massmailer@modules/boonex/massmailer/|std-icon.svg", "_bx_massmailer", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [45, "46", "bx_notifications", "extensions", "{url_studio}module.php?name=bx_notifications", "", "bx_notifications@modules/boonex/notifications/|std-icon.svg", "_bx_ntfs", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [46, "47", "bx_glossary", "content", "{url_studio}module.php?name=bx_glossary", "", "bx_glossary@modules/boonex/glossary/|std-icon.svg", "_bx_glossary", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [58, "59", "bx_albums", "content", "{url_studio}module.php?name=bx_albums", "", "bx_albums@modules/boonex/albums/|std-icon.svg", "_bx_albums", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [60, "61", "bx_channels", "extensions", "{url_studio}module.php?name=bx_channels", "", "bx_channels@modules/boonex/channels/|std-icon.svg", "_bx_channels", "a:4:{s:6:\"module\";s:11:\"bx_channels\";s:6:\"method\";s:18:\"get_widget_notices\";s:6:\"params\";a:0:{}s:5:\"class\";s:6:\"Module\";}", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_std_widgets (id, page_id, module, 'type', url, click, icon, caption, cnt_notices, cnt_actions, featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [63, "64", "bx_courses", "content", "{url_studio}module.php?name=bx_courses", "", "bx_courses@modules/boonex/courses/|std-icon.svg", "_bx_courses", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_std_widgets executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_std_widgets: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_std_widgets...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_std_widgets será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_std_widgets...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_std_widgets")
    Logger.info("Tabela sys_std_widgets limpa com sucesso.", module: __MODULE__)
  end

  # Funções privadas para controle de execução
  defp seed_already_executed? do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.exists?(seed_file)
  end

  defp mark_seed_executed do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    File.write(seed_file, "executed_at: #{timestamp}")
  end

  defp ensure_seeds_dir do
    unless File.exists?(@seeds_dir) do
      File.mkdir_p(@seeds_dir)
    end
  end
end
