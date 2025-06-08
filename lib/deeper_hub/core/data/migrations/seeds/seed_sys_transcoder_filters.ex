defmodule DeeperHub.Core.Data.Migrations.Seeds.SysTranscoderFiltersSeed do
  @moduledoc """
  Seed para a tabela sys_transcoder_filters.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_transcoder_filters...")

    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [1, "sys_image_resize", "ResizeVar", "", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [2, "sys_icon_apple", "Resize", "a:3:{s:1:\"w\";s:3:\"180\";s:1:\"h\";s:3:\"180\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [3, "sys_icon_android", "Resize", "a:3:{s:1:\"w\";s:3:\"192\";s:1:\"h\";s:3:\"192\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [4, "sys_icon_android_splash", "Resize", "a:3:{s:1:\"w\";s:3:\"512\";s:1:\"h\";s:3:\"512\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [5, "sys_icon_facebook", "Resize", "a:4:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"png\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [6, "sys_icon_favicon", "Resize", "a:4:{s:1:\"w\";s:2:\"16\";s:1:\"h\";s:2:\"16\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"png\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [7, "sys_cover", "Resize", "a:3:{s:1:\"w\";s:4:\"1920\";s:1:\"h\";s:3:\"720\";s:10:\"force_type\";s:3:\"png\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [8, "sys_cover_unit_profile", "Resize", "a:3:{s:1:\"w\";s:3:\"640\";s:1:\"h\";s:3:\"240\";s:10:\"force_type\";s:3:\"png\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [9, "sys_cover_preview", "Resize", "a:3:{s:1:\"w\";s:3:\"120\";s:1:\"h\";s:2:\"45\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [10, "sys_builder_page_preview", "Resize", "a:4:{s:1:\"w\";s:3:\"128\";s:1:\"h\";s:3:\"128\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [11, "sys_builder_page_embed", "ResizeVar", "", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [12, "sys_cmts_images_preview", "Resize", "a:4:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [13, "sys_custom_images", "ResizeVar", "", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [14, "sys_images_editor", "Resize", "a:2:{s:1:\"w\";s:4:\"1600\";s:1:\"h\";s:4:\"1600\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [15, "sys_wiki_images_preview", "Resize", "a:4:{s:1:\"w\";s:2:\"52\";s:1:\"h\";s:2:\"52\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [16, "sys_agents_assistants_chats_files_preview", "Resize", "a:4:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";s:10:\"force_type\";s:3:\"jpg\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [17, "sys_accounts_icon", "Resize", "a:3:{s:1:\"w\";s:2:\"30\";s:1:\"h\";s:2:\"30\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [18, "sys_accounts_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"50\";s:1:\"h\";s:2:\"50\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [19, "sys_accounts_avatar", "Resize", "a:3:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [20, "sys_accounts_avatar_big", "Resize", "a:3:{s:1:\"w\";s:3:\"200\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [21, "sys_accounts_picture", "Resize", "a:3:{s:1:\"w\";s:4:\"1024\";s:1:\"h\";s:4:\"1024\";s:13:\"square_resize\";s:1:\"0\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [22, "bx_persons_icon", "Resize", "a:3:{s:1:\"w\";s:2:\"30\";s:1:\"h\";s:2:\"30\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [23, "bx_persons_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"50\";s:1:\"h\";s:2:\"50\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [24, "bx_persons_avatar", "Resize", "a:3:{s:1:\"w\";s:3:\"100\";s:1:\"h\";s:3:\"100\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [25, "bx_persons_avatar_big", "Resize", "a:3:{s:1:\"w\";s:3:\"200\";s:1:\"h\";s:3:\"200\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [26, "bx_persons_picture", "Resize", "a:3:{s:1:\"w\";s:4:\"1024\";s:1:\"h\";s:4:\"1024\";s:13:\"square_resize\";s:1:\"0\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [27, "bx_persons_cover", "Resize", "a:2:{s:1:\"w\";s:3:\"960\";s:1:\"h\";s:3:\"480\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [28, "bx_persons_cover_thumb", "Resize", "a:3:{s:1:\"w\";s:2:\"48\";s:1:\"h\";s:2:\"48\";s:13:\"square_resize\";s:1:\"1\";}", 0])
    Repo.execute("INSERT INTO sys_transcoder_filters (id, transcoder_object, filter, filter_params, order) VALUES (?, ?, ?, ?, ?)", [29, "bx_persons_gallery", "Resize", "a:1:{s:1:\"w\";s:3:\"500\";}", 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
