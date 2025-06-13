def available_migrations do
    [
      {"20250608214349195", DeeperHub.Core.Data.Migrations.BxAdsCategories},
    ]

def available_seeds do
    [
      DeeperHub.Core.Data.Migrations.Seeds.BxAdsCategoriesSeed,
    ]