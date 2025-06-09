defmodule DeeperHub.Core.Data.Migrations.Seeds.SysGridActionsSeed do
  @moduledoc """
  Seed para a tabela sys_grid_actions.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_grid_actions_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_grid_actions já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_grid_actions...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_studio_lang_keys", "bulk", "delete", "_adm_pgt_btn_delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_studio_lang_keys", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_studio_lang_keys", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_studio_lang_keys", "independent", "add", "_adm_pgt_btn_add_new_key", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "sys_studio_lang_etemplates", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "sys_studio_acl", "independent", "add", "_adm_prm_btn_add_level", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, "sys_studio_acl", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, "sys_studio_acl", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, "sys_studio_acl_actions", "single", "options", "", "cog", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [10, "sys_studio_nav_menus", "independent", "add", "_adm_nav_btn_menus_create", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [11, "sys_studio_nav_menus", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, "sys_studio_nav_menus", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, "sys_studio_nav_sets", "independent", "add", "_adm_nav_btn_sets_create", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, "sys_studio_nav_sets", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, "sys_studio_nav_sets", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [16, "sys_studio_nav_items", "independent", "import", "_adm_nav_btn_items_gl_import", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [17, "sys_studio_nav_items", "independent", "add", "_adm_nav_btn_items_gl_create", "", 0, 0, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [18, "sys_studio_nav_items", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [19, "sys_studio_nav_items", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [20, "sys_studio_nav_items", "single", "show_to", "_adm_nav_btn_items_gl_visible", "", 0, 0, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [21, "sys_studio_nav_import", "single", "import", "", "plus", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [22, "sys_studio_nav_import", "bulk", "done", "_adm_nav_btn_items_done", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [23, "sys_studio_forms", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [24, "sys_studio_forms_displays", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [25, "sys_studio_forms_fields", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [26, "sys_studio_forms_fields", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [27, "sys_studio_forms_fields", "single", "show_to", "_adm_form_btn_fields_visible", "", 0, 0, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [28, "sys_studio_forms_fields", "independent", "add", "_adm_form_btn_fields_create", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [29, "sys_studio_forms_pre_lists", "independent", "add", "_adm_form_btn_pre_lists_create", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [30, "sys_studio_forms_pre_lists", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [31, "sys_studio_forms_pre_lists", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [32, "sys_studio_forms_pre_values", "independent", "add", "_adm_form_btn_pre_values_create", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [33, "sys_studio_forms_pre_values", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [34, "sys_studio_forms_pre_values", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [35, "sys_studio_forms_pre_values", "bulk", "delete", "_adm_form_btn_pre_values_delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [36, "sys_studio_search_forms", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [37, "sys_studio_search_forms_fields", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [38, "sys_studio_search_forms_fields", "independent", "reset", "_adm_form_btn_search_forms_fields_reset", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [39, "sys_studio_search_forms_sortable_fields", "independent", "reset", "_adm_form_btn_search_forms_sortable_fields_reset", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [40, "sys_studio_labels", "independent", "back", "_adm_form_btn_labels_back", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [41, "sys_studio_labels", "independent", "add", "_adm_form_btn_labels_add", "", 0, 0, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [42, "sys_studio_labels", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [43, "sys_studio_labels", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [44, "sys_studio_categories", "bulk", "delete", "_adm_form_btn_categories_delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [45, "sys_studio_categories", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [46, "sys_studio_categories", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [47, "sys_studio_categories", "independent", "add", "_adm_form_btn_categories_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [48, "sys_studio_groups_roles", "independent", "add", "_adm_rl_btn_role_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [49, "sys_studio_groups_roles", "single", "edit", "_adm_rl_btn_role_edit", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [50, "sys_studio_groups_roles", "single", "delete", "_adm_rl_btn_role_delete", "remove", 0, 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [51, "sys_badges_administration", "bulk", "delete", "_adm_form_btn_badges_delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [52, "sys_badges_administration", "single", "edit", "", "pencil-alt", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [53, "sys_badges_administration", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [54, "sys_badges_administration", "single", "delete_icon", "", "", 0, 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [55, "sys_badges_administration", "independent", "add", "_adm_form_btn_badges_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [56, "sys_reports_administration", "single", "check_in", "_adm_form_btn_reports_check_in", "lock-open", 1, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [57, "sys_reports_administration", "single", "check_out", "_adm_form_btn_reports_check_out", "lock", 1, 0, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [58, "sys_reports_administration", "single", "audit", "_adm_form_btn_reports_audit", "history", 1, 0, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [59, "sys_studio_roles", "independent", "add", "_adm_rl_btn_role_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [60, "sys_studio_roles", "single", "edit", "_adm_rl_btn_role_edit", "pencil-alt", 1, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [61, "sys_studio_roles", "single", "delete", "_adm_rl_btn_role_delete", "remove", 1, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [62, "sys_cmts_administration", "bulk", "delete", "_sys_cmts_administration_grid_action_title_adm_delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [63, "sys_cmts_administration", "single", "delete", "_sys_cmts_administration_grid_action_title_adm_delete", "remove", 1, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [64, "sys_studio_strg_files", "bulk", "delete", "_adm_strg_btn_delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [65, "sys_studio_strg_files", "single", "download", "_adm_strg_btn_download", "download", 1, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [66, "sys_studio_strg_files", "single", "delete", "_adm_strg_btn_delete", "remove", 1, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [67, "sys_studio_strg_files", "independent", "add", "_adm_strg_btn_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [68, "sys_studio_strg_images", "bulk", "delete", "_adm_strg_btn_delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [69, "sys_studio_strg_images", "single", "download", "_adm_strg_btn_download", "download", 1, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [70, "sys_studio_strg_images", "single", "resize", "_adm_strg_btn_resize", "compress", 1, 0, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [71, "sys_studio_strg_images", "single", "delete", "_adm_strg_btn_delete", "remove", 1, 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [72, "sys_studio_strg_images", "independent", "add", "_adm_strg_btn_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [73, "sys_grid_connections", "single", "accept", "_sys_accept", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [74, "sys_grid_connections", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [75, "sys_grid_connections", "single", "add_friend", "_sys_add_friend", "plus", 0, 0, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [76, "sys_grid_connections_requests", "single", "accept", "_sys_accept", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [77, "sys_grid_connections_requests", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [78, "sys_grid_subscriptions", "single", "subscribe", "_sys_subscribe", "check", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [79, "sys_grid_subscriptions", "single", "delete", "", "remove", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [80, "sys_grid_subscribed_me", "single", "subscribe", "_sys_subscribe", "check", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [81, "sys_grid_relations", "single", "delete", "_Delete", "remove", 1, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [82, "sys_grid_related_me", "single", "confirm", "_sys_confirm", "check-circle", 1, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [83, "sys_grid_related_me", "single", "decline", "_sys_decline", "times-circle", 1, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [84, "sys_grid_related_me", "single", "add", "_sys_add_relation", "plus-circle", 1, 0, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [85, "sys_grid_related_me", "single", "delete", "_Delete", "remove", 1, 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [86, "sys_queues", "single", "clear", "", "eraser", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [87, "sys_studio_api_origins", "single", "delete", "_Delete", "remove", 1, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [88, "sys_studio_api_origins", "independent", "add", "_adm_form_btn_field_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [89, "sys_studio_api_keys", "single", "delete", "_Delete", "remove", 1, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [90, "sys_studio_api_keys", "independent", "add", "_adm_form_btn_field_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [91, "sys_studio_agents_automators", "bulk", "delete", "_Delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [92, "sys_studio_agents_automators", "single", "tune", "_sys_agents_automators_btn_tune", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [93, "sys_studio_agents_automators", "single", "edit", "_Edit", "pencil-alt", 1, 0, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [94, "sys_studio_agents_automators", "single", "delete", "_Delete", "remove", 1, 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [95, "sys_studio_agents_automators", "independent", "add", "_sys_agents_automators_btn_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [96, "sys_studio_agents_helpers", "independent", "add", "_sys_agents_helpers_btn_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [97, "sys_studio_agents_helpers", "single", "tune", "_sys_agents_helpers_btn_tune", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [98, "sys_studio_agents_helpers", "single", "edit", "_Edit", "pencil-alt", 1, 0, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [99, "sys_studio_agents_helpers", "single", "delete", "_Delete", "remove", 1, 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [100, "sys_studio_agents_helpers", "bulk", "delete", "_Delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [101, "sys_studio_agents_assistants", "independent", "add", "_sys_agents_assistants_btn_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [102, "sys_studio_agents_assistants", "single", "chats", "_sys_agents_assistants_btn_chats", "comments", 1, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [103, "sys_studio_agents_assistants", "single", "files", "_sys_agents_assistants_btn_files", "folder", 1, 0, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [104, "sys_studio_agents_assistants", "single", "codes", "_sys_agents_assistants_btn_codes", "code", 1, 0, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [105, "sys_studio_agents_assistants", "single", "edit", "_Edit", "pencil-alt", 1, 0, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [106, "sys_studio_agents_assistants", "single", "delete", "_Delete", "remove", 1, 1, 1, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [107, "sys_studio_agents_assistants", "bulk", "delete", "_Delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [108, "sys_studio_agents_assistants_chats", "independent", "add", "_sys_agents_assistants_chats_btn_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [109, "sys_studio_agents_assistants_chats", "single", "chat", "_sys_agents_assistants_chats_btn_chat", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [110, "sys_studio_agents_assistants_chats", "single", "store", "_sys_agents_assistants_chats_btn_store", "download", 1, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [111, "sys_studio_agents_assistants_chats", "single", "unstore", "_sys_agents_assistants_chats_btn_unstore", "upload", 1, 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [112, "sys_studio_agents_assistants_chats", "single", "edit", "_Edit", "pencil-alt", 1, 0, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [113, "sys_studio_agents_assistants_chats", "single", "delete", "_Delete", "remove", 1, 1, 1, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [114, "sys_studio_agents_assistants_chats", "bulk", "delete", "_Delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [115, "sys_studio_agents_assistants_files", "independent", "add", "_sys_agents_assistants_files_btn_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [116, "sys_studio_agents_assistants_files", "independent", "sync", "_sys_agents_assistants_files_btn_sync", "", 0, 0, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [117, "sys_studio_agents_assistants_files", "single", "delete", "_sys_agents_assistants_files_btn_delete", "remove", 1, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [118, "sys_studio_agents_providers", "independent", "add", "_sys_agents_providers_btn_add", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [119, "sys_studio_agents_providers", "single", "info", "_sys_agents_providers_btn_info", "info", 1, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [120, "sys_studio_agents_providers", "single", "edit", "_sys_agents_providers_btn_edit", "pencil-alt", 1, 0, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [121, "sys_studio_agents_providers", "single", "delete", "_sys_agents_providers_btn_delete", "remove", 1, 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [122, "sys_studio_agents_providers", "bulk", "delete", "_sys_agents_providers_btn_delete", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [123, "bx_persons_administration", "bulk", "set_acl_level", "_bx_persons_grid_action_title_adm_set_acl_level", "", 0, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [124, "bx_persons_administration", "bulk", "delete_with_content", "_bx_persons_grid_action_title_adm_delete_with_content", "", 0, 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [125, "bx_persons_administration", "bulk", "clear_reports", "_bx_persons_grid_action_title_adm_clear_reports", "", 0, 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [126, "bx_persons_administration", "single", "set_acl_level", "_bx_persons_grid_action_title_adm_set_acl_level", "certificate", 1, 0, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [127, "bx_persons_administration", "single", "settings", "_bx_persons_grid_action_title_adm_more_actions", "cog", 1, 0, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [128, "bx_persons_administration", "single", "audit_content", "_bx_persons_grid_action_title_adm_audit_content", "search", 1, 0, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [129, "bx_persons_administration", "single", "audit_profile", "_bx_persons_grid_action_title_adm_audit_profile", "search-location", 1, 0, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [130, "bx_persons_common", "bulk", "delete_with_content", "_bx_persons_grid_action_title_adm_delete_with_content", "", 0, 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_grid_actions (id, object, 'type', name, title, icon, icon_only, confirm, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [131, "bx_persons_common", "single", "settings", "_bx_persons_grid_action_title_adm_more_actions", "cog", 1, 0, 1, 1])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_grid_actions executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_grid_actions: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_grid_actions...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_grid_actions será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_grid_actions...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_grid_actions")
    Logger.info("Tabela sys_grid_actions limpa com sucesso.", module: __MODULE__)
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
