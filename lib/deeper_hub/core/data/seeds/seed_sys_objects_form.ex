defmodule DeeperHub.Core.Data.Seeds.SeedSysObjectsForm do
  @doc """
  Executa o seed para a tabela sys_objects_form.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "sys_login", "system", "_sys_form_login", "member.php", "a:3:{s:2:\"id\";s:14:\"sys-form-login\";s:6:\"action\";s:10:\"member.php\";s:8:\"onsubmit\";s:31:\"return validateLoginForm(this);\";}", "a:3:{i:0;s:4:\"role\";i:1;s:10:\"do_sendsms\";i:2;s:12:\"do_checkcode\";}", "", "", "", "", "a:1:{s:14:\"checker_helper\";s:24:\"BxFormLoginCheckerHelper\";}", 0, 1, "", "BxTemplFormLogin", ""],
      [2, "sys_account", "system", "_sys_form_account", "", "", "a:2:{i:0;s:10:\"do_publish\";i:1;s:9:\"do_submit\";}", "sys_accounts", "id", "", "", "a:1:{s:14:\"checker_helper\";s:26:\"BxFormAccountCheckerHelper\";}", 0, 1, "", "BxTemplFormAccount", ""],
      [3, "sys_profile", "system", "_sys_form_profile", "", "", "do_submit", "sys_profiles", "id", "", "", "", 0, 1, "", "BxTemplFormProfile", ""],
      [4, "sys_forgot_password", "system", "_sys_form_forgot_password", "", "", "do_submit", "", "", "", "", "a:1:{s:14:\"checker_helper\";s:33:\"BxFormForgotPasswordCheckerHelper\";}", 0, 1, "", "BxTemplFormForgotPassword", ""],
      [5, "sys_confirm_email", "system", "_sys_form_confirm_email", "", "", "do_submit", "", "", "", "", "a:1:{s:14:\"checker_helper\";s:31:\"BxFormConfirmEmailCheckerHelper\";}", 0, 1, "", "BxTemplFormConfirmEmail", ""],
      [6, "sys_confirm_phone", "system", "_sys_form_confirm_phone", "", "", "a:2:{i:0;s:9:\"do_submit\";i:1;s:10:\"do_sendsms\";}", "", "", "", "", "a:1:{s:14:\"checker_helper\";s:31:\"BxFormConfirmPhoneCheckerHelper\";}", 0, 1, "", "BxTemplFormConfirmPhone", ""],
      [7, "sys_unsubscribe", "system", "_sys_form_unsubscribe", "", "", "do_submit", "sys_accounts", "id", "", "", "", 0, 1, "", "BxTemplFormAccount", ""],
      [8, "sys_comment", "system", "_sys_form_comment", "cmts.php", "a:3:{s:2:\"id\";s:20:\"cmt-%s-form-%s-%d-%d\";s:4:\"name\";s:20:\"cmt-%s-form-%s-%d-%d\";s:5:\"class\";s:14:\"cmt-post-reply\";}", "cmt_submit", "", "cmt_id", "", "", "", 0, 1, "", "BxTemplCmtsForm", ""],
      [9, "sys_agents_comment", "system", "_sys_form_agents_comment", "cmts.php", "a:3:{s:2:\"id\";s:20:\"cmt-%s-form-%s-%d-%d\";s:4:\"name\";s:20:\"cmt-%s-form-%s-%d-%d\";s:5:\"class\";s:14:\"cmt-post-reply\";}", "cmt_submit", "", "cmt_id", "", "", "", 0, 1, "", "BxTemplCmtsForm", ""],
      [10, "sys_review", "system", "_sys_form_review", "cmts.php", "a:3:{s:2:\"id\";s:20:\"cmt-%s-form-%s-%d-%d\";s:4:\"name\";s:20:\"cmt-%s-form-%s-%d-%d\";s:5:\"class\";s:14:\"cmt-post-reply\";}", "cmt_submit", "", "cmt_id", "", "", "", 0, 1, "", "BxTemplCmtsReviewsForm", ""],
      [11, "sys_report", "system", "_sys_form_report", "report.php", "a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";s:5:\"class\";s:17:\"bx-report-do-form\";}", "submit", "", "id", "", "", "", 0, 1, "", "", ""],
      [12, "sys_favorite", "system", "_sys_form_favorite", "favorite.php", "a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";s:5:\"class\";s:19:\"bx-favorite-do-form\";}", "submit", "", "id", "", "", "", 0, 1, "", "", ""],
      [13, "sys_privacy_group_custom", "system", "_sys_form_ps_group_custom", "privacy.php", "", "do_submit", "sys_privacy_groups_custom", "id", "", "", "", 0, 1, "", "BxTemplPrivacyFormGroupCustom", ""],
      [14, "sys_labels", "system", "_sys_form_labels", "label.php", "", "do_submit", "", "", "", "", "", 0, 1, "", "BxTemplLabelForm", ""],
      [15, "sys_wiki", "system", "_sys_form_wiki", "", "", "do_submit", "sys_pages_wiki_blocks", "id", "", "", "", 0, 1, "", "BxTemplFormWiki", ""],
      [16, "sys_manage", "system", "_sys_form_manage", "", "", "a:2:{i:0;s:7:\"do_send\";i:1;s:9:\"do_submit\";}", "", "", "", "", "", 0, 1, "", "", ""],
      [17, "sys_acl", "system", "_sys_form_acl", "", "", "do_submit", "", "", "", "", "", 0, 1, "", "", ""],
      [18, "bx_person", "bx_persons", "_bx_persons_form_profile", "", "a:1:{s:7:\"enctype\";s:19:\"multipart/form-data\";}", "do_submit", "bx_persons_data", "id", "", "", "", 0, 1, "", "BxPersonsFormEntry", "modules/boonex/persons/classes/BxPersonsFormEntry.php"],
      [19, "bx_person_skills", "bx_persons", "_bx_persons_skills_form_profile", "", "a:1:{s:7:\"enctype\";s:19:\"multipart/form-data\";}", "do_submit", "bx_persons_skills", "skill_id", "", "", "", 0, 1, "bx_person", "BxDolFormNested", "inc/classes/BxDolFormNested.php"]
    ]
    
    table_name = "sys_objects_form"
    columns = ["id", "object", "module", "title", "action", "form_attrs", "submit_name", "table", "key", "uri", "uri_title", "params", "deletable", "active", "parent_form", "override_class_name", "override_class_file"]
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