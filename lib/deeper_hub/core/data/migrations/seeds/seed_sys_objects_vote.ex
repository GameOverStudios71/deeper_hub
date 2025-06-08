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

    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?)", [1, 604800, 1, 1, 31536000, 0, 1])
    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?)", [2, 604800, 1, 1, 31536000, 1, 1])
    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?)", [3, 604800, 1, 1, 31536000, 0, 1])
    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?)", [4, 604800, 1, 1, 31536000, 1, 1])
    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?)", [5, 604800, 1, 1, 31536000, 0, 1])
    Repo.execute("INSERT INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?)", [6, 604800, 1, 1, 31536000, 1, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
