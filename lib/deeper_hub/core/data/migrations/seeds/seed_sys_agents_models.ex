defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAgentsModelsSeed do
  @moduledoc """
  Seed para a tabela sys_agents_models.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_agents_models...")

    Repo.execute("INSERT INTO sys_agents_models (id, name, title, key, params, for_asst, active, hidden, class_name, class_file) VALUES (?, ?, ?, ?)", [1, 0, 1, 0])
    Repo.execute("INSERT INTO sys_agents_models (id, name, title, key, params, for_asst, active, hidden, class_name, class_file) VALUES (?, ?, ?, ?)", [2, 1, 1, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
