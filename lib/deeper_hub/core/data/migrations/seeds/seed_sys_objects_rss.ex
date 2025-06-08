defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsRssSeed do
  @moduledoc """
  Seed para a tabela sys_objects_rss.
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
    Logger.info("Inserindo registros na tabela sys_objects_rss...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_rss (id, object, class_name, class_file) VALUES (?, ?, ?, ?)", [1, "sys_boonex", "BxDolRssBoonEx", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_rss (id, object, class_name, class_file) VALUES (?, ?, ?, ?)", [2, "sys_page_block", "BxDolRssPageBlock", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_rss (id, object, class_name, class_file) VALUES (?, ?, ?, ?)", [3, "sys_studio_page_help", "BxDolStudioRssPageHelp", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_rss (id, object, class_name, class_file) VALUES (?, ?, ?, ?)", [4, "sys_studio_module_help", "BxDolStudioRssModuleHelp", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_rss!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_rss: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_rss...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_rss")
    Logger.info("Tabela sys_objects_rss limpa com sucesso.", module: __MODULE__)
  end
end
