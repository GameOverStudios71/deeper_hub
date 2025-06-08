defmodule DeeperHub.Core.Data.Seeds.SeedSysPermalinks do
  @doc """
  Executa o seed para a tabela sys_permalinks.
  """
  def run do
    # Inserir dados para sys_permalinks
    [
      %{ id: 1, standard: "page.php?i=", permalink: "page/", check: "permalinks_pages", compare_by_prefix: 1 },
      %{ id: 2, standard: "modules/?r=", permalink: "m/", check: "permalinks_modules", compare_by_prefix: 1 },
      %{ id: 3, standard: "storage.php?o=", permalink: "s/", check: "permalinks_storage", compare_by_prefix: 1 }
    ]
  end
end