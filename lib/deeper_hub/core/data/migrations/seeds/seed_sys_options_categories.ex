defmodule DeeperHub.Core.Data.Migrations.Seeds.SysOptionsCategoriesSeed do
  @moduledoc """
  Seed para a tabela sys_options_categories.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_options_categories...")

    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [1, 1, 1, 0])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [2, 1, 1, 1])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [3, 1, 1, 2])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [4, 1, 1, 3])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [5, 1, 0, 4])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [6, 1, 0, 5])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [7, 1, 0, 6])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [8, 1, 0, 9])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [9, 1, 0, 11])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [10, 1, 0, 13])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [11, 1, 0, 14])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [12, 1, 0, 15])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [13, 1, 0, 16])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [14, 1, 0, 17])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [15, 1, 0, 18])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [16, 1, 0, 20])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [17, 1, 0, 21])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [18, 1, 0, 22])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [19, 1, 1, 2])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [20, 1, 1, 2])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [21, 1, 1, 2])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [22, 1, 1, 3])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [23, 1, 1, 2])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [24, 1, 1, 2])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [25, 1, 1, 1])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [26, 1, 1, 2])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [27, 2, 0, 1])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [28, 3, 0, 10])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [29, 3, 0, 20])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [30, 4, 0, 1])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [31, 5, 0, 1])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [32, 5, 0, 2])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [33, 5, 0, 3])
    Repo.execute("INSERT INTO sys_options_categories (id, type_id, name, caption, hidden, order) VALUES (?, ?, ?, ?)", [34, 5, 0, 4])

    IO.puts("Registros inseridos com sucesso!")
  end
end
