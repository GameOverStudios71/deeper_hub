defmodule DeeperHub.Core.Data.Migrations.Seeds.SysStdPagesWidgetsSeed do
  @moduledoc """
  Seed para a tabela sys_std_pages_widgets.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_std_pages_widgets_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
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
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [20, 1, 20, 20])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [48, 1, 48, 43])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [47, 1, 47, 42])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [23, 1, 23, 23])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [24, 1, 24, 24])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [25, 1, 25, 25])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [26, 1, 26, 26])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [30, 1, 30, 29])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [59, 1, 59, 53])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [49, 1, 49, 44])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [33, 1, 33, 31])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [53, 1, 53, 48])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [56, 1, 56, 51])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [61, 1, 61, 55])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [39, 1, 39, 35])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [40, 1, 40, 36])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [41, 1, 41, 37])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [42, 1, 42, 38])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [43, 1, 43, 38])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [44, 1, 44, 39])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [45, 1, 45, 40])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [46, 1, 46, 41])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [58, 1, 58, 52])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [60, 1, 60, 54])
    Repo.execute("INSERT OR REPLACE INTO sys_std_pages_widgets (id, page_id, widget_id, 'order') VALUES (?, ?, ?, ?)", [63, 1, 63, 56])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_std_pages_widgets executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_std_pages_widgets: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_std_pages_widgets...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_std_pages_widgets será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_std_pages_widgets...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_std_pages_widgets")
    Logger.info("Tabela sys_std_pages_widgets limpa com sucesso.", module: __MODULE__)
  end

  # Funções privadas para controle de execução
  defp seed_already_executed? do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.exists?(seed_file)
  end

  defp mark_seed_executed do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    File.write(seed_file, "executed_at: #{timestamp}")
  end

  defp ensure_seeds_dir do
    unless File.exists?(@seeds_dir) do
      File.mkdir_p(@seeds_dir)
    end
  end
end
