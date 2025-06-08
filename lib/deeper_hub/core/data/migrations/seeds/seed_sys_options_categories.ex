defmodule DeeperHub.Core.Data.Migrations.Seeds.SysOptionsCategoriesSeed do
  @moduledoc """
  Seed para a tabela sys_options_categories.
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
    Logger.info("Inserindo registros na tabela sys_options_categories...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [1, 1, "hidden", "_adm_stg_cpt_category_hidden", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [2, 1, "system", "_adm_stg_cpt_category_system", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [3, 1, "languages", "_adm_stg_cpt_category_languages", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [4, 1, "templates", "_adm_stg_cpt_category_templates", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [5, 1, "site_settings", "_adm_stg_cpt_category_site_settings", 0, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [6, 1, "general", "_adm_stg_cpt_category_general", 0, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [7, 1, "cache", "_adm_stg_cpt_category_cache", 0, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [8, 1, "permalinks", "_adm_stg_cpt_category_permalinks", 0, 9])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [9, 1, "security", "_adm_stg_cpt_category_security", 0, 11])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [10, 1, "storage", "_adm_stg_cpt_category_storage", 0, 13])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [11, 1, "account", "_adm_stg_cpt_category_account", 0, 14])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [12, 1, "acl", "_adm_stg_cpt_category_acl", 0, 15])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [13, 1, "notifications", "_adm_stg_cpt_category_notifications", 0, 16])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [14, 1, "notifications_push", "_adm_stg_cpt_category_notifications_push", 0, 17])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [15, 1, "sms", "_adm_stg_cpt_category_sms", 0, 18])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [16, 1, "location", "_adm_stg_cpt_category_location", 0, 20])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [17, 1, "social_settings", "_adm_stg_cpt_category_social_settings", 0, 21])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [18, 1, "sockets", "_adm_stg_cpt_category_sockets", 0, 22])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [19, 1, "audit", "_adm_stg_cpt_category_audit", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [20, 1, "api_general", "_adm_stg_cpt_category_api_general", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [21, 1, "api_layout", "_adm_stg_cpt_category_api_layout", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [22, 1, "api_config", "_adm_stg_cpt_category_api_config", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [23, 1, "pwa_manifest", "_adm_stg_cpt_category_pwa_manifest", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [24, 1, "pwa_sw", "_adm_stg_cpt_category_pwa_sw", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [25, 1, "agents_general", "_adm_stg_cpt_category_agents_general", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [26, 1, "agents_usage", "_adm_stg_cpt_category_agents_usage", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [27, 2, "bx_en_system", "_bx_eng_stg_cpt_category_system", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [28, 3, "bx_artificer_system", "_bx_artificer_stg_cpt_category_system", 0, 10])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [29, 3, "bx_artificer_styles_custom", "_bx_artificer_stg_cpt_category_styles_custom", 0, 20])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [30, 4, "bx_persons", "_bx_persons", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [31, 5, "bx_profiler", "Debug Panel", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [32, 5, "bx_profiler_sql_querues", "SQL Queries", 0, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [33, 5, "bx_profiler_modules_queries", "Modules Queries", 0, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?, ?, ?)", [34, 5, "bx_profiler_page_opens", "Pages opens", 0, 4])
      Logger.info("Registros inseridos com sucesso na tabela sys_options_categories!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_options_categories: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_options_categories...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_options_categories")
    Logger.info("Tabela sys_options_categories limpa com sucesso.", module: __MODULE__)
  end
end
