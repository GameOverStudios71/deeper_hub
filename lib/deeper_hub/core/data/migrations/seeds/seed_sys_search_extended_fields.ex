defmodule DeeperHub.Core.Data.Migrations.Seeds.SysSearchExtendedFieldsSeed do
  @moduledoc """
  Seed para a tabela sys_search_extended_fields.
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
    Logger.info("Inserindo registros na tabela sys_search_extended_fields...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_search_extended_fields (id, object, name, 'type', caption, info, 'values', pass, search_type, search_value, search_operator, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "gender", "select", "_bx_persons_form_profile_input_gender_1749379456", "_sys_form_input_gender_info_1749379456", "#!Sex", "Xss", "checkbox_set", "", "in", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_fields (id, object, name, 'type', caption, info, 'values', pass, search_type, search_value, search_operator, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "birthday", "datepicker", "_bx_persons_form_profile_input_birthday_1749379456", "_sys_form_input_birthday_info_1749379456", "", "Date", "datepicker_range", "a:3:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:18:\"get_search_options\";s:6:\"params\";a:3:{i:0;s:8:\"birthday\";i:1;s:10:\"datepicker\";i:2;s:16:\"datepicker_range\";}}", "between", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_fields (id, object, name, 'type', caption, info, 'values', pass, search_type, search_value, search_operator, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons", "fullname", "text", "_bx_persons_form_profile_input_fullname_1749379456", "_sys_form_input_fullname_info_1749379456", "", "Xss", "text", "", "like", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_fields (id, object, name, 'type', caption, info, 'values', pass, search_type, search_value, search_operator, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "bx_persons", "description", "textarea", "_bx_persons_form_profile_input_desc_1749379456", "_sys_form_input_description_info_1749379456", "", "XssHtml", "text", "", "like", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_fields (id, object, name, 'type', caption, info, 'values', pass, search_type, search_value, search_operator, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "bx_persons", "location", "location", "_sys_form_input_location_1749379456", "_sys_form_input_location_info_1749379456", "", "", "location", "", "locate", 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_fields (id, object, name, 'type', caption, info, 'values', pass, search_type, search_value, search_operator, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "bx_persons", "online", "checkbox", "_bx_persons_form_profile_input_online_search_1749379456", "_sys_form_input_online_info_1749379456", "", "", "checkbox", "1", "=", 1, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_fields (id, object, name, 'type', caption, info, 'values', pass, search_type, search_value, search_operator, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, "bx_persons", "picture", "checkbox", "_bx_persons_form_profile_input_picture_search_1749379456", "_sys_form_input_picture_info_1749379456", "", "", "checkbox", "1", ">=", 1, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_fields (id, object, name, 'type', caption, info, 'values', pass, search_type, search_value, search_operator, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, "bx_persons_cmts", "cmt_author_id", "text_auto", "_sys_form_comment_input_caption_cmt_author_id_1749379456", "_sys_form_input_cmt_author_id_info_1749379456", "", "", "text_auto", "", "in", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_fields (id, object, name, 'type', caption, info, 'values', pass, search_type, search_value, search_operator, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, "bx_persons_cmts", "cmt_text", "textarea", "_sys_form_comment_input_caption_cmt_text_1749379456", "_sys_form_input_cmt_text_info_1749379456", "", "XssHtml", "text", "", "like", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_fields (id, object, name, 'type', caption, info, 'values', pass, search_type, search_value, search_operator, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [10, "bx_persons_cmts", "cmt_cf", "select", "_sys_form_entry_input_cf_1749379456", "_sys_form_input_cmt_cf_info_1749379456", "#!sys_content_filter", "", "checkbox_set", "", "in", 1, 2])
      Logger.info("Registros inseridos com sucesso na tabela sys_search_extended_fields!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_search_extended_fields: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_search_extended_fields...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_search_extended_fields")
    Logger.info("Tabela sys_search_extended_fields limpa com sucesso.", module: __MODULE__)
  end
end
