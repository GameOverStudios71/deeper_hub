defmodule DeeperHub.Core.Data.Migrations.CreateSysMenuTemplatesTable do
  @moduledoc """
  Migração para criar a tabela sys_menu_templates no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de templates de menu
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_menu_templates.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_menu_templates...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_menu_templates (
      id INTEGER PRIMARY KEY,
      module_name TEXT NOT NULL DEFAULT '',
      template_name TEXT NOT NULL DEFAULT '',
      title TEXT NOT NULL
    );

    CREATE INDEX IF NOT EXISTS idx_sys_menu_templates_module_name ON sys_menu_templates(module_name);
    CREATE INDEX IF NOT EXISTS idx_sys_menu_templates_template_name ON sys_menu_templates(template_name);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_menu_templates criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_menu_templates: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_menu_templates.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_menu_templates...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_menu_templates;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_menu_templates removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_menu_templates: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
