defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsVoteSeed do
  @moduledoc """
  Seed para a tabela sys_objects_vote.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_vote_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
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

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_vote executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_vote: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_vote...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_vote será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_vote...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_vote")
    Logger.info("Tabela sys_objects_vote limpa com sucesso.", module: __MODULE__)
  end

  # Funções privadas para controle de execução
  defp seed_already_executed? do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.exists?(seed_file)
  end

  defp mark_seed_executed do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    File.write(seed_file, "executed_at: #{timestamp}")
  end

  defp ensure_seeds_dir do
    unless File.exists?(@seeds_dir) do
      File.mkdir_p(@seeds_dir)
    end
  end
end
