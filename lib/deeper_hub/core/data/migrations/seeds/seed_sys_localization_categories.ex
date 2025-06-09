defmodule DeeperHub.Core.Data.Migrations.Seeds.SysLocalizationCategoriesSeed do
  @moduledoc """
  Seed para a tabela sys_localization_categories.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_localization_categories_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_localization_categories já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_localization_categories...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [1, "System"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [2, "Custom"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [3, "BoonEx English"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [4, "Boonex Artificer Template"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [5, "Persons"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [6, "Boonex Profiler"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [7, "Accounts"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [8, "Ads"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [9, "Albums"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [10, "Analytics"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [11, "Anonymous Follow"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [12, "Antispam"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [13, "Attendant"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [16, "Charts"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [15, "Channels"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [17, "Classes"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [18, "Contact"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [19, "Conversations"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [20, "Courses"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [21, "Credits"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [22, "Discussions"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [23, "Google Tag Manager"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [24, "Feedback"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [25, "Donations"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [26, "Reminders"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [27, "MassMailer"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [28, "Notifications"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [29, "Glossary"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [30, "Groups"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [31, "Events"])
    Repo.execute("INSERT OR REPLACE INTO sys_localization_categories (ID, Name) VALUES (?, ?)", [32, "Reviews"])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_localization_categories executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_localization_categories: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_localization_categories...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_localization_categories será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_localization_categories...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_localization_categories")
    Logger.info("Tabela sys_localization_categories limpa com sucesso.", module: __MODULE__)
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
