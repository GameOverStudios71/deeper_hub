defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsPrivacySeed do
  @moduledoc """
  Seed para a tabela sys_objects_privacy.
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
    Logger.info("Inserindo registros na tabela sys_objects_privacy...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_privacy (id, object, module, 'action', title, default_group, spaces, 'table', table_field_id, table_field_author, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_form_inputs_allow_view_to", "system", "view", "_sys_privacy_forms_input_allow_view_to", "3", "all", "sys_form_inputs_privacy", "id", "author_id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_privacy (id, object, module, 'action', title, default_group, spaces, 'table', table_field_id, table_field_author, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons_allow_view_to", "bx_persons", "view", "_bx_persons_form_profile_input_allow_view_to", "3", "", "bx_persons_data", "id", "author", "BxPersonsPrivacy", "modules/boonex/persons/classes/BxPersonsPrivacy.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_privacy (id, object, module, 'action', title, default_group, spaces, 'table', table_field_id, table_field_author, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons_allow_post_to", "bx_persons", "post", "_bx_persons_form_profile_input_allow_post_to", "5", "", "bx_persons_data", "id", "author", "BxPersonsPrivacyPost", "modules/boonex/persons/classes/BxPersonsPrivacyPost.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_privacy (id, object, module, 'action', title, default_group, spaces, 'table', table_field_id, table_field_author, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "bx_persons_allow_contact_to", "bx_persons", "contact", "_bx_persons_form_profile_input_allow_contact_to", "3", "", "bx_persons_data", "id", "author", "BxPersonsPrivacyContact", "modules/boonex/persons/classes/BxPersonsPrivacyContact.php"])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_privacy!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_privacy: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_privacy...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_privacy")
    Logger.info("Tabela sys_objects_privacy limpa com sucesso.", module: __MODULE__)
  end
end
