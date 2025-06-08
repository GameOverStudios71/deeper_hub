defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsPushSeed do
  @moduledoc """
  Seed para a tabela sys_objects_push.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_push...")

    Repo.execute("INSERT INTO sys_objects_push (id, object, title, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [1, "sys_onesignal", "OneSignal", "BxTemplPushOneSignal", ""])

    IO.puts("Registros inseridos com sucesso!")
  end
end
