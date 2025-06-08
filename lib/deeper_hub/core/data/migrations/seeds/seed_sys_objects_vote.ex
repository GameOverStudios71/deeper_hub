defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsVoteSeed do
  @moduledoc """
  Seed para a tabela sys_objects_vote.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_vote_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_objects_vote já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_vote...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_cmts", "system", "sys_cmts_votes", "sys_cmts_votes_track", 604800, 1, 1, 31536000, 0, 1, "sys_cmts_ids", "id", "author_id", "rate", "votes", "BxTemplCmtsVoteLikes", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_cmts_reactions", "system", "sys_cmts_reactions", "sys_cmts_reactions_track", 604800, 1, 1, 31536000, 1, 1, "sys_cmts_ids", "id", "author_id", "rrate", "rvotes", "BxTemplCmtsVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_form_fields_votes", "system", "sys_form_fields_votes", "sys_form_fields_votes_track", 604800, 1, 1, 31536000, 0, 1, "sys_form_fields_ids", "id", "author_id", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_form_fields_reaction", "system", "sys_form_fields_reaction", "sys_form_fields_reaction_track", 604800, 1, 1, 31536000, 1, 1, "sys_form_fields_ids", "id", "author_id", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "bx_persons", "bx_persons", "bx_persons_votes", "bx_persons_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_persons_data", "id", "", "rate", "votes", "BxPersonsVote", "modules/boonex/persons/classes/BxPersonsVote.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "bx_persons_reactions", "bx_persons", "bx_persons_reactions", "bx_persons_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_persons_data", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_objects_vote executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_objects_vote: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_vote...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_vote...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_vote")
    Logger.info("Tabela sys_objects_vote limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
