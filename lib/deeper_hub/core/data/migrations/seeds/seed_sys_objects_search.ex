defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsSearchSeed do
  @moduledoc """
  Seed para a tabela sys_objects_search.
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
    Logger.info("Inserindo registros na tabela sys_objects_search...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_search (ID, ObjectName, Title, Order, GlobalSearch, ClassName, ClassPath) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, "sys_pages", "_sys_pages", 1, 1, "BxTemplPagesSearchResult", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search (ID, ObjectName, Title, Order, GlobalSearch, ClassName, ClassPath) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "_bx_persons", 2, 1, "BxPersonsSearchResult", "modules/boonex/persons/classes/BxPersonsSearchResult.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_search (ID, ObjectName, Title, Order, GlobalSearch, ClassName, ClassPath) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons_cmts", "_bx_persons_cmts", 3, 1, "BxPersonsCmtsSearchResult", "modules/boonex/persons/classes/BxPersonsCmtsSearchResult.php"])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_search!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_search: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_search...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_search")
    Logger.info("Tabela sys_objects_search limpa com sucesso.", module: __MODULE__)
  end
end
