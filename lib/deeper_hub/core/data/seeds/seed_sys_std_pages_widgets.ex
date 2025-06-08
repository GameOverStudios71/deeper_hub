defmodule DeeperHub.Core.Data.Seeds.SeedSysStdPagesWidgets do
  @doc """
  Executa o seed para a tabela sys_std_pages_widgets.
  """
  def run do
    # Inserir dados para sys_std_pages_widgets
    [
      %{ id: 1, page_id: 1, widget_id: 1, order: 3 },
      %{ id: 2, page_id: 1, widget_id: 2, order: 2 },
      %{ id: 3, page_id: 1, widget_id: 3, order: 1 },
      %{ id: 4, page_id: 1, widget_id: 4, order: 6 },
      %{ id: 5, page_id: 1, widget_id: 5, order: 5 },
      %{ id: 6, page_id: 1, widget_id: 6, order: 7 },
      %{ id: 7, page_id: 1, widget_id: 7, order: 8 },
      %{ id: 8, page_id: 1, widget_id: 8, order: 9 },
      %{ id: 9, page_id: 1, widget_id: 9, order: 10 },
      %{ id: 10, page_id: 1, widget_id: 10, order: 11 },
      %{ id: 11, page_id: 1, widget_id: 11, order: 4 },
      %{ id: 12, page_id: 1, widget_id: 12, order: 12 },
      %{ id: 13, page_id: 1, widget_id: 13, order: 13 },
      %{ id: 14, page_id: 1, widget_id: 14, order: 14 },
      %{ id: 15, page_id: 1, widget_id: 15, order: 15 },
      %{ id: 16, page_id: 1, widget_id: 16, order: 16 },
      %{ id: 17, page_id: 1, widget_id: 17, order: 17 },
      %{ id: 18, page_id: 1, widget_id: 18, order: 18 },
      %{ id: 19, page_id: 1, widget_id: 19, order: 19 }
    ]
  end
end