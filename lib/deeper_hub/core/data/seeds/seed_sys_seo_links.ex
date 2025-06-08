defmodule DeeperHub.Core.Data.Seeds.SeedSysSeoLinks do
  @doc """
  Executa o seed para a tabela sys_seo_links.
  """
  def run do
    # Inserir dados para sys_seo_links
    [
      %{ id: 1, module: "bx_persons", page_uri: "persons-profile-friends", param_name: "profile_id", param_value: "1", uri: "admin", added: 1749379473 }
    ]
  end
end