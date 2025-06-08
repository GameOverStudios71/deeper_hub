defmodule DeeperHub.Core.Data.Migrations.CreateSysStdWidgetsBookmarksTable do
  @moduledoc """
  Migração para criar a tabela sys_std_widgets_bookmarks no banco de dados.

  Esta migração cria a estrutura básica para armazenar informações de bookmarks de widgets padrão
  no sistema DeeperHub.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Executa a migração para criar a tabela sys_std_widgets_bookmarks.

  Retorna `:ok` se a migração foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec up() :: :ok | {:error, any()}
  def up do
    Logger.info("Criando tabela sys_std_widgets_bookmarks...", module: __MODULE__)

    sql = """
    CREATE TABLE IF NOT EXISTS sys_std_widgets_bookmarks (
      id INTEGER PRIMARY KEY,
      profile_id INTEGER NOT NULL,
      widget_id INTEGER NOT NULL DEFAULT 0,
      bookmark_order INTEGER NOT NULL DEFAULT 0
    );

    CREATE INDEX IF NOT EXISTS idx_sys_std_widgets_bookmarks_profile_id ON sys_std_widgets_bookmarks(profile_id);
    CREATE INDEX IF NOT EXISTS idx_sys_std_widgets_bookmarks_widget_id ON sys_std_widgets_bookmarks(widget_id);
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_std_widgets_bookmarks criada com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao criar tabela sys_std_widgets_bookmarks: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  @doc """
  Reverte a migração, removendo a tabela sys_std_widgets_bookmarks.

  Retorna `:ok` se a reversão foi aplicada com sucesso,
  ou `{:error, reason}` se ocorreu algum erro.
  """
  @spec down() :: :ok | {:error, any()}
  def down do
    Logger.info("Removendo tabela sys_std_widgets_bookmarks...", module: __MODULE__)

    sql = """
    DROP TABLE IF EXISTS sys_std_widgets_bookmarks;
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela sys_std_widgets_bookmarks removida com sucesso.", module: __MODULE__)
        :ok

      {:error, reason} ->
        Logger.error("Falha ao remover tabela sys_std_widgets_bookmarks: #{inspect(reason)}",
          module: __MODULE__
        )

        {:error, reason}
    end
  end
end
