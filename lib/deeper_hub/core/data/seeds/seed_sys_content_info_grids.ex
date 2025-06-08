defmodule DeeperHub.Core.Data.Seeds.SeedSysContentInfoGrids do
  @doc """
  Executa o seed para a tabela sys_content_info_grids.
  """
  def run do
    # Inserir dados para sys_content_info_grids
    [
      %{ id: 1, object: "bx_persons", grid_object: "bx_persons_administration", grid_field_id: "td`.`id", condition: "", selection: "" },
      %{ id: 2, object: "bx_persons", grid_object: "bx_persons_common", grid_field_id: "td`.`id", condition: "", selection: "" }
    ]
  end
end