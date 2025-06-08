defmodule DeeperHub.Core.Data.Migrations.Seeds.SysEmailTemplatesSeed do
  @moduledoc """
  Seed para a tabela sys_email_templates.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_email_templates...")

    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [1, "system", "_sys_et_txt_name_system_admin_email", "t_AdminEmail", "_sys_et_txt_subject_admin_email", "_sys_et_txt_body_admin_email"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [2, "system", "_sys_et_txt_name_system_confirmation", "t_Confirmation", "_sys_et_txt_subject_confirmation", "_sys_et_txt_body_confirmation"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [3, "system", "_sys_et_txt_name_system_forgot", "t_Forgot", "_sys_et_txt_subject_forgot", "_sys_et_txt_body_forgot"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [4, "system", "_sys_et_txt_name_system_mem_expiration", "t_MemExpiration", "_sys_et_txt_subject_mem_expiration", "_sys_et_txt_body_mem_expiration"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [5, "system", "_sys_et_txt_name_system_mem_changed", "t_MemChanged", "_sys_et_txt_subject_mem_changed", "_sys_et_txt_body_mem_changed"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [6, "system", "_sys_et_txt_name_system_mem_prolonged", "t_MemProlonged", "_sys_et_txt_subject_mem_prolonged", "_sys_et_txt_body_mem_prolonged"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [7, "system", "_sys_et_txt_name_system_comment_replied", "t_CommentReplied", "_sys_et_txt_subject_comment_replied", "_sys_et_txt_body_comment_replied"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [8, "system", "_sys_et_txt_name_system_reported", "t_Reported", "_sys_et_txt_subject_system_reported", "_sys_et_txt_body_system_reported"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [9, "system", "_sys_et_txt_name_system_delayed_module_uninstall", "t_DelayedModuleUninstall", "_sys_et_txt_subject_delayed_module_uninstall", "_sys_et_txt_body_delayed_module_uninstall"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [10, "system", "_sys_et_txt_name_system_account", "t_Account", "_sys_et_txt_subject_account", "_sys_et_txt_body_account"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [11, "system", "_sys_et_txt_name_system_account_password_expired", "t_AccountPasswordExpired", "_sys_et_txt_subject_account_password_expired", "_sys_et_txt_body_account_password_expired"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [12, "system", "_sys_et_txt_name_system_pruning", "t_Pruning", "_sys_et_txt_subject_pruning", "_sys_et_txt_body_pruning"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [13, "system", "_sys_et_txt_name_profile_change_status_active", "t_ChangeStatusActive", "_sys_et_txt_subject_profile_change_status_active", "_sys_et_txt_body_profile_change_status_active"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [14, "system", "_sys_et_txt_name_profile_change_status_suspended", "t_ChangeStatusSuspended", "_sys_et_txt_subject_profile_change_status_suspended", "_sys_et_txt_body_profile_change_status_suspended"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [15, "system", "_sys_et_txt_name_profile_change_status_pending", "t_ChangeStatusPending", "_sys_et_txt_subject_profile_change_status_pending", "_sys_et_txt_body_profile_change_status_pending"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [16, "system", "_sys_et_txt_name_upgrade_failed", "t_UpgradeFailed", "_sys_et_txt_subject_upgrade_failed", "_sys_et_txt_body_upgrade_failed"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [17, "system", "_sys_et_txt_name_upgrade_modules_failed", "t_UpgradeModulesFailed", "_sys_et_txt_subject_upgrade_modules_failed", "_sys_et_txt_body_upgrade_modules_failed"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [18, "system", "_sys_et_txt_name_upgrade_success", "t_UpgradeSuccess", "_sys_et_txt_subject_upgrade_success", "_sys_et_txt_body_upgrade_success"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [19, "system", "_sys_et_txt_name_upgrade_modules_success", "t_UpgradeModulesSuccess", "_sys_et_txt_subject_upgrade_modules_success", "_sys_et_txt_body_upgrade_modules_success"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [20, "system", "_sys_et_txt_name_bg_operation_failed", "t_BgOperationFailed", "_sys_et_txt_subject_bg_operation_failed", "_sys_et_txt_body_bg_operation_failed"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [21, "system", "_sys_et_txt_name_account_change_status_activate", "t_ChangeStatusAccountActivate", "_sys_et_txt_subject_account_change_status_activate", "_sys_et_txt_body_account_change_status_activate"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [22, "system", "_sys_et_txt_name_account_change_status_suspended", "t_ChangeStatusAccountSuspend", "_sys_et_txt_subject_account_change_status_suspended", "_sys_et_txt_body_account_change_status_suspended"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [23, "system", "_sys_et_txt_name_manage_approve", "t_ManageApprove", "_sys_et_txt_subject_manage_approve", "_sys_et_txt_body_manage_approve"])
    Repo.execute("INSERT INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [24, "bx_persons", "_bx_persons_email_friend_request", "bx_persons_friend_request", "_bx_persons_email_friend_request_subject", "_bx_persons_email_friend_request_body"])

    IO.puts("Registros inseridos com sucesso!")
  end
end
