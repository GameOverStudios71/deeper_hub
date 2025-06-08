defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesActionsSeed do
  @moduledoc """
  Seed para a tabela sys_std_roles_actions.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_std_roles_actions_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_std_roles_actions já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_std_roles_actions...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [1, "manage roles", "_adm_rl_txt_action_manage_roles", "_adm_rl_txt_action_manage_roles_dsc"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [2, "manage apps", "_adm_rl_txt_action_manage_apps", "_adm_rl_txt_action_manage_apps_dsc"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [3, "use appearance", "_adm_rl_txt_action_use_appearance", "_adm_rl_txt_action_use_appearance_dsc"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [4, "use structure", "_adm_rl_txt_action_use_structure", "_adm_rl_txt_action_use_structure_dsc"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [5, "use content", "_adm_rl_txt_action_use_content", "_adm_rl_txt_action_use_content_dsc"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [6, "use users", "_adm_rl_txt_action_use_users", "_adm_rl_txt_action_use_users_dsc"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [7, "use configuration", "_adm_rl_txt_action_use_configuration", "_adm_rl_txt_action_use_configuration_dsc"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [8, "use extensions", "_adm_rl_txt_action_use_extensions", "_adm_rl_txt_action_use_extensions_dsc"])
    Repo.execute("INSERT OR REPLACE INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [9, "use integrations", "_adm_rl_txt_action_use_integrations", "_adm_rl_txt_action_use_integrations_dsc"])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_std_roles_actions executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_std_roles_actions: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_std_roles_actions...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_std_roles_actions...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_std_roles_actions")
    Logger.info("Tabela sys_std_roles_actions limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
