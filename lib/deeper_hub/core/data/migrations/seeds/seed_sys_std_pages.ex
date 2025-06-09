defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdPagesSeed do
  @moduledoc """
  Seed para a tabela sys_std_pages.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_std_pages_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_std_pages já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_std_pages...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [1, 3, "home", "_adm_page_cpt_home", "_adm_page_cpt_home", "bc-home.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [2, 4, "dashboard", "_adm_page_cpt_dashboard", "_adm_page_cpt_dashboard", "wi-dashboard.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [3, 3, "settings", "_adm_page_cpt_settings", "_adm_page_cpt_settings", "wi-settings.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [4, 3, "store", "_adm_page_cpt_store", "_adm_page_cpt_store", "wi-store.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [5, 3, "designer", "_adm_page_cpt_designer", "_adm_page_cpt_designer", "wi-designer.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [6, 3, "polyglot", "_adm_page_cpt_polyglot", "_adm_page_cpt_polyglot", "wi-polyglot.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [7, 3, "builder_pages", "_adm_page_cpt_builder_pages", "_adm_page_cpt_builder_pages", "wi-bld-pages.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [8, 3, "builder_menus", "_adm_page_cpt_builder_menus", "_adm_page_cpt_builder_menus", "wi-bld-navigation.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [9, 3, "builder_forms", "_adm_page_cpt_builder_forms", "_adm_page_cpt_builder_forms", "wi-bld-forms.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [10, 3, "builder_permissions", "_adm_page_cpt_builder_permissions", "_adm_page_cpt_builder_permissions", "wi-bld-permissions.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [11, 3, "builder_roles", "_adm_page_cpt_builder_roles", "_adm_page_cpt_builder_roles", "wi-bld-roles.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [12, 3, "storages", "_adm_page_cpt_storages", "_adm_page_cpt_storages", "wi-storages.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [13, 3, "audit", "_adm_page_cpt_audit", "_adm_page_cpt_audit", "wi-audit.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [14, 3, "badges", "_adm_page_cpt_badges", "_adm_page_cpt_badges", "wi-badges.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [15, 3, "api", "_adm_page_cpt_api", "_adm_page_cpt_api", "wi-api.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [16, 3, "agents", "_adm_page_cpt_agents", "_adm_page_cpt_agents", "wi-agents.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [17, 3, "bx_en", "", "", "bx_en@modules/boonex/english/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [18, 3, "bx_artificer", "", "", "bx_artificer@modules/boonex/artificer/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [19, 3, "bx_persons", "_bx_persons", "_bx_persons", "bx_persons@modules/boonex/persons/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [20, 3, "bx_profiler", "_bx_profiler", "_bx_profiler", "bx_profiler@modules/boonex/profiler/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [21, 3, "bx_accounts", "_bx_accnt", "_bx_accnt", "bx_accounts@modules/boonex/accounts/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [49, 3, "bx_events", "_bx_events", "_bx_events", "bx_events@modules/boonex/events/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [48, 3, "bx_groups", "_bx_groups", "_bx_groups", "bx_groups@modules/boonex/groups/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [24, 3, "bx_analytics", "_bx_analytics", "_bx_analytics", "bx_analytics@modules/boonex/analytics/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [25, 3, "bx_anon_follow", "_bx_anon_follow", "_bx_anon_follow", "bx_anon_follow@modules/boonex/anon_follow/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [26, 3, "bx_antispam", "_bx_antispam", "_bx_antispam", "bx_antispam@modules/boonex/antispam/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [27, 3, "bx_attendant", "_bx_attendant", "_bx_attendant", "bx_attendant@modules/boonex/attendant/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [31, 3, "bx_charts", "_bx_charts", "_bx_charts", "bx_charts@modules/boonex/charts/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [60, 3, "bx_classes", "_bx_classes", "_bx_classes", "bx_classes@modules/boonex/classes/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [50, 3, "bx_reviews", "_bx_reviews", "_bx_reviews", "bx_reviews@modules/boonex/reviews/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [34, 3, "bx_contact", "_bx_contact", "_bx_contact", "bx_contact@modules/boonex/contact/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [54, 3, "bx_ads", "_bx_ads", "_bx_ads", "bx_ads@modules/boonex/ads/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [57, 3, "bx_credits", "_bx_credits", "_bx_credits", "bx_credits@modules/boonex/credits/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [62, 3, "bx_convos", "_bx_cnv", "_bx_cnv", "bx_convos@modules/boonex/convos/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [40, 3, "bx_forum", "_bx_forum", "_bx_forum", "bx_forum@modules/boonex/forum/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [41, 3, "bx_googletagman", "_bx_googletagman", "_bx_googletagman", "bx_googletagman@modules/boonex/google_tagmanager/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [42, 3, "bx_feedback", "_bx_feedback", "_bx_feedback", "bx_feedback@modules/boonex/feedback/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [43, 3, "bx_donations", "_bx_donations", "_bx_donations", "bx_donations@modules/boonex/donations/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [44, 3, "bx_reminders", "_bx_reminders", "_bx_reminders", "bx_reminders@modules/boonex/reminders/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [45, 3, "bx_massmailer", "_bx_massmailer", "_bx_massmailer", "bx_massmailer@modules/boonex/massmailer/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [46, 3, "bx_notifications", "_bx_ntfs", "_bx_ntfs", "bx_notifications@modules/boonex/notifications/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [47, 3, "bx_glossary", "_bx_glossary", "_bx_glossary", "bx_glossary@modules/boonex/glossary/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [59, 3, "bx_albums", "_bx_albums", "_bx_albums", "bx_albums@modules/boonex/albums/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [61, 3, "bx_channels", "_bx_channels", "_bx_channels", "bx_channels@modules/boonex/channels/|std-icon.svg"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages (id, 'index', name, header, caption, icon) VALUES (?, ?, ?, ?, ?, ?)", [64, 3, "bx_courses", "_bx_courses", "_bx_courses", "bx_courses@modules/boonex/courses/|std-icon.svg"])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_std_pages executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_std_pages: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_std_pages...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_std_pages será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_std_pages...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_std_pages")
    Logger.info("Tabela sys_std_pages limpa com sucesso.", module: __MODULE__)
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
