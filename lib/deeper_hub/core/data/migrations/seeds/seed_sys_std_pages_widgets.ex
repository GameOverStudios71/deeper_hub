defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdPagesWidgetsSeed do
  @moduledoc """
  Seed para a tabela sys_std_pages_widgets.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_std_pages_widgets_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_std_pages_widgets já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_std_pages_widgets...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [1, 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [2, 1, 2, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [3, 1, 3, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [4, 1, 4, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [5, 1, 5, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [6, 1, 6, 7])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [7, 1, 7, 8])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [8, 1, 8, 9])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [9, 1, 9, 10])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [10, 1, 10, 11])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [11, 1, 11, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [12, 1, 12, 12])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [13, 1, 13, 13])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [14, 1, 14, 14])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [15, 1, 15, 15])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [16, 1, 16, 16])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [17, 1, 17, 17])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [18, 1, 18, 18])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [19, 1, 19, 19])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_std_pages_widgets executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_std_pages_widgets: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_std_pages_widgets...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_std_pages_widgets...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_std_pages_widgets")
    Logger.info("Tabela sys_std_pages_widgets limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
