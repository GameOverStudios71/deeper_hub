defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsEmbedsSeed do
  @moduledoc """
  Seed para a tabela sys_objects_embeds.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_embeds...")

    Repo.execute("INSERT INTO sys_objects_embeds (id, object, title, override_class_name, override_class_file) VALUES (?)", [1])
    Repo.execute("INSERT INTO sys_objects_embeds (id, object, title, override_class_name, override_class_file) VALUES (?)", [2])
    Repo.execute("INSERT INTO sys_objects_embeds (id, object, title, override_class_name, override_class_file) VALUES (?)", [3])
    Repo.execute("INSERT INTO sys_objects_embeds (id, object, title, override_class_name, override_class_file) VALUES (?)", [4])

    IO.puts("Registros inseridos com sucesso!")
  end
end
