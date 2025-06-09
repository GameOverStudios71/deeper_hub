defmodule DeeperHub.Core.Data.Migrations.Seeds.SysModulesSeed do
  @moduledoc """
  Seed para a tabela sys_modules.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_modules_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_modules já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_modules...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "module", 0, "system", "System", "UNA, Inc", "15.0.0-DEV1", "", "", "system", "Bx", "sys_", "System", "", 1749379445, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "language", 0, "bx_en", "English", "UNA INC", "14.0.10.DEV", "http://feed.una.io/?section={module_name}", "boonex/english/", "en", "BxEng", "bx_eng_", "BoonEx English", "", 1749379454, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, "template", 0, "bx_artificer", "Artificer", "UNA INC", "14.0.10.DEV", "http://feed.una.io/?section={module_name}", "boonex/artificer/", "artificer", "BxArtificer", "bx_artificer_", "Boonex Artificer Template", "", 1749379454, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, "module", 2, "bx_persons", "Persons", "UNA INC", "14.0.7.DEV", "http://feed.una.io/?section={module_name}", "boonex/persons/", "persons", "BxPersons", "bx_persons_", "Persons", "", 1749379456, 1, 0, "", 0])
    Repo.execute("INSERT OR REPLACE INTO sys_modules (id, 'type', subtypes, name, title, vendor, version, help_url, path, uri, class_prefix, db_prefix, lang_category, dependencies, date, enabled, pending_uninstall, hash, updated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, "module", 0, "bx_profiler", "Profiler", "Boonex", "13.0.5.DEV", "http://feed.una.io/?section={module_name}", "boonex/profiler/", "profiler", "BxProfiler", "bx_profiler_", "Boonex Profiler", "", 1749379496, 1, 0, "", 0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_modules executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_modules: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_modules...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_modules será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_modules...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_modules")
    Logger.info("Tabela sys_modules limpa com sucesso.", module: __MODULE__)
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
