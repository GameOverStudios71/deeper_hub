defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdWidgetsSeed do
  @moduledoc """
  Seed para a tabela sys_std_widgets.
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
    Logger.info("Inserindo registros na tabela sys_std_widgets...", module: __MODULE__)

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
      Logger.info("Registros inseridos com sucesso na tabela sys_std_widgets!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_std_widgets: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_std_widgets...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_std_widgets")
    Logger.info("Tabela sys_std_widgets limpa com sucesso.", module: __MODULE__)
  end
end
