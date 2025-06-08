defmodule DeeperHub.Core.Data.Migrations.Seeds.SysFormDisplaysSeed do
  @moduledoc """
  Seed para a tabela sys_form_displays.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_form_displays_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_form_displays já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_form_displays...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [1, "sys_login", "system", "sys_login", "_sys_form_display_login", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [2, "sys_login_step2", "system", "sys_login", "_sys_form_display_login_step2", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [3, "sys_login_step3", "system", "sys_login", "_sys_form_display_login_step3", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [4, "sys_account_create", "system", "sys_account", "_sys_form_display_account_create", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [5, "sys_account_settings_email", "system", "sys_account", "_sys_form_display_account_settings_email", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [6, "sys_account_settings_pwd", "system", "sys_account", "_sys_form_display_account_settings_password", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [7, "sys_account_settings_info", "system", "sys_account", "_sys_form_display_account_settings_info", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [8, "sys_account_settings_del_account", "system", "sys_account", "_sys_form_display_account_settings_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [9, "sys_profile_cf_set", "system", "sys_profile", "_sys_form_display_profile_cf_set", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [10, "sys_profile_cf_manage", "system", "sys_profile", "_sys_form_display_profile_cf_manage", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [11, "sys_forgot_password", "system", "sys_forgot_password", "_sys_form_display_forgot_password", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [12, "sys_forgot_password_reset", "system", "sys_forgot_password", "_sys_form_display_forgot_password_reset", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [13, "sys_confirm_phone_set_phone", "system", "sys_confirm_phone", "_sys_form_display_confirm_phone_set_phone", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [14, "sys_confirm_phone_confirmation", "system", "sys_confirm_phone", "_sys_form_display_confirm_phone_confirmation", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [15, "sys_confirm_email", "system", "sys_confirm_email", "_sys_form_display_confirm_email", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [16, "sys_unsubscribe_updates", "system", "sys_unsubscribe", "_sys_form_display_unsubscribe_updates", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [17, "sys_unsubscribe_news", "system", "sys_unsubscribe", "_sys_form_display_unsubscribe_news", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [18, "sys_comment_post", "system", "sys_comment", "_sys_form_display_comment_post", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [19, "sys_comment_edit", "system", "sys_comment", "_sys_form_display_comment_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [20, "sys_agents_comment_post", "system", "sys_agents_comment", "_sys_form_display_agents_comment_post", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [21, "sys_review_post", "system", "sys_review", "_sys_form_review_display_post", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [22, "sys_review_edit", "system", "sys_review", "_sys_form_review_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [23, "sys_report_post", "system", "sys_report", "_sys_form_display_report_post", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [24, "sys_favorite_add", "system", "sys_favorite", "_sys_form_display_favorite_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [25, "sys_favorite_list_edit", "system", "sys_favorite", "_sys_form_display_favorite_list_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [26, "sys_privacy_group_custom_members", "system", "sys_privacy_group_custom", "_sys_form_display_ps_gc_members", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [27, "sys_privacy_group_custom_memberships", "system", "sys_privacy_group_custom", "_sys_form_display_ps_gc_memberships", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [28, "sys_labels_select", "system", "sys_labels", "_sys_form_labels_display_select", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [29, "sys_wiki_edit", "system", "sys_wiki", "_sys_form_display_wiki_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [30, "sys_wiki_translate", "system", "sys_wiki", "_sys_form_display_wiki_translate", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [31, "sys_manage_approve", "system", "sys_manage", "_sys_form_display_manage_approve", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [32, "sys_acl_set", "system", "sys_acl", "_sys_form_display_acl_set", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [33, "bx_person_add", "bx_persons", "bx_person", "_bx_persons_form_profile_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [34, "bx_person_delete", "bx_persons", "bx_person", "_bx_persons_form_profile_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [35, "bx_person_edit", "bx_persons", "bx_person", "_bx_persons_form_profile_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [36, "bx_person_edit_cover", "bx_persons", "bx_person", "_bx_persons_form_profile_display_edit_cover", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [37, "bx_person_view", "bx_persons", "bx_person", "_bx_persons_form_profile_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [38, "bx_person_view_full", "bx_persons", "bx_person", "_bx_persons_form_profile_display_view_full", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [39, "bx_person_skills", "bx_persons", "bx_person_skills", "_bx_persons_skills_form_profile_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [40, "bx_person_skills_view", "bx_persons", "bx_person_skills", "_bx_persons_skills_form_profile_display_view", 1])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_form_displays executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_form_displays: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_form_displays...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_form_displays...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_form_displays")
    Logger.info("Tabela sys_form_displays limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
