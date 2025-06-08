defmodule DeeperHub.Core.Data.Migrations.CreateSysFormDisplayInputsTable do
  @moduledoc """
  Migração para criar a tabela sys_form_display_inputs no banco de dados.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_form_display_inputs...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_form_display_inputs (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      display_name TEXT NOT NULL,
      input_name TEXT NOT NULL,
      "order" INTEGER
    );

    CREATE UNIQUE INDEX IF NOT EXISTS idx_sys_form_display_inputs_display_input ON sys_form_display_inputs(display_name, input_name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_form_display_inputs criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_form_display_inputs: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_form_display_inputs...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_form_display_inputs;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_form_display_inputs removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_form_display_inputs: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
