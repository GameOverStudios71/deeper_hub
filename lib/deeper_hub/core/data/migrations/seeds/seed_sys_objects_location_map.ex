defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLocationMapSeed do
  @moduledoc """
  Seed para a tabela sys_objects_location_map.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_location_map_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_objects_location_map já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_location_map...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_location_map (id, object, module, title, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?)", [1, "sys_google_static", "system", "_sys_location_map_google_static", "BxDolLocationMapGoogleStatic", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_location_map (id, object, module, title, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?)", [2, "sys_leaflet", "system", "_sys_location_map_leaflet", "BxDolLocationMapLeaflet", ""])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_objects_location_map executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_objects_location_map: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_location_map...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_location_map...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_location_map")
    Logger.info("Tabela sys_objects_location_map limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
