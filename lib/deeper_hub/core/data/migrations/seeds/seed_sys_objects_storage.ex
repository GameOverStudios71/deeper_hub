defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsStorageSeed do
  @moduledoc """
  Seed para a tabela sys_objects_storage.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_storage...")

    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, 360, 2592000, 0, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, 360, 2592000, 0, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, 360, 2592000, 0, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, 3600, 2592000, 0, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [10, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [11, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_storage (id, object, engine, params, token_life, cache_control, levels, table_files, ext_mode, ext_allow, ext_deny, quota_size, current_size, quota_number, current_number, max_file_size, ts) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [16, 360, 2592000, 3, 0, 0, 0, 0, 0, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
