defmodule DeeperHub.Core.Data.Seeds.SeedSysMenuTemplates do
  @doc """
  Executa o seed para a tabela sys_menu_templates.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "menu_empty.html", "_sys_menu_template_title_empty", 1],
      [2, "menu_footer.html", "_sys_menu_template_title_footer", 0],
      [3, "menu_horizontal.html", "_sys_menu_template_title_hor", 1],
      [4, "menu_vertical_lite.html", "_sys_menu_template_title_ver_lite", 1],
      [5, "menu_toolbar.html", "_sys_menu_template_title_toolbar", 0],
      [6, "menu_vertical.html", "_sys_menu_template_title_ver", 1],
      [7, "menu_floating_blocks.html", "_sys_menu_template_title_floating_blocks", 1],
      [8, "menu_main_submenu.html", "_sys_menu_template_title_main_submenu", 0],
      [9, "menu_buttons_hor.html", "_sys_menu_template_title_buttons_hor", 1],
      [10, "menu_inline.html", "_sys_menu_template_title_inline", 1],
      [11, "menu_interactive_vertical.html", "_sys_menu_template_title_interactive_vertical", 0],
      [12, "menu_account_popup.html", "_sys_menu_template_title_account_popup", 0],
      [13, "menu_account_notifications.html", "_sys_menu_template_title_account_notifications", 0],
      [14, "menu_floating_blocks_big.html", "_sys_menu_template_title_floating_blocks_big", 1],
      [15, "menu_custom_hor.html", "_sys_menu_template_title_custom_hor", 0],
      [16, "menu_buttons_ver.html", "_sys_menu_template_title_buttons_ver", 1],
      [17, "menu_inline_sbtn.html", "_sys_menu_template_title_inline_sbtn", 1],
      [18, "menu_main_submenu_more_auto.html", "_sys_menu_template_title_main_submenu_more_auto", 0],
      [19, "menu_floating_blocks_wide.html", "_sys_menu_template_title_floating_blocks_wide", 0],
      [20, "menu_custom_ver.html", "_sys_menu_template_title_custom_ver", 0],
      [21, "menu_vertical_more_less.html", "_sys_menu_template_title_vertical_more_less", 0],
      [22, "menu_interactive.html", "_sys_menu_template_title_interactive", 0],
      [23, "menu_buttons_icon_hor.html", "_sys_menu_template_title_buttons_icon_hor", 1],
      [24, "menu_floating_blocks_dash.html", "_sys_menu_template_title_floating_blocks_dash", 0],
      [25, "menu_block_submenu_hor.html", "_sys_menu_template_title_block_submenu_hor", 1],
      [26, "menu_block_submenu_ver.html", "_sys_menu_template_title_block_submenu_ver", 1],
      [27, "menu_profile_followings.html", "_sys_menu_template_title_profile_followings", 0],
      [28, "menu_main.html", "_sys_menu_template_title_main", 0],
      [29, "menu_add_content.html", "_sys_menu_template_title_add_content", 0],
      [30, "menu_panel.html", "_sys_menu_template_title_panel", 0],
      [31, "menu_main_in_panel.html", "_sys_menu_template_title_main_in_panel", 0],
      [32, "menu_multilevel.html", "_sys_menu_template_title_multilevel", 1],
      [5893, "menu_sidebar_site.html", "_bx_artificer_menu_template_title_sidebar_site", 1]
    ]
    
    table_name = "sys_menu_templates"
    columns = ["id", "template", "title", "visible"]
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