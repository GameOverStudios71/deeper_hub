defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPagesLayoutsSeed do
  @moduledoc """
  Seed para a tabela sys_pages_layouts.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_pages_layouts...")

    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [1, 2])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [2, 2])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [3, 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [4, 2])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [5, 1])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [6, 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [7, 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [8, 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [9, 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [10, 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [11, 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [12, 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [13, 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [14, 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [15, 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [16, 5])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [17, 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [18, 1])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [19, 1])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [20, 1])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?)", [21, 5])

    IO.puts("Registros inseridos com sucesso!")
  end
end
