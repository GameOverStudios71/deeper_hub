defmodule DeeperHub.Core.Data.Seeds.SeedSysFormDisplays do
  @doc """
  Executa o seed para a tabela sys_form_displays.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "sys_login", "system", "sys_login", "_sys_form_display_login", 0],
      [2, "sys_login_step2", "system", "sys_login", "_sys_form_display_login_step2", 0],
      [3, "sys_login_step3", "system", "sys_login", "_sys_form_display_login_step3", 0],
      [4, "sys_account_create", "system", "sys_account", "_sys_form_display_account_create", 0],
      [5, "sys_account_settings_email", "system", "sys_account", "_sys_form_display_account_settings_email", 0],
      [6, "sys_account_settings_pwd", "system", "sys_account", "_sys_form_display_account_settings_password", 0],
      [7, "sys_account_settings_info", "system", "sys_account", "_sys_form_display_account_settings_info", 0],
      [8, "sys_account_settings_del_account", "system", "sys_account", "_sys_form_display_account_settings_delete", 0],
      [9, "sys_profile_cf_set", "system", "sys_profile", "_sys_form_display_profile_cf_set", 0],
      [10, "sys_profile_cf_manage", "system", "sys_profile", "_sys_form_display_profile_cf_manage", 0],
      [11, "sys_forgot_password", "system", "sys_forgot_password", "_sys_form_display_forgot_password", 0],
      [12, "sys_forgot_password_reset", "system", "sys_forgot_password", "_sys_form_display_forgot_password_reset", 0],
      [13, "sys_confirm_phone_set_phone", "system", "sys_confirm_phone", "_sys_form_display_confirm_phone_set_phone", 0],
      [14, "sys_confirm_phone_confirmation", "system", "sys_confirm_phone", "_sys_form_display_confirm_phone_confirmation", 0],
      [15, "sys_confirm_email", "system", "sys_confirm_email", "_sys_form_display_confirm_email", 0],
      [16, "sys_unsubscribe_updates", "system", "sys_unsubscribe", "_sys_form_display_unsubscribe_updates", 0],
      [17, "sys_unsubscribe_news", "system", "sys_unsubscribe", "_sys_form_display_unsubscribe_news", 0],
      [18, "sys_comment_post", "system", "sys_comment", "_sys_form_display_comment_post", 0],
      [19, "sys_comment_edit", "system", "sys_comment", "_sys_form_display_comment_edit", 0],
      [20, "sys_agents_comment_post", "system", "sys_agents_comment", "_sys_form_display_agents_comment_post", 0],
      [21, "sys_review_post", "system", "sys_review", "_sys_form_review_display_post", 0],
      [22, "sys_review_edit", "system", "sys_review", "_sys_form_review_display_edit", 0],
      [23, "sys_report_post", "system", "sys_report", "_sys_form_display_report_post", 0],
      [24, "sys_favorite_add", "system", "sys_favorite", "_sys_form_display_favorite_add", 0],
      [25, "sys_favorite_list_edit", "system", "sys_favorite", "_sys_form_display_favorite_list_edit", 0],
      [26, "sys_privacy_group_custom_members", "system", "sys_privacy_group_custom", "_sys_form_display_ps_gc_members", 0],
      [27, "sys_privacy_group_custom_memberships", "system", "sys_privacy_group_custom", "_sys_form_display_ps_gc_memberships", 0],
      [28, "sys_labels_select", "system", "sys_labels", "_sys_form_labels_display_select", 0],
      [29, "sys_wiki_edit", "system", "sys_wiki", "_sys_form_display_wiki_edit", 0],
      [30, "sys_wiki_translate", "system", "sys_wiki", "_sys_form_display_wiki_translate", 0],
      [31, "sys_manage_approve", "system", "sys_manage", "_sys_form_display_manage_approve", 0],
      [32, "sys_acl_set", "system", "sys_acl", "_sys_form_display_acl_set", 0],
      [33, "bx_person_add", "bx_persons", "bx_person", "_bx_persons_form_profile_display_add", 0],
      [34, "bx_person_delete", "bx_persons", "bx_person", "_bx_persons_form_profile_display_delete", 0],
      [35, "bx_person_edit", "bx_persons", "bx_person", "_bx_persons_form_profile_display_edit", 0],
      [36, "bx_person_edit_cover", "bx_persons", "bx_person", "_bx_persons_form_profile_display_edit_cover", 0],
      [37, "bx_person_view", "bx_persons", "bx_person", "_bx_persons_form_profile_display_view", 1],
      [38, "bx_person_view_full", "bx_persons", "bx_person", "_bx_persons_form_profile_display_view_full", 1],
      [39, "bx_person_skills", "bx_persons", "bx_person_skills", "_bx_persons_skills_form_profile_display_add", 0],
      [40, "bx_person_skills_view", "bx_persons", "bx_person_skills", "_bx_persons_skills_form_profile_display_view", 1]
    ]
    
    table_name = "sys_form_displays"
    columns = ["id", "display_name", "module", "object", "title", "view_mode"]
    placeholders = Enum.map(1..length(columns), fn _i -> "?" end) |> Enum.join(", ")
    sql = "INSERT INTO #{table_name} (#{Enum.join(columns, ", ")}) VALUES (#{placeholders})"
    
    Enum.each(data, fn record ->
      case DeeperHub.Core.Data.Repo.execute(sql, record) do
        { :ok, result } ->
          DeeperHub.Core.Logger.info("Registro inserido com sucesso na tabela #{table_name}: #{inspect(result)}")
        { :error, reason } ->
          DeeperHub.Core.Logger.warning("Erro ao inserir registro na tabela #{table_name}: #{inspect(reason)}", [])
      end
    end)
    
    data
  end
end