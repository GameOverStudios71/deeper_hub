defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdRolesActionsSeed do
  @moduledoc """
  Seed para a tabela sys_std_roles_actions.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_std_roles_actions...")

    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [1, "manage roles", "_adm_rl_txt_action_manage_roles", "_adm_rl_txt_action_manage_roles_dsc"])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [2, "manage apps", "_adm_rl_txt_action_manage_apps", "_adm_rl_txt_action_manage_apps_dsc"])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [3, "use appearance", "_adm_rl_txt_action_use_appearance", "_adm_rl_txt_action_use_appearance_dsc"])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [4, "use structure", "_adm_rl_txt_action_use_structure", "_adm_rl_txt_action_use_structure_dsc"])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [5, "use content", "_adm_rl_txt_action_use_content", "_adm_rl_txt_action_use_content_dsc"])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [6, "use users", "_adm_rl_txt_action_use_users", "_adm_rl_txt_action_use_users_dsc"])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [7, "use configuration", "_adm_rl_txt_action_use_configuration", "_adm_rl_txt_action_use_configuration_dsc"])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [8, "use extensions", "_adm_rl_txt_action_use_extensions", "_adm_rl_txt_action_use_extensions_dsc"])
    Repo.execute("INSERT INTO sys_std_roles_actions (id, name, title, description) VALUES (?, ?, ?, ?)", [9, "use integrations", "_adm_rl_txt_action_use_integrations", "_adm_rl_txt_action_use_integrations_dsc"])

    IO.puts("Registros inseridos com sucesso!")
  end
end
