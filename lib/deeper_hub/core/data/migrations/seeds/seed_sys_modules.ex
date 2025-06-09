defmodule DeeperHub.Core.Data.Migrations.Seeds.SysModulesSeed do
  @moduledoc """
  Seed para a tabela sys_modules.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_modules_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_modules já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_modules...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "module", 0, "system", "System", "UNA, Inc", "15.0.0-DEV1", "", "", "system", "Bx", "sys_", "System", "", 1749379445, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "language", 0, "bx_en", "English", "UNA INC", "14.0.10.DEV", "http://feed.una.io/?section={module_name}", "boonex/english/", "en", "BxEng", "bx_eng_", "BoonEx English", "", 1749379454, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "template", 0, "bx_artificer", "Artificer", "UNA INC", "14.0.10.DEV", "http://feed.una.io/?section={module_name}", "boonex/artificer/", "artificer", "BxArtificer", "bx_artificer_", "Boonex Artificer Template", "", 1749379454, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "module", 2, "bx_persons", "Persons", "UNA INC", "14.0.7.DEV", "http://feed.una.io/?section={module_name}", "boonex/persons/", "persons", "BxPersons", "bx_persons_", "Persons", "", 1749379456, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "module", 0, "bx_profiler", "Profiler", "Boonex", "13.0.5.DEV", "http://feed.una.io/?section={module_name}", "boonex/profiler/", "profiler", "BxProfiler", "bx_profiler_", "Boonex Profiler", "", 1749379496, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "module", 0, "bx_accounts", "Accounts Manager", "UNA INC", "14.0.6.DEV", "http://feed.una.io/?section={module_name}", "boonex/accounts/", "accounts", "BxAccnt", "bx_accnt_", "Accounts", "", 1749429139, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, "module", 0, "bx_analytics", "Analytics", "UNA INC", "14.0.3.DEV", "http://feed.una.io/?section={module_name}", "boonex/analytics/", "analytics", "BxAnalytics", "bx_analytics_", "Analytics", "", 1749429157, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, "module", 0, "bx_anon_follow", "Anonymous Follow", "BoonEx", "9.0.0", "http://feed.boonex.com/?section={module_name}", "boonex/anon_follow/", "anon_follow", "BxAnonFollow", "bx_anon_follow_", "Anonymous Follow", "", 1749429161, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, "module", 0, "bx_attendant", "Attendant", "UNA INC", "14.0.1.DEV", "http://feed.una.io/?section={module_name}", "boonex/attendant/", "attendant", "BxAttendant", "bx_attendant_", "Attendant", "", 1749429179, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [11, "module", 0, "bx_antispam", "Antispam", "UNA INC", "14.0.3.DEV", "http://feed.una.io/?section={module_name}", "boonex/antispam/", "antispam", "BxAntispam", "bx_antispam_", "Antispam", "", 1749429256, 0, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, "module", 0, "bx_charts", "Charts", "BoonEx", "13.0.3.DEV", "http://feed.una.io/?section={module_name}", "boonex/charts/", "charts", "BxCharts", "bx_charts_", "Charts", "", 1749429268, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, "module", 0, "bx_contact", "Contact", "UNA INC", "14.0.2.DEV", "http://feed.una.io/?section={module_name}", "boonex/contact/", "contact", "BxContact", "bx_contact_", "Contact", "", 1749429324, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, "module", 0, "bx_googletagman", "Google Tag Manager", "BoonEx", "13.0.1.DEV", "http://feed.una.io/?section={module_name}", "boonex/google_tagmanager/", "google_tagmanager", "BxGoogleTagMan", "bx_googletagman_", "Google Tag Manager", "", 1749429419, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, "module", 0, "bx_reminders", "Reminders", "BoonEx", "11.0.0", "http://feed.una.io/?section={module_name}", "boonex/reminders/", "reminders", "BxReminders", "bx_reminders_", "Reminders", "", 1749429476, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [16, "module", 0, "bx_convos", "Conversations", "UNA INC", "14.0.4.DEV", "http://feed.una.io/?section={module_name}", "boonex/convos/", "convos", "BxCnv", "bx_convos_", "Conversations", "", 1749429715, 1, 0, "", 0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_modules executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_modules: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_modules...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_modules será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_modules...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_modules")
    Logger.info("Tabela sys_modules limpa com sucesso.", module: __MODULE__)
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
