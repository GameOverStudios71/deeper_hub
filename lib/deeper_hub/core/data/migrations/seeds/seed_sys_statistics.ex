defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStatisticsSeed do
  @moduledoc """
  Seed para a tabela sys_statistics.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_statistics...")

    Repo.execute("INSERT INTO sys_statistics (id, module, name, title, link, icon, query, order) VALUES (?, ?)", [1, 1])
    Repo.execute("INSERT INTO sys_statistics (id, module, name, title, link, icon, query, order) VALUES (?, ?)", [2, 2])

    IO.puts("Registros inseridos com sucesso!")
  end
end
