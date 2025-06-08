defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsRecommendationSeed do
  @moduledoc """
  Seed para a tabela sys_objects_recommendation.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_recommendation...")

    Repo.execute("INSERT INTO sys_objects_recommendation (id, name, module, connection, content_info, countable, active, class_name, class_file) VALUES (?, ?, ?)", [1, 1, 1])
    Repo.execute("INSERT INTO sys_objects_recommendation (id, name, module, connection, content_info, countable, active, class_name, class_file) VALUES (?, ?, ?)", [2, 1, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
