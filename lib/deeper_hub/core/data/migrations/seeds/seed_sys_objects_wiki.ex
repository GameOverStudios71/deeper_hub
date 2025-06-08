defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsWikiSeed do
  @moduledoc """
  Seed para a tabela sys_objects_wiki.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_wiki...")

    Repo.execute("INSERT INTO sys_objects_wiki (id, object, uri, title, module, override_class_name, override_class_file) VALUES (?)", [1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
