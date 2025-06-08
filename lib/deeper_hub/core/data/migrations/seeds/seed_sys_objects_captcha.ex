defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsCaptchaSeed do
  @moduledoc """
  Seed para a tabela sys_objects_captcha.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_captcha...")

    Repo.execute("INSERT INTO sys_objects_captcha (id, object, title, override_class_name, override_class_file) VALUES (?)", [1])
    Repo.execute("INSERT INTO sys_objects_captcha (id, object, title, override_class_name, override_class_file) VALUES (?)", [2])
    Repo.execute("INSERT INTO sys_objects_captcha (id, object, title, override_class_name, override_class_file) VALUES (?)", [3])

    IO.puts("Registros inseridos com sucesso!")
  end
end
