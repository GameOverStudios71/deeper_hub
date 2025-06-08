defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsStorageSeed do
  @moduledoc """
  Seed para a tabela sys_objects_storage.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_storage_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_objects_storage já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_storage...", module: __MODULE__)

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

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_objects_storage executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_objects_storage: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_storage...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_storage...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_storage")
    Logger.info("Tabela sys_objects_storage limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
