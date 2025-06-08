defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPermalinksSeed do
  @moduledoc """
  Seed para a tabela sys_permalinks.
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
    Logger.info("Inserindo registros na tabela sys_permalinks...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_permalinks (id, standard, permalink, check, compare_by_prefix) VALUES (?, ?, ?, ?, ?)", [1, "page.php?i=", "page/", "permalinks_pages", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_permalinks (id, standard, permalink, check, compare_by_prefix) VALUES (?, ?, ?, ?, ?)", [2, "modules/?r=", "m/", "permalinks_modules", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_permalinks (id, standard, permalink, check, compare_by_prefix) VALUES (?, ?, ?, ?, ?)", [3, "storage.php?o=", "s/", "permalinks_storage", 1])
      Logger.info("Registros inseridos com sucesso na tabela sys_permalinks!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_permalinks: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_permalinks...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_permalinks")
    Logger.info("Tabela sys_permalinks limpa com sucesso.", module: __MODULE__)
  end
end
