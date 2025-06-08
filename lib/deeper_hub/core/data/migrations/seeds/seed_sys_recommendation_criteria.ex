defmodule DeeperHub.Core.Data.Migrations.Seeds.SysRecommendationCriteriaSeed do
  @moduledoc """
  Seed para a tabela sys_recommendation_criteria.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_recommendation_criteria...")

    Repo.execute("INSERT INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?)", [1, 1, 0.5, 1])
    Repo.execute("INSERT INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?)", [2, 1, 0.2, 1])
    Repo.execute("INSERT INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?)", [3, 1, 0.2, 1])
    Repo.execute("INSERT INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?)", [4, 1, 0.1, 1])
    Repo.execute("INSERT INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?)", [5, 2, 0.5, 1])
    Repo.execute("INSERT INTO sys_recommendation_criteria (id, object_id, name, source_type, source, params, weight, active) VALUES (?, ?, ?, ?)", [6, 2, 0.5, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
