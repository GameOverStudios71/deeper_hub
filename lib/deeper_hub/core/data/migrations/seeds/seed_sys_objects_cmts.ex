defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsCmtsSeed do
  @moduledoc """
  Seed para a tabela sys_objects_cmts.
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
    Logger.info("Inserindo registros na tabela sys_objects_cmts...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_cmts (ID, Name, Module, 'Table', CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_agents_automators", "system", "sys_agents_automators_messages", 1, 5000, 1000, 0, 9999, 3, "tail", 1, "bottom", 1, 1, 1, -3, 1, "cmt", "agents.php?page=automators&id={object_id}", "", "", "", "", "sys_agents_automators", "id", "", "", "messages", "BxDolStudioAgentsAutomatorsCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_cmts (ID, Name, Module, 'Table', CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_agents_assistants_chats", "system", "sys_agents_assistants_chats_messages", 1, 5000, 1000, 0, 9999, 3, "tail", 1, "bottom", 1, 1, 1, -3, 1, "cmt", "agents.php?page=assistants&aid={assistant_id}", "", "", "", "", "sys_agents_assistants_chats", "id", "", "", "messages", "BxDolStudioAgentsAsstChatsCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_cmts (ID, Name, Module, 'Table', CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons", "bx_persons", "bx_persons_cmts", 1, 5000, 1000, 3, 5, 3, "tail", 1, "bottom", 1, 1, 1, -3, 1, "cmt", "page.php?i=view-persons-profile&id={object_id}", "", "", "", "", "bx_persons_data", "id", "author", "fullname", "comments", "BxPersonsCmts", "modules/boonex/persons/classes/BxPersonsCmts.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_cmts (ID, Name, Module, 'Table', CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "bx_persons_notes", "bx_persons", "bx_persons_cmts_notes", 1, 5000, 1000, 0, 5, 3, "tail", 1, "bottom", 1, 1, 1, -3, 1, "cmt", "page.php?i=view-post&id={object_id}", "", "", "", "", "bx_persons_data", "id", "author", "fullname", "", "BxTemplCmtsNotes", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_cmts!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_cmts: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_cmts...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_cmts")
    Logger.info("Tabela sys_objects_cmts limpa com sucesso.", module: __MODULE__)
  end
end
