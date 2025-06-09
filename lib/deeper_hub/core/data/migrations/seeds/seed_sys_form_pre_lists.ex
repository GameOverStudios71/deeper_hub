defmodule DeeperHub.Core.Data.Migrations.Seeds.SysFormPreListsSeed do
  @moduledoc """
  Seed para a tabela sys_form_pre_lists.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_form_pre_lists_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_form_pre_lists já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_form_pre_lists...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [1, "system", "Country", "_adm_form_txt_pre_lists_country", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [2, "system", "Sex", "_adm_form_txt_pre_lists_sex", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [3, "system", "Language", "_adm_form_txt_pre_lists_language", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [4, "system", "Currency", "_adm_form_txt_pre_lists_currency", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [5, "system", "sys_report_types", "_sys_pre_lists_report_types", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [6, "system", "sys_vote_reactions", "_sys_pre_lists_vote_reactions", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [7, "system", "sys_relations", "_sys_pre_lists_relations", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [8, "system", "sys_content_filter", "_sys_pre_lists_content_filter", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [9, "system", "sys_studio_widget_types", "_sys_pre_lists_studio_widget_types", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [10, "system", "sys_colors", "_sys_pre_lists_colors", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [42, "bx_reviews", "bx_reviews_cats", "_bx_reviews_pre_lists_cats", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [57, "bx_courses", "bx_courses_period_units", "_bx_courses_pre_lists_period_units", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [49, "bx_classes", "bx_classes_avail", "_bx_classes_pre_lists_availability", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [50, "bx_classes", "bx_classes_cmts", "_bx_classes_pre_lists_cmts", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [51, "bx_classes", "bx_classes_completed_when", "_bx_classes_pre_lists_completed_when", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [26, "bx_forum", "bx_forum_cats", "_bx_forum_pre_lists_cats", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [27, "bx_donations", "bx_donations_period_units", "_bx_donations_pre_lists_period_units", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [28, "bx_glossary", "bx_glossary_cats", "_bx_glossary_pre_lists_cats", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [29, "bx_glossary", "bx_glossary_statuses", "_bx_glossary_pre_lists_statuses", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [30, "bx_events", "bx_events_reminder", "_bx_events_pre_lists_reminder", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [31, "bx_events", "bx_events_cats", "_bx_events_pre_lists_cats", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [32, "bx_groups", "bx_groups_cats", "_bx_groups_pre_lists_cats", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [33, "bx_events", "bx_events_roles", "_bx_events_pre_lists_roles", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [34, "bx_groups", "bx_groups_roles", "_bx_groups_pre_lists_roles", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [35, "bx_events", "bx_events_period_units", "_bx_events_pre_lists_period_units", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [36, "bx_events", "bx_events_repeat_year", "_bx_events_pre_lists_repeat_year", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [37, "bx_groups", "bx_groups_period_units", "_bx_groups_pre_lists_period_units", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [38, "bx_events", "bx_events_repeat_month", "_bx_events_pre_lists_repeat_month", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [39, "bx_events", "bx_events_repeat_week_of_month", "_bx_events_pre_lists_repeat_week_of_month", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [40, "bx_events", "bx_events_repeat_day_of_month", "_bx_events_pre_lists_repeat_day_of_month", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [41, "bx_events", "bx_events_repeat_day_of_week", "_bx_events_pre_lists_repeat_day_of_week", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [55, "bx_courses", "bx_courses_cats", "_bx_courses_pre_lists_cats", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [56, "bx_courses", "bx_courses_roles", "_bx_courses_pre_lists_roles", 1, 1])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_form_pre_lists executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_form_pre_lists: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_form_pre_lists...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_form_pre_lists será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_form_pre_lists...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_form_pre_lists")
    Logger.info("Tabela sys_form_pre_lists limpa com sucesso.", module: __MODULE__)
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
