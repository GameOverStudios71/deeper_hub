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
  @seeds_dir "priv/seeds_executed"

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
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [35, "bx_events_reactions", "bx_events", "bx_events_reactions", "bx_events_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_events_data", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [39, "bx_reviews_poll_answers", "bx_reviews", "bx_reviews_polls_answers_votes", "bx_reviews_polls_answers_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_reviews_polls_answers", "id", "author_id", "rate", "votes", "BxReviewsVotePollAnswers", "modules/boonex/reviews/classes/BxReviewsVotePollAnswers.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [33, "bx_groups_reactions", "bx_groups", "bx_groups_reactions", "bx_groups_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_groups_data", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [34, "bx_events", "bx_events", "bx_events_votes", "bx_events_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_events_data", "id", "author", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [32, "bx_groups", "bx_groups", "bx_groups_votes", "bx_groups_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_groups_data", "id", "author", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [61, "bx_classes_poll_answers", "bx_classes", "bx_classes_polls_answers_votes", "bx_classes_polls_answers_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_classes_polls_answers", "id", "author_id", "rate", "votes", "BxClssVotePollAnswers", "modules/boonex/classes/classes/BxClssVotePollAnswers.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [36, "bx_reviews", "bx_reviews", "bx_reviews_votes", "bx_reviews_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_reviews_reviews", "id", "author", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [38, "bx_reviews_reactions", "bx_reviews", "bx_reviews_reactions", "bx_reviews_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_reviews_reviews", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [37, "bx_reviews_stars", "bx_reviews", "bx_reviews_svotes", "bx_reviews_svotes_track", 604800, 1, 5, 31536000, 0, 1, "bx_reviews_reviews", "id", "author", "srate", "svotes", "BxReviewsVoteStars", "modules/boonex/reviews/classes/BxReviewsVoteStars.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [59, "bx_classes", "bx_classes", "bx_classes_votes", "bx_classes_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_classes_classes", "id", "author", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [60, "bx_classes_reactions", "bx_classes", "bx_classes_reactions", "bx_classes_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_classes_classes", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [27, "bx_forum", "bx_forum", "bx_forum_votes", "bx_forum_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_forum_discussions", "id", "author", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [28, "bx_forum_reactions", "bx_forum", "bx_forum_reactions", "bx_forum_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_forum_discussions", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [29, "bx_forum_poll_answers", "bx_forum", "bx_forum_polls_answers_votes", "bx_forum_polls_answers_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_forum_polls_answers", "id", "author_id", "rate", "votes", "BxForumVotePollAnswers", "modules/boonex/forum/classes/BxForumVotePollAnswers.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [30, "bx_glossary", "bx_glossary", "bx_glossary_votes", "bx_glossary_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_glossary_terms", "id", "author", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [31, "bx_glossary_reactions", "bx_glossary", "bx_glossary_reactions", "bx_glossary_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_glossary_terms", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [57, "bx_albums_media", "bx_albums", "bx_albums_votes_media", "bx_albums_votes_media_track", 604800, 1, 1, 31536000, 0, 1, "bx_albums_files2albums", "id", "author", "rate", "votes", "BxAlbumsVoteLikesMedia", "modules/boonex/albums/classes/BxAlbumsVoteLikesMedia.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [56, "bx_albums", "bx_albums", "bx_albums_votes", "bx_albums_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_albums_albums", "id", "author", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [46, "bx_ads", "bx_ads", "bx_ads_votes", "bx_ads_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_ads_entries", "id", "author", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [47, "bx_ads_reactions", "bx_ads", "bx_ads_reactions", "bx_ads_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_ads_entries", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [48, "bx_ads_poll_answers", "bx_ads", "bx_ads_polls_answers_votes", "bx_ads_polls_answers_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_ads_polls_answers", "id", "author_id", "rate", "votes", "BxAdsVotePollAnswers", "modules/boonex/ads/classes/BxAdsVotePollAnswers.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [63, "bx_channels_reactions", "bx_channels", "bx_cnl_reactions", "bx_cnl_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_cnl_data", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [62, "bx_channels", "bx_channels", "bx_cnl_votes", "bx_cnl_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_cnl_data", "id", "author", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [66, "bx_courses", "bx_courses", "bx_courses_votes", "bx_courses_votes_track", 604800, 1, 1, 31536000, 0, 1, "bx_courses_data", "id", "author", "rate", "votes", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [58, "bx_albums_reactions", "bx_albums", "bx_albums_reactions", "bx_albums_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_albums_albums", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_vote (ID, Name, Module, TableMain, TableTrack, PostTimeout, MinValue, MaxValue, Pruning, IsUndo, IsOn, TriggerTable, TriggerFieldId, TriggerFieldAuthor, TriggerFieldRate, TriggerFieldRateCount, ClassName, ClassFile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [67, "bx_courses_reactions", "bx_courses", "bx_courses_reactions", "bx_courses_reactions_track", 604800, 1, 1, 31536000, 1, 1, "bx_courses_data", "id", "author", "rrate", "rvotes", "BxTemplVoteReactions", ""])

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
