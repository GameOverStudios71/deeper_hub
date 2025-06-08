defmodule DeeperHub.Core.Data.Migrations.Seeds.SysContentInfoGridsSeed do
  @moduledoc """
  Seed para a tabela sys_content_info_grids.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_content_info_grids...")

    Repo.execute("INSERT INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?)", [1])
    Repo.execute("INSERT INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?)", [2])

    IO.puts("Registros inseridos com sucesso!")
  end
end
