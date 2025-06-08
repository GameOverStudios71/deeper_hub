defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStatisticsSeed do
  @moduledoc """
  Seed para a tabela sys_statistics.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_statistics...")

    Repo.execute("INSERT INTO sys_statistics (id, module, name, title, link, icon, query, order) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "system", "sys_accounts", "_sys_accounts", "", "user", "SELECT COUNT(*) FROM `sys_accounts` WHERE 1", 1])
    Repo.execute("INSERT INTO sys_statistics (id, module, name, title, link, icon, query, order) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons", "_bx_persons", "page.php?i=persons-home", "user col-blue3", "SELECT COUNT(*) FROM `bx_persons_data` AS `td` LEFT JOIN `sys_profiles` AS `tp` ON `td`.`id` = `tp`.`content_id` AND `tp`.`type`='bx_persons' WHERE 1 AND `tp`.`status`='active'", 2])

    IO.puts("Registros inseridos com sucesso!")
  end
end
