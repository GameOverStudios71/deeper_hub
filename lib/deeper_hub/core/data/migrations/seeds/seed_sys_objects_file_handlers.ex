defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFileHandlersSeed do
  @moduledoc """
  Seed para a tabela sys_objects_file_handlers.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_file_handlers...")

    Repo.execute("INSERT INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?)", [1, 1, 1])
    Repo.execute("INSERT INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?)", [2, 1, 2])
    Repo.execute("INSERT INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?)", [3, 1, 3])
    Repo.execute("INSERT INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?)", [4, 1, 4])
    Repo.execute("INSERT INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?)", [5, 1, 5])
    Repo.execute("INSERT INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?)", [6, 1, 5])

    IO.puts("Registros inseridos com sucesso!")
  end
end
