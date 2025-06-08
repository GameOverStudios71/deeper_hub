defmodule DeeperHub.Core.Data.Migrations.Seeds.SysFormPreListsSeed do
  @moduledoc """
  Seed para a tabela sys_form_pre_lists.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_form_pre_lists...")

    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?)", [1, 0, 1])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?)", [2, 1, 1])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?)", [3, 0, 1])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?)", [4, 0, 1])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?)", [5, 0, 0])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?)", [6, 0, 0])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?)", [7, 0, 1])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?)", [8, 1, 0])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?)", [9, 0, 0])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?)", [10, 0, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
