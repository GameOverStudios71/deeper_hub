defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsRecommendationSeed do
  @moduledoc """
  Seed para a tabela sys_objects_recommendation.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Insere os registros na tabela.
  Usa INSERT OR REPLACE para evitar erros de UNIQUE CONSTRAINT.
  """
  def run do
    Logger.info("Inserindo registros na tabela sys_objects_recommendation...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_recommendation (id, name, module, connection, content_info, countable, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_friends", "system", "sys_profiles_friends", "", 1, 1, "BxTemplRecommendationProfile", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_recommendation (id, name, module, connection, content_info, countable, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_subscriptions", "system", "sys_profiles_subscriptions", "", 1, 1, "BxTemplRecommendationProfile", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_recommendation!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_recommendation: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_recommendation...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_recommendation")
    Logger.info("Tabela sys_objects_recommendation limpa com sucesso.", module: __MODULE__)
  end
end
