defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsUploaderSeed do
  @moduledoc """
  Seed para a tabela sys_objects_uploader.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_uploader...")

    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?)", [1, 1])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?)", [2, 1])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?)", [3, 1])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?)", [4, 1])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?)", [5, 1])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?)", [6, 1])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?)", [7, 1])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?)", [8, 1])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?)", [9, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
