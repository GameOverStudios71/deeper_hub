defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPrivacyGroupsSeed do
  @moduledoc """
  Seed para a tabela sys_privacy_groups.
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
    Logger.info("Inserindo registros na tabela sys_privacy_groups...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [1, "", "", 1, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [2, "_sys_ps_group_title_me_only", "@me_only", 1, 1, 7])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [3, "_sys_ps_group_title_public", "@public", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [4, "_sys_ps_group_title_members", "@members", 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [5, "_sys_ps_group_title_friends", "@friends", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [6, "_sys_ps_group_title_friends_selected", "@friends_selected_by_object", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [7, "_sys_ps_group_title_relations", "@relations", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [8, "_sys_ps_group_title_relations_selected", "@relations_selected_by_object", 1, 1, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [9, "_sys_ps_group_title_memberships_selected", "@memberships_selected_by_object", 1, 1, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, check, active, visible, order) VALUES (?, ?, ?, ?, ?, ?)", [99, "_sys_ps_group_title_custom", "@custom_by_object", 0, 0, 0])
      Logger.info("Registros inseridos com sucesso na tabela sys_privacy_groups!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_privacy_groups: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_privacy_groups...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_privacy_groups")
    Logger.info("Tabela sys_privacy_groups limpa com sucesso.", module: __MODULE__)
  end
end
