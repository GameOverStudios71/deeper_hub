defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPagesTypesSeed do
  @moduledoc """
  Seed para a tabela sys_pages_types.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_pages_types_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_pages_types já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_pages_types...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_pages_types (id, title, template, 'order') VALUES (?, ?, ?, ?)", [1, "_sys_page_type_default", "", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_types (id, title, template, 'order') VALUES (?, ?, ?, ?)", [2, "_sys_page_type_wo_hf", "pt_wo_hf.html", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_types (id, title, template, 'order') VALUES (?, ?, ?, ?)", [3, "_sys_page_type_standard", "pt_standard.html", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_types (id, title, template, 'order') VALUES (?, ?, ?, ?)", [4, "_sys_page_type_application", "pt_application.html", 4])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_pages_types executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_pages_types: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_pages_types...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_pages_types será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_pages_types...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_pages_types")
    Logger.info("Tabela sys_pages_types limpa com sucesso.", module: __MODULE__)
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
