defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsMetatagsSeed do
  @moduledoc """
  Seed para a tabela sys_objects_metatags.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_metatags...")

    Repo.execute("INSERT INTO sys_objects_metatags (id, object, module, table_keywords, table_locations, table_mentions, override_class_name, override_class_file) VALUES (?)", [1])
    Repo.execute("INSERT INTO sys_objects_metatags (id, object, module, table_keywords, table_locations, table_mentions, override_class_name, override_class_file) VALUES (?)", [2])

    IO.puts("Registros inseridos com sucesso!")
  end
end
