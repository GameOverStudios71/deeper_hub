defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsSearchExtendedSeed do
  @moduledoc """
  Seed para a tabela sys_objects_search_extended.
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
    Logger.info("Inserindo registros na tabela sys_objects_search_extended...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons", "bx_persons", "_bx_persons_search_extended", 0, 1, "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search_extended (id, object, object_content_info, module, title, filter, active, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons_cmts", "bx_persons_cmts", "bx_persons", "_bx_persons_search_extended_cmts", 0, 1, "BxTemplSearchExtendedCmts", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_search_extended!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_search_extended: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_search_extended...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_search_extended")
    Logger.info("Tabela sys_objects_search_extended limpa com sucesso.", module: __MODULE__)
  end
end
