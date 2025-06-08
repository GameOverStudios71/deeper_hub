defmodule DeeperHub.Core.Data.Migrations.Seeds.SysMenuTemplatesSeed do
  @moduledoc """
  Seed para a tabela sys_menu_templates.
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
    Logger.info("Inserindo registros na tabela sys_menu_templates...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [1, "menu_empty.html", "_sys_menu_template_title_empty", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [2, "menu_footer.html", "_sys_menu_template_title_footer", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [3, "menu_horizontal.html", "_sys_menu_template_title_hor", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [4, "menu_vertical_lite.html", "_sys_menu_template_title_ver_lite", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [5, "menu_toolbar.html", "_sys_menu_template_title_toolbar", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [6, "menu_vertical.html", "_sys_menu_template_title_ver", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [7, "menu_floating_blocks.html", "_sys_menu_template_title_floating_blocks", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [8, "menu_main_submenu.html", "_sys_menu_template_title_main_submenu", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [9, "menu_buttons_hor.html", "_sys_menu_template_title_buttons_hor", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [10, "menu_inline.html", "_sys_menu_template_title_inline", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [11, "menu_interactive_vertical.html", "_sys_menu_template_title_interactive_vertical", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [12, "menu_account_popup.html", "_sys_menu_template_title_account_popup", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [13, "menu_account_notifications.html", "_sys_menu_template_title_account_notifications", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [14, "menu_floating_blocks_big.html", "_sys_menu_template_title_floating_blocks_big", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [15, "menu_custom_hor.html", "_sys_menu_template_title_custom_hor", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [16, "menu_buttons_ver.html", "_sys_menu_template_title_buttons_ver", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [17, "menu_inline_sbtn.html", "_sys_menu_template_title_inline_sbtn", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [18, "menu_main_submenu_more_auto.html", "_sys_menu_template_title_main_submenu_more_auto", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [19, "menu_floating_blocks_wide.html", "_sys_menu_template_title_floating_blocks_wide", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [20, "menu_custom_ver.html", "_sys_menu_template_title_custom_ver", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [21, "menu_vertical_more_less.html", "_sys_menu_template_title_vertical_more_less", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [22, "menu_interactive.html", "_sys_menu_template_title_interactive", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [23, "menu_buttons_icon_hor.html", "_sys_menu_template_title_buttons_icon_hor", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [24, "menu_floating_blocks_dash.html", "_sys_menu_template_title_floating_blocks_dash", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [25, "menu_block_submenu_hor.html", "_sys_menu_template_title_block_submenu_hor", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [26, "menu_block_submenu_ver.html", "_sys_menu_template_title_block_submenu_ver", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [27, "menu_profile_followings.html", "_sys_menu_template_title_profile_followings", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [28, "menu_main.html", "_sys_menu_template_title_main", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [29, "menu_add_content.html", "_sys_menu_template_title_add_content", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [30, "menu_panel.html", "_sys_menu_template_title_panel", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [31, "menu_main_in_panel.html", "_sys_menu_template_title_main_in_panel", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [32, "menu_multilevel.html", "_sys_menu_template_title_multilevel", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?, ?, ?)", [5893, "menu_sidebar_site.html", "_bx_artificer_menu_template_title_sidebar_site", 1])
      Logger.info("Registros inseridos com sucesso na tabela sys_menu_templates!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_menu_templates: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_menu_templates...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_menu_templates")
    Logger.info("Tabela sys_menu_templates limpa com sucesso.", module: __MODULE__)
  end
end
