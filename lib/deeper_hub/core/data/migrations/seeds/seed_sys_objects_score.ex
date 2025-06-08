defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsScoreSeed do
  @moduledoc """
  Seed para a tabela sys_objects_score.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_score...")

    Repo.execute("INSERT INTO sys_objects_score (id, name, module, table_main, table_track, post_timeout, pruning, is_undo, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_score, trigger_field_cup, trigger_field_cdown, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_cmts", "system", "sys_cmts_scores", "sys_cmts_scores_track", 604800, 31536000, 0, 0, "sys_cmts_ids", "id", "author_id", "score", "sc_up", "sc_down", "BxTemplCmtsScore", ""])
    Repo.execute("INSERT INTO sys_objects_score (id, name, module, table_main, table_track, post_timeout, pruning, is_undo, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_score, trigger_field_cup, trigger_field_cdown, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons", "bx_persons_scores", "bx_persons_scores_track", 604800, 31536000, 0, 1, "bx_persons_data", "id", "author", "score", "sc_up", "sc_down", "", ""])

    IO.puts("Registros inseridos com sucesso!")
  end
end
