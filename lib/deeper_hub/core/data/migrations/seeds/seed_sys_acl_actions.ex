defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAclActionsSeed do
  @moduledoc """
  Seed para a tabela sys_acl_actions.
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
    Logger.info("Inserindo registros na tabela sys_acl_actions...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "system", "connect", nil, "_sys_acl_action_connect", "", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, "system", "vote", nil, "_sys_acl_action_vote", "", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [3, "system", "vote_view", nil, "_sys_acl_action_vote_view", "", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [4, "system", "vote_view_voters", nil, "_sys_acl_action_vote_view_voters", "", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [5, "system", "report", nil, "_sys_acl_action_report", "", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [6, "system", "report_view", nil, "_sys_acl_action_report_view", "", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [7, "system", "favorite", nil, "_sys_acl_action_favorite", "", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [8, "system", "favorite_view", nil, "_sys_acl_action_favorite_view", "", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [9, "system", "feature", nil, "_sys_acl_action_feature", "", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [10, "system", "view_view", nil, "_sys_acl_action_view_view", "", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [11, "system", "view_view_viewers_own", nil, "_sys_acl_action_view_view_viewers_own", "", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [12, "system", "comments post", nil, "_sys_acl_action_comments_post", "", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [13, "system", "comments edit own", nil, "_sys_acl_action_comments_edit_own", "", 0, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [14, "system", "comments remove own", nil, "_sys_acl_action_comments_remove_own", "", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [15, "system", "comments edit all", nil, "_sys_acl_action_comments_edit_all", "", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [16, "system", "comments remove all", nil, "_sys_acl_action_comments_remove_all", "", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [17, "system", "comments remove in own content", nil, "_sys_acl_action_comments_remove_in_own_content", "", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [18, "system", "comments remove in group context", nil, "_sys_acl_action_comments_remove_in_group_context", "", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [19, "system", "comments pin", nil, "_sys_acl_action_comments_pin", "", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [20, "system", "create account", nil, "_sys_acl_action_create_account", "_sys_acl_action_create_account_desc", 0, 2147483646])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [21, "system", "delete account", nil, "_sys_acl_action_delete_account", "_sys_acl_action_delete_account_desc", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [22, "system", "set acl level", nil, "_sys_acl_action_set_acl_level", "_sys_acl_action_set_acl_level_desc", 0, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [23, "system", "set badge", nil, "_sys_acl_action_set_badge", "_sys_acl_action_set_badge_desc", 0, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [24, "system", "set acl as privacy", nil, "_sys_acl_action_set_acl_as_privacy", "_sys_acl_action_set_acl_as_privacy_desc", 0, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [25, "system", "set form fields privacy", nil, "_sys_acl_action_set_form_fields_privacy", "_sys_acl_action_set_form_fields_privacy_desc", 0, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [26, "system", "chart view", nil, "_sys_acl_action_chart_view", "_sys_acl_action_chart_view_desc", 0, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [27, "system", "post links", nil, "_sys_acl_action_post_links", "_sys_acl_action_post_links_desc", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [28, "system", "use macros", nil, "_sys_acl_action_use_macros", "_sys_acl_action_use_macros_desc", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [29, "system", "switch to any profile", nil, "_sys_acl_action_switch_to_any_profile", "_sys_acl_action_switch_to_any_profile_desc", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [30, "system", "show membership levels in privacy groups", nil, "_sys_acl_action_show_membership_levels_in_privacy_groups", "_sys_acl_action_show_membership_levels_in_privacy_groups_desc", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [31, "system", "show membership private info", nil, "_sys_acl_action_show_membership_private_info", "_sys_acl_action_show_membership_private_info_desc", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [32, "system", "wiki add block", nil, "_sys_acl_action_add_block", "", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [33, "system", "wiki edit block", nil, "_sys_acl_action_edit_block", "", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [34, "system", "wiki translate block", nil, "_sys_acl_action_translate_block", "", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [35, "system", "wiki delete version", nil, "_sys_acl_action_delete_version", "", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [36, "system", "wiki delete block", nil, "_sys_acl_action_delete_block", "", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [37, "system", "wiki history", nil, "_sys_acl_action_history", "", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [38, "system", "wiki unsafe", nil, "_sys_acl_action_unsafe", "", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [39, "bx_persons", "create entry", nil, "_bx_persons_acl_action_create_profile", "", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [40, "bx_persons", "delete entry", nil, "_bx_persons_acl_action_delete_profile", "", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [41, "bx_persons", "view entry", nil, "_bx_persons_acl_action_view_profile", "", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [42, "bx_persons", "edit any entry", nil, "_bx_persons_acl_action_edit_any_profile", "", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_actions (ID, Module, Name, AdditionalParamName, Title, 'Desc', Countable, DisabledForLevels) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [43, "bx_persons", "delete any entry", nil, "_bx_persons_acl_action_delete_any_profile", "", 1, 3])
      Logger.info("Registros inseridos com sucesso na tabela sys_acl_actions!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_acl_actions: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_acl_actions...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_acl_actions")
    Logger.info("Tabela sys_acl_actions limpa com sucesso.", module: __MODULE__)
  end
end
