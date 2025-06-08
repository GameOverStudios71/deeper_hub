defmodule DeeperHub.Core.Data.Seeds.SeedSysPagesLayouts do
  @doc """
  Executa o seed para a tabela sys_pages_layouts.
  """
  def run do
    # Inserir dados para sys_pages_layouts
    [
      %{ id: 1, name: "bar_left", icon: "layout_bar_left.png", title: "_sys_layout_bar_left", template: "layout_bar_left.html", cells_number: 2 },
      %{ id: 2, name: "bar_right", icon: "layout_bar_right.png", title: "_sys_layout_bar_right", template: "layout_bar_right.html", cells_number: 2 },
      %{ id: 3, name: "3_columns", icon: "layout_3_columns.png", title: "_sys_layout_3_columns", template: "layout_3_columns.html", cells_number: 3 },
      %{ id: 4, name: "2_columns", icon: "layout_2_columns.png", title: "_sys_layout_2_columns", template: "layout_2_columns.html", cells_number: 2 },
      %{ id: 5, name: "1_column", icon: "layout_1_column.png", title: "_sys_layout_1_column", template: "layout_1_column.html", cells_number: 1 },
      %{ id: 6, name: "top_area_bar_left", icon: "layout_top_area_bar_left.png", title: "_sys_layout_top_area_bar_left", template: "layout_top_area_bar_left.html", cells_number: 3 },
      %{ id: 7, name: "top_area_bar_right", icon: "layout_top_area_bar_right.png", title: "_sys_layout_top_area_bar_right", template: "layout_top_area_bar_right.html", cells_number: 3 },
      %{ id: 8, name: "top_area_3_columns", icon: "layout_top_area_3_columns.png", title: "_sys_layout_top_area_3_columns", template: "layout_top_area_3_columns.html", cells_number: 4 },
      %{ id: 9, name: "top_area_2_columns", icon: "layout_top_area_2_columns.png", title: "_sys_layout_top_area_2_columns", template: "layout_top_area_2_columns.html", cells_number: 3 },
      %{ id: 10, name: "topbottom_area_2_columns", icon: "layout_topbottom_area_2_columns.png", title: "_sys_layout_topbottom_area_2_columns", template: "layout_topbottom_area_2_columns.html", cells_number: 4 },
      %{ id: 11, name: "bottom_area_2_columns", icon: "layout_bottom_area_2_columns.png", title: "_sys_layout_bottom_area_2_columns", template: "layout_bottom_area_2_columns.html", cells_number: 3 },
      %{ id: 12, name: "topbottom_area_bar_right", icon: "layout_topbottom_area_bar_right.png", title: "_sys_layout_topbottom_area_bar_right", template: "layout_topbottom_area_bar_right.html", cells_number: 4 },
      %{ id: 13, name: "topbottom_area_bar_left", icon: "layout_topbottom_area_bar_left.png", title: "_sys_layout_topbottom_area_bar_left", template: "layout_topbottom_area_bar_left.html", cells_number: 4 },
      %{ id: 14, name: "bar_content_bar", icon: "layout_bar_content_bar.png", title: "_sys_layout_bar_content_bar", template: "layout_bar_content_bar.html", cells_number: 3 },
      %{ id: 15, name: "top_area_bar_content_bar", icon: "layout_top_area_bar_content_bar.png", title: "_sys_layout_top_area_bar_content_bar", template: "layout_top_area_bar_content_bar.html", cells_number: 4 },
      %{ id: 16, name: "topbottom_area_col1_col3_col2", icon: "layout_topbottom_area_col1_col3_col2.png", title: "_sys_layout_topbottom_area_col1_col3_col2", template: "layout_topbottom_area_col1_col3_col2.html", cells_number: 5 },
      %{ id: 17, name: "topbottom_area_col1_col5", icon: "layout_topbottom_area_col1_col5.png", title: "_sys_layout_topbottom_area_col1_col5", template: "layout_topbottom_area_col1_col5.html", cells_number: 4 },
      %{ id: 18, name: "1_column_thin", icon: "layout_1_column_thin.png", title: "_sys_layout_1_column_thin", template: "layout_1_column_thin.html", cells_number: 1 },
      %{ id: 19, name: "1_column_half", icon: "layout_1_column_half.png", title: "_sys_layout_1_column_half", template: "layout_1_column_half.html", cells_number: 1 },
      %{ id: 20, name: "1_column_wiki", icon: "layout_1_column_wiki.png", title: "_sys_layout_1_column_wiki", template: "layout_1_column_wiki.html", cells_number: 1 },
      %{ id: 21, name: "topbottom_area_col2_col5_col3", icon: "layout_topbottom_area_col2_col5_col3.png", title: "_sys_layout_topbottom_area_col2_col5_col3", template: "layout_topbottom_area_col2_col5_col3.html", cells_number: 5 }
    ]
  end
end