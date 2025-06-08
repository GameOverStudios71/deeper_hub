defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAccountsSeed do
  @moduledoc """
  Seed para a tabela sys_accounts.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_accounts...")

    Repo.execute("INSERT INTO sys_accounts (id, profile_id, name, picture, email, email_confirmed, phone, phone_confirmed, receive_updates, receive_news, password, password_changed, salt, role, lang_id, added, changed, logged, ip, referred, login_attempts, locked, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, 1, 0, 1, 0, 1, 1, 0, 3, 1, 1749379446, 0, 1749379457, 0, 0, 0])
    Repo.execute("INSERT INTO sys_accounts (id, profile_id, name, picture, email, email_confirmed, phone, phone_confirmed, receive_updates, receive_news, password, password_changed, salt, role, lang_id, added, changed, logged, ip, referred, login_attempts, locked, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1749379446, 0, 0, 0, 0, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
