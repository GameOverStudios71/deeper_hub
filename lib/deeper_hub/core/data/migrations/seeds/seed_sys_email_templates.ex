defmodule DeeperHub.Core.Data.Migrations.Seeds.SysEmailTemplatesSeed do
  @moduledoc """
  Seed para a tabela sys_email_templates.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_email_templates_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_email_templates já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_email_templates...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [1, "system", "_sys_et_txt_name_system_admin_email", "t_AdminEmail", "_sys_et_txt_subject_admin_email", "_sys_et_txt_body_admin_email"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [2, "system", "_sys_et_txt_name_system_confirmation", "t_Confirmation", "_sys_et_txt_subject_confirmation", "_sys_et_txt_body_confirmation"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [3, "system", "_sys_et_txt_name_system_forgot", "t_Forgot", "_sys_et_txt_subject_forgot", "_sys_et_txt_body_forgot"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [4, "system", "_sys_et_txt_name_system_mem_expiration", "t_MemExpiration", "_sys_et_txt_subject_mem_expiration", "_sys_et_txt_body_mem_expiration"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [5, "system", "_sys_et_txt_name_system_mem_changed", "t_MemChanged", "_sys_et_txt_subject_mem_changed", "_sys_et_txt_body_mem_changed"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [6, "system", "_sys_et_txt_name_system_mem_prolonged", "t_MemProlonged", "_sys_et_txt_subject_mem_prolonged", "_sys_et_txt_body_mem_prolonged"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [7, "system", "_sys_et_txt_name_system_comment_replied", "t_CommentReplied", "_sys_et_txt_subject_comment_replied", "_sys_et_txt_body_comment_replied"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [8, "system", "_sys_et_txt_name_system_reported", "t_Reported", "_sys_et_txt_subject_system_reported", "_sys_et_txt_body_system_reported"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [9, "system", "_sys_et_txt_name_system_delayed_module_uninstall", "t_DelayedModuleUninstall", "_sys_et_txt_subject_delayed_module_uninstall", "_sys_et_txt_body_delayed_module_uninstall"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [10, "system", "_sys_et_txt_name_system_account", "t_Account", "_sys_et_txt_subject_account", "_sys_et_txt_body_account"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [11, "system", "_sys_et_txt_name_system_account_password_expired", "t_AccountPasswordExpired", "_sys_et_txt_subject_account_password_expired", "_sys_et_txt_body_account_password_expired"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [12, "system", "_sys_et_txt_name_system_pruning", "t_Pruning", "_sys_et_txt_subject_pruning", "_sys_et_txt_body_pruning"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [13, "system", "_sys_et_txt_name_profile_change_status_active", "t_ChangeStatusActive", "_sys_et_txt_subject_profile_change_status_active", "_sys_et_txt_body_profile_change_status_active"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [14, "system", "_sys_et_txt_name_profile_change_status_suspended", "t_ChangeStatusSuspended", "_sys_et_txt_subject_profile_change_status_suspended", "_sys_et_txt_body_profile_change_status_suspended"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [15, "system", "_sys_et_txt_name_profile_change_status_pending", "t_ChangeStatusPending", "_sys_et_txt_subject_profile_change_status_pending", "_sys_et_txt_body_profile_change_status_pending"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [16, "system", "_sys_et_txt_name_upgrade_failed", "t_UpgradeFailed", "_sys_et_txt_subject_upgrade_failed", "_sys_et_txt_body_upgrade_failed"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [17, "system", "_sys_et_txt_name_upgrade_modules_failed", "t_UpgradeModulesFailed", "_sys_et_txt_subject_upgrade_modules_failed", "_sys_et_txt_body_upgrade_modules_failed"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [18, "system", "_sys_et_txt_name_upgrade_success", "t_UpgradeSuccess", "_sys_et_txt_subject_upgrade_success", "_sys_et_txt_body_upgrade_success"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [19, "system", "_sys_et_txt_name_upgrade_modules_success", "t_UpgradeModulesSuccess", "_sys_et_txt_subject_upgrade_modules_success", "_sys_et_txt_body_upgrade_modules_success"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [20, "system", "_sys_et_txt_name_bg_operation_failed", "t_BgOperationFailed", "_sys_et_txt_subject_bg_operation_failed", "_sys_et_txt_body_bg_operation_failed"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [21, "system", "_sys_et_txt_name_account_change_status_activate", "t_ChangeStatusAccountActivate", "_sys_et_txt_subject_account_change_status_activate", "_sys_et_txt_body_account_change_status_activate"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [22, "system", "_sys_et_txt_name_account_change_status_suspended", "t_ChangeStatusAccountSuspend", "_sys_et_txt_subject_account_change_status_suspended", "_sys_et_txt_body_account_change_status_suspended"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [23, "system", "_sys_et_txt_name_manage_approve", "t_ManageApprove", "_sys_et_txt_subject_manage_approve", "_sys_et_txt_body_manage_approve"])
    Repo.execute("INSERT OR REPLACE INTO sys_email_templates (ID, Module, NameSystem, Name, Subject, Body) VALUES (?, ?, ?, ?, ?, ?)", [24, "bx_persons", "_bx_persons_email_friend_request", "bx_persons_friend_request", "_bx_persons_email_friend_request_subject", "_bx_persons_email_friend_request_body"])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_email_templates executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_email_templates: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_email_templates...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_email_templates será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_email_templates...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_email_templates")
    Logger.info("Tabela sys_email_templates limpa com sucesso.", module: __MODULE__)
  end

  # Funções privadas para controle de execução
  defp seed_already_executed? do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.exists?(seed_file)
  end

  defp mark_seed_executed do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    File.write(seed_file, "executed_at: #{timestamp}")
  end

  defp ensure_seeds_dir do
    unless File.exists?(@seeds_dir) do
      File.mkdir_p(@seeds_dir)
    end
  end
end
