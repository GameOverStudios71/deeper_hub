defmodule DeeperHub.Core.Data.Migrations.Seeds.SysTranscoderFiltersSeed do
  @moduledoc """
  Seed para a tabela sys_transcoder_filters.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_transcoder_filters_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_transcoder_filters já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_transcoder_filters...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [1, "sys_image_resize", "ResizeVar", "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [2, "sys_icon_apple", "Resize", "a:3:{s:1:\"w\";s:3:\"180\";s:1:\"h\";s:3:\"180\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [3, "sys_icon_android", "Resize", "a:3:{s:1:\"w\";s:3:\"192\";s:1:\"h\";s:3:\"192\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [4, "sys_icon_android_splash", "Resize", "a:3:{s:1:\"w\";s:3:\"512\";s:1:\"h\";s:3:\"512\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [5, "sys_icon_facebook", "Resize", "a:4:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"png\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [6, "sys_icon_favicon", "Resize", "a:4:{s:1:\"w\";s:2:\"16\";s:1:\"h\";s:2:\"16\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"png\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [7, "sys_cover", "Resize", "a:3:{s:1:\"w\";s:4:\"1920\";s:1:\"h\";s:3:\"720\";s:10:\"force_type\";s:3:\"png\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [8, "sys_cover_unit_profile", "Resize", "a:3:{s:1:\"w\";s:3:\"640\";s:1:\"h\";s:3:\"240\";s:10:\"force_type\";s:3:\"png\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [9, "sys_cover_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"120\";s:1:\"h\";s:2:\"45\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [10, "sys_builder_page_preview", "Resize", "a:4:{s:1:\"w\";s:3:\"128\";s:1:\"h\";s:3:\"128\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [11, "sys_builder_page_embed", "ResizeVar", "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [12, "sys_cmts_images_preview", "Resize", "a:4:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [13, "sys_custom_images", "ResizeVar", "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [14, "sys_images_editor", "Resize", "a:2:{s:1:\"w\";s:4:\"1600\";s:1:\"h\";s:4:\"1600\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [15, "sys_wiki_images_preview", "Resize", "a:4:{s:1:\"w\";s:2:\"52\";s:1:\"h\";s:2:\"52\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [16, "sys_agents_assistants_chats_files_preview", "Resize", "a:4:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [17, "sys_accounts_icon", "Resize", "a:3:{s:1:\"w\";s:2:\"30\";s:1:\"h\";s:2:\"30\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [18, "sys_accounts_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"50\";s:1:\"h\";s:2:\"50\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [19, "sys_accounts_avatar", "Resize", "a:3:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [20, "sys_accounts_avatar_big", "Resize", "a:3:{s:1:\"w\";s:3:\"200\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [21, "sys_accounts_picture", "Resize", "a:3:{s:1:\"w\";s:4:\"1024\";s:1:\"h\";s:4:\"1024\";s:13:\"square_resize\";s:1:\"0\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [22, "bx_persons_icon", "Resize", "a:3:{s:1:\"w\";s:2:\"30\";s:1:\"h\";s:2:\"30\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [23, "bx_persons_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"50\";s:1:\"h\";s:2:\"50\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [24, "bx_persons_avatar", "Resize", "a:3:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [25, "bx_persons_avatar_big", "Resize", "a:3:{s:1:\"w\";s:3:\"200\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [26, "bx_persons_picture", "Resize", "a:3:{s:1:\"w\";s:4:\"1024\";s:1:\"h\";s:4:\"1024\";s:13:\"square_resize\";s:1:\"0\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [27, "bx_persons_cover", "Resize", "a:2:{s:1:\"w\";s:3:\"960\";s:1:\"h\";s:3:\"480\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [28, "bx_persons_cover_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"48\";s:1:\"h\";s:2:\"48\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [29, "bx_persons_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_transcoder_filters executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_transcoder_filters: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_transcoder_filters...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_transcoder_filters...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_transcoder_filters")
    Logger.info("Tabela sys_transcoder_filters limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
