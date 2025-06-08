defmodule DeeperHub.Core.Data.Migrations.Seeds.SysSessionsSeed do
  @moduledoc """
  Seed para a tabela sys_sessions.
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
    Logger.info("Inserindo registros na tabela sys_sessions...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_sessions (id, user_id, data, date) VALUES (?, ?, ?, ?)", ["Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz", 1, "a:2:{s:18:\"sys_studio_history\";a:4:{s:5:\"store\";a:5:{s:4:\"name\";s:5:\"store\";s:4:\"icon\";s:12:\"wi-store.svg\";s:4:\"link\";s:21:\"{url_studio}store.php\";s:7:\"onclick\";s:0:\"\";s:5:\"title\";s:18:\"_adm_wgt_cpt_store\";}s:9:\"dashboard\";a:5:{s:4:\"name\";s:9:\"dashboard\";s:4:\"icon\";s:16:\"wi-dashboard.svg\";s:4:\"link\";s:25:\"{url_studio}dashboard.php\";s:7:\"onclick\";s:0:\"\";s:5:\"title\";s:22:\"_adm_wgt_cpt_dashboard\";}s:11:\"bx_profiler\";a:5:{s:4:\"name\";s:11:\"bx_profiler\";s:4:\"icon\";s:49:\"bx_profiler@modules/boonex/profiler/|std-icon.svg\";s:4:\"link\";s:39:\"{url_studio}module.php?name=bx_profiler\";s:7:\"onclick\";s:0:\"\";s:5:\"title\";s:12:\"_bx_profiler\";}s:8:\"settings\";a:5:{s:4:\"name\";s:8:\"settings\";s:4:\"icon\";s:15:\"wi-settings.svg\";s:4:\"link\";s:24:\"{url_studio}settings.php\";s:7:\"onclick\";s:0:\"\";s:5:\"title\";s:21:\"_adm_wgt_cpt_settings\";}}s:16:\"sys_entrance_url\";s:21:\"http://localhost/una/\";}", 1749385393])
      Logger.info("Registros inseridos com sucesso na tabela sys_sessions!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_sessions: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_sessions...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_sessions")
    Logger.info("Tabela sys_sessions limpa com sucesso.", module: __MODULE__)
  end
end
