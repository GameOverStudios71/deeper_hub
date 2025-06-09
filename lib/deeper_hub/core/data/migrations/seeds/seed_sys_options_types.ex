defmodule DeeperHub.Core.Data.Migrations.Seeds.SysOptionsTypesSeed do
  @moduledoc """
  Seed para a tabela sys_options_types.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_options_types_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_options_types já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_options_types...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [1, "system", "system", "_adm_stg_cpt_type_system", "mi-cog.svg", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [2, "languages", "bx_en", "_bx_eng_stg_cpt_type", "bx_en@modules/boonex/english/|std-icon.svg", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [3, "templates", "bx_artificer", "_bx_artificer_stg_cpt_type", "bx_artificer@modules/boonex/artificer/|std-icon.svg", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [4, "modules", "bx_persons", "_bx_persons", "bx_persons@modules/boonex/persons/|std-icon.svg", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [5, "modules", "bx_profiler", "Profiler", "bx_profiler@modules/boonex/profiler/|std-icon.svg", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [6, "modules", "bx_accounts", "_bx_accounts", "bx_accounts@modules/boonex/accounts/|std-icon.svg", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [7, "modules", "bx_analytics", "_bx_analytics_adm_stg_cpt_type", "bx_analytics@modules/boonex/analytics/|std-icon.svg", 5])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [8, "modules", "bx_anon_follow", "_bx_anon_follow", "bx_anon_follow@modules/boonex/anon_follow/|std-icon.svg", 7])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [9, "modules", "bx_attendant", "_bx_attendant_adm_stg_cpt_type", "bx_attendant@modules/boonex/attendant/|std-icon.svg", 9])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [12, "modules", "bx_charts", "_bx_charts_adm_stg_cpt_type", "bx_charts@modules/boonex/charts/|std-icon.svg", 11])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [13, "modules", "bx_antispam", "_bx_antispam_adm_stg_cpt_type", "bx_antispam@modules/boonex/antispam/|std-icon.svg", 12])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [14, "modules", "bx_contact", "_bx_contact", "bx_contact@modules/boonex/contact/|std-icon.svg", 13])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [15, "modules", "bx_googletagman", "_bx_googletagman_adm_stg_cpt_type", "bx_googletagman@modules/boonex/google_tagmanager/|std-icon.svg", 14])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [16, "modules", "bx_reminders", "_bx_reminders", "bx_reminders@modules/boonex/reminders/|std-icon.svg", 15])
    Repo.execute("INSERT OR REPLACE INTO sys_options_types (id, 'group', name, caption, icon, 'order') VALUES (?, ?, ?, ?, ?, ?)", [17, "modules", "bx_convos", "_bx_cnv", "bx_convos@modules/boonex/convos/|std-icon.svg", 16])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_options_types executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_options_types: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_options_types...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_options_types será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_options_types...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_options_types")
    Logger.info("Tabela sys_options_types limpa com sucesso.", module: __MODULE__)
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
