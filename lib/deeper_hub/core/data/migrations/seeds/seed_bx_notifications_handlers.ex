defmodule DeeperHub.Core.Data.Migrations.Seeds.BxNotificationsHandlersSeed do
  @moduledoc """
  Seed para a tabela bx_notifications_handlers.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "bx_notifications_handlers_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para bx_notifications_handlers já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela bx_notifications_handlers...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "profile", "delete", "profile", "delete", "", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, "mention", "insert", "meta_mention", "added", "a:3:{s:11:\"module_name\";s:6:\"system\";s:13:\"module_method\";s:30:\"get_notifications_post_mention\";s:12:\"module_class\";s:20:\"TemplServiceMetatags\";}", "", 1])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [3, "friendship", "insert", "sys_profiles_friends", "connection_added", "a:3:{s:11:\"module_name\";s:6:\"system\";s:13:\"module_method\";s:33:\"get_notifications_post_friendship\";s:12:\"module_class\";s:23:\"TemplServiceConnections\";}", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [4, "friendship", "delete", "sys_profiles_friends", "connection_removed", "", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [5, "subscription", "insert", "sys_profiles_subscriptions", "connection_added", "a:3:{s:11:\"module_name\";s:6:\"system\";s:13:\"module_method\";s:22:\"get_notifications_post\";s:12:\"module_class\";s:23:\"TemplServiceConnections\";}", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [6, "subscription", "delete", "sys_profiles_subscriptions", "connection_removed", "", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [7, "comment", "insert", "comment", "added", "a:3:{s:11:\"module_name\";s:6:\"system\";s:13:\"module_method\";s:31:\"get_notifications_comment_added\";s:12:\"module_class\";s:17:\"TemplCmtsServices\";}", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [8, "comment", "delete", "comment", "deleted", "", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [9, "sys_cmts_vote", "insert", "sys_cmts", "doVote", "a:3:{s:11:\"module_name\";s:6:\"system\";s:13:\"module_method\";s:22:\"get_notifications_vote\";s:12:\"module_class\";s:17:\"TemplCmtsServices\";}", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [10, "sys_cmts_vote", "delete", "sys_cmts", "undoVote", "", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [11, "sys_cmts_reaction", "insert", "sys_cmts_reactions", "doVote", "a:3:{s:11:\"module_name\";s:6:\"system\";s:13:\"module_method\";s:26:\"get_notifications_reaction\";s:12:\"module_class\";s:17:\"TemplCmtsServices\";}", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [12, "sys_cmts_reaction", "delete", "sys_cmts_reactions", "undoVote", "", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [13, "sys_cmts_score_up", "insert", "sys_cmts", "doVoteUp", "a:3:{s:11:\"module_name\";s:6:\"system\";s:13:\"module_method\";s:26:\"get_notifications_score_up\";s:12:\"module_class\";s:17:\"TemplCmtsServices\";}", "", 0])
    Repo.execute("INSERT OR REPLACE INTO bx_notifications_handlers (id, 'group', 'type', alert_unit, alert_action, content, privacy, priority) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [14, "sys_cmts_score_down", "insert", "sys_cmts", "doVoteDown", "a:3:{s:11:\"module_name\";s:6:\"system\";s:13:\"module_method\";s:28:\"get_notifications_score_down\";s:12:\"module_class\";s:17:\"TemplCmtsServices\";}", "", 0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para bx_notifications_handlers executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para bx_notifications_handlers: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para bx_notifications_handlers...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed bx_notifications_handlers será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela bx_notifications_handlers...", module: __MODULE__)
    Repo.execute("DELETE FROM bx_notifications_handlers")
    Logger.info("Tabela bx_notifications_handlers limpa com sucesso.", module: __MODULE__)
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
