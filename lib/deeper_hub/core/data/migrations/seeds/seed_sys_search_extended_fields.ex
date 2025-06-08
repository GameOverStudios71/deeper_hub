defmodule DeeperHub.Core.Data.Migrations.Seeds.SysSearchExtendedFieldsSeed do
  @moduledoc """
  Seed para a tabela sys_search_extended_fields.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_search_extended_fields...")

    Repo.execute("INSERT INTO sys_search_extended_fields (id, object, name, type, caption, info, values, pass, search_type, search_value, search_operator, active, order) VALUES (?, ?, ?)", [1, 1, 0])
    Repo.execute("INSERT INTO sys_search_extended_fields (id, object, name, type, caption, info, values, pass, search_type, search_value, search_operator, active, order) VALUES (?, ?, ?)", [2, 1, 1])
    Repo.execute("INSERT INTO sys_search_extended_fields (id, object, name, type, caption, info, values, pass, search_type, search_value, search_operator, active, order) VALUES (?, ?, ?)", [3, 1, 2])
    Repo.execute("INSERT INTO sys_search_extended_fields (id, object, name, type, caption, info, values, pass, search_type, search_value, search_operator, active, order) VALUES (?, ?, ?)", [4, 1, 3])
    Repo.execute("INSERT INTO sys_search_extended_fields (id, object, name, type, caption, info, values, pass, search_type, search_value, search_operator, active, order) VALUES (?, ?, ?)", [5, 1, 4])
    Repo.execute("INSERT INTO sys_search_extended_fields (id, object, name, type, caption, info, values, pass, search_type, search_value, search_operator, active, order) VALUES (?, ?, ?)", [6, 1, 5])
    Repo.execute("INSERT INTO sys_search_extended_fields (id, object, name, type, caption, info, values, pass, search_type, search_value, search_operator, active, order) VALUES (?, ?, ?)", [7, 1, 6])
    Repo.execute("INSERT INTO sys_search_extended_fields (id, object, name, type, caption, info, values, pass, search_type, search_value, search_operator, active, order) VALUES (?, ?, ?)", [8, 1, 0])
    Repo.execute("INSERT INTO sys_search_extended_fields (id, object, name, type, caption, info, values, pass, search_type, search_value, search_operator, active, order) VALUES (?, ?, ?)", [9, 1, 1])
    Repo.execute("INSERT INTO sys_search_extended_fields (id, object, name, type, caption, info, values, pass, search_type, search_value, search_operator, active, order) VALUES (?, ?, ?)", [10, 1, 2])

    IO.puts("Registros inseridos com sucesso!")
  end
end
