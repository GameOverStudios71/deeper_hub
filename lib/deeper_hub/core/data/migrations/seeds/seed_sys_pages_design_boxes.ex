defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPagesDesignBoxesSeed do
  @moduledoc """
  Seed para a tabela sys_pages_design_boxes.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_pages_design_boxes...")

    Repo.execute("INSERT INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?)", [0, 2])
    Repo.execute("INSERT INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?)", [1, 8])
    Repo.execute("INSERT INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?)", [2, 1])
    Repo.execute("INSERT INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?)", [3, 4])
    Repo.execute("INSERT INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?)", [4, 6])
    Repo.execute("INSERT INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?)", [10, 3])
    Repo.execute("INSERT INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?)", [11, 9])
    Repo.execute("INSERT INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?)", [13, 5])
    Repo.execute("INSERT INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?)", [14, 7])

    IO.puts("Registros inseridos com sucesso!")
  end
end
