defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFavoriteSeed do
  @moduledoc """
  Seed para a tabela sys_objects_favorite.
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
    Logger.info("Inserindo registros na tabela sys_objects_favorite...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_favorite (id, name, table_track, table_lists, pruning, is_on, is_undo, is_public, base_url, trigger_table, trigger_field_id, trigger_field_author, trigger_field_count, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons_favorites_track", "", 31536000, 1, 1, 0, "page.php?i=view-persons-profile&id={object_id}", "bx_persons_data", "id", "author", "favorites", "BxPersonsFavorite", "modules/boonex/persons/classes/BxPersonsFavorite.php"])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_favorite!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_favorite: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_favorite...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_favorite")
    Logger.info("Tabela sys_objects_favorite limpa com sucesso.", module: __MODULE__)
  end
end
