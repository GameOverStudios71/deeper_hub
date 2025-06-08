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

    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [1, "", "", 1, 0, 0])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [2, "_sys_ps_group_title_me_only", "@me_only", 1, 1, 7])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [3, "_sys_ps_group_title_public", "@public", 1, 1, 1])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [4, "_sys_ps_group_title_members", "@members", 0, 0, 0])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [5, "_sys_ps_group_title_friends", "@friends", 1, 1, 2])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [6, "_sys_ps_group_title_friends_selected", "@friends_selected_by_object", 1, 1, 3])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [7, "_sys_ps_group_title_relations", "@relations", 1, 1, 4])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [8, "_sys_ps_group_title_relations_selected", "@relations_selected_by_object", 1, 1, 5])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [9, "_sys_ps_group_title_memberships_selected", "@memberships_selected_by_object", 1, 1, 6])
    Repo.execute("INSERT INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [99, "_sys_ps_group_title_custom", "@custom_by_object", 0, 0, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
