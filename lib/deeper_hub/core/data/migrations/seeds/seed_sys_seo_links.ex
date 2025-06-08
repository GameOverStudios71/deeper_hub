defmodule DeeperHub.Core.Data.Migrations.Seeds.SysSeoLinksSeed do
  @moduledoc """
  Seed para a tabela sys_seo_links.
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
    Logger.info("Inserindo registros na tabela sys_seo_links...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_seo_links (id, module, page_uri, param_name, param_value, uri, added) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "persons-profile-friends", "profile_id", "1", "admin", 1749379473])
      Logger.info("Registros inseridos com sucesso na tabela sys_seo_links!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_seo_links: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_seo_links...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_seo_links")
    Logger.info("Tabela sys_seo_links limpa com sucesso.", module: __MODULE__)
  end
end
