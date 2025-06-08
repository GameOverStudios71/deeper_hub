defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsMenuSeed do
  @moduledoc """
  Seed para a tabela sys_objects_menu.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_menu...")

    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [1, 28, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [2, 31, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [3, 28, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [4, 7, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [5, 8, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [6, 1, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [7, 1, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [8, 30, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [9, 2, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [10, 5, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [11, 5, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [12, 29, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [13, 14, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [14, 6, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [15, 8, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [16, 24, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [17, 8, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [18, 4, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [19, 20, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [20, 15, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [21, 15, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [22, 15, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [23, 12, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [24, 19, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [25, 21, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [26, 21, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [27, 27, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [28, 6, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [29, 3, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [30, 6, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [31, 6, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [32, 6, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [33, 23, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [34, 15, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [35, 15, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [36, 15, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [37, 6, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [38, 3, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [39, 6, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [40, 9, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [41, 8, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [42, 4, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [43, 5893, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [44, 9, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [45, 6, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [46, 15, 1, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [47, 15, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [48, 8, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [49, 18, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [50, 15, 0, 0, 1])
    Repo.execute("INSERT INTO sys_objects_menu (id, object, title, set_name, module, template_id, config_api, persistent, deletable, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [51, 6, 0, 0, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
