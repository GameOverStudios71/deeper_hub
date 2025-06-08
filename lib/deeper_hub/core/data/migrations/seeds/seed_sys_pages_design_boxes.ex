defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPagesDesignBoxesSeed do
  @moduledoc """
  Seed para a tabela sys_pages_design_boxes.
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
    Logger.info("Inserindo registros na tabela sys_pages_design_boxes...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?, ?, ?)", [0, "_sys_designbox_0", "designbox_0.html", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?, ?, ?)", [1, "_sys_designbox_1", "designbox_1.html", 8])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?, ?, ?)", [2, "_sys_designbox_2", "designbox_2.html", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?, ?, ?)", [3, "_sys_designbox_3", "designbox_3.html", 4])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?, ?, ?)", [4, "_sys_designbox_4", "designbox_4.html", 6])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?, ?, ?)", [10, "_sys_designbox_10", "designbox_10.html", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?, ?, ?)", [11, "_sys_designbox_11", "designbox_11.html", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?, ?, ?)", [13, "_sys_designbox_13", "designbox_13.html", 5])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_design_boxes (id, title, template, order) VALUES (?, ?, ?, ?)", [14, "_sys_designbox_14", "designbox_14.html", 7])
      Logger.info("Registros inseridos com sucesso na tabela sys_pages_design_boxes!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_pages_design_boxes: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_pages_design_boxes...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_pages_design_boxes")
    Logger.info("Tabela sys_pages_design_boxes limpa com sucesso.", module: __MODULE__)
  end
end
