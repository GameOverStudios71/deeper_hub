defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLocationFieldSeed do
  @moduledoc """
  Seed para a tabela sys_objects_location_field.
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
    Logger.info("Inserindo registros na tabela sys_objects_location_field...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_location_field (id, object, module, title, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?)", [1, "sys_google", "system", "_sys_location_field_google", "BxDolLocationFieldGoogle", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_location_field (id, object, module, title, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?)", [2, "sys_plain", "system", "_sys_location_field_plain", "BxDolLocationFieldNominatim", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_location_field!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_location_field: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_location_field...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_location_field")
    Logger.info("Tabela sys_objects_location_field limpa com sucesso.", module: __MODULE__)
  end
end
