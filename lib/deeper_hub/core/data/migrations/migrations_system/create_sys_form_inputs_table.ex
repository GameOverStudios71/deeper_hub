defmodule DeeperHub.Core.Data.Migrations.CreateSysFormInputsTable do
  @moduledoc """
  Migração para criar a tabela sys_form_inputs no banco de dados.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_form_inputs...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_form_inputs (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      object TEXT NOT NULL,
      name TEXT NOT NULL,
      type TEXT,
      caption TEXT
    );

    CREATE UNIQUE INDEX IF NOT EXISTS idx_sys_form_inputs_object_name ON sys_form_inputs(object, name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_form_inputs criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_form_inputs: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_form_inputs...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_form_inputs;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_form_inputs removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_form_inputs: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end
end
