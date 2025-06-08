defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStatisticsSeed do
  @moduledoc """
  Seed para a tabela sys_statistics.
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
    Logger.info("Inserindo registros na tabela sys_statistics...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_statistics (id, module, name, title, link, icon, 'query', 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "system", "sys_accounts", "_sys_accounts", "", "user", "SELECT COUNT(*) FROM `sys_accounts` WHERE 1", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_statistics (id, module, name, title, link, icon, 'query', 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons", "_bx_persons", "page.php?i=persons-home", "user col-blue3", "SELECT COUNT(*) FROM `bx_persons_data` AS `td` LEFT JOIN `sys_profiles` AS `tp` ON `td`.`id` = `tp`.`content_id` AND `tp`.`type`='bx_persons' WHERE 1 AND `tp`.`status`='active'", 2])
      Logger.info("Registros inseridos com sucesso na tabela sys_statistics!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_statistics: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_statistics...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_statistics")
    Logger.info("Tabela sys_statistics limpa com sucesso.", module: __MODULE__)
  end
end
