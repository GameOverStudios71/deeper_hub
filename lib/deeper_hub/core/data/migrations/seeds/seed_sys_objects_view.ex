defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsViewSeed do
  @moduledoc """
  Seed para a tabela sys_objects_view.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_view_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_view já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_view...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons", "bx_persons_views_track", 86400, 31536000, 1, "bx_persons_data", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, "bx_events", "bx_events", "bx_events_views_track", 86400, 31536000, 1, "bx_events_data", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, "bx_groups", "bx_groups", "bx_groups_views_track", 86400, 31536000, 1, "bx_groups_data", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [16, "bx_reviews", "bx_reviews", "bx_reviews_views_track", 86400, 31536000, 1, "bx_reviews_reviews", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [28, "bx_classes", "bx_classes", "bx_classes_views_track", 86400, 31536000, 1, "bx_classes_classes", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [21, "bx_ads", "bx_ads", "bx_ads_views_track", 86400, 31536000, 1, "bx_ads_entries", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [30, "bx_convos", "", "bx_convos_views_track", 86400, 31536000, 1, "bx_convos_conversations", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, "bx_forum", "bx_forum", "bx_forum_views_track", 86400, 31536000, 1, "bx_forum_discussions", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, "bx_glossary", "bx_glossary", "bx_glossary_views_track", 86400, 31536000, 1, "bx_glossary_terms", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [26, "bx_albums", "bx_albums", "bx_albums_views_track", 86400, 31536000, 1, "bx_albums_albums", "id", "", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [29, "bx_channels", "bx_channels", "bx_cnl_views_track", 86400, 31536000, 1, "bx_cnl_data", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [32, "bx_courses", "bx_courses", "bx_courses_views_track", 86400, 31536000, 1, "bx_courses_data", "id", "author", "views", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_view (id, name, module, table_track, period, pruning, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [27, "bx_albums_media", "bx_albums", "bx_albums_views_media_track", 86400, 31536000, 1, "bx_albums_files2albums", "id", "author", "views", "", ""])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_view executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_view: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_view...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_view será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_view...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_view")
    Logger.info("Tabela sys_objects_view limpa com sucesso.", module: __MODULE__)
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
