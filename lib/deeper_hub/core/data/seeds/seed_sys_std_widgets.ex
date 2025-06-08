defmodule DeeperHub.Core.Data.Seeds.SeedSysStdWidgets do
  @doc """
  Executa o seed para a tabela sys_std_widgets.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "3", "system", "configuration", "{url_studio}settings.php", "", "wi-settings.svg", "_adm_wgt_cpt_settings", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [2, "4", "system", "extensions", "{url_studio}store.php", "", "wi-store.svg", "_adm_wgt_cpt_store", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [3, "2", "system", "", "{url_studio}dashboard.php", "", "wi-dashboard.svg", "_adm_wgt_cpt_dashboard", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:18:\"get_widget_notices\";s:6:\"params\";a:0:{}s:5:\"class\";s:20:\"TemplStudioDashboard\";}", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 1],
      [4, "5", "system", "appearance", "{url_studio}designer.php", "", "wi-designer.svg", "_adm_wgt_cpt_designer", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [5, "6", "system", "appearance", "{url_studio}polyglot.php", "", "wi-polyglot.svg", "_adm_wgt_cpt_polyglot", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [6, "7", "system", "structure", "{url_studio}builder_page.php", "", "wi-bld-pages.svg", "_adm_wgt_cpt_builder_pages", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [7, "8", "system", "structure", "{url_studio}builder_menu.php", "", "wi-bld-navigation.svg", "_adm_wgt_cpt_builder_menus", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [8, "9", "system", "structure", "{url_studio}builder_forms.php", "", "wi-bld-forms.svg", "_adm_wgt_cpt_builder_forms", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [9, "10", "system", "configuration", "{url_studio}builder_permissions.php", "", "wi-bld-permissions.svg", "_adm_wgt_cpt_builder_permissions", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [10, "11", "system", "configuration", "{url_studio}builder_roles.php", "", "wi-bld-roles.svg", "_adm_wgt_cpt_builder_roles", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [11, "12", "system", "content", "{url_studio}storages.php", "", "wi-storages.svg", "_adm_wgt_cpt_storages", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [12, "13", "system", "extensions", "{url_studio}audit.php", "", "wi-audit.svg", "_adm_wgt_cpt_audit", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [13, "14", "system", "structure", "{url_studio}badges.php", "", "wi-badges.svg", "_adm_wgt_cpt_badges", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [14, "15", "system", "configuration", "{url_studio}api.php", "", "wi-api.svg", "_adm_wgt_cpt_api", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [15, "16", "system", "configuration", "{url_studio}agents.php", "", "wi-agents.svg", "_adm_wgt_cpt_agents", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [16, "17", "bx_en", "appearance", "{url_studio}language.php?name=bx_en", "", "bx_en@modules/boonex/english/|std-icon.svg", "_bx_eng_wgt_cpt", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:20:\"TemplStudioLanguages\";}", 0],
      [17, "18", "bx_artificer", "appearance", "{url_studio}design.php?name=bx_artificer", "", "bx_artificer@modules/boonex/artificer/|std-icon.svg", "_bx_artificer_wgt_cpt", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioDesigns\";}", 0],
      [18, "19", "bx_persons", "users", "{url_studio}module.php?name=bx_persons", "", "bx_persons@modules/boonex/persons/|std-icon.svg", "_bx_persons", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0],
      [19, "20", "bx_profiler", "extensions", "{url_studio}module.php?name=bx_profiler", "", "bx_profiler@modules/boonex/profiler/|std-icon.svg", "_bx_profiler", "", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"get_actions\";s:6:\"params\";a:0:{}s:5:\"class\";s:18:\"TemplStudioModules\";}", 0]
    ]
    
    table_name = "sys_std_widgets"
    columns = ["id", "page_id", "module", "type", "url", "click", "icon", "caption", "cnt_notices", "cnt_actions", "featured"]
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