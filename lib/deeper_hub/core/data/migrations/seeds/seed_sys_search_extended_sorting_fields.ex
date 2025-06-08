defmodule DeeperHub.Core.Data.Migrations.Seeds.SysSearchExtendedSortingFieldsSeed do
  @moduledoc """
  Seed para a tabela sys_search_extended_sorting_fields.
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
    Logger.info("Inserindo registros na tabela sys_search_extended_sorting_fields...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "fullname", "asc", "_bx_persons_form_profile_input_fullname", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "fullname", "desc", "_bx_persons_form_profile_input_fullname", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons", "added", "asc", "_bx_persons_form_profile_input_date_added", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [4, "bx_persons", "added", "desc", "_bx_persons_form_profile_input_date_added", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [5, "bx_persons", "changed", "asc", "_bx_persons_form_profile_input_date_changed", 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [6, "bx_persons", "changed", "desc", "_bx_persons_form_profile_input_date_changed", 1, 5])
      Logger.info("Registros inseridos com sucesso na tabela sys_search_extended_sorting_fields!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_search_extended_sorting_fields: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_search_extended_sorting_fields...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_search_extended_sorting_fields")
    Logger.info("Tabela sys_search_extended_sorting_fields limpa com sucesso.", module: __MODULE__)
  end
end
