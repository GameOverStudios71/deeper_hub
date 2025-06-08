defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsCmtsSeed do
  @moduledoc """
  Seed para a tabela sys_objects_cmts.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_cmts...")

    Repo.execute("INSERT INTO sys_objects_cmts (ID, Name, Module, Table, CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, 1, 5000, 1000, 0, 9999, 3, 1, 1, 1, 1, -3, 1])
    Repo.execute("INSERT INTO sys_objects_cmts (ID, Name, Module, Table, CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, 1, 5000, 1000, 0, 9999, 3, 1, 1, 1, 1, -3, 1])
    Repo.execute("INSERT INTO sys_objects_cmts (ID, Name, Module, Table, CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, 1, 5000, 1000, 3, 5, 3, 1, 1, 1, 1, -3, 1])
    Repo.execute("INSERT INTO sys_objects_cmts (ID, Name, Module, Table, CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, 1, 5000, 1000, 0, 5, 3, 1, 1, 1, 1, -3, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
