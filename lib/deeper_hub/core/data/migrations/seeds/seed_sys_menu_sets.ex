defmodule DeeperHub.Core.Data.Migrations.Seeds.SysMenuSetsSeed do
  @moduledoc """
  Seed para a tabela sys_menu_sets.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_menu_sets_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_menu_sets já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_menu_sets...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_site", "system", "_sys_menu_set_title_site", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_application", "system", "_sys_menu_set_title_application", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_homepage", "system", "_sys_menu_set_title_homepage", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_homepage_submenu", "system", "_sys_menu_set_title_homepage_submenu", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_site_panel", "system", "_sys_menu_set_title_panel", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_footer", "system", "_sys_menu_set_title_footer", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_toolbar_site", "system", "_sys_menu_set_title_toolbar_site", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_toolbar_member", "system", "_sys_menu_set_title_toolbar_member", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_account_popup", "system", "_sys_menu_set_title_account_popup", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_account_notifications", "system", "_sys_menu_set_title_account_notifications", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_add_content_links", "system", "_sys_menu_set_title_add_content", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_dashboard_content_manage", "system", "_sys_menu_set_title_dashboard_content_manage", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_dashboard_reports_manage", "system", "_sys_menu_set_title_dashboard_reports_manage", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_add_profile_links", "system", "_sys_menu_set_title_add_profile", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_account_dashboard", "system", "_sys_menu_set_title_account_dashboard", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_account_dashboard_manage_tools", "system", "_sys_menu_set_title_account_dashboard_manage_tools", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_account_settings", "system", "_sys_menu_set_title_account_settings", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_profiles_create", "system", "_sys_menu_set_title_profile_create_links", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_profile_stats", "system", "_sys_menu_set_title_profile_stats", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_profile_followings", "system", "_sys_menu_set_title_profile_followings", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_cmts_item_manage", "system", "_sys_menu_set_title_cmts_item_manage", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_cmts_item_actions", "system", "_sys_menu_set_title_cmts_item_actions", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_cmts_item_counters", "system", "_sys_menu_set_title_cmts_item_counters", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_cmts_item_meta", "system", "_sys_menu_set_title_cmts_item_meta", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_switch_language", "system", "_sys_menu_set_title_switch_language", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_switch_template", "system", "_sys_menu_set_title_switch_template", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_social_sharing", "system", "_sys_menu_set_title_sys_social_sharing", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_wiki", "system", "_sys_menu_set_title_sys_wiki", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_favorite_list", "system", "_sys_menu_set_title_sys_favorite_list", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_con_submenu", "system", "_sys_menu_set_title_con_submenu", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["sys_studio_account_popup", "system", "_sys_menu_set_title_studio_account_popup", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_view_actions", "bx_persons", "_bx_persons_menu_set_title_view_profile_actions", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_view_actions_more", "bx_persons", "_bx_persons_menu_set_title_view_profile_actions_more", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_view_actions_all", "bx_persons", "_sys_menu_set_title_view_actions", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_view_meta", "bx_persons", "_bx_persons_menu_set_title_view_profile_meta", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_submenu", "bx_persons", "_bx_persons_menu_set_title_submenu", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_view_submenu", "bx_persons", "_bx_persons_menu_set_title_view_profile_submenu", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_snippet_meta", "bx_persons", "_sys_menu_set_title_snippet_meta", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_menu_sets (set_name, module, title, deletable) VALUES (?, ?, ?, ?)", ["bx_persons_menu_manage_tools", "bx_persons", "_bx_persons_menu_set_title_manage_tools", 0])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_menu_sets executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_menu_sets: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_menu_sets...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_menu_sets...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_menu_sets")
    Logger.info("Tabela sys_menu_sets limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
