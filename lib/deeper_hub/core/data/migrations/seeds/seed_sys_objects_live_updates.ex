defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsLiveUpdatesSeed do
  @moduledoc """
  Seed para a tabela sys_objects_live_updates.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_live_updates...")

    Repo.execute("INSERT INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [1, "sys_payments_cart", 0, 1, "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:21:\"get_live_updates_cart\";s:6:\"params\";a:3:{i:0;a:2:{s:11:\"menu_object\";s:18:\"sys_toolbar_member\";s:9:\"menu_item\";s:7:\"account\";}i:1;a:2:{s:11:\"menu_object\";s:25:\"sys_account_notifications\";s:9:\"menu_item\";s:4:\"cart\";}i:2;s:7:\"{count}\";}s:5:\"class\";s:21:\"TemplPaymentsServices\";}", 1])
    Repo.execute("INSERT INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [2, "sys_payments_orders", 0, 1, "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:23:\"get_live_updates_orders\";s:6:\"params\";a:3:{i:0;a:2:{s:11:\"menu_object\";s:18:\"sys_toolbar_member\";s:9:\"menu_item\";s:7:\"account\";}i:1;a:2:{s:11:\"menu_object\";s:25:\"sys_account_notifications\";s:9:\"menu_item\";s:6:\"orders\";}i:2;s:7:\"{count}\";}s:5:\"class\";s:21:\"TemplPaymentsServices\";}", 1])
    Repo.execute("INSERT INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [3, "sys_payments_invoices", 0, 1, "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:25:\"get_live_updates_invoices\";s:6:\"params\";a:3:{i:0;a:2:{s:11:\"menu_object\";s:18:\"sys_toolbar_member\";s:9:\"menu_item\";s:7:\"account\";}i:1;a:2:{s:11:\"menu_object\";s:25:\"sys_account_notifications\";s:9:\"menu_item\";s:8:\"invoices\";}i:2;s:7:\"{count}\";}s:5:\"class\";s:21:\"TemplPaymentsServices\";}", 1])
    Repo.execute("INSERT INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [4, "bx_persons_friend_requests", 0, 1, "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:40:\"get_live_updates_unconfirmed_connections\";s:6:\"params\";a:5:{i:0;s:10:\"bx_persons\";i:1;s:20:\"sys_profiles_friends\";i:2;a:2:{s:11:\"menu_object\";s:18:\"sys_toolbar_member\";s:9:\"menu_item\";s:7:\"account\";}i:3;a:2:{s:11:\"menu_object\";s:25:\"sys_account_notifications\";s:9:\"menu_item\";s:29:\"notifications-friend-requests\";}i:4;s:7:\"{count}\";}s:5:\"class\";s:23:\"TemplServiceConnections\";}", 1])
    Repo.execute("INSERT INTO sys_objects_live_updates (id, name, init, frequency, service_call, active) VALUES (?, ?, ?, ?, ?, ?)", [5, "bx_persons_friend_requests_new", 0, 1, "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:44:\"get_live_updates_unconfirmed_connections_new\";s:6:\"params\";a:5:{i:0;s:10:\"bx_persons\";i:1;s:20:\"sys_profiles_friends\";i:2;a:0:{}i:3;a:0:{}i:4;s:7:\"{count}\";}s:5:\"class\";s:23:\"TemplServiceConnections\";}", 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
