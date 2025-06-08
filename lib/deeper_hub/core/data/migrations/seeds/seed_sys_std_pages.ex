defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdPagesSeed do
  @moduledoc """
  Seed para a tabela sys_std_pages.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_std_pages...")

    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [1, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [2, 4])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [3, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [4, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [5, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [6, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [7, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [8, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [9, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [10, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [11, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [12, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [13, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [14, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [15, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [16, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [17, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [18, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [19, 3])
    Repo.execute("INSERT INTO sys_std_pages (id, index, name, header, caption, icon) VALUES (?, ?)", [20, 3])

    IO.puts("Registros inseridos com sucesso!")
  end
end
