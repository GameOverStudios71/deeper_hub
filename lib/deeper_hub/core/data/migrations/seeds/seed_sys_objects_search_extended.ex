defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsSearchExtendedSeed do
  @moduledoc """
  Seed para a tabela sys_objects_search_extended.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_search_extended_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_search_extended já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_search_extended...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons", "bx_persons", "_bx_persons_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons_cmts", "bx_persons_cmts", "bx_persons", "_bx_persons_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [52, "bx_albums_media_cmts", "bx_albums_media_cmts", "bx_albums", "_bx_albums_search_extended_media_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [51, "bx_albums_cmts", "bx_albums_cmts", "bx_albums", "_bx_albums_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [29, "bx_events_cmts", "bx_events_cmts", "bx_events", "_bx_events_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [28, "bx_events", "bx_events", "bx_events", "_bx_events_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [26, "bx_groups", "bx_groups", "bx_groups", "_bx_groups_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [27, "bx_groups_cmts", "bx_groups_cmts", "bx_groups", "_bx_groups_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [38, "bx_ads", "bx_ads", "bx_ads", "_bx_ads_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [39, "bx_ads_cmts", "bx_ads_cmts", "bx_ads", "_bx_ads_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [30, "bx_reviews", "bx_reviews", "bx_reviews", "_bx_reviews_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [31, "bx_reviews_cmts", "bx_reviews_cmts", "bx_reviews", "_bx_reviews_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [53, "bx_classes", "bx_classes", "bx_classes", "_bx_classes_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [54, "bx_classes_cmts", "bx_classes_cmts", "bx_classes", "_bx_classes_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [22, "bx_forum", "bx_forum", "bx_forum", "_bx_forum_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [23, "bx_forum_cmts", "bx_forum_cmts", "bx_forum", "_bx_forum_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [24, "bx_glossary", "bx_glossary", "bx_glossary", "_bx_glossary_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [25, "bx_glossary_cmts", "bx_glossary_cmts", "bx_glossary", "_bx_glossary_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [49, "bx_albums", "bx_albums", "bx_albums", "_bx_albums_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [50, "bx_albums_media", "bx_albums_media", "bx_albums", "_bx_albums_search_extended_media", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [40, "bx_ads_reviews", "bx_ads_reviews", "bx_ads", "_bx_ads_search_extended_reviews", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [56, "bx_channels_cmts", "bx_channels_cmts", "bx_channels", "_bx_channels_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [55, "bx_channels", "bx_channels", "bx_channels", "_bx_channels_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [59, "bx_courses", "bx_courses", "bx_courses", "_bx_courses_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [60, "bx_courses_cmts", "bx_courses_cmts", "bx_courses", "_bx_courses_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_search_extended executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_search_extended: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_search_extended...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_search_extended será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_search_extended...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_search_extended")
    Logger.info("Tabela sys_objects_search_extended limpa com sucesso.", module: __MODULE__)
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
