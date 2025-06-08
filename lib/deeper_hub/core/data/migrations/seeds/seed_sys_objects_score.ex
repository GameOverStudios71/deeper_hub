defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsScoreSeed do
  @moduledoc """
  Seed para a tabela sys_objects_score.
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
    Logger.info("Inserindo registros na tabela sys_objects_score...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_score (id, name, module, table_main, table_track, post_timeout, pruning, is_undo, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_score, trigger_field_cup, trigger_field_cdown, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_cmts", "system", "sys_cmts_scores", "sys_cmts_scores_track", 604800, 31536000, 0, 0, "sys_cmts_ids", "id", "author_id", "score", "sc_up", "sc_down", "BxTemplCmtsScore", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_score (id, name, module, table_main, table_track, post_timeout, pruning, is_undo, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_score, trigger_field_cup, trigger_field_cdown, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons", "bx_persons_scores", "bx_persons_scores_track", 604800, 31536000, 0, 1, "bx_persons_data", "id", "author", "score", "sc_up", "sc_down", "", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_score!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_score: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_score...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_score")
    Logger.info("Tabela sys_objects_score limpa com sucesso.", module: __MODULE__)
  end
end
