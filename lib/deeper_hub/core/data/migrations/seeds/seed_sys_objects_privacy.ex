defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsPrivacySeed do
  @moduledoc """
  Seed para a tabela sys_objects_privacy.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_privacy_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_objects_privacy já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_privacy...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_privacy (id, object, module, 'action', title, default_group, spaces, 'table', table_field_id, table_field_author, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_form_inputs_allow_view_to", "system", "view", "_sys_privacy_forms_input_allow_view_to", "3", "all", "sys_form_inputs_privacy", "id", "author_id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_privacy (id, object, module, 'action', title, default_group, spaces, 'table', table_field_id, table_field_author, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons_allow_view_to", "bx_persons", "view", "_bx_persons_form_profile_input_allow_view_to", "3", "", "bx_persons_data", "id", "author", "BxPersonsPrivacy", "modules/boonex/persons/classes/BxPersonsPrivacy.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_privacy (id, object, module, 'action', title, default_group, spaces, 'table', table_field_id, table_field_author, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons_allow_post_to", "bx_persons", "post", "_bx_persons_form_profile_input_allow_post_to", "5", "", "bx_persons_data", "id", "author", "BxPersonsPrivacyPost", "modules/boonex/persons/classes/BxPersonsPrivacyPost.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_privacy (id, object, module, 'action', title, default_group, spaces, 'table', table_field_id, table_field_author, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "bx_persons_allow_contact_to", "bx_persons", "contact", "_bx_persons_form_profile_input_allow_contact_to", "3", "", "bx_persons_data", "id", "author", "BxPersonsPrivacyContact", "modules/boonex/persons/classes/BxPersonsPrivacyContact.php"])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_objects_privacy executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_objects_privacy: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_privacy...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_privacy...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_privacy")
    Logger.info("Tabela sys_objects_privacy limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
