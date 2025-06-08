defmodule DeeperHub.Core.Data.Migrations.CreateSysFormDisplaysTable do
  @moduledoc """
  Migração para criar a tabela sys_form_displays no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de exibições de formulários
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_form_displays.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_form_displays...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_form_displays (
      id INTEGER PRIMARY KEY,
      display_name TEXT NOT NULL DEFAULT '',
      module_name TEXT NOT NULL DEFAULT '',
      form_id INTEGER NOT NULL DEFAULT 0,
      display_order INTEGER NOT NULL DEFAULT 0
    );

    CREATE INDEX IF NOT EXISTS idx_sys_form_displays_display_name ON sys_form_displays(display_name);
    CREATE INDEX IF NOT EXISTS idx_sys_form_displays_module_name ON sys_form_displays(module_name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_form_displays criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_form_displays: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_form_displays.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_form_displays...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_form_displays;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_form_displays removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_form_displays: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
