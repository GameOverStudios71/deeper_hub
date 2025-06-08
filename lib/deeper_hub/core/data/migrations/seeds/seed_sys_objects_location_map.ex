defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLocationMapSeed do
  @moduledoc """
  Seed para a tabela sys_objects_location_map.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_location_map...")

    Repo.execute("INSERT INTO sys_objects_location_map (id, object, module, title, class_name, class_file) VALUES (?)", [1])
    Repo.execute("INSERT INTO sys_objects_location_map (id, object, module, title, class_name, class_file) VALUES (?)", [2])

    IO.puts("Registros inseridos com sucesso!")
  end
end
