defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsTranscoderSeed do
  @moduledoc """
  Seed para a tabela sys_objects_transcoder.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_transcoder...")

    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [1, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [2, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [3, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [4, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [5, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [6, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [7, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [8, 0, 0, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [9, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [10, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [11, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [12, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [13, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [14, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [15, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [16, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [17, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [18, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [19, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [20, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [21, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [22, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [23, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [24, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [25, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [26, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [27, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [28, 1, 2592000, 0])
    Repo.execute("INSERT INTO sys_objects_transcoder (id, object, storage_object, source_type, source_params, private, atime_tracking, atime_pruning, ts, override_class_name, override_class_file) VALUES (?, ?, ?, ?)", [29, 1, 2592000, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
