defmodule DeeperHub.Core.Data.Migrations.Seeds.SysFormDisplaysSeed do
  @moduledoc """
  Seed para a tabela sys_form_displays.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_form_displays...")

    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [1, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [2, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [3, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [4, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [5, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [6, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [7, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [8, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [9, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [10, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [11, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [12, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [13, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [14, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [15, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [16, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [17, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [18, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [19, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [20, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [21, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [22, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [23, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [24, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [25, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [26, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [27, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [28, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [29, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [30, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [31, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [32, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [33, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [34, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [35, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [36, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [37, 1])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [38, 1])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [39, 0])
    Repo.execute("INSERT INTO sys_form_displays (id, display_name, module, object, title, view_mode) VALUES (?, ?)", [40, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
