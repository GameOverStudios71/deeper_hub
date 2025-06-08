defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPrivacyGroupsSeed do
  @moduledoc """
  Seed para a tabela sys_privacy_groups.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_privacy_groups...")

    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?)", [1, 1, 0, 0])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?)", [2, 1, 1, 7])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?)", [3, 1, 1, 1])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?)", [4, 0, 0, 0])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?)", [5, 1, 1, 2])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?)", [6, 1, 1, 3])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?)", [7, 1, 1, 4])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?)", [8, 1, 1, 5])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?)", [9, 1, 1, 6])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?)", [99, 0, 0, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
