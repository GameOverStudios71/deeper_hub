defmodule DeeperHub.Core.Data.Seeds.SeedSysPagesLayouts do
  @doc """
  Executa o seed para a tabela sys_pages_layouts.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "bar_left", "layout_bar_left.png", "_sys_layout_bar_left", "layout_bar_left.html", 2],
      [2, "bar_right", "layout_bar_right.png", "_sys_layout_bar_right", "layout_bar_right.html", 2],
      [3, "3_columns", "layout_3_columns.png", "_sys_layout_3_columns", "layout_3_columns.html", 3],
      [4, "2_columns", "layout_2_columns.png", "_sys_layout_2_columns", "layout_2_columns.html", 2],
      [5, "1_column", "layout_1_column.png", "_sys_layout_1_column", "layout_1_column.html", 1],
      [6, "top_area_bar_left", "layout_top_area_bar_left.png", "_sys_layout_top_area_bar_left", "layout_top_area_bar_left.html", 3],
      [7, "top_area_bar_right", "layout_top_area_bar_right.png", "_sys_layout_top_area_bar_right", "layout_top_area_bar_right.html", 3],
      [8, "top_area_3_columns", "layout_top_area_3_columns.png", "_sys_layout_top_area_3_columns", "layout_top_area_3_columns.html", 4],
      [9, "top_area_2_columns", "layout_top_area_2_columns.png", "_sys_layout_top_area_2_columns", "layout_top_area_2_columns.html", 3],
      [10, "topbottom_area_2_columns", "layout_topbottom_area_2_columns.png", "_sys_layout_topbottom_area_2_columns", "layout_topbottom_area_2_columns.html", 4],
      [11, "bottom_area_2_columns", "layout_bottom_area_2_columns.png", "_sys_layout_bottom_area_2_columns", "layout_bottom_area_2_columns.html", 3],
      [12, "topbottom_area_bar_right", "layout_topbottom_area_bar_right.png", "_sys_layout_topbottom_area_bar_right", "layout_topbottom_area_bar_right.html", 4],
      [13, "topbottom_area_bar_left", "layout_topbottom_area_bar_left.png", "_sys_layout_topbottom_area_bar_left", "layout_topbottom_area_bar_left.html", 4],
      [14, "bar_content_bar", "layout_bar_content_bar.png", "_sys_layout_bar_content_bar", "layout_bar_content_bar.html", 3],
      [15, "top_area_bar_content_bar", "layout_top_area_bar_content_bar.png", "_sys_layout_top_area_bar_content_bar", "layout_top_area_bar_content_bar.html", 4],
      [16, "topbottom_area_col1_col3_col2", "layout_topbottom_area_col1_col3_col2.png", "_sys_layout_topbottom_area_col1_col3_col2", "layout_topbottom_area_col1_col3_col2.html", 5],
      [17, "topbottom_area_col1_col5", "layout_topbottom_area_col1_col5.png", "_sys_layout_topbottom_area_col1_col5", "layout_topbottom_area_col1_col5.html", 4],
      [18, "1_column_thin", "layout_1_column_thin.png", "_sys_layout_1_column_thin", "layout_1_column_thin.html", 1],
      [19, "1_column_half", "layout_1_column_half.png", "_sys_layout_1_column_half", "layout_1_column_half.html", 1],
      [20, "1_column_wiki", "layout_1_column_wiki.png", "_sys_layout_1_column_wiki", "layout_1_column_wiki.html", 1],
      [21, "topbottom_area_col2_col5_col3", "layout_topbottom_area_col2_col5_col3.png", "_sys_layout_topbottom_area_col2_col5_col3", "layout_topbottom_area_col2_col5_col3.html", 5]
    ]
    
    table_name = "sys_pages_layouts"
    columns = ["id", "name", "icon", "title", "template", "cells_number"]
    placeholders = Enum.map(1..length(columns), fn _i -> "?" end) |> Enum.join(", ")
    sql = "INSERT INTO #{table_name} (#{Enum.join(columns, ", ")}) VALUES (#{placeholders})"
    
    Enum.each(data, fn record ->
      case DeeperHub.Core.Data.Repo.execute(sql, record) do
        { :ok, result } ->
          DeeperHub.Core.Logger.info("Registro inserido com sucesso na tabela #{table_name}: #{inspect(result)}")
        { :error, reason } ->
          DeeperHub.Core.Logger.warning("Erro ao inserir registro na tabela #{table_name}: #{inspect(reason)}", [])
      end
    end)
    
    data
  end
end