defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAclLevelsSeed do
  @moduledoc """
  Seed para a tabela sys_acl_levels.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_acl_levels...")

    Repo.execute("INSERT INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, Order, PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "_adm_prm_txt_level_unauthenticated", "user bx-def-font-color", "", "yes", "no", "no", 0, 0, 0, 1, 0, 0])
    Repo.execute("INSERT INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, Order, PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "_adm_prm_txt_level_account", "user col-green1", "", "yes", "no", "no", 0, 0, 0, 2, 0, 0])
    Repo.execute("INSERT INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, Order, PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "_adm_prm_txt_level_standard", "user col-red1", "", "yes", "no", "no", 0, 0, 0, 3, 0, 0])
    Repo.execute("INSERT INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, Order, PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "_adm_prm_txt_level_unconfirmed", "user bx-def-font-color", "", "yes", "no", "no", 0, 0, 0, 4, 0, 0])
    Repo.execute("INSERT INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, Order, PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "_adm_prm_txt_level_pending", "user bx-def-font-color", "", "yes", "no", "no", 0, 0, 0, 5, 0, 0])
    Repo.execute("INSERT INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, Order, PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, "_adm_prm_txt_level_suspended", "user bx-def-font-color", "", "yes", "no", "no", 0, 0, 0, 6, 0, 0])
    Repo.execute("INSERT INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, Order, PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, "_adm_prm_txt_level_moderator", "user-secret col-blue3", "", "yes", "no", "no", 0, 0, 0, 7, 0, 0])
    Repo.execute("INSERT INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, Order, PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, "_adm_prm_txt_level_administrator", "user-secret col-blue3", "", "yes", "no", "no", 0, 0, 0, 8, 0, 0])
    Repo.execute("INSERT INTO sys_acl_levels (ID, Name, Icon, Description, Active, Purchasable, Removable, QuotaSize, QuotaNumber, QuotaMaxFileSize, Order, PasswordExpired, PasswordExpiredNotify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [9, "_adm_prm_txt_level_premium", "user col-red3", "", "yes", "yes", "no", 0, 0, 0, 9, 0, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
