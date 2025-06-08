defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsConnectionSeed do
  @moduledoc """
  Seed para a tabela sys_objects_connection.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_connection...")

    Repo.execute("INSERT INTO sys_objects_connection (id, object, table, profile_initiator, profile_content, type, tt_initiator, tf_id_initiator, tf_count_initiator, tt_content, tf_id_content, tf_count_content, override_class_name, override_class_file) VALUES (?, ?, ?)", [1, 1, 1])
    Repo.execute("INSERT INTO sys_objects_connection (id, object, table, profile_initiator, profile_content, type, tt_initiator, tf_id_initiator, tf_count_initiator, tt_content, tf_id_content, tf_count_content, override_class_name, override_class_file) VALUES (?, ?, ?)", [2, 1, 1])
    Repo.execute("INSERT INTO sys_objects_connection (id, object, table, profile_initiator, profile_content, type, tt_initiator, tf_id_initiator, tf_count_initiator, tt_content, tf_id_content, tf_count_content, override_class_name, override_class_file) VALUES (?, ?, ?)", [3, 1, 1])
    Repo.execute("INSERT INTO sys_objects_connection (id, object, table, profile_initiator, profile_content, type, tt_initiator, tf_id_initiator, tf_count_initiator, tt_content, tf_id_content, tf_count_content, override_class_name, override_class_file) VALUES (?, ?, ?)", [4, 1, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
