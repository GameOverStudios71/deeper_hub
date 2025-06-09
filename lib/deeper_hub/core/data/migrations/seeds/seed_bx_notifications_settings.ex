defmodule DeeperHub.Core.Data.Migrations.Seeds.BxNotificationsSettingsSeed do
  @moduledoc """
  Seed para a tabela bx_notifications_settings.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "bx_notifications_settings_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para bx_notifications_settings já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela bx_notifications_settings...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "mention", 2, "site", "personal", "_bx_ntfs_alert_action_mention_added_personal", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "mention", 2, "email", "personal", "_bx_ntfs_alert_action_mention_added_personal", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "mention", 2, "push", "personal", "_bx_ntfs_alert_action_mention_added_personal", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "friendship", 3, "site", "personal", "_bx_ntfs_alert_action_friendship_added_personal", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "friendship", 3, "email", "personal", "_bx_ntfs_alert_action_friendship_added_personal", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "friendship", 3, "push", "personal", "_bx_ntfs_alert_action_friendship_added_personal", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, "subscription", 5, "site", "personal", "_bx_ntfs_alert_action_subscription_added_personal", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, "subscription", 5, "email", "personal", "_bx_ntfs_alert_action_subscription_added_personal", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, "subscription", 5, "push", "personal", "_bx_ntfs_alert_action_subscription_added_personal", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [10, "comment", 7, "site", "personal", "_bx_ntfs_alert_action_comment_added_personal", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [11, "comment", 7, "email", "personal", "_bx_ntfs_alert_action_comment_added_personal", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [12, "comment", 7, "push", "personal", "_bx_ntfs_alert_action_comment_added_personal", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [13, "vote", 9, "site", "personal", "_bx_ntfs_alert_action_doVote_personal", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [14, "vote", 9, "email", "personal", "_bx_ntfs_alert_action_doVote_personal", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [15, "vote", 9, "push", "personal", "_bx_ntfs_alert_action_doVote_personal", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [16, "vote", 9, "site", "follow_member", "_bx_ntfs_alert_action_doVote_follow_member", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [17, "vote", 9, "email", "follow_member", "_bx_ntfs_alert_action_doVote_follow_member", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [18, "vote", 9, "push", "follow_member", "_bx_ntfs_alert_action_doVote_follow_member", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [19, "vote", 9, "site", "follow_context", "_bx_ntfs_alert_action_doVote_follow_context", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [20, "vote", 9, "email", "follow_context", "_bx_ntfs_alert_action_doVote_follow_context", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [21, "vote", 9, "push", "follow_context", "_bx_ntfs_alert_action_doVote_follow_context", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [22, "vote", 11, "site", "personal", "_bx_ntfs_alert_action_doVote_personal", 1, 1, 5])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [23, "vote", 11, "email", "personal", "_bx_ntfs_alert_action_doVote_personal", 1, 1, 5])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [24, "vote", 11, "push", "personal", "_bx_ntfs_alert_action_doVote_personal", 1, 1, 5])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [25, "vote", 11, "site", "follow_member", "_bx_ntfs_alert_action_doVote_follow_member", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [26, "vote", 11, "email", "follow_member", "_bx_ntfs_alert_action_doVote_follow_member", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [27, "vote", 11, "push", "follow_member", "_bx_ntfs_alert_action_doVote_follow_member", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [28, "vote", 11, "site", "follow_context", "_bx_ntfs_alert_action_doVote_follow_context", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [29, "vote", 11, "email", "follow_context", "_bx_ntfs_alert_action_doVote_follow_context", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [30, "vote", 11, "push", "follow_context", "_bx_ntfs_alert_action_doVote_follow_context", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [31, "score_up", 13, "site", "personal", "_bx_ntfs_alert_action_doVoteUp_personal", 1, 1, 6])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [32, "score_up", 13, "email", "personal", "_bx_ntfs_alert_action_doVoteUp_personal", 1, 1, 6])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [33, "score_up", 13, "push", "personal", "_bx_ntfs_alert_action_doVoteUp_personal", 1, 1, 6])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [34, "score_up", 13, "site", "follow_member", "_bx_ntfs_alert_action_doVoteUp_follow_member", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [35, "score_up", 13, "email", "follow_member", "_bx_ntfs_alert_action_doVoteUp_follow_member", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [36, "score_up", 13, "push", "follow_member", "_bx_ntfs_alert_action_doVoteUp_follow_member", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [37, "score_up", 13, "site", "follow_context", "_bx_ntfs_alert_action_doVoteUp_follow_context", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [38, "score_up", 13, "email", "follow_context", "_bx_ntfs_alert_action_doVoteUp_follow_context", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [39, "score_up", 13, "push", "follow_context", "_bx_ntfs_alert_action_doVoteUp_follow_context", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [40, "score_down", 14, "site", "personal", "_bx_ntfs_alert_action_doVoteDown_personal", 1, 1, 7])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [41, "score_down", 14, "email", "personal", "_bx_ntfs_alert_action_doVoteDown_personal", 1, 1, 7])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [42, "score_down", 14, "push", "personal", "_bx_ntfs_alert_action_doVoteDown_personal", 1, 1, 7])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [43, "score_down", 14, "site", "follow_member", "_bx_ntfs_alert_action_doVoteDown_follow_member", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [44, "score_down", 14, "email", "follow_member", "_bx_ntfs_alert_action_doVoteDown_follow_member", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [45, "score_down", 14, "push", "follow_member", "_bx_ntfs_alert_action_doVoteDown_follow_member", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [46, "score_down", 14, "site", "follow_context", "_bx_ntfs_alert_action_doVoteDown_follow_context", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [47, "score_down", 14, "email", "follow_context", "_bx_ntfs_alert_action_doVoteDown_follow_context", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_settings (id, 'group', handler_id, delivery, 'type', title, value, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [48, "score_down", 14, "push", "follow_context", "_bx_ntfs_alert_action_doVoteDown_follow_context", 1, 1, 4])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para bx_notifications_settings executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para bx_notifications_settings: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para bx_notifications_settings...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed bx_notifications_settings será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela bx_notifications_settings...", module: __MODULE__)
    Repo.execute("DELETE FROM bx_notifications_settings")
    Logger.info("Tabela bx_notifications_settings limpa com sucesso.", module: __MODULE__)
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
