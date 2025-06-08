defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAccountsSeed do
  @moduledoc """
  Seed para a tabela sys_accounts.
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
    Logger.info("Inserindo registros na tabela sys_accounts...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_accounts (id, profile_id, name, picture, email, email_confirmed, phone, phone_confirmed, receive_updates, receive_news, password, password_changed, salt, role, lang_id, added, changed, logged, ip, referred, login_attempts, locked, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, 1, "admin", 0, "crashangel@live.com", 1, "", 0, 1, 1, "bbca86673537ecaa02b635e9029cd031b30c984d", 0, "z,v8RetG", 3, 1, 1749379446, 0, 1749379457, "::1", "", 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_accounts (id, profile_id, name, picture, email, email_confirmed, phone, phone_confirmed, receive_updates, receive_news, password, password_changed, salt, role, lang_id, added, changed, logged, ip, referred, login_attempts, locked, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, 0, "Robot", 0, "", 0, "", 0, 0, 0, "", 0, "", 3, 0, 1749379446, 0, 0, "", "", 0, 0, 0])
      Logger.info("Registros inseridos com sucesso na tabela sys_accounts!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_accounts: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_accounts...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_accounts")
    Logger.info("Tabela sys_accounts limpa com sucesso.", module: __MODULE__)
  end
end
