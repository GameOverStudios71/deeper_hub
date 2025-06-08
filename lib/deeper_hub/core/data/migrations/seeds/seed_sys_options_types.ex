defmodule DeeperHub.Core.Data.Migrations.Seeds.SysOptionsTypesSeed do
  @moduledoc """
  Seed para a tabela sys_options_types.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Insere os registros na tabela.
  Usa INSERT OR REPLACE para evitar erros de UNIQUE CONSTRAINT.
  """
  def run do
    Logger.info("Inserindo registros na tabela sys_options_types...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [1, "system", "system", "_adm_stg_cpt_type_system", "mi-cog.svg", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [2, "languages", "bx_en", "_bx_eng_stg_cpt_type", "bx_en@modules/boonex/english/|std-icon.svg", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [3, "templates", "bx_artificer", "_bx_artificer_stg_cpt_type", "bx_artificer@modules/boonex/artificer/|std-icon.svg", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [4, "modules", "bx_persons", "_bx_persons", "bx_persons@modules/boonex/persons/|std-icon.svg", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [5, "modules", "bx_profiler", "Profiler", "bx_profiler@modules/boonex/profiler/|std-icon.svg", 2])
      Logger.info("Registros inseridos com sucesso na tabela sys_options_types!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_options_types: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_options_types...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_options_types")
    Logger.info("Tabela sys_options_types limpa com sucesso.", module: __MODULE__)
  end
end
