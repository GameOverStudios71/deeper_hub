defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPagesContentPlaceholdersSeed do
  @moduledoc """
  Seed para a tabela sys_pages_content_placeholders.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_pages_content_placeholders...")

    Repo.execute("INSERT INTO sys_pages_content_placeholders (id, module, title, template, order) VALUES (?, ?)", [1, 1])
    Repo.execute("INSERT INTO sys_pages_content_placeholders (id, module, title, template, order) VALUES (?, ?)", [2, 2])
    Repo.execute("INSERT INTO sys_pages_content_placeholders (id, module, title, template, order) VALUES (?, ?)", [3, 3])
    Repo.execute("INSERT INTO sys_pages_content_placeholders (id, module, title, template, order) VALUES (?, ?)", [4, 4])
    Repo.execute("INSERT INTO sys_pages_content_placeholders (id, module, title, template, order) VALUES (?, ?)", [100, 100])
    Repo.execute("INSERT INTO sys_pages_content_placeholders (id, module, title, template, order) VALUES (?, ?)", [110, 110])
    Repo.execute("INSERT INTO sys_pages_content_placeholders (id, module, title, template, order) VALUES (?, ?)", [120, 120])

    IO.puts("Registros inseridos com sucesso!")
  end
end
