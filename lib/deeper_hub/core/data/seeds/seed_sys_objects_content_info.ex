defmodule DeeperHub.Core.Data.Seeds.SeedSysObjectsContentInfo do
  @doc """
  Executa o seed para a tabela sys_objects_content_info.
  """
  def run do
    # Inserir dados para sys_objects_content_info
    [
      %{ id: 1, name: "bx_persons", title: "_bx_persons", alert_unit: "bx_persons", alert_action_add: "added", alert_action_update: "edited", alert_action_delete: "deleted", class_name: "", class_file: "" },
      %{ id: 2, name: "bx_persons_cmts", title: "_bx_persons_cmts", alert_unit: "bx_persons", alert_action_add: "commentPost", alert_action_update: "commentUpdated", alert_action_delete: "commentRemoved", class_name: "BxDolContentInfoCmts", class_file: "" }
    ]
  end
end