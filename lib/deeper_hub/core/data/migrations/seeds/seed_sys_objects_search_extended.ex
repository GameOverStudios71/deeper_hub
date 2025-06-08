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

    Repo.execute("INSERT INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons", "bx_persons", "_bx_persons_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons_cmts", "bx_persons_cmts", "bx_persons", "_bx_persons_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])

    IO.puts("Registros inseridos com sucesso!")
  end
end
