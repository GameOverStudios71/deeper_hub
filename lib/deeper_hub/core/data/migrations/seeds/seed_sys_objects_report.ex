defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsReportSeed do
  @moduledoc """
  Seed para a tabela sys_objects_report.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_report_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_report já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_report...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_cmts", "system", "sys_cmts_reports", "sys_cmts_reports_track", 31536000, 1, "", "", "sys_cmts_ids", "id", "author_id", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons", "bx_persons_reports", "bx_persons_reports_track", 31536000, 1, "page.php?i=view-persons-profile&id={object_id}", "bx_persons_notes", "bx_persons_data", "id", "author", "reports", "BxPersonsReport", "modules/boonex/persons/classes/BxPersonsReport.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, "bx_events", "bx_events", "bx_events_reports", "bx_events_reports_track", 31536000, 1, "page.php?i=view-event-profile&id={object_id}", "bx_events_notes", "bx_events_data", "id", "author", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, "bx_groups", "bx_groups", "bx_groups_reports", "bx_groups_reports_track", 31536000, 1, "page.php?i=view-group-profile&id={object_id}", "bx_groups_notes", "bx_groups_data", "id", "author", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [20, "bx_ads", "bx_ads", "bx_ads_reports", "bx_ads_reports_track", 31536000, 1, "page.php?i=view-ad&id={object_id}", "bx_ads_notes", "bx_ads_entries", "id", "author", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [16, "bx_reviews", "bx_reviews", "bx_reviews_reports", "bx_reviews_reports_track", 31536000, 1, "page.php?i=view-review&id={object_id}", "bx_reviews_notes", "bx_reviews_reviews", "id", "author", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [27, "bx_classes", "bx_classes", "bx_classes_reports", "bx_classes_reports_track", 31536000, 1, "page.php?i=view-class&id={object_id}", "bx_classes_notes", "bx_classes_classes", "id", "author", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, "bx_forum", "bx_forum", "bx_forum_reports", "bx_forum_reports_track", 31536000, 1, "page.php?i=view-discussion&id={object_id}", "bx_forum_notes", "bx_forum_discussions", "id", "author", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, "bx_glossary", "bx_glossary", "bx_glossary_reports", "bx_glossary_reports_track", 31536000, 1, "page.php?i=view-glossary&id={object_id}", "bx_glossary_notes", "bx_glossary_terms", "id", "author", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [25, "bx_albums", "bx_albums", "bx_albums_reports", "bx_albums_reports_track", 31536000, 1, "page.php?i=view-album&id={object_id}", "bx_albums_notes", "bx_albums_albums", "id", "author", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [28, "bx_channels", "bx_channels", "bx_cnl_reports", "bx_cnl_reports_track", 31536000, 1, "page.php?i=view-channel-profile&id={object_id}", "bx_cnl_notes", "bx_cnl_data", "id", "author", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [30, "bx_courses", "bx_courses", "bx_courses_reports", "bx_courses_reports_track", 31536000, 1, "page.php?i=view-course-profile&id={object_id}", "bx_courses_notes", "bx_courses_data", "id", "author", "reports", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_report (id, name, module, table_main, table_track, pruning, is_on, base_url, object_comment, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [26, "bx_albums_media", "bx_albums", "bx_albums_reports_media", "bx_albums_reports_media_track", 31536000, 1, "page.php?i=view-album-media&id={object_id}", "", "bx_albums_files2albums", "id", "author", "reports", "", ""])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_report executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_report: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_report...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_report será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_report...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_report")
    Logger.info("Tabela sys_objects_report limpa com sucesso.", module: __MODULE__)
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
