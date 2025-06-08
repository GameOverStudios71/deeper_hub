defmodule DeeperHub.Core.Data.Migrations.Seeds.{{MODULE_NAME}}Seed do
  @moduledoc """
  Seed para a tabela {{TABLE_NAME}}.
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
    Logger.info("Inserindo registros na tabela {{TABLE_NAME}}...", module: __MODULE__)

    try do
      {{SEED_INSERTS}}
      Logger.info("Registros inseridos com sucesso na tabela {{TABLE_NAME}}!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela {{TABLE_NAME}}: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela {{TABLE_NAME}}...", module: __MODULE__)
    Repo.execute("DELETE FROM {{TABLE_NAME}}")
    Logger.info("Tabela {{TABLE_NAME}} limpa com sucesso.", module: __MODULE__)
  end
end
