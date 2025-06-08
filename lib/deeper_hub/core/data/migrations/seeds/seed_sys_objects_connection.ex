defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsConnectionSeed do
  @moduledoc """
  Seed para a tabela sys_objects_connection.
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
    Logger.info("Inserindo registros na tabela sys_objects_connection...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_connection (id, object, 'table', profile_initiator, profile_content, 'type', tt_initiator, tf_id_initiator, tf_count_initiator, tt_content, tf_id_content, tf_count_content, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_profiles_friends", "sys_profiles_conn_friends", 1, 1, "mutual", "", "", "", "", "", "", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_connection (id, object, 'table', profile_initiator, profile_content, 'type', tt_initiator, tf_id_initiator, tf_count_initiator, tt_content, tf_id_content, tf_count_content, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_profiles_subscriptions", "sys_profiles_conn_subscriptions", 1, 1, "one-way", "", "", "", "", "", "", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_connection (id, object, 'table', profile_initiator, profile_content, 'type', tt_initiator, tf_id_initiator, tf_count_initiator, tt_content, tf_id_content, tf_count_content, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_profiles_relations", "sys_profiles_conn_relations", 1, 1, "mutual", "", "", "", "", "", "", "BxDolRelation", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_connection (id, object, 'table', profile_initiator, profile_content, 'type', tt_initiator, tf_id_initiator, tf_count_initiator, tt_content, tf_id_content, tf_count_content, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_profiles_bans", "sys_profiles_conn_bans", 1, 1, "one-way", "", "", "", "", "", "", "BxDolBan", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_connection!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_connection: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_connection...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_connection")
    Logger.info("Tabela sys_objects_connection limpa com sucesso.", module: __MODULE__)
  end
end
