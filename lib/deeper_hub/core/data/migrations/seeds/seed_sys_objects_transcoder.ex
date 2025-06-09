defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsTranscoderSeed do
  @moduledoc """
  Seed para a tabela sys_objects_transcoder.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_transcoder_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_transcoder já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_transcoder...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_image_resize", "sys_images_resized", "Storage", "a:2:{s:6:\"object\";s:10:\"sys_images\";s:14:\"disable_retina\";b:1;}", "no", 0, 0, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_icon_apple", "sys_images_resized", "Storage", "a:2:{s:6:\"object\";s:10:\"sys_images\";s:14:\"disable_retina\";b:1;}", "no", 0, 0, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_icon_android", "sys_images_resized", "Storage", "a:2:{s:6:\"object\";s:10:\"sys_images\";s:14:\"disable_retina\";b:1;}", "no", 0, 0, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_icon_android_splash", "sys_images_resized", "Storage", "a:2:{s:6:\"object\";s:10:\"sys_images\";s:14:\"disable_retina\";b:1;}", "no", 0, 0, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "sys_icon_facebook", "sys_images_resized", "Storage", "a:2:{s:6:\"object\";s:10:\"sys_images\";s:14:\"disable_retina\";b:1;}", "no", 0, 0, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "sys_icon_favicon", "sys_images_resized", "Storage", "a:1:{s:6:\"object\";s:10:\"sys_images\";}", "no", 0, 0, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, "sys_cover", "sys_images_resized", "Storage", "a:1:{s:6:\"object\";s:10:\"sys_images\";}", "no", 0, 0, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, "sys_cover_unit_profile", "sys_images_resized", "Storage", "a:1:{s:6:\"object\";s:10:\"sys_images\";}", "no", 0, 0, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, "sys_cover_preview", "sys_images_resized", "Storage", "a:1:{s:6:\"object\";s:10:\"sys_images\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [10, "sys_builder_page_preview", "sys_images_resized", "Storage", "a:1:{s:6:\"object\";s:10:\"sys_images\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [11, "sys_builder_page_embed", "sys_images_resized", "Storage", "a:1:{s:6:\"object\";s:10:\"sys_images\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, "sys_cmts_images_preview", "sys_cmts_images_preview", "Storage", "a:1:{s:6:\"object\";s:15:\"sys_cmts_images\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, "sys_custom_images", "sys_images_resized", "Storage", "a:1:{s:6:\"object\";s:17:\"sys_images_custom\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, "sys_images_editor", "sys_images_editor_resized", "Storage", "a:1:{s:6:\"object\";s:17:\"sys_images_editor\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, "sys_wiki_images_preview", "sys_wiki_images_resized", "Storage", "a:1:{s:6:\"object\";s:14:\"sys_wiki_files\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [16, "sys_agents_assistants_chats_files_preview", "sys_cmts_images_preview", "Storage", "a:1:{s:6:\"object\";s:33:\"sys_agents_assistants_chats_files\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [17, "sys_accounts_icon", "sys_accounts_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:21:\"sys_accounts_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [18, "sys_accounts_thumb", "sys_accounts_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:21:\"sys_accounts_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [19, "sys_accounts_avatar", "sys_accounts_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:21:\"sys_accounts_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [20, "sys_accounts_avatar_big", "sys_accounts_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:21:\"sys_accounts_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [21, "sys_accounts_picture", "sys_accounts_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:21:\"sys_accounts_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [22, "bx_persons_icon", "bx_persons_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:19:\"bx_persons_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [23, "bx_persons_thumb", "bx_persons_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:19:\"bx_persons_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [24, "bx_persons_avatar", "bx_persons_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:19:\"bx_persons_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [25, "bx_persons_avatar_big", "bx_persons_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:19:\"bx_persons_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [26, "bx_persons_picture", "bx_persons_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:19:\"bx_persons_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [27, "bx_persons_cover", "bx_persons_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:19:\"bx_persons_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [28, "bx_persons_cover_thumb", "bx_persons_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:19:\"bx_persons_pictures\";}", "no", 1, 2592000, 0, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [29, "bx_persons_gallery", "bx_persons_pictures_resized", "Storage", "a:1:{s:6:\"object\";s:19:\"bx_persons_pictures\";}", "no", 1, 2592000, 0, "", ""])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_transcoder executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_transcoder: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_transcoder...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_transcoder será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_transcoder...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_transcoder")
    Logger.info("Tabela sys_objects_transcoder limpa com sucesso.", module: __MODULE__)
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
