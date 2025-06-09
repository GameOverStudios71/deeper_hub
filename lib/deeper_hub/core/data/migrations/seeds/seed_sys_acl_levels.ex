defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAclLevelsSeed do
  @moduledoc """
  Seed para a tabela sys_acl_levels.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_acl_levels_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_acl_levels já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_acl_levels...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, 'Order', PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "_adm_prm_txt_level_unauthenticated", "user bx-def-font-color", "", "yes", "no", "no", 0, 0, 0, 1, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, 'Order', PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "_adm_prm_txt_level_account", "user col-green1", "", "yes", "no", "no", 0, 0, 0, 2, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, 'Order', PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "_adm_prm_txt_level_standard", "user col-red1", "", "yes", "no", "no", 0, 0, 0, 3, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, 'Order', PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "_adm_prm_txt_level_unconfirmed", "user bx-def-font-color", "", "yes", "no", "no", 0, 0, 0, 4, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, 'Order', PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "_adm_prm_txt_level_pending", "user bx-def-font-color", "", "yes", "no", "no", 0, 0, 0, 5, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, 'Order', PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "_adm_prm_txt_level_suspended", "user bx-def-font-color", "", "yes", "no", "no", 0, 0, 0, 6, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, 'Order', PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, "_adm_prm_txt_level_moderator", "user-secret col-blue3", "", "yes", "no", "no", 0, 0, 0, 7, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, 'Order', PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, "_adm_prm_txt_level_administrator", "user-secret col-blue3", "", "yes", "no", "no", 0, 0, 0, 8, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, 'Order', PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, "_adm_prm_txt_level_premium", "user col-red3", "", "yes", "yes", "no", 0, 0, 0, 9, 0, 0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_acl_levels executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_acl_levels: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_acl_levels...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_acl_levels será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_acl_levels...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_acl_levels")
    Logger.info("Tabela sys_acl_levels limpa com sucesso.", module: __MODULE__)
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
