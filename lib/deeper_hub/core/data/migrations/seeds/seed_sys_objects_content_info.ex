defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsContentInfoSeed do
  @moduledoc """
  Seed para a tabela sys_objects_content_info.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_content_info_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_content_info já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_content_info...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "_bx_persons", "bx_persons", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons_cmts", "_bx_persons_cmts", "bx_persons", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [51, "bx_albums_cmts", "_bx_albums_cmts", "bx_albums", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [52, "bx_albums_media_cmts", "_bx_albums_media_cmts", "bx_albums_media", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [29, "bx_events_cmts", "_bx_events_cmts", "bx_events", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [28, "bx_events", "_bx_events", "bx_events", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [26, "bx_groups", "_bx_groups", "bx_groups", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [27, "bx_groups_cmts", "_bx_groups_cmts", "bx_groups", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [38, "bx_ads", "_bx_ads", "bx_ads", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [39, "bx_ads_cmts", "_bx_ads_cmts", "bx_ads", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [31, "bx_reviews_cmts", "_bx_reviews_cmts", "bx_reviews", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [30, "bx_reviews", "_bx_reviews", "bx_reviews", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [53, "bx_classes", "_bx_classes", "bx_classes", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [54, "bx_classes_cmts", "_bx_classes_cmts", "bx_classes", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [22, "bx_forum", "_bx_forum", "bx_forum", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [23, "bx_forum_cmts", "_bx_forum_cmts", "bx_forum", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [24, "bx_glossary", "_bx_glossary", "bx_glossary", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [25, "bx_glossary_cmts", "_bx_glossary_cmts", "bx_glossary", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [50, "bx_albums_media", "_bx_albums_media", "bx_albums", "media_added", "", "media_deleted", "BxAlbumsContentInfoMedia", "modules/boonex/albums/classes/BxAlbumsContentInfoMedia.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [40, "bx_ads_reviews", "_bx_ads_reviews", "bx_ads_reviews", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [55, "bx_channels", "_bx_channels", "bx_channels", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [56, "bx_channels_cmts", "_bx_channels_cmts", "bx_channels", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [60, "bx_courses_cmts", "_bx_courses_cmts", "bx_courses", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [49, "bx_albums", "_bx_albums", "bx_albums", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [59, "bx_courses", "_bx_courses", "bx_courses", "added", "edited", "deleted", "", ""])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_content_info executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_content_info: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_content_info...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_content_info será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_content_info...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_content_info")
    Logger.info("Tabela sys_objects_content_info limpa com sucesso.", module: __MODULE__)
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
