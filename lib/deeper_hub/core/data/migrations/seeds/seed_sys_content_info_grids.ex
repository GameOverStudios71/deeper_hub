defmodule DeeperHub.Core.Data.Migrations.Seeds.SysContentInfoGridsSeed do
  @moduledoc """
  Seed para a tabela sys_content_info_grids.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_content_info_grids_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_content_info_grids já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_content_info_grids...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons_administration", "td`.`id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons_common", "td`.`id", "", ""])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_content_info_grids executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_content_info_grids: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_content_info_grids...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_content_info_grids...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_content_info_grids")
    Logger.info("Tabela sys_content_info_grids limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
