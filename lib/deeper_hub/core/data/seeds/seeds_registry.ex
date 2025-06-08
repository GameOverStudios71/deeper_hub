defmodule DeeperHub.Core.Data.Seeds.SeedsRegistry do
  @moduledoc """
  Gerenciador de seeds para o banco de dados.
  Executa todos os seeds em sequência.
  """

  @doc """
  Executa todos os seeds.
  """
  def run do
    IO.puts("Iniciando execução de todos os seeds...")

    # Lista de todos os seeds
    seeds = [
    DeeperHub.Core.Data.Seeds.SeedSysContentInfoGrids,
    DeeperHub.Core.Data.Seeds.SeedSysFormDisplays,
    DeeperHub.Core.Data.Seeds.SeedSysFormDisplayInputs,
    DeeperHub.Core.Data.Seeds.SeedSysFormInputs,
    DeeperHub.Core.Data.Seeds.SeedSysGridActions,
    DeeperHub.Core.Data.Seeds.SeedSysGridFields,
    DeeperHub.Core.Data.Seeds.SeedSysMenuItems,
    DeeperHub.Core.Data.Seeds.SeedSysMenuSets,
    DeeperHub.Core.Data.Seeds.SeedSysMenuTemplates,
    DeeperHub.Core.Data.Seeds.SeedSysObjectsContentInfo,
    DeeperHub.Core.Data.Seeds.SeedSysObjectsForm,
    DeeperHub.Core.Data.Seeds.SeedSysObjectsGrid,
    DeeperHub.Core.Data.Seeds.SeedSysObjectsMenu,
    DeeperHub.Core.Data.Seeds.SeedSysObjectsPage,
    DeeperHub.Core.Data.Seeds.SeedSysObjectsView,
    DeeperHub.Core.Data.Seeds.SeedSysPagesBlocks,
    DeeperHub.Core.Data.Seeds.SeedSysPagesContentPlaceholders,
    DeeperHub.Core.Data.Seeds.SeedSysPagesLayouts,
    DeeperHub.Core.Data.Seeds.SeedSysPagesTypes,
    DeeperHub.Core.Data.Seeds.SeedSysPermalinks,
    DeeperHub.Core.Data.Seeds.SeedSysRewriteRules,
    DeeperHub.Core.Data.Seeds.SeedSysSeoLinks,
    DeeperHub.Core.Data.Seeds.SeedSysStdPages,
    DeeperHub.Core.Data.Seeds.SeedSysStdPagesWidgets,
    DeeperHub.Core.Data.Seeds.SeedSysStdWidgets,
    ]

    # Executar cada seed
    Enum.each(seeds, fn seed ->
      IO.puts("\nExecutando seed: \#{seed}")
      seed.run()
    end)

    IO.puts("\nTodos os seeds foram executados com sucesso!")
  end
end