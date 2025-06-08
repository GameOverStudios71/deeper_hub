defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPagesTypesSeed do
  @moduledoc """
  Seed para a tabela sys_pages_types.
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
    Logger.info("Inserindo registros na tabela sys_pages_types...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_pages_types (id, title, template, order) VALUES (?, ?, ?, ?)", [1, "_sys_page_type_default", "", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_types (id, title, template, order) VALUES (?, ?, ?, ?)", [2, "_sys_page_type_wo_hf", "pt_wo_hf.html", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_types (id, title, template, order) VALUES (?, ?, ?, ?)", [3, "_sys_page_type_standard", "pt_standard.html", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_types (id, title, template, order) VALUES (?, ?, ?, ?)", [4, "_sys_page_type_application", "pt_application.html", 4])
      Logger.info("Registros inseridos com sucesso na tabela sys_pages_types!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_pages_types: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_pages_types...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_pages_types")
    Logger.info("Tabela sys_pages_types limpa com sucesso.", module: __MODULE__)
  end
end
