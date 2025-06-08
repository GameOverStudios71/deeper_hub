defmodule DeeperHub.Core.Data.Migrations.Seeds.SysSearchExtendedSortingFieldsSeed do
  @moduledoc """
  Seed para a tabela sys_search_extended_sorting_fields.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_search_extended_sorting_fields_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_search_extended_sorting_fields já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_search_extended_sorting_fields...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "fullname", "asc", "_bx_persons_form_profile_input_fullname", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "fullname", "desc", "_bx_persons_form_profile_input_fullname", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons", "added", "asc", "_bx_persons_form_profile_input_date_added", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [4, "bx_persons", "added", "desc", "_bx_persons_form_profile_input_date_added", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [5, "bx_persons", "changed", "asc", "_bx_persons_form_profile_input_date_changed", 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_search_extended_sorting_fields (id, object, name, direction, caption, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?)", [6, "bx_persons", "changed", "desc", "_bx_persons_form_profile_input_date_changed", 1, 5])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_search_extended_sorting_fields executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_search_extended_sorting_fields: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_search_extended_sorting_fields...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_search_extended_sorting_fields...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_search_extended_sorting_fields")
    Logger.info("Tabela sys_search_extended_sorting_fields limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
