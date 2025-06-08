defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLogsSeed do
  @moduledoc """
  Seed para a tabela sys_objects_logs.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_logs...")

    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?)", [1, 1])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?)", [2, 1])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?)", [3, 1])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?)", [4, 1])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?)", [5, 0])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?)", [6, 1])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?)", [7, 1])
    Repo.execute("INSERT INTO sys_objects_logs (id, object, module, logs_storage, title, active, class_name, class_file) VALUES (?, ?)", [8, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
