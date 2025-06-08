defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsStorageSeed do
  @moduledoc """
  Seed para a tabela sys_objects_storage.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Insere os registros na tabela.
  Usa INSERT OR REPLACE para evitar erros de UNIQUE CONSTRAINT.
  """
  def run do
    Logger.info("Inserindo registros na tabela sys_objects_storage...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_images", "Local", "", 360, 2592000, 0, "sys_images", "allow-deny", "{image},svg", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_images_custom", "Local", "", 360, 2592000, 0, "sys_images_custom", "allow-deny", "{image},svg", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_images_resized", "Local", "", 360, 2592000, 0, "sys_images_resized", "allow-deny", "{image},svg", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_cmts_images", "Local", "", 360, 2592000, 3, "sys_cmts_images", "allow-deny", "{image}", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "sys_cmts_images_preview", "Local", "", 360, 2592000, 3, "sys_cmts_images_preview", "allow-deny", "{image}", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "sys_transcoder_queue_files", "Local", "", 3600, 2592000, 0, "sys_transcoder_queue_files", "allow-deny", "avi,flv,mpg,mpeg,wmv,mp4,m4v,mov,divx,xvid,3gp,webm,jpg", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, "sys_files", "Local", "", 360, 2592000, 3, "sys_files", "deny-allow", "", "{dangerous}", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, "sys_images_editor", "Local", "", 360, 2592000, 3, "sys_images_editor", "allow-deny", "{image}", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, "sys_images_editor_resized", "Local", "", 360, 2592000, 3, "sys_images_editor_resized", "allow-deny", "{image}", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [10, "sys_wiki_files", "Local", "", 360, 2592000, 3, "sys_wiki_files", "allow-deny", "{image}", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [11, "sys_wiki_images_resized", "Local", "", 360, 2592000, 3, "sys_wiki_images_resized", "allow-deny", "{image}", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, "sys_agents_assistants_chats_files", "Local", "", 360, 2592000, 3, "sys_agents_assistants_chats_files", "deny-allow", "", "{dangerous}", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, "sys_accounts_pictures", "Local", "", 360, 2592000, 3, "sys_accounts_pictures", "allow-deny", "{image}", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, "sys_accounts_pictures_resized", "Local", "", 360, 2592000, 3, "sys_accounts_pictures_resized", "allow-deny", "{image}", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, "bx_persons_pictures", "Local", "", 360, 2592000, 3, "bx_persons_pictures", "allow-deny", "{image}", "", 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [16, "bx_persons_pictures_resized", "Local", "", 360, 2592000, 3, "bx_persons_pictures_resized", "allow-deny", "{image}", "", 0, 0, 0, 0, 0, 0])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_storage!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_storage: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_storage...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_storage")
    Logger.info("Tabela sys_objects_storage limpa com sucesso.", module: __MODULE__)
  end
end
