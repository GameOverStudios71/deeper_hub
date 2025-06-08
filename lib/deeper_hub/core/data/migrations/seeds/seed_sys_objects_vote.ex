defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsVoteSeed do
  @moduledoc """
  Seed para a tabela sys_objects_vote.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_vote...")

    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_cmts", "system", "sys_cmts_votes", "sys_cmts_votes_track", 604800, 1, 1, 31536000, 0, 1, "sys_cmts_ids", "id", "author_id", "rate", "votes", "BxTemplCmtsVoteLikes", ""])
    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_cmts_reactions", "system", "sys_cmts_reactions", "sys_cmts_reactions_track", 604800, 1, 1, 31536000, 1, 1, "sys_cmts_ids", "id", "author_id", "rrate", "rvotes", "BxTemplCmtsVoteReactions", ""])
    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_form_fields_votes", "system", "sys_form_fields_votes", "sys_form_fields_votes_track", 604800, 1, 1, 31536000, 0, 1, "sys_form_fields_ids", "id", "author_id", "rate", "votes", "", ""])
    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_form_fields_reaction", "system", "sys_form_fields_reaction", "sys_form_fields_reaction_track", 604800, 1, 1, 31536000, 1, 1, "sys_form_fields_ids", "id", "author_id", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "bx_persons", "bx_persons", "bx_persons_votes", "bx_persons_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_persons_data", "id", "", "rate", "votes", "BxPersonsVote", "modules/boonex/persons/classes/BxPersonsVote.php"])
    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "bx_persons_reactions", "bx_persons", "bx_persons_reactions", "bx_persons_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_persons_data", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])

    IO.puts("Registros inseridos com sucesso!")
  end
end
