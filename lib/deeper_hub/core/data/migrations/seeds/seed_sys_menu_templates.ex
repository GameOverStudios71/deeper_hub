defmodule DeeperHub.Core.Data.Migrations.Seeds.SysMenuTemplatesSeed do
  @moduledoc """
  Seed para a tabela sys_menu_templates.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_menu_templates...")

    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [1, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [2, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [3, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [4, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [5, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [6, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [7, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [8, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [9, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [10, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [11, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [12, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [13, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [14, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [15, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [16, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [17, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [18, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [19, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [20, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [21, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [22, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [23, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [24, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [25, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [26, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [27, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [28, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [29, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [30, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [31, 0])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [32, 1])
    Repo.execute("INSERT INTO sys_menu_templates (id, template, title, visible) VALUES (?, ?)", [5893, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
