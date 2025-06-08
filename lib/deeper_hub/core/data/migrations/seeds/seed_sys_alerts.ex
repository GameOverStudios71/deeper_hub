defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAlertsSeed do
  @moduledoc """
  Seed para a tabela sys_alerts.
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
    Logger.info("Inserindo registros na tabela sys_alerts...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [1, "system", "save_setting", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [2, "sys_images_custom", "file_deleted", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [3, "system", "save_setting", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [4, "system", "save_setting", 4])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [5, "system", "installed", 5])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [6, "sys_profiles_friends", "connection_added", 6])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [7, "sys_profiles_friends", "connection_removed", 6])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [8, "sys_cmts_images", "file_deleted", 7])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [9, "system", "change_logo", 8])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [10, "system", "change_logo_dark", 8])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [11, "system", "change_mark", 8])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [12, "system", "change_mark_dark", 8])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [13, "system", "get_object", 8])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [14, "system", "get_layout_images", 8])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [15, "system", "save_setting", 8])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [16, "profile", "unit", 8])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [17, "system", "save_setting", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [18, "sys_profiles_friends", "connection_added", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [19, "bx_timeline", "post_common", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [20, "bx_persons_pictures", "file_deleted", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [21, "bx_persons", "timeline_view", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [22, "bx_persons", "timeline_post", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [23, "bx_persons", "timeline_delete", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [24, "bx_persons", "timeline_comment", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [25, "bx_persons", "timeline_vote", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [26, "bx_persons", "timeline_score", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [27, "bx_persons", "timeline_report", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [28, "bx_persons", "timeline_repost", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [29, "bx_persons", "timeline_pin", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [30, "bx_persons", "timeline_promote", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [31, "bx_persons_pictures_resized", "file_deleted", 10])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [32, "bx_persons_pictures", "file_deleted", 11])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [33, "bx_persons_pictures_resized", "file_deleted", 12])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [34, "bx_persons_pictures", "file_deleted", 13])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [35, "bx_persons_pictures_resized", "file_deleted", 14])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [36, "bx_persons_pictures", "file_deleted", 15])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [37, "bx_persons_pictures_resized", "file_deleted", 16])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [38, "bx_persons_pictures", "file_deleted", 17])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [39, "bx_persons_pictures_resized", "file_deleted", 18])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [40, "bx_persons_pictures", "file_deleted", 19])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [41, "bx_persons_pictures_resized", "file_deleted", 20])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [42, "bx_persons_pictures", "file_deleted", 21])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [43, "bx_persons_pictures_resized", "file_deleted", 22])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [44, "bx_persons_pictures", "file_deleted", 23])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [45, "bx_persons_pictures_resized", "file_deleted", 24])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [46, "bx_persons_pictures", "file_deleted", 25])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [47, "sys_images_resized", "file_deleted", 26])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [48, "sys_images", "file_deleted", 27])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [49, "sys_images_resized", "file_deleted", 28])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [50, "sys_images", "file_deleted", 29])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [51, "sys_images_resized", "file_deleted", 30])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [52, "sys_images", "file_deleted", 31])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [53, "sys_images_resized", "file_deleted", 32])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [54, "sys_images", "file_deleted", 33])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [55, "sys_images_resized", "file_deleted", 34])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [56, "sys_images", "file_deleted", 35])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [57, "sys_images_resized", "file_deleted", 36])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [58, "sys_images", "file_deleted", 37])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [59, "sys_images_resized", "file_deleted", 38])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [60, "sys_images", "file_deleted", 39])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [61, "sys_images_resized", "file_deleted", 40])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [62, "sys_images", "file_deleted", 41])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [63, "sys_images_resized", "file_deleted", 42])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [64, "sys_images", "file_deleted", 43])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [65, "sys_images_resized", "file_deleted", 44])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [66, "sys_images", "file_deleted", 45])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [67, "sys_images_resized", "file_deleted", 46])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [68, "sys_images", "file_deleted", 47])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [69, "sys_cmts_images_preview", "file_deleted", 48])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [70, "sys_cmts_images", "file_deleted", 49])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [71, "sys_images_resized", "file_deleted", 50])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [72, "sys_images_custom", "file_deleted", 51])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [73, "sys_images_editor_resized", "file_deleted", 52])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [74, "sys_images_editor", "file_deleted", 53])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [75, "sys_wiki_images_resized", "file_deleted", 54])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [76, "sys_wiki_files", "file_deleted", 55])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [77, "sys_cmts_images_preview", "file_deleted", 56])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [78, "sys_agents_assistants_chats_files", "file_deleted", 57])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [79, "sys_accounts_pictures_resized", "file_deleted", 58])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [80, "sys_accounts_pictures", "file_deleted", 59])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [81, "sys_accounts_pictures_resized", "file_deleted", 60])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [82, "sys_accounts_pictures", "file_deleted", 61])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [83, "sys_accounts_pictures_resized", "file_deleted", 62])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [84, "sys_accounts_pictures", "file_deleted", 63])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [85, "sys_accounts_pictures_resized", "file_deleted", 64])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [86, "sys_accounts_pictures", "file_deleted", 65])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [87, "sys_accounts_pictures_resized", "file_deleted", 66])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [88, "sys_accounts_pictures", "file_deleted", 67])
    Repo.execute("INSERT OR REPLACE INTO sys_alerts (id, unit, 'action', handler_id) VALUES (?, ?, ?, ?)", [89, "system", "begin", 68])
      Logger.info("Registros inseridos com sucesso na tabela sys_alerts!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_alerts: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_alerts...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_alerts")
    Logger.info("Tabela sys_alerts limpa com sucesso.", module: __MODULE__)
  end
end
