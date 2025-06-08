defmodule DeeperHub.Core.Data.Seeds.SeedSysPagesTypes do
  @doc """
  Executa o seed para a tabela sys_pages_types.
  """
  def run do
    # Inserir dados para sys_pages_types
    [
      %{ id: 1, title: "_sys_page_type_default", template: "", order: 1 },
      %{ id: 2, title: "_sys_page_type_wo_hf", template: "pt_wo_hf.html", order: 2 },
      %{ id: 3, title: "_sys_page_type_standard", template: "pt_standard.html", order: 3 },
      %{ id: 4, title: "_sys_page_type_application", template: "pt_application.html", order: 4 }
    ]
  end
end