defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdPagesWidgetsSeed do
  @moduledoc """
  Seed para a tabela sys_std_pages_widgets.
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
    Logger.info("Inserindo registros na tabela sys_std_pages_widgets...", module: __MODULE__)

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
      Logger.info("Registros inseridos com sucesso na tabela sys_std_pages_widgets!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_std_pages_widgets: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_std_pages_widgets...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_std_pages_widgets")
    Logger.info("Tabela sys_std_pages_widgets limpa com sucesso.", module: __MODULE__)
  end
end
