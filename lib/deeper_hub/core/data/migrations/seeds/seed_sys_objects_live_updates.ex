defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLiveUpdatesSeed do
  @moduledoc """
  Seed para a tabela sys_objects_live_updates.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_live_updates_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_live_updates já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_live_updates...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [1, "sys_payments_cart", 0, 1, "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:21:\"get_live_updates_cart\";s:6:\"params\";a:3:{i:0;a:2:{s:11:\"menu_object\";s:18:\"sys_toolbar_member\";s:9:\"menu_item\";s:7:\"account\";}i:1;a:2:{s:11:\"menu_object\";s:25:\"sys_account_notifications\";s:9:\"menu_item\";s:4:\"cart\";}i:2;s:7:\"{count}\";}s:5:\"class\";s:21:\"TemplPaymentsServices\";}", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [2, "sys_payments_orders", 0, 1, "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:23:\"get_live_updates_orders\";s:6:\"params\";a:3:{i:0;a:2:{s:11:\"menu_object\";s:18:\"sys_toolbar_member\";s:9:\"menu_item\";s:7:\"account\";}i:1;a:2:{s:11:\"menu_object\";s:25:\"sys_account_notifications\";s:9:\"menu_item\";s:6:\"orders\";}i:2;s:7:\"{count}\";}s:5:\"class\";s:21:\"TemplPaymentsServices\";}", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [3, "sys_payments_invoices", 0, 1, "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:25:\"get_live_updates_invoices\";s:6:\"params\";a:3:{i:0;a:2:{s:11:\"menu_object\";s:18:\"sys_toolbar_member\";s:9:\"menu_item\";s:7:\"account\";}i:1;a:2:{s:11:\"menu_object\";s:25:\"sys_account_notifications\";s:9:\"menu_item\";s:8:\"invoices\";}i:2;s:7:\"{count}\";}s:5:\"class\";s:21:\"TemplPaymentsServices\";}", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [4, "bx_persons_friend_requests", 0, 1, "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:40:\"get_live_updates_unconfirmed_connections\";s:6:\"params\";a:5:{i:0;s:10:\"bx_persons\";i:1;s:20:\"sys_profiles_friends\";i:2;a:2:{s:11:\"menu_object\";s:18:\"sys_toolbar_member\";s:9:\"menu_item\";s:7:\"account\";}i:3;a:2:{s:11:\"menu_object\";s:25:\"sys_account_notifications\";s:9:\"menu_item\";s:29:\"notifications-friend-requests\";}i:4;s:7:\"{count}\";}s:5:\"class\";s:23:\"TemplServiceConnections\";}", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [5, "bx_persons_friend_requests_new", 0, 1, "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:44:\"get_live_updates_unconfirmed_connections_new\";s:6:\"params\";a:5:{i:0;s:10:\"bx_persons\";i:1;s:20:\"sys_profiles_friends\";i:2;a:0:{}i:3;a:0:{}i:4;s:7:\"{count}\";}s:5:\"class\";s:23:\"TemplServiceConnections\";}", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [6, "bx_convos", 0, 1, "a:3:{s:6:\"module\";s:9:\"bx_convos\";s:6:\"method\";s:16:\"get_live_updates\";s:6:\"params\";a:3:{i:0;a:2:{s:11:\"menu_object\";s:18:\"sys_toolbar_member\";s:9:\"menu_item\";s:7:\"account\";}i:1;a:2:{s:11:\"menu_object\";s:25:\"sys_account_notifications\";s:9:\"menu_item\";s:20:\"notifications-convos\";}i:2;s:7:\"{count}\";}}", 1])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_live_updates executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_live_updates: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_live_updates...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_live_updates será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_live_updates...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_live_updates")
    Logger.info("Tabela sys_objects_live_updates limpa com sucesso.", module: __MODULE__)
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
