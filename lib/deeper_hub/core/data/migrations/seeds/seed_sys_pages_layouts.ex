defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPagesLayoutsSeed do
  @moduledoc """
  Seed para a tabela sys_pages_layouts.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_pages_layouts_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_pages_layouts já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_pages_layouts...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [1, "bar_left", "layout_bar_left.png", "_sys_layout_bar_left", "layout_bar_left.html", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [2, "bar_right", "layout_bar_right.png", "_sys_layout_bar_right", "layout_bar_right.html", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [3, "3_columns", "layout_3_columns.png", "_sys_layout_3_columns", "layout_3_columns.html", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [4, "2_columns", "layout_2_columns.png", "_sys_layout_2_columns", "layout_2_columns.html", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [5, "1_column", "layout_1_column.png", "_sys_layout_1_column", "layout_1_column.html", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [6, "top_area_bar_left", "layout_top_area_bar_left.png", "_sys_layout_top_area_bar_left", "layout_top_area_bar_left.html", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [7, "top_area_bar_right", "layout_top_area_bar_right.png", "_sys_layout_top_area_bar_right", "layout_top_area_bar_right.html", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [8, "top_area_3_columns", "layout_top_area_3_columns.png", "_sys_layout_top_area_3_columns", "layout_top_area_3_columns.html", 4])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [9, "top_area_2_columns", "layout_top_area_2_columns.png", "_sys_layout_top_area_2_columns", "layout_top_area_2_columns.html", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [10, "topbottom_area_2_columns", "layout_topbottom_area_2_columns.png", "_sys_layout_topbottom_area_2_columns", "layout_topbottom_area_2_columns.html", 4])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [11, "bottom_area_2_columns", "layout_bottom_area_2_columns.png", "_sys_layout_bottom_area_2_columns", "layout_bottom_area_2_columns.html", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [12, "topbottom_area_bar_right", "layout_topbottom_area_bar_right.png", "_sys_layout_topbottom_area_bar_right", "layout_topbottom_area_bar_right.html", 4])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [13, "topbottom_area_bar_left", "layout_topbottom_area_bar_left.png", "_sys_layout_topbottom_area_bar_left", "layout_topbottom_area_bar_left.html", 4])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [14, "bar_content_bar", "layout_bar_content_bar.png", "_sys_layout_bar_content_bar", "layout_bar_content_bar.html", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [15, "top_area_bar_content_bar", "layout_top_area_bar_content_bar.png", "_sys_layout_top_area_bar_content_bar", "layout_top_area_bar_content_bar.html", 4])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [16, "topbottom_area_col1_col3_col2", "layout_topbottom_area_col1_col3_col2.png", "_sys_layout_topbottom_area_col1_col3_col2", "layout_topbottom_area_col1_col3_col2.html", 5])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [17, "topbottom_area_col1_col5", "layout_topbottom_area_col1_col5.png", "_sys_layout_topbottom_area_col1_col5", "layout_topbottom_area_col1_col5.html", 4])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [18, "1_column_thin", "layout_1_column_thin.png", "_sys_layout_1_column_thin", "layout_1_column_thin.html", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [19, "1_column_half", "layout_1_column_half.png", "_sys_layout_1_column_half", "layout_1_column_half.html", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [20, "1_column_wiki", "layout_1_column_wiki.png", "_sys_layout_1_column_wiki", "layout_1_column_wiki.html", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_layouts (id, name, icon, title, template, cells_number) VALUES (?, ?, ?, ?, ?, ?)", [21, "topbottom_area_col2_col5_col3", "layout_topbottom_area_col2_col5_col3.png", "_sys_layout_topbottom_area_col2_col5_col3", "layout_topbottom_area_col2_col5_col3.html", 5])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_pages_layouts executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_pages_layouts: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_pages_layouts...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_pages_layouts será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_pages_layouts...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_pages_layouts")
    Logger.info("Tabela sys_pages_layouts limpa com sucesso.", module: __MODULE__)
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
