defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsCmtsSeed do
  @moduledoc """
  Seed para a tabela sys_objects_cmts.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_cmts_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_objects_cmts já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_cmts...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_cmts (ID, Name, Module, 'Table', CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_agents_automators", "system", "sys_agents_automators_messages", 1, 5000, 1000, 0, 9999, 3, "tail", 1, "bottom", 1, 1, 1, -3, 1, "cmt", "agents.php?page=automators&id={object_id}", "", "", "", "", "sys_agents_automators", "id", "", "", "messages", "BxDolStudioAgentsAutomatorsCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_cmts (ID, Name, Module, 'Table', CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_agents_assistants_chats", "system", "sys_agents_assistants_chats_messages", 1, 5000, 1000, 0, 9999, 3, "tail", 1, "bottom", 1, 1, 1, -3, 1, "cmt", "agents.php?page=assistants&aid={assistant_id}", "", "", "", "", "sys_agents_assistants_chats", "id", "", "", "messages", "BxDolStudioAgentsAsstChatsCmts", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_cmts (ID, Name, Module, 'Table', CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "bx_persons", "bx_persons", "bx_persons_cmts", 1, 5000, 1000, 3, 5, 3, "tail", 1, "bottom", 1, 1, 1, -3, 1, "cmt", "page.php?i=view-persons-profile&id={object_id}", "", "", "", "", "bx_persons_data", "id", "author", "fullname", "comments", "BxPersonsCmts", "modules/boonex/persons/classes/BxPersonsCmts.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_cmts (ID, Name, Module, 'Table', CharsPostMin, CharsPostMax, CharsDisplayMax, Html, PerView, PerViewReplies, BrowseType, IsBrowseSwitch, PostFormPosition, NumberOfLevels, IsDisplaySwitch, IsRatable, ViewingThreshold, IsOn, RootStylePrefix, BaseUrl, ObjectVote, ObjectReaction, ObjectScore, ObjectReport, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldTitle, TriggerFieldComments, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "bx_persons_notes", "bx_persons", "bx_persons_cmts_notes", 1, 5000, 1000, 0, 5, 3, "tail", 1, "bottom", 1, 1, 1, -3, 1, "cmt", "page.php?i=view-post&id={object_id}", "", "", "", "", "bx_persons_data", "id", "author", "fullname", "", "BxTemplCmtsNotes", ""])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_objects_cmts executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_objects_cmts: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_cmts...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_cmts...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_cmts")
    Logger.info("Tabela sys_objects_cmts limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
