defmodule DeeperHub.Core.Data.Migrations.MigrationRegistry do
  @moduledoc """
  Registro centralizado de migrações disponíveis no sistema.
  Este módulo é gerado e atualizado automaticamente pelo gerador.
  """

  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Retorna a lista de migrações disponíveis no sistema.
  Cada migração é representada por uma tupla {versão, módulo}.
  """
  def available_migrations do
    [
      {"20250608000001", DeeperHub.Core.Data.Migrations.CreateSysMenuItemsTable},
      {"20250608000002", DeeperHub.Core.Data.Migrations.CreateSysMenuSetsTable},
      {"20250608000003", DeeperHub.Core.Data.Migrations.CreateSysMenuTemplatesTable},
      {"20250608000004", DeeperHub.Core.Data.Migrations.CreateSysObjectsMenuTable},
      {"20250608000005", DeeperHub.Core.Data.Migrations.CreateSysObjectsPageTable},
      {"20250608000006", DeeperHub.Core.Data.Migrations.CreateSysObjectsWidgetTable},
      {"20250608000007", DeeperHub.Core.Data.Migrations.CreateSysPagesBlocksTable},
      {"20250608000008", DeeperHub.Core.Data.Migrations.CreateSysPagesBlocksDataTable},
      {"20250608000009", DeeperHub.Core.Data.Migrations.CreateSysPagesContentPlaceholdersTable},
      {"20250608000010", DeeperHub.Core.Data.Migrations.CreateSysPagesLayoutsTable},
      {"20250608000011", DeeperHub.Core.Data.Migrations.CreateSysPagesTypesTable},
      {"20250608000012", DeeperHub.Core.Data.Migrations.CreateSysPagesWikiBlocksTable},
      {"20250608000013", DeeperHub.Core.Data.Migrations.CreateSysPermalinksTable},
      {"20250608000014", DeeperHub.Core.Data.Migrations.CreateSysRewriteRulesTable},
      {"20250608000015", DeeperHub.Core.Data.Migrations.CreateSysSeoLinksTable},
      {"20250608000016", DeeperHub.Core.Data.Migrations.CreateSysSeoUriRewritesTable},
      {"20250608000017", DeeperHub.Core.Data.Migrations.CreateSysStdPagesTable},
      {"20250608000018", DeeperHub.Core.Data.Migrations.CreateSysObjectsFormTable},
      {"20250608000019", DeeperHub.Core.Data.Migrations.CreateSysFormInputsTable},
      {"20250608000020", DeeperHub.Core.Data.Migrations.CreateSysFormDisplaysTable},
      {"20250608000021", DeeperHub.Core.Data.Migrations.CreateSysFormDisplayInputsTable},
      {"20250608000022", DeeperHub.Core.Data.Migrations.CreateSysObjectsGridTable},
      {"20250608000023", DeeperHub.Core.Data.Migrations.CreateSysGridFieldsTable},
      {"20250608000024", DeeperHub.Core.Data.Migrations.CreateSysGridActionsTable},
      {"20250608000025", DeeperHub.Core.Data.Migrations.CreateSysContentInfoGridsTable},
      {"20250608000026", DeeperHub.Core.Data.Migrations.CreateSysObjectsViewTable},
      {"20250608000027", DeeperHub.Core.Data.Migrations.CreateSysObjectsContentInfoTable},
      {"20250608000028", DeeperHub.Core.Data.Migrations.CreateSysStdWidgetsTable},
      {"20250608000029", DeeperHub.Core.Data.Migrations.CreateSysStdPagesWidgetsTable},
    ]
  end

  @doc """
  Retorna a lista de seeds disponíveis no sistema.
  """
  def available_seeds do
    [
    ]
  end


  @doc """
  Executa todos os seeds disponíveis.
  """
  def run_seeds do
    Logger.info("Executando seeds...", module: __MODULE__)

    Enum.each(available_seeds(), fn seed_module ->
      Logger.info("Executando seed: #{inspect(seed_module)}", module: __MODULE__)
      seed_module.run()
    end)

    Logger.info("Seeds executados com sucesso.", module: __MODULE__)
    :ok
  end
end
