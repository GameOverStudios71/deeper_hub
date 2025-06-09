defmodule DeeperHub.Core.Data.Migrations.Seeds.SysTranscoderFiltersSeed do
  @moduledoc """
  Seed para a tabela sys_transcoder_filters.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_transcoder_filters_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
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
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [226, "bx_albums_video_mp4", "Mp4", "a:2:{s:1:\"h\";s:3:\"480\";s:10:\"force_type\";s:3:\"mp4\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [224, "bx_albums_video_poster_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"300\";s:13:\"square_resize\";s:1:\"1\";}", 10])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [137, "bx_events_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [145, "bx_groups_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [135, "bx_events_cover", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [136, "bx_events_cover_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"48\";s:1:\"h\";s:2:\"48\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [134, "bx_events_picture", "Resize", "a:3:{s:1:\"w\";s:4:\"1024\";s:1:\"h\";s:4:\"1024\";s:13:\"square_resize\";s:1:\"0\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [133, "bx_events_avatar_big", "Resize", "a:3:{s:1:\"w\";s:3:\"200\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [132, "bx_events_avatar", "Resize", "a:3:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [131, "bx_events_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"50\";s:1:\"h\";s:2:\"50\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [130, "bx_events_icon", "Resize", "a:3:{s:1:\"w\";s:2:\"30\";s:1:\"h\";s:2:\"30\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [144, "bx_groups_cover_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"48\";s:1:\"h\";s:2:\"48\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [143, "bx_groups_cover", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [142, "bx_groups_picture", "Resize", "a:3:{s:1:\"w\";s:4:\"1024\";s:1:\"h\";s:4:\"1024\";s:13:\"square_resize\";s:1:\"0\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [141, "bx_groups_avatar_big", "Resize", "a:3:{s:1:\"w\";s:3:\"200\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [140, "bx_groups_avatar", "Resize", "a:3:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [139, "bx_groups_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"50\";s:1:\"h\";s:2:\"50\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [138, "bx_groups_icon", "Resize", "a:3:{s:1:\"w\";s:2:\"30\";s:1:\"h\";s:2:\"30\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [248, "bx_channels_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [261, "bx_courses_avatar_big", "Resize", "a:3:{s:1:\"w\";s:3:\"200\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [262, "bx_courses_picture", "Resize", "a:3:{s:1:\"w\";s:4:\"1024\";s:1:\"h\";s:4:\"1024\";s:13:\"square_resize\";s:1:\"0\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [258, "bx_courses_icon", "Resize", "a:3:{s:1:\"w\";s:2:\"30\";s:1:\"h\";s:2:\"30\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [259, "bx_courses_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"50\";s:1:\"h\";s:2:\"50\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [260, "bx_courses_avatar", "Resize", "a:3:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [157, "bx_reviews_gallery_files", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [156, "bx_reviews_preview_files", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [155, "bx_reviews_videos_mp4_hd", "Mp4", "a:3:{s:1:\"h\";s:3:\"720\";s:13:\"video_bitrate\";s:4:\"1536\";s:10:\"force_type\";s:3:\"mp4\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [153, "bx_reviews_videos_poster", "Poster", "a:2:{s:1:\"h\";s:3:\"318\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [154, "bx_reviews_videos_mp4", "Mp4", "a:2:{s:1:\"h\";s:3:\"318\";s:10:\"force_type\";s:3:\"mp4\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [152, "bx_reviews_videos_poster_preview", "Poster", "a:2:{s:1:\"h\";s:3:\"480\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [151, "bx_reviews_videos_poster_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 10])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [150, "bx_reviews_gallery_photos", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [148, "bx_reviews_cover", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [149, "bx_reviews_preview_photos", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [147, "bx_reviews_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [146, "bx_reviews_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [244, "bx_channels_avatar_big", "Resize", "a:3:{s:1:\"w\";s:3:\"200\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [245, "bx_channels_picture", "Resize", "a:3:{s:1:\"w\";s:4:\"1024\";s:1:\"h\";s:4:\"1024\";s:13:\"square_resize\";s:1:\"0\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [246, "bx_channels_cover", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [249, "bx_convos_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [247, "bx_channels_cover_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"48\";s:1:\"h\";s:2:\"48\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [241, "bx_channels_icon", "Resize", "a:3:{s:1:\"w\";s:2:\"30\";s:1:\"h\";s:2:\"30\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [242, "bx_channels_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"50\";s:1:\"h\";s:2:\"50\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [243, "bx_channels_avatar", "Resize", "a:3:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [111, "bx_forum_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [112, "bx_forum_miniature", "Resize", "a:1:{s:1:\"w\";s:3:\"300\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [113, "bx_forum_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [114, "bx_forum_cover", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [115, "bx_forum_preview_photos", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [116, "bx_forum_miniature_photos", "Resize", "a:4:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"300\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [117, "bx_forum_gallery_photos", "Resize", "a:4:{s:1:\"w\";s:3:\"600\";s:1:\"h\";s:3:\"600\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [118, "bx_forum_view_photos", "Resize", "a:2:{s:1:\"w\";s:4:\"1200\";s:1:\"h\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [119, "bx_forum_videos_poster_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 10])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [120, "bx_forum_videos_poster_preview", "Poster", "a:2:{s:1:\"h\";s:3:\"480\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [121, "bx_forum_videos_poster", "Poster", "a:2:{s:1:\"h\";s:3:\"318\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [122, "bx_forum_videos_mp4", "Mp4", "a:2:{s:1:\"h\";s:3:\"318\";s:10:\"force_type\";s:3:\"mp4\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [123, "bx_forum_videos_mp4_hd", "Mp4", "a:3:{s:1:\"h\";s:3:\"720\";s:13:\"video_bitrate\";s:4:\"1536\";s:10:\"force_type\";s:3:\"mp4\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [124, "bx_forum_preview_files", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [125, "bx_forum_gallery_files", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [126, "bx_forum_preview_cmts", "Resize", "a:4:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [127, "bx_glossary_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [128, "bx_glossary_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [129, "bx_glossary_cover", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [225, "bx_albums_video_poster_big", "Poster", "a:2:{s:1:\"h\";s:3:\"480\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [219, "bx_albums_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"300\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [220, "bx_albums_browse", "Resize", "a:1:{s:1:\"h\";s:3:\"180\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [221, "bx_albums_big", "Resize", "a:2:{s:1:\"w\";s:4:\"1280\";s:1:\"h\";s:4:\"1280\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [222, "bx_albums_video_poster_browse", "Poster", "a:2:{s:1:\"h\";s:3:\"180\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [223, "bx_albums_video_poster_preview", "Poster", "a:2:{s:1:\"h\";s:3:\"480\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [237, "bx_classes_videos_mp4_hd", "Mp4", "a:3:{s:1:\"h\";s:3:\"720\";s:13:\"video_bitrate\";s:4:\"1536\";s:10:\"force_type\";s:3:\"mp4\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [236, "bx_classes_videos_mp4", "Mp4", "a:2:{s:1:\"h\";s:3:\"318\";s:10:\"force_type\";s:3:\"mp4\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [235, "bx_classes_videos_poster", "Poster", "a:2:{s:1:\"h\";s:3:\"318\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [234, "bx_classes_videos_poster_preview", "Poster", "a:2:{s:1:\"h\";s:3:\"480\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [233, "bx_classes_videos_poster_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 10])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [232, "bx_classes_gallery_photos", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [230, "bx_classes_cover", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [231, "bx_classes_preview_photos", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [229, "bx_classes_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [228, "bx_classes_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [180, "bx_ads_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [181, "bx_ads_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [182, "bx_ads_cover", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [183, "bx_ads_preview_photos", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [184, "bx_ads_gallery_photos", "Resize", "a:4:{s:1:\"w\";s:3:\"600\";s:1:\"h\";s:3:\"600\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [185, "bx_ads_view_photos", "Resize", "a:2:{s:1:\"w\";s:4:\"1200\";s:1:\"h\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [186, "bx_ads_videos_poster_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 10])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [187, "bx_ads_videos_poster_preview", "Poster", "a:2:{s:1:\"h\";s:3:\"480\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [188, "bx_ads_videos_poster", "Poster", "a:2:{s:1:\"h\";s:3:\"318\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [189, "bx_ads_videos_mp4", "Mp4", "a:2:{s:1:\"h\";s:3:\"318\";s:10:\"force_type\";s:3:\"mp4\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [190, "bx_ads_videos_mp4_hd", "Mp4", "a:3:{s:1:\"h\";s:3:\"720\";s:13:\"video_bitrate\";s:4:\"1536\";s:10:\"force_type\";s:3:\"mp4\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [191, "bx_ads_preview_files", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [192, "bx_ads_gallery_files", "Resize", "a:4:{s:1:\"w\";s:3:\"600\";s:1:\"h\";s:3:\"600\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [263, "bx_courses_cover", "Resize", "a:1:{s:1:\"w\";s:4:\"1200\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [264, "bx_courses_cover_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"48\";s:1:\"h\";s:2:\"48\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [227, "bx_albums_video_mp4_hd", "Mp4", "a:3:{s:1:\"h\";s:3:\"720\";s:13:\"video_bitrate\";s:4:\"1536\";s:10:\"force_type\";s:3:\"mp4\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [238, "bx_classes_sounds_mp3", "Mp3", "a:0:{}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [239, "bx_classes_preview_files", "Resize", "a:3:{s:1:\"w\";s:3:\"300\";s:1:\"h\";s:3:\"200\";s:11:\"crop_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [240, "bx_classes_gallery_files", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, 'order') VALUES (?, ?, ?, ?, ?)", [265, "bx_courses_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_transcoder_filters executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_transcoder_filters: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_transcoder_filters...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_transcoder_filters será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_transcoder_filters...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_transcoder_filters")
    Logger.info("Tabela sys_transcoder_filters limpa com sucesso.", module: __MODULE__)
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
