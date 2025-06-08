defmodule DeeperHub.Core.Data.Migrations.Seeds.SysSearchExtendedSortingFieldsSeed do
  @moduledoc """
  Seed para a tabela sys_search_extended_sorting_fields.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_search_extended_sorting_fields...")

    Repo.execute("INSERT INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, order) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "fullname", "asc", "_bx_persons_form_profile_input_fullname", 1, 0])
    Repo.execute("INSERT INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, order) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "fullname", "desc", "_bx_persons_form_profile_input_fullname", 1, 1])
    Repo.execute("INSERT INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, order) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons", "added", "asc", "_bx_persons_form_profile_input_date_added", 1, 2])
    Repo.execute("INSERT INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, order) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, "bx_persons", "added", "desc", "_bx_persons_form_profile_input_date_added", 1, 3])
    Repo.execute("INSERT INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, order) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, "bx_persons", "changed", "asc", "_bx_persons_form_profile_input_date_changed", 1, 4])
    Repo.execute("INSERT INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, order) VALUES (?, ?, ?, ?, ?, ?, ?)", [6, "bx_persons", "changed", "desc", "_bx_persons_form_profile_input_date_changed", 1, 5])

    IO.puts("Registros inseridos com sucesso!")
  end
end
