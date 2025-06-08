defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFormSeed do
  @moduledoc """
  Seed para a tabela sys_objects_form.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_form...")

    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [1, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [2, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [3, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [4, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [5, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [6, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [7, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [8, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [9, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [10, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [11, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [12, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [13, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [14, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [15, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [16, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [17, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [18, 0, 1])
    Repo.execute("INSERT INTO sys_objects_form (id, object, module, title, action, form_attrs, submit_name, table, key, uri, uri_title, params, deletable, active, parent_form, override_class_name, override_class_file) VALUES (?, ?, ?)", [19, 0, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
