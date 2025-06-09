defmodule DeeperHub.Core.Data.Migrations.Seeds.SysMenuTemplatesSeed do
  @moduledoc """
  Seed para a tabela sys_menu_templates.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_menu_templates_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_menu_templates já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_menu_templates...", module: __MODULE__)

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

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_menu_templates executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_menu_templates: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_menu_templates...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_menu_templates será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_menu_templates...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_menu_templates")
    Logger.info("Tabela sys_menu_templates limpa com sucesso.", module: __MODULE__)
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
