defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFavoriteSeed do
  @moduledoc """
  Seed para a tabela sys_objects_favorite.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_favorite_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_favorite já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_favorite...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons_favorites_track", "", 31536000, 1, 1, 0, "page.php?i=view-persons-profile&id={object_id}", "bx_persons_data", "id", "author", "favorites", "BxPersonsFavorite", "modules/boonex/persons/classes/BxPersonsFavorite.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, "bx_events", "bx_events_favorites_track", "bx_events_favorites_lists", 31536000, 1, 1, 1, "page.php?i=view-event-profile&id={object_id}", "bx_events_data", "id", "author", "favorites", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, "bx_groups", "bx_groups_favorites_track", "bx_groups_favorites_lists", 31536000, 1, 1, 1, "page.php?i=view-group-profile&id={object_id}", "bx_groups_data", "id", "author", "favorites", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [19, "bx_ads", "bx_ads_favorites_track", "bx_ads_favorites_lists", 31536000, 1, 1, 1, "page.php?i=view-ad&id={object_id}", "bx_ads_entries", "id", "author", "favorites", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, "bx_reviews", "bx_reviews_favorites_track", "bx_reviews_favorites_lists", 31536000, 1, 1, 1, "page.php?i=view-review&id={object_id}", "bx_reviews_reviews", "id", "author", "favorites", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [26, "bx_classes", "bx_classes_favorites_track", "", 31536000, 1, 1, 1, "page.php?i=view-class&id={object_id}", "bx_classes_classes", "id", "author", "favorites", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [11, "bx_forum", "bx_forum_favorites_track", "bx_forum_favorites_lists", 31536000, 1, 1, 1, "page.php?i=view-discussion&id={object_id}", "bx_forum_discussions", "id", "author", "favorites", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, "bx_glossary", "bx_glossary_favorites_track", "bx_glossary_favorites_lists", 31536000, 1, 1, 1, "page.php?i=view-glossary&id={object_id}", "bx_glossary_terms", "id", "author", "favorites", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [24, "bx_albums", "bx_albums_favorites_track", "bx_albums_favorites_lists", 31536000, 1, 1, 1, "page.php?i=view-album&id={object_id}", "bx_albums_albums", "id", "author", "favorites", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [25, "bx_albums_media", "bx_albums_favorites_media_track", "", 31536000, 1, 1, 1, "page.php?i=view-album-media&id={object_id}", "bx_albums_files2albums", "id", "author", "favorites", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [27, "bx_channels", "bx_cnl_favorites_track", "", 31536000, 1, 1, 1, "page.php?i=view-channel-profile&id={object_id}", "bx_cnl_data", "id", "author", "favorites", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [29, "bx_courses", "bx_courses_favorites_track", "bx_courses_favorites_lists", 31536000, 1, 1, 1, "page.php?i=view-course-profile&id={object_id}", "bx_courses_data", "id", "author", "favorites", "", ""])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_favorite executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_favorite: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_favorite...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_favorite será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_favorite...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_favorite")
    Logger.info("Tabela sys_objects_favorite limpa com sucesso.", module: __MODULE__)
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
