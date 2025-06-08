defmodule DeeperHub.Core.Data.Migrations.Seeds.SysContentInfoGridsSeed do
  @moduledoc """
  Seed para a tabela sys_content_info_grids.
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
    Logger.info("Inserindo registros na tabela sys_content_info_grids...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons_administration", "td`.`id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons_common", "td`.`id", "", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_content_info_grids!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_content_info_grids: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_content_info_grids...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_content_info_grids")
    Logger.info("Tabela sys_content_info_grids limpa com sucesso.", module: __MODULE__)
  end
end
