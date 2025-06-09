defmodule DeeperHub.Core.Data.Migrations.Seeds.SeedManager do
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
      DeeperHub.Core.Data.Migrations.Seeds.BxAdsCategoriesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.BxAdsCategoriesTypesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.BxAdsSourcesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.BxAdsSourcesOptionsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.BxAntispamDnsblRulesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.BxConvosFoldersSeed,
      DeeperHub.Core.Data.Migrations.Seeds.BxNotificationsHandlersSeed,
      DeeperHub.Core.Data.Migrations.Seeds.BxNotificationsSettingsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.BxRemindersTypesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysAccountsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysAclActionsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysAclLevelsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysAclMatrixSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysAgentsModelsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysAgentsProviderOptionsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysAgentsProviderTypesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysAlertsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysAlertsCacheTriggersSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysAlertsHandlersSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysContentInfoGridsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysCronJobsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysEmailTemplatesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysFormDisplayInputsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysFormDisplaysSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysFormInputsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysFormPreListsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysFormPreValuesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysGridActionsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysGridFieldsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysInjectionsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysKeysSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysLocalizationCategoriesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysLocalizationKeysSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysLocalizationLanguagesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysLocalizationStringsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysMenuItemsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysMenuSetsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysMenuTemplatesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysModulesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysModulesFileTracksSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsCaptchaSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsChartSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsCmtsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsConnectionSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsContentInfoSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsEditorSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsEmbedsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFavoriteSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFeatureSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFileHandlersSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFormSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsGridSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLiveUpdatesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLocationFieldSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLocationMapSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLogsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsMenuSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsMetatagsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsPageSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsPlayerSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsPrivacySeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsPushSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsRecommendationSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsReportSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsRssSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsScoreSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsSearchSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsSearchExtendedSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsSmsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsStorageSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsTranscoderSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsUploaderSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsViewSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsVoteSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysObjectsWikiSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysOptionsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysOptionsCategoriesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysOptionsTypesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysPagesBlocksSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysPagesContentPlaceholdersSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysPagesDesignBoxesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysPagesLayoutsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysPagesTypesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysPermalinksSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysPreloaderSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysPrivacyGroupsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysProfilesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysRecommendationCriteriaSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysRewriteRulesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysSearchExtendedFieldsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysSearchExtendedSortingFieldsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysSeoLinksSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysSessionsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysStatisticsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysStdPagesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysStdPagesWidgetsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesActionsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesActions2rolesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesMembersSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysStdWidgetsSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysStorageMimeTypesSeed,
      DeeperHub.Core.Data.Migrations.Seeds.SysTranscoderFiltersSeed
    ]
    
    # Executar cada seed
    Enum.each(seeds, fn seed ->
      IO.puts("\nExecutando seed: #{seed}")
      seed.run()
    end)
    
    IO.puts("\nTodos os seeds foram executados com sucesso!")
  end
end
