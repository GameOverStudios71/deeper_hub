defmodule DeeperHub.Core.Data.Seeds.SeedSysObjectsView do
  @doc """
  Executa o seed para a tabela sys_objects_view.
  """
  def run do
    # Inserir dados para sys_objects_view
    [
      %{ id: 1, name: "bx_persons", module: "bx_persons", table_track: "bx_persons_views_track", period: 86400, pruning: 31536000, is_on: 1, trigger_table: "bx_persons_data", trigger_field_id: "id", trigger_field_author: "author", trigger_field_count: "views", class_name: "", class_file: "" }
    ]
  end
end