defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFeatureSeed do
  @moduledoc """
  Seed para a tabela sys_objects_feature.
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
    Logger.info("Inserindo registros na tabela sys_objects_feature...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_feature (id, name, module, is_on, is_undo, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_flag, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons", 1, 1, "page.php?i=view-persons-profile&id={object_id}", "bx_persons_data", "id", "author", "featured", "", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_feature!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_feature: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_feature...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_feature")
    Logger.info("Tabela sys_objects_feature limpa com sucesso.", module: __MODULE__)
  end
end
