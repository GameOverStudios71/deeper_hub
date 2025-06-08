defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsContentInfoSeed do
  @moduledoc """
  Seed para a tabela sys_objects_content_info.
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
    Logger.info("Inserindo registros na tabela sys_objects_content_info...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "_bx_persons", "bx_persons", "added", "edited", "deleted", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons_cmts", "_bx_persons_cmts", "bx_persons", "commentPost", "commentUpdated", "commentRemoved", "BxDolContentInfoCmts", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_content_info!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_content_info: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_content_info...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_content_info")
    Logger.info("Tabela sys_objects_content_info limpa com sucesso.", module: __MODULE__)
  end
end
