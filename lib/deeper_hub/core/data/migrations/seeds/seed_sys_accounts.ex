defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAccountsSeed do
  @moduledoc """
  Seed para a tabela sys_accounts.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui sistema de controle para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_accounts_seed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed para sys_accounts já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_accounts...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_accounts (id, profile_id, name, picture, email, email_confirmed, phone, phone_confirmed, receive_updates, receive_news, password, password_changed, salt, role, lang_id, added, changed, logged, ip, referred, login_attempts, locked, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, 1, "admin", 0, "crashangel@live.com", 1, "", 0, 1, 1, "bbca86673537ecaa02b635e9029cd031b30c984d", 0, "z,v8RetG", 3, 1, 1749379446, 0, 1749379457, "::1", "", 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_accounts (id, profile_id, name, picture, email, email_confirmed, phone, phone_confirmed, receive_updates, receive_news, password, password_changed, salt, role, lang_id, added, changed, logged, ip, referred, login_attempts, locked, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, 0, "Robot", 0, "", 0, "", 0, 0, 0, "", 0, "", 3, 0, 1749379446, 0, 0, "", "", 0, 0, 0])

        # Marcar como executado com sucesso
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed para sys_accounts executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          Logger.error("Erro ao executar seed para sys_accounts: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o registro de execução.
  """
  def reset do
    Logger.info("Resetando seed para sys_accounts...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_accounts...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_accounts")
    Logger.info("Tabela sys_accounts limpa com sucesso.", module: __MODULE__)
  end

  @doc """
  Retorna o nome do seed para controle.
  """
  def seed_name, do: @seed_name
end
