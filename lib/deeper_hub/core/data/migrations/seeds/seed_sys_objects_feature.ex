defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFeatureSeed do
  @moduledoc """
  Seed para a tabela sys_objects_feature.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_feature...")

    Repo.execute("INSERT INTO sys_objects_feature (id, name, module, is_on, is_undo, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_flag, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons", 1, 1, "page.php?i=view-persons-profile&id={object_id}", "bx_persons_data", "id", "author", "featured", "", ""])

    IO.puts("Registros inseridos com sucesso!")
  end
end
