defmodule DeeperHub.Core.Data.Migrations.Seeds.SysProfilesSeed do
  @moduledoc """
  Seed para a tabela sys_profiles.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_profiles...")

    Repo.execute("INSERT INTO sys_profiles (id, account_id, type, content_id, cfw_value, cfw_items, cfu_items, cfu_locked, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, 1, "system", 1, 2147483647, 2147483647, 2147483647, 0, "active"])
    Repo.execute("INSERT INTO sys_profiles (id, account_id, type, content_id, cfw_value, cfw_items, cfu_items, cfu_locked, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, 2, "system", 2, 2147483647, 2147483647, 2147483647, 0, "active"])

    IO.puts("Registros inseridos com sucesso!")
  end
end
