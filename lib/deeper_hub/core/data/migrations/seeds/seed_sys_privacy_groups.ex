defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPrivacyGroupsSeed do
  @moduledoc """
  Seed para a tabela sys_privacy_groups.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_privacy_groups_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_privacy_groups já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_privacy_groups...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [1, "", "", 1, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [2, "_sys_ps_group_title_me_only", "@me_only", 1, 1, 7])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [3, "_sys_ps_group_title_public", "@public", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [4, "_sys_ps_group_title_members", "@members", 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [5, "_sys_ps_group_title_friends", "@friends", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [6, "_sys_ps_group_title_friends_selected", "@friends_selected_by_object", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [7, "_sys_ps_group_title_relations", "@relations", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [8, "_sys_ps_group_title_relations_selected", "@relations_selected_by_object", 1, 1, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [9, "_sys_ps_group_title_memberships_selected", "@memberships_selected_by_object", 1, 1, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [99, "_sys_ps_group_title_custom", "@custom_by_object", 0, 0, 0])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_privacy_groups executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_privacy_groups: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_privacy_groups...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_privacy_groups...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_privacy_groups")
    Logger.info("Tabela sys_privacy_groups limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
