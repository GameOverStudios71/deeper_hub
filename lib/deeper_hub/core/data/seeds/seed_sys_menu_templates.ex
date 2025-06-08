defmodule DeeperHub.Core.Data.Seeds.SeedSysMenuTemplates do
  @doc """
  Executa o seed para a tabela sys_menu_templates.
  """
  def run do
    # Inserir dados para sys_menu_templates
    [
      %{ id: 1, template: "menu_empty.html", title: "_sys_menu_template_title_empty", visible: 1 },
      %{ id: 2, template: "menu_footer.html", title: "_sys_menu_template_title_footer", visible: 0 },
      %{ id: 3, template: "menu_horizontal.html", title: "_sys_menu_template_title_hor", visible: 1 },
      %{ id: 4, template: "menu_vertical_lite.html", title: "_sys_menu_template_title_ver_lite", visible: 1 },
      %{ id: 5, template: "menu_toolbar.html", title: "_sys_menu_template_title_toolbar", visible: 0 },
      %{ id: 6, template: "menu_vertical.html", title: "_sys_menu_template_title_ver", visible: 1 },
      %{ id: 7, template: "menu_floating_blocks.html", title: "_sys_menu_template_title_floating_blocks", visible: 1 },
      %{ id: 8, template: "menu_main_submenu.html", title: "_sys_menu_template_title_main_submenu", visible: 0 },
      %{ id: 9, template: "menu_buttons_hor.html", title: "_sys_menu_template_title_buttons_hor", visible: 1 },
      %{ id: 10, template: "menu_inline.html", title: "_sys_menu_template_title_inline", visible: 1 },
      %{ id: 11, template: "menu_interactive_vertical.html", title: "_sys_menu_template_title_interactive_vertical", visible: 0 },
      %{ id: 12, template: "menu_account_popup.html", title: "_sys_menu_template_title_account_popup", visible: 0 },
      %{ id: 13, template: "menu_account_notifications.html", title: "_sys_menu_template_title_account_notifications", visible: 0 },
      %{ id: 14, template: "menu_floating_blocks_big.html", title: "_sys_menu_template_title_floating_blocks_big", visible: 1 },
      %{ id: 15, template: "menu_custom_hor.html", title: "_sys_menu_template_title_custom_hor", visible: 0 },
      %{ id: 16, template: "menu_buttons_ver.html", title: "_sys_menu_template_title_buttons_ver", visible: 1 },
      %{ id: 17, template: "menu_inline_sbtn.html", title: "_sys_menu_template_title_inline_sbtn", visible: 1 },
      %{ id: 18, template: "menu_main_submenu_more_auto.html", title: "_sys_menu_template_title_main_submenu_more_auto", visible: 0 },
      %{ id: 19, template: "menu_floating_blocks_wide.html", title: "_sys_menu_template_title_floating_blocks_wide", visible: 0 },
      %{ id: 20, template: "menu_custom_ver.html", title: "_sys_menu_template_title_custom_ver", visible: 0 },
      %{ id: 21, template: "menu_vertical_more_less.html", title: "_sys_menu_template_title_vertical_more_less", visible: 0 },
      %{ id: 22, template: "menu_interactive.html", title: "_sys_menu_template_title_interactive", visible: 0 },
      %{ id: 23, template: "menu_buttons_icon_hor.html", title: "_sys_menu_template_title_buttons_icon_hor", visible: 1 },
      %{ id: 24, template: "menu_floating_blocks_dash.html", title: "_sys_menu_template_title_floating_blocks_dash", visible: 0 },
      %{ id: 25, template: "menu_block_submenu_hor.html", title: "_sys_menu_template_title_block_submenu_hor", visible: 1 },
      %{ id: 26, template: "menu_block_submenu_ver.html", title: "_sys_menu_template_title_block_submenu_ver", visible: 1 },
      %{ id: 27, template: "menu_profile_followings.html", title: "_sys_menu_template_title_profile_followings", visible: 0 },
      %{ id: 28, template: "menu_main.html", title: "_sys_menu_template_title_main", visible: 0 },
      %{ id: 29, template: "menu_add_content.html", title: "_sys_menu_template_title_add_content", visible: 0 },
      %{ id: 30, template: "menu_panel.html", title: "_sys_menu_template_title_panel", visible: 0 },
      %{ id: 31, template: "menu_main_in_panel.html", title: "_sys_menu_template_title_main_in_panel", visible: 0 },
      %{ id: 32, template: "menu_multilevel.html", title: "_sys_menu_template_title_multilevel", visible: 1 },
      %{ id: 5893, template: "menu_sidebar_site.html", title: "_bx_artificer_menu_template_title_sidebar_site", visible: 1 }
    ]
  end
end