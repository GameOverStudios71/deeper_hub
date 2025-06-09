defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFormSeed do
  @moduledoc """
  Seed para a tabela sys_objects_form.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_form_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_form já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_form...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_login", "system", "_sys_form_login", "member.php", "a:3:{s:2:\"id\";s:14:\"sys-form-login\";s:6:\"action\";s:10:\"member.php\";s:8:\"onsubmit\";s:31:\"return validateLoginForm(this);\";}", "a:3:{i:0;s:4:\"role\";i:1;s:10:\"do_sendsms\";i:2;s:12:\"do_checkcode\";}", "", "", "", "", "a:1:{s:14:\"checker_helper\";s:24:\"BxFormLoginCheckerHelper\";}", 0, 1, "", "BxTemplFormLogin", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_account", "system", "_sys_form_account", "", "", "a:2:{i:0;s:10:\"do_publish\";i:1;s:9:\"do_submit\";}", "sys_accounts", "id", "", "", "a:1:{s:14:\"checker_helper\";s:26:\"BxFormAccountCheckerHelper\";}", 0, 1, "", "BxTemplFormAccount", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_profile", "system", "_sys_form_profile", "", "", "do_submit", "sys_profiles", "id", "", "", "", 0, 1, "", "BxTemplFormProfile", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_forgot_password", "system", "_sys_form_forgot_password", "", "", "do_submit", "", "", "", "", "a:1:{s:14:\"checker_helper\";s:33:\"BxFormForgotPasswordCheckerHelper\";}", 0, 1, "", "BxTemplFormForgotPassword", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "sys_confirm_email", "system", "_sys_form_confirm_email", "", "", "do_submit", "", "", "", "", "a:1:{s:14:\"checker_helper\";s:31:\"BxFormConfirmEmailCheckerHelper\";}", 0, 1, "", "BxTemplFormConfirmEmail", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "sys_confirm_phone", "system", "_sys_form_confirm_phone", "", "", "a:2:{i:0;s:9:\"do_submit\";i:1;s:10:\"do_sendsms\";}", "", "", "", "", "a:1:{s:14:\"checker_helper\";s:31:\"BxFormConfirmPhoneCheckerHelper\";}", 0, 1, "", "BxTemplFormConfirmPhone", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, "sys_unsubscribe", "system", "_sys_form_unsubscribe", "", "", "do_submit", "sys_accounts", "id", "", "", "", 0, 1, "", "BxTemplFormAccount", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, "sys_comment", "system", "_sys_form_comment", "cmts.php", "a:3:{s:2:\"id\";s:20:\"cmt-%s-form-%s-%d-%d\";s:4:\"name\";s:20:\"cmt-%s-form-%s-%d-%d\";s:5:\"class\";s:14:\"cmt-post-reply\";}", "cmt_submit", "", "cmt_id", "", "", "", 0, 1, "", "BxTemplCmtsForm", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, "sys_agents_comment", "system", "_sys_form_agents_comment", "cmts.php", "a:3:{s:2:\"id\";s:20:\"cmt-%s-form-%s-%d-%d\";s:4:\"name\";s:20:\"cmt-%s-form-%s-%d-%d\";s:5:\"class\";s:14:\"cmt-post-reply\";}", "cmt_submit", "", "cmt_id", "", "", "", 0, 1, "", "BxTemplCmtsForm", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [10, "sys_review", "system", "_sys_form_review", "cmts.php", "a:3:{s:2:\"id\";s:20:\"cmt-%s-form-%s-%d-%d\";s:4:\"name\";s:20:\"cmt-%s-form-%s-%d-%d\";s:5:\"class\";s:14:\"cmt-post-reply\";}", "cmt_submit", "", "cmt_id", "", "", "", 0, 1, "", "BxTemplCmtsReviewsForm", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [11, "sys_report", "system", "_sys_form_report", "report.php", "a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";s:5:\"class\";s:17:\"bx-report-do-form\";}", "submit", "", "id", "", "", "", 0, 1, "", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, "sys_favorite", "system", "_sys_form_favorite", "favorite.php", "a:3:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";s:5:\"class\";s:19:\"bx-favorite-do-form\";}", "submit", "", "id", "", "", "", 0, 1, "", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, "sys_privacy_group_custom", "system", "_sys_form_ps_group_custom", "privacy.php", "", "do_submit", "sys_privacy_groups_custom", "id", "", "", "", 0, 1, "", "BxTemplPrivacyFormGroupCustom", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, "sys_labels", "system", "_sys_form_labels", "label.php", "", "do_submit", "", "", "", "", "", 0, 1, "", "BxTemplLabelForm", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, "sys_wiki", "system", "_sys_form_wiki", "", "", "do_submit", "sys_pages_wiki_blocks", "id", "", "", "", 0, 1, "", "BxTemplFormWiki", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [16, "sys_manage", "system", "_sys_form_manage", "", "", "a:2:{i:0;s:7:\"do_send\";i:1;s:9:\"do_submit\";}", "", "", "", "", "", 0, 1, "", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [17, "sys_acl", "system", "_sys_form_acl", "", "", "do_submit", "", "", "", "", "", 0, 1, "", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [18, "bx_person", "bx_persons", "_bx_persons_form_profile", "", "a:1:{s:7:\"enctype\";s:19:\"multipart/form-data\";}", "do_submit", "bx_persons_data", "id", "", "", "", 0, 1, "", "BxPersonsFormEntry", "modules/boonex/persons/classes/BxPersonsFormEntry.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_form (id, object, module, title, 'action', form_attrs, submit_name, 'table', 'key', uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [19, "bx_person_skills", "bx_persons", "_bx_persons_skills_form_profile", "", "a:1:{s:7:\"enctype\";s:19:\"multipart/form-data\";}", "do_submit", "bx_persons_skills", "skill_id", "", "", "", 0, 1, "bx_person", "BxDolFormNested", "inc/classes/BxDolFormNested.php"])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_form executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_form: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_form...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_form será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_form...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_form")
    Logger.info("Tabela sys_objects_form limpa com sucesso.", module: __MODULE__)
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
