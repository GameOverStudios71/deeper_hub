defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsPlayerSeed do
  @moduledoc """
  Seed para a tabela sys_objects_player.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_player...")

    Repo.execute("INSERT INTO sys_objects_player (id, object, title, skin, override_class_name, override_class_file) VALUES (?)", [1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
