defmodule DeeperHub.Core.Data.Migrations.Seeds.SysFormDisplaysSeed do
  @moduledoc """
  Seed para a tabela sys_form_displays.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_form_displays_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
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
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [41, "bx_accounts_account_settings_email", "bx_accounts", "bx_accounts_account", "_sys_form_display_account_settings_email", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [42, "bx_accounts_account_create", "bx_accounts", "bx_accounts_account", "_sys_form_display_account_create", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [43, "bx_accounts_send_test", "bx_accounts", "bx_accounts_account", "_bx_accnt_form_display_send_message", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [170, "bx_group_invite", "bx_groups", "bx_group", "_bx_groups_form_profile_display_invite", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [169, "bx_group_view_full", "bx_groups", "bx_group", "_bx_groups_form_profile_display_view_full", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [161, "bx_events_session_edit", "bx_events", "bx_events_session", "_bx_events_form_session_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [160, "bx_events_session_add", "bx_events", "bx_events_session", "_bx_events_form_session_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [159, "bx_events_question_edit", "bx_events", "bx_events_question", "_bx_events_form_question_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [158, "bx_events_question_add", "bx_events", "bx_events_question", "_bx_events_form_question_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [157, "bx_event_invite", "bx_events", "bx_event", "_bx_events_form_profile_display_invite", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [156, "bx_event_view_full", "bx_events", "bx_event", "_bx_events_form_profile_display_view_full", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [155, "bx_event_view", "bx_events", "bx_event", "_bx_events_form_profile_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [154, "bx_event_edit_cover", "bx_events", "bx_event", "_bx_events_form_profile_display_edit_cover", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [153, "bx_event_edit", "bx_events", "bx_event", "_bx_events_form_profile_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [152, "bx_event_delete", "bx_events", "bx_event", "_bx_events_form_profile_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [151, "bx_event_add", "bx_events", "bx_event", "_bx_events_form_profile_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [168, "bx_group_view", "bx_groups", "bx_group", "_bx_groups_form_profile_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [167, "bx_group_edit_cover", "bx_groups", "bx_group", "_bx_groups_form_profile_display_edit_cover", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [166, "bx_group_edit", "bx_groups", "bx_group", "_bx_groups_form_profile_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [165, "bx_group_delete", "bx_groups", "bx_group", "_bx_groups_form_profile_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [164, "bx_group_add", "bx_groups", "bx_group", "_bx_groups_form_profile_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [163, "bx_events_price_edit", "bx_events", "bx_events_price", "_bx_events_form_price_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [162, "bx_events_price_add", "bx_events", "bx_events_price", "_bx_events_form_price_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [254, "bx_classes_attach_link_add", "bx_classes", "bx_classes_attach_link", "_bx_classes_form_attach_link_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [193, "bx_ads_category_edit", "bx_ads", "bx_ads_category", "_bx_ads_form_category_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [192, "bx_ads_category_delete", "bx_ads", "bx_ads_category", "_bx_ads_form_category_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [191, "bx_ads_category_add", "bx_ads", "bx_ads_category", "_bx_ads_form_category_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [248, "bx_albums_media_move", "bx_albums", "bx_albums_media", "_bx_albums_form_media_display_move", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [177, "bx_reviews_poll_add", "bx_reviews", "bx_reviews_poll", "_bx_reviews_form_poll_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [247, "bx_albums_media_edit", "bx_albums", "bx_albums_media", "_bx_albums_form_media_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [176, "bx_reviews_entry_view", "bx_reviews", "bx_reviews", "_bx_reviews_form_entry_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [175, "bx_reviews_entry_edit", "bx_reviews", "bx_reviews", "_bx_reviews_form_entry_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [173, "bx_reviews_entry_add", "bx_reviews", "bx_reviews", "_bx_reviews_form_entry_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [174, "bx_reviews_entry_delete", "bx_reviews", "bx_reviews", "_bx_reviews_form_entry_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [86, "bx_contact_contact_send", "bx_contact", "bx_contact_contact", "_bx_contact_form_contact_display_send", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [253, "bx_classes_poll_add", "bx_classes", "bx_classes_poll", "_bx_classes_form_poll_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [251, "bx_classes_entry_edit", "bx_classes", "bx_classes", "_bx_classes_form_entry_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [252, "bx_classes_entry_view", "bx_classes", "bx_classes", "_bx_classes_form_entry_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [203, "bx_ads_entry_price_year_view", "bx_ads", "bx_ads", "_bx_ads_form_entry_price_year_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [204, "bx_ads_poll_add", "bx_ads", "bx_ads_poll", "_bx_ads_form_poll_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [202, "bx_ads_entry_price_year_edit", "bx_ads", "bx_ads", "_bx_ads_form_entry_price_year_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [201, "bx_ads_entry_price_year_add", "bx_ads", "bx_ads", "_bx_ads_form_entry_price_year_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [234, "bx_credits_profile_edit", "bx_credits", "bx_credits_profile", "_bx_credits_form_profile_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [233, "bx_credits_bundle_edit", "bx_credits", "bx_credits_bundle", "_bx_credits_form_bundle_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [231, "bx_credits_credit_withdraw_request", "bx_credits", "bx_credits_credit", "_bx_credits_form_credit_display_withdraw_request", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [232, "bx_credits_bundle_add", "bx_credits", "bx_credits_bundle", "_bx_credits_form_bundle_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [230, "bx_credits_credit_grant", "bx_credits", "bx_credits_credit", "_bx_credits_form_credit_display_grant", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [229, "bx_credits_credit_send", "bx_credits", "bx_credits_credit", "_bx_credits_form_credit_display_send", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [205, "bx_ads_attach_link_add", "bx_ads", "bx_ads_attach_link", "_bx_ads_form_attach_link_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [200, "bx_ads_entry_price_view", "bx_ads", "bx_ads", "_bx_ads_form_entry_price_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [199, "bx_ads_entry_price_edit", "bx_ads", "bx_ads", "_bx_ads_form_entry_price_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [198, "bx_ads_entry_price_add", "bx_ads", "bx_ads", "_bx_ads_form_entry_price_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [197, "bx_ads_entry_delete", "bx_ads", "bx_ads", "_bx_ads_form_entry_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [195, "bx_ads_entry_add", "bx_ads", "bx_ads", "_bx_ads_form_entry_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [196, "bx_ads_entry_edit_budget", "bx_ads", "bx_ads", "_bx_ads_form_entry_display_edit_budget", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [130, "bx_forum_entry_add", "bx_forum", "bx_forum", "_bx_forum_form_entry_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [131, "bx_forum_entry_delete", "bx_forum", "bx_forum", "_bx_forum_form_entry_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [132, "bx_forum_entry_edit", "bx_forum", "bx_forum", "_bx_forum_form_entry_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [133, "bx_forum_entry_view", "bx_forum", "bx_forum", "_bx_forum_form_entry_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [134, "bx_forum_search_full", "bx_forum", "bx_forum_search", "_bx_forum_form_search_display_full", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [135, "bx_forum_poll_add", "bx_forum", "bx_forum_poll", "_bx_forum_form_poll_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [136, "bx_forum_attach_link_add", "bx_forum", "bx_forum_attach_link", "_bx_forum_form_attach_link_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [137, "bx_feedback_question_add", "bx_feedback", "bx_feedback_question", "_bx_feedback_form_question_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [138, "bx_feedback_question_delete", "bx_feedback", "bx_feedback_question", "_bx_feedback_form_question_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [139, "bx_feedback_question_edit", "bx_feedback", "bx_feedback_question", "_bx_feedback_form_question_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [140, "bx_feedback_question_view", "bx_feedback", "bx_feedback_question", "_bx_feedback_form_question_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [141, "bx_donations_type_add", "bx_donations", "bx_donations_type", "_bx_donations_form_type_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [142, "bx_donations_type_edit", "bx_donations", "bx_donations_type", "_bx_donations_form_type_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [143, "bx_massmailer_campaign_add", "bx_massmailer", "bx_massmailer", "_bx_massmailer_form_campaign_add_display", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [144, "bx_massmailer_campaign_edit", "bx_massmailer", "bx_massmailer", "_bx_massmailer_form_campaign_edit_display", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [145, "bx_massmailer_campaign_send_test", "bx_massmailer", "bx_massmailer", "_bx_massmailer_form_campaign_send_test_display", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [146, "bx_massmailer_campaign_send_all", "bx_massmailer", "bx_massmailer", "_bx_massmailer_form_campaign_send_all_display", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [147, "bx_glossary_entry_add", "bx_glossary", "bx_glossary", "_bx_glossary_form_entry_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [148, "bx_glossary_entry_delete", "bx_glossary", "bx_glossary", "_bx_glossary_form_entry_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [149, "bx_glossary_entry_edit", "bx_glossary", "bx_glossary", "_bx_glossary_form_entry_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [150, "bx_glossary_entry_view", "bx_glossary", "bx_glossary", "_bx_glossary_form_entry_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [171, "bx_groups_price_add", "bx_groups", "bx_groups_price", "_bx_groups_form_price_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [172, "bx_groups_price_edit", "bx_groups", "bx_groups_price", "_bx_groups_form_price_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [245, "bx_albums_entry_delete", "bx_albums", "bx_albums", "_bx_albums_form_entry_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [246, "bx_albums_entry_view", "bx_albums", "bx_albums", "_bx_albums_form_entry_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [244, "bx_albums_entry_add_images", "bx_albums", "bx_albums", "_bx_albums_form_entry_display_add_images", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [243, "bx_albums_entry_edit", "bx_albums", "bx_albums", "_bx_albums_form_entry_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [250, "bx_classes_entry_delete", "bx_classes", "bx_classes", "_bx_classes_form_entry_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [249, "bx_classes_entry_add", "bx_classes", "bx_classes", "_bx_classes_form_entry_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [190, "bx_ads_form_sources_details_edit", "bx_ads", "bx_ads_form_sources_details", "_bx_ads_form_sources_details_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [264, "bx_convos_entry_view", "bx_convos", "bx_convos", "_bx_cnv_form_entry_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [263, "bx_convos_entry_delete", "bx_convos", "bx_convos", "_bx_cnv_form_entry_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [262, "bx_convos_entry_edit", "bx_convos", "bx_convos", "_bx_cnv_form_entry_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [261, "bx_convos_entry_add", "bx_convos", "bx_convos", "_bx_cnv_form_entry_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [210, "bx_ads_offer_add", "bx_ads", "bx_ads_offer", "_bx_ads_form_offer_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [211, "bx_ads_offer_view", "bx_ads", "bx_ads_offer", "_bx_ads_form_offer_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [259, "bx_channel_view", "bx_channels", "bx_channel", "_bx_channels_form_profile_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [258, "bx_channel_edit_cover", "bx_channels", "bx_channel", "_bx_channels_form_profile_display_edit_cover", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [257, "bx_channel_edit", "bx_channels", "bx_channel", "_bx_channels_form_profile_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [256, "bx_channel_delete", "bx_channels", "bx_channel", "_bx_channels_form_profile_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [255, "bx_channel_add", "bx_channels", "bx_channel", "_bx_channels_form_profile_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [285, "bx_courses_content_node_add", "bx_courses", "bx_courses_content_node", "_bx_courses_form_content_node_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [286, "bx_courses_content_node_edit", "bx_courses", "bx_courses_content_node", "_bx_courses_form_content_node_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [284, "bx_courses_price_edit", "bx_courses", "bx_courses_price", "_bx_courses_form_price_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [283, "bx_courses_price_add", "bx_courses", "bx_courses_price", "_bx_courses_form_price_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [281, "bx_course_view_full", "bx_courses", "bx_course", "_bx_courses_form_profile_display_view_full", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [282, "bx_course_invite", "bx_courses", "bx_course", "_bx_courses_form_profile_display_invite", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [280, "bx_course_view", "bx_courses", "bx_course", "_bx_courses_form_profile_display_view", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [279, "bx_course_edit_cover", "bx_courses", "bx_course", "_bx_courses_form_profile_display_edit_cover", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [278, "bx_course_edit", "bx_courses", "bx_course", "_bx_courses_form_profile_display_edit", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [242, "bx_albums_entry_add", "bx_albums", "bx_albums", "_bx_albums_form_entry_display_add", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [260, "bx_channel_view_full", "bx_channels", "bx_channel", "_bx_channels_form_profile_display_view_full", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [277, "bx_course_delete", "bx_courses", "bx_course", "_bx_courses_form_profile_display_delete", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?, ?, ?, ?, ?)", [276, "bx_course_add", "bx_courses", "bx_course", "_bx_courses_form_profile_display_add", 0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_form_displays executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_form_displays: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_form_displays...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_form_displays será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_form_displays...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_form_displays")
    Logger.info("Tabela sys_form_displays limpa com sucesso.", module: __MODULE__)
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
