defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLocationFieldSeed do
  @moduledoc """
  Seed para a tabela sys_objects_location_field.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_location_field...")

    Repo.execute("INSERT INTO sys_objects_location_field (id, object, module, title, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?)", [1, "sys_google", "system", "_sys_location_field_google", "BxDolLocationFieldGoogle", ""])
    Repo.execute("INSERT INTO sys_objects_location_field (id, object, module, title, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?)", [2, "sys_plain", "system", "_sys_location_field_plain", "BxDolLocationFieldNominatim", ""])

    IO.puts("Registros inseridos com sucesso!")
  end
end
