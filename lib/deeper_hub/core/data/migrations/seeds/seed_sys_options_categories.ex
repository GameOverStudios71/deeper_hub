defmodule DeeperHub.Core.Data.Migrations.Seeds.SysOptionsCategoriesSeed do
  @moduledoc """
  Seed para a tabela sys_options_categories.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_options_categories_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_options_categories já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_options_categories...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [1, 1, "hidden", "_adm_stg_cpt_category_hidden", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [2, 1, "system", "_adm_stg_cpt_category_system", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [3, 1, "languages", "_adm_stg_cpt_category_languages", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [4, 1, "templates", "_adm_stg_cpt_category_templates", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [5, 1, "site_settings", "_adm_stg_cpt_category_site_settings", 0, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [6, 1, "general", "_adm_stg_cpt_category_general", 0, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [7, 1, "cache", "_adm_stg_cpt_category_cache", 0, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [8, 1, "permalinks", "_adm_stg_cpt_category_permalinks", 0, 9])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [9, 1, "security", "_adm_stg_cpt_category_security", 0, 11])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [10, 1, "storage", "_adm_stg_cpt_category_storage", 0, 13])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [11, 1, "account", "_adm_stg_cpt_category_account", 0, 14])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [12, 1, "acl", "_adm_stg_cpt_category_acl", 0, 15])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [13, 1, "notifications", "_adm_stg_cpt_category_notifications", 0, 16])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [14, 1, "notifications_push", "_adm_stg_cpt_category_notifications_push", 0, 17])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [15, 1, "sms", "_adm_stg_cpt_category_sms", 0, 18])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [16, 1, "location", "_adm_stg_cpt_category_location", 0, 20])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [17, 1, "social_settings", "_adm_stg_cpt_category_social_settings", 0, 21])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [18, 1, "sockets", "_adm_stg_cpt_category_sockets", 0, 22])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [19, 1, "audit", "_adm_stg_cpt_category_audit", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [20, 1, "api_general", "_adm_stg_cpt_category_api_general", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [21, 1, "api_layout", "_adm_stg_cpt_category_api_layout", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [22, 1, "api_config", "_adm_stg_cpt_category_api_config", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [23, 1, "pwa_manifest", "_adm_stg_cpt_category_pwa_manifest", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [24, 1, "pwa_sw", "_adm_stg_cpt_category_pwa_sw", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [25, 1, "agents_general", "_adm_stg_cpt_category_agents_general", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [26, 1, "agents_usage", "_adm_stg_cpt_category_agents_usage", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [27, 2, "bx_en_system", "_bx_eng_stg_cpt_category_system", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [28, 3, "bx_artificer_system", "_bx_artificer_stg_cpt_category_system", 0, 10])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [29, 3, "bx_artificer_styles_custom", "_bx_artificer_stg_cpt_category_styles_custom", 0, 20])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [30, 4, "bx_persons", "_bx_persons", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [31, 5, "bx_profiler", "Debug Panel", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [32, 5, "bx_profiler_sql_querues", "SQL Queries", 0, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [33, 5, "bx_profiler_modules_queries", "Modules Queries", 0, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [34, 5, "bx_profiler_page_opens", "Pages opens", 0, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [35, 6, "bx_accounts", "_bx_accounts", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [36, 7, "bx_analytics_general", "_bx_analytics_adm_stg_cpt_category_general", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [37, 8, "bx_anon_follow", "_bx_anon_follow", 0, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [38, 9, "bx_attendant_on_profile_creation", "_bx_attendant_adm_stg_cpt_category_on_profile_creation", 0, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [50, 12, "bx_charts_chart_chart_growth", "_bx_charts_adm_stg_cpt_category_chart_growth", 0, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [48, 12, "bx_charts_chart_most_active_profiles", "_bx_charts_adm_stg_cpt_category_chart_most_active_profiles", 0, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [49, 12, "bx_charts_chart_most_followed_profiles", "_bx_charts_adm_stg_cpt_category_chart_most_followed_profiles", 0, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [47, 12, "bx_charts_chart1", "_bx_charts_adm_stg_cpt_category_chart_top_contents_by_likes", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [51, 13, "bx_antispam_general", "_bx_antispam_adm_stg_cpt_category_general", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [52, 13, "bx_antispam_ip_table", "_bx_antispam_adm_stg_cpt_category_ip_table", 0, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [53, 13, "bx_antispam_dnsbl", "_bx_antispam_adm_stg_cpt_category_dnsbl", 0, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [54, 13, "bx_antispam_akismet", "_bx_antispam_adm_stg_cpt_category_akismet", 0, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [55, 13, "bx_antispam_stopforumspam", "_bx_antispam_adm_stg_cpt_category_stopforumspam", 0, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [56, 13, "bx_antispam_disposable_email_domains", "_bx_antispam_adm_stg_cpt_category_disposable_email_domains", 0, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [57, 13, "bx_antispam_profanity_filter", "_bx_antispam_adm_stg_cpt_category_profanity_filter", 0, 7])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [58, 13, "bx_antispam_toxicity_filter", "_bx_antispam_adm_stg_cpt_category_toxicity_filter", 0, 8])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [59, 14, "bx_contact", "_bx_contact", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [60, 15, "bx_googletagman_general", "_sys_connect_adm_stg_cpt_category_general", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [61, 16, "bx_reminders", "_bx_reminders", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, 'order') VALUES (?, ?, ?, ?, ?, ?)", [62, 17, "bx_convos", "_bx_cnv", 0, 1])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_options_categories executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_options_categories: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_options_categories...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_options_categories será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_options_categories...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_options_categories")
    Logger.info("Tabela sys_options_categories limpa com sucesso.", module: __MODULE__)
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
