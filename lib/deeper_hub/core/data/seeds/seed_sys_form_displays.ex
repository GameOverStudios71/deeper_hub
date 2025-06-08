defmodule DeeperHub.Core.Data.Seeds.SeedSysFormDisplays do
  @doc """
  Executa o seed para a tabela sys_form_displays.
  """
  def run do
    # Inserir dados para sys_form_displays
    [
      %{ id: 1, display_name: "sys_login", module: "system", object: "sys_login", title: "_sys_form_display_login", view_mode: 0 },
      %{ id: 2, display_name: "sys_login_step2", module: "system", object: "sys_login", title: "_sys_form_display_login_step2", view_mode: 0 },
      %{ id: 3, display_name: "sys_login_step3", module: "system", object: "sys_login", title: "_sys_form_display_login_step3", view_mode: 0 },
      %{ id: 4, display_name: "sys_account_create", module: "system", object: "sys_account", title: "_sys_form_display_account_create", view_mode: 0 },
      %{ id: 5, display_name: "sys_account_settings_email", module: "system", object: "sys_account", title: "_sys_form_display_account_settings_email", view_mode: 0 },
      %{ id: 6, display_name: "sys_account_settings_pwd", module: "system", object: "sys_account", title: "_sys_form_display_account_settings_password", view_mode: 0 },
      %{ id: 7, display_name: "sys_account_settings_info", module: "system", object: "sys_account", title: "_sys_form_display_account_settings_info", view_mode: 0 },
      %{ id: 8, display_name: "sys_account_settings_del_account", module: "system", object: "sys_account", title: "_sys_form_display_account_settings_delete", view_mode: 0 },
      %{ id: 9, display_name: "sys_profile_cf_set", module: "system", object: "sys_profile", title: "_sys_form_display_profile_cf_set", view_mode: 0 },
      %{ id: 10, display_name: "sys_profile_cf_manage", module: "system", object: "sys_profile", title: "_sys_form_display_profile_cf_manage", view_mode: 0 },
      %{ id: 11, display_name: "sys_forgot_password", module: "system", object: "sys_forgot_password", title: "_sys_form_display_forgot_password", view_mode: 0 },
      %{ id: 12, display_name: "sys_forgot_password_reset", module: "system", object: "sys_forgot_password", title: "_sys_form_display_forgot_password_reset", view_mode: 0 },
      %{ id: 13, display_name: "sys_confirm_phone_set_phone", module: "system", object: "sys_confirm_phone", title: "_sys_form_display_confirm_phone_set_phone", view_mode: 0 },
      %{ id: 14, display_name: "sys_confirm_phone_confirmation", module: "system", object: "sys_confirm_phone", title: "_sys_form_display_confirm_phone_confirmation", view_mode: 0 },
      %{ id: 15, display_name: "sys_confirm_email", module: "system", object: "sys_confirm_email", title: "_sys_form_display_confirm_email", view_mode: 0 },
      %{ id: 16, display_name: "sys_unsubscribe_updates", module: "system", object: "sys_unsubscribe", title: "_sys_form_display_unsubscribe_updates", view_mode: 0 },
      %{ id: 17, display_name: "sys_unsubscribe_news", module: "system", object: "sys_unsubscribe", title: "_sys_form_display_unsubscribe_news", view_mode: 0 },
      %{ id: 18, display_name: "sys_comment_post", module: "system", object: "sys_comment", title: "_sys_form_display_comment_post", view_mode: 0 },
      %{ id: 19, display_name: "sys_comment_edit", module: "system", object: "sys_comment", title: "_sys_form_display_comment_edit", view_mode: 0 },
      %{ id: 20, display_name: "sys_agents_comment_post", module: "system", object: "sys_agents_comment", title: "_sys_form_display_agents_comment_post", view_mode: 0 },
      %{ id: 21, display_name: "sys_review_post", module: "system", object: "sys_review", title: "_sys_form_review_display_post", view_mode: 0 },
      %{ id: 22, display_name: "sys_review_edit", module: "system", object: "sys_review", title: "_sys_form_review_display_edit", view_mode: 0 },
      %{ id: 23, display_name: "sys_report_post", module: "system", object: "sys_report", title: "_sys_form_display_report_post", view_mode: 0 },
      %{ id: 24, display_name: "sys_favorite_add", module: "system", object: "sys_favorite", title: "_sys_form_display_favorite_add", view_mode: 0 },
      %{ id: 25, display_name: "sys_favorite_list_edit", module: "system", object: "sys_favorite", title: "_sys_form_display_favorite_list_edit", view_mode: 0 },
      %{ id: 26, display_name: "sys_privacy_group_custom_members", module: "system", object: "sys_privacy_group_custom", title: "_sys_form_display_ps_gc_members", view_mode: 0 },
      %{ id: 27, display_name: "sys_privacy_group_custom_memberships", module: "system", object: "sys_privacy_group_custom", title: "_sys_form_display_ps_gc_memberships", view_mode: 0 },
      %{ id: 28, display_name: "sys_labels_select", module: "system", object: "sys_labels", title: "_sys_form_labels_display_select", view_mode: 0 },
      %{ id: 29, display_name: "sys_wiki_edit", module: "system", object: "sys_wiki", title: "_sys_form_display_wiki_edit", view_mode: 0 },
      %{ id: 30, display_name: "sys_wiki_translate", module: "system", object: "sys_wiki", title: "_sys_form_display_wiki_translate", view_mode: 0 },
      %{ id: 31, display_name: "sys_manage_approve", module: "system", object: "sys_manage", title: "_sys_form_display_manage_approve", view_mode: 0 },
      %{ id: 32, display_name: "sys_acl_set", module: "system", object: "sys_acl", title: "_sys_form_display_acl_set", view_mode: 0 },
      %{ id: 33, display_name: "bx_person_add", module: "bx_persons", object: "bx_person", title: "_bx_persons_form_profile_display_add", view_mode: 0 },
      %{ id: 34, display_name: "bx_person_delete", module: "bx_persons", object: "bx_person", title: "_bx_persons_form_profile_display_delete", view_mode: 0 },
      %{ id: 35, display_name: "bx_person_edit", module: "bx_persons", object: "bx_person", title: "_bx_persons_form_profile_display_edit", view_mode: 0 },
      %{ id: 36, display_name: "bx_person_edit_cover", module: "bx_persons", object: "bx_person", title: "_bx_persons_form_profile_display_edit_cover", view_mode: 0 },
      %{ id: 37, display_name: "bx_person_view", module: "bx_persons", object: "bx_person", title: "_bx_persons_form_profile_display_view", view_mode: 1 },
      %{ id: 38, display_name: "bx_person_view_full", module: "bx_persons", object: "bx_person", title: "_bx_persons_form_profile_display_view_full", view_mode: 1 },
      %{ id: 39, display_name: "bx_person_skills", module: "bx_persons", object: "bx_person_skills", title: "_bx_persons_skills_form_profile_display_add", view_mode: 0 },
      %{ id: 40, display_name: "bx_person_skills_view", module: "bx_persons", object: "bx_person_skills", title: "_bx_persons_skills_form_profile_display_view", view_mode: 1 }
    ]
  end
end