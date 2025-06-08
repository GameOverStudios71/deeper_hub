defmodule DeeperHub.Core.Data.Migrations.Seeds.SysOptionsTypesSeed do
  @moduledoc """
  Seed para a tabela sys_options_types.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_options_types...")

    Repo.execute("INSERT INTO sys_options_types (id, group, name, caption, icon, order) VALUES (?, ?, ?, ?, ?, ?)", [1, "system", "system", "_adm_stg_cpt_type_system", "mi-cog.svg", 1])
    Repo.execute("INSERT INTO sys_options_types (id, group, name, caption, icon, order) VALUES (?, ?, ?, ?, ?, ?)", [2, "languages", "bx_en", "_bx_eng_stg_cpt_type", "bx_en@modules/boonex/english/|std-icon.svg", 2])
    Repo.execute("INSERT INTO sys_options_types (id, group, name, caption, icon, order) VALUES (?, ?, ?, ?, ?, ?)", [3, "templates", "bx_artificer", "_bx_artificer_stg_cpt_type", "bx_artificer@modules/boonex/artificer/|std-icon.svg", 2])
    Repo.execute("INSERT INTO sys_options_types (id, group, name, caption, icon, order) VALUES (?, ?, ?, ?, ?, ?)", [4, "modules", "bx_persons", "_bx_persons", "bx_persons@modules/boonex/persons/|std-icon.svg", 1])
    Repo.execute("INSERT INTO sys_options_types (id, group, name, caption, icon, order) VALUES (?, ?, ?, ?, ?, ?)", [5, "modules", "bx_profiler", "Profiler", "bx_profiler@modules/boonex/profiler/|std-icon.svg", 2])

    IO.puts("Registros inseridos com sucesso!")
  end
end
