defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsSearchExtendedSeed do
  @moduledoc """
  Seed para a tabela sys_objects_search_extended.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_search_extended...")

    Repo.execute("INSERT INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?)", [1, 0, 1])
    Repo.execute("INSERT INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?)", [2, 0, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
