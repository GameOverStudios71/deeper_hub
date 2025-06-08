defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdPagesWidgetsSeed do
  @moduledoc """
  Seed para a tabela sys_std_pages_widgets.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_std_pages_widgets...")

    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [1, 1, 1, 3])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [2, 1, 2, 2])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [3, 1, 3, 1])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [4, 1, 4, 6])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [5, 1, 5, 5])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [6, 1, 6, 7])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [7, 1, 7, 8])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [8, 1, 8, 9])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [9, 1, 9, 10])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [10, 1, 10, 11])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [11, 1, 11, 4])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [12, 1, 12, 12])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [13, 1, 13, 13])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [14, 1, 14, 14])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [15, 1, 15, 15])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [16, 1, 16, 16])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [17, 1, 17, 17])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [18, 1, 18, 18])
    Repo.execute("INSERT INTO sys_std_pages_widgets (id, page_id, widget_id, order) VALUES (?, ?, ?, ?)", [19, 1, 19, 19])

    IO.puts("Registros inseridos com sucesso!")
  end
end
