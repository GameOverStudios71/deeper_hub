defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPagesTypesSeed do
  @moduledoc """
  Seed para a tabela sys_pages_types.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_pages_types...")

    Repo.execute("INSERT INTO sys_pages_types (id, title, template, order) VALUES (?, ?, ?, ?)", [1, "_sys_page_type_default", "", 1])
    Repo.execute("INSERT INTO sys_pages_types (id, title, template, order) VALUES (?, ?, ?, ?)", [2, "_sys_page_type_wo_hf", "pt_wo_hf.html", 2])
    Repo.execute("INSERT INTO sys_pages_types (id, title, template, order) VALUES (?, ?, ?, ?)", [3, "_sys_page_type_standard", "pt_standard.html", 3])
    Repo.execute("INSERT INTO sys_pages_types (id, title, template, order) VALUES (?, ?, ?, ?)", [4, "_sys_page_type_application", "pt_application.html", 4])

    IO.puts("Registros inseridos com sucesso!")
  end
end
