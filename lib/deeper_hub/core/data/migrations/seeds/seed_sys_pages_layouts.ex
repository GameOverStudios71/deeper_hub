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

    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [1, "bar_left", "layout_bar_left.png", "_sys_layout_bar_left", "layout_bar_left.html", 2])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [2, "bar_right", "layout_bar_right.png", "_sys_layout_bar_right", "layout_bar_right.html", 2])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [3, "3_columns", "layout_3_columns.png", "_sys_layout_3_columns", "layout_3_columns.html", 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [4, "2_columns", "layout_2_columns.png", "_sys_layout_2_columns", "layout_2_columns.html", 2])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [5, "1_column", "layout_1_column.png", "_sys_layout_1_column", "layout_1_column.html", 1])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [6, "top_area_bar_left", "layout_top_area_bar_left.png", "_sys_layout_top_area_bar_left", "layout_top_area_bar_left.html", 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [7, "top_area_bar_right", "layout_top_area_bar_right.png", "_sys_layout_top_area_bar_right", "layout_top_area_bar_right.html", 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [8, "top_area_3_columns", "layout_top_area_3_columns.png", "_sys_layout_top_area_3_columns", "layout_top_area_3_columns.html", 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [9, "top_area_2_columns", "layout_top_area_2_columns.png", "_sys_layout_top_area_2_columns", "layout_top_area_2_columns.html", 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [10, "topbottom_area_2_columns", "layout_topbottom_area_2_columns.png", "_sys_layout_topbottom_area_2_columns", "layout_topbottom_area_2_columns.html", 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [11, "bottom_area_2_columns", "layout_bottom_area_2_columns.png", "_sys_layout_bottom_area_2_columns", "layout_bottom_area_2_columns.html", 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [12, "topbottom_area_bar_right", "layout_topbottom_area_bar_right.png", "_sys_layout_topbottom_area_bar_right", "layout_topbottom_area_bar_right.html", 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [13, "topbottom_area_bar_left", "layout_topbottom_area_bar_left.png", "_sys_layout_topbottom_area_bar_left", "layout_topbottom_area_bar_left.html", 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [14, "bar_content_bar", "layout_bar_content_bar.png", "_sys_layout_bar_content_bar", "layout_bar_content_bar.html", 3])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [15, "top_area_bar_content_bar", "layout_top_area_bar_content_bar.png", "_sys_layout_top_area_bar_content_bar", "layout_top_area_bar_content_bar.html", 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [16, "topbottom_area_col1_col3_col2", "layout_topbottom_area_col1_col3_col2.png", "_sys_layout_topbottom_area_col1_col3_col2", "layout_topbottom_area_col1_col3_col2.html", 5])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [17, "topbottom_area_col1_col5", "layout_topbottom_area_col1_col5.png", "_sys_layout_topbottom_area_col1_col5", "layout_topbottom_area_col1_col5.html", 4])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [18, "1_column_thin", "layout_1_column_thin.png", "_sys_layout_1_column_thin", "layout_1_column_thin.html", 1])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [19, "1_column_half", "layout_1_column_half.png", "_sys_layout_1_column_half", "layout_1_column_half.html", 1])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [20, "1_column_wiki", "layout_1_column_wiki.png", "_sys_layout_1_column_wiki", "layout_1_column_wiki.html", 1])
    Repo.execute("INSERT INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [21, "topbottom_area_col2_col5_col3", "layout_topbottom_area_col2_col5_col3.png", "_sys_layout_topbottom_area_col2_col5_col3", "layout_topbottom_area_col2_col5_col3.html", 5])

    IO.puts("Registros inseridos com sucesso!")
  end
end
