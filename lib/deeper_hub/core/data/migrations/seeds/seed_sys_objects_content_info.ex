defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsContentInfoSeed do
  @moduledoc """
  Seed para a tabela sys_objects_content_info.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_content_info...")

    Repo.execute("INSERT INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?)", [1])
    Repo.execute("INSERT INTO sys_objects_content_info (id, name, title, alert_unit, alert_action_add, alert_action_update, alert_action_delete, class_name, class_file) VALUES (?)", [2])

    IO.puts("Registros inseridos com sucesso!")
  end
end
