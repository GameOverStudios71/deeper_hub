defmodule DeeperHub.Core.Data.Migrations.Seeds.SysRewriteRulesSeed do
  @moduledoc """
  Seed para a tabela sys_rewrite_rules.
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
    Logger.info("Inserindo registros na tabela sys_rewrite_rules...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_rewrite_rules (id, preg, service, active) VALUES (?, ?, ?, ?)", [1, "^sys-action/(.*)$", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:11:\"wiki_action\";s:6:\"params\";a:2:{i:0;s:3:\"sys\";i:1;s:3:\"{1}\";}s:5:\"class\";s:16:\"TemplServiceWiki\";}", 1])
      Logger.info("Registros inseridos com sucesso na tabela sys_rewrite_rules!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_rewrite_rules: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_rewrite_rules...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_rewrite_rules")
    Logger.info("Tabela sys_rewrite_rules limpa com sucesso.", module: __MODULE__)
  end
end
