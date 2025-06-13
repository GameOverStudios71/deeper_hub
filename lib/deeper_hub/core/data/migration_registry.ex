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
      # Sistema Dinâmico Base
      {"20250108000001", DeeperHub.Core.Data.Migrations.CreateCmsEntities},
      {"20250108000002", DeeperHub.Core.Data.Migrations.CreateCmsFields},
      {"20250108000003", DeeperHub.Core.Data.Migrations.CreateCmsEntityData},
      {"20250108000004", DeeperHub.Core.Data.Migrations.CreateCmsRelationships},
      {"20250108000005", DeeperHub.Core.Data.Migrations.CreateCmsUsersPermissions},
      {"20250108000006", DeeperHub.Core.Data.Migrations.CreateCmsAuditLog},

      # Sistema CMS Fundamental
      {"20250108000010", DeeperHub.Core.Data.Migrations.CreateCmsPagesSystem},
      {"20250108000011", DeeperHub.Core.Data.Migrations.CreateCmsFormsSystem},
      {"20250108000012", DeeperHub.Core.Data.Migrations.CreateCmsWidgetsSystem},
      {"20250108000013", DeeperHub.Core.Data.Migrations.CreateCmsMenusSystem},
      {"20250108000014", DeeperHub.Core.Data.Migrations.CreateCmsSettingsSystem},
      {"20250108000015", DeeperHub.Core.Data.Migrations.CreateCmsMediaSystem},
    ]
  end

  @doc """
  Retorna a lista de seeds disponíveis no sistema.
  """
  def available_seeds do
    [
      DeeperHub.Core.Data.Seeds.CmsInitialDataSeed,
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
