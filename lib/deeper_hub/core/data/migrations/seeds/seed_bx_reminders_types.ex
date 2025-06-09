defmodule DeeperHub.Core.Data.Migrations.Seeds.BxRemindersTypesSeed do
  @moduledoc """
  Seed para a tabela bx_reminders_types.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "bx_reminders_types_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para bx_reminders_types já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela bx_reminders_types...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO bx_reminders_types (id, author, added, changed, name, title, text, link, 'when', show, notify, personal, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, 0, 1749429406, 1749429406, "birthday", "_bx_reminders_type_title_birthday", "_bx_reminders_type_text_birthday", "", "", 7, "14,7,3", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO bx_reminders_types (id, author, added, changed, name, title, text, link, 'when', show, notify, personal, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, 0, 1749429406, 1749429406, "anniversary", "_bx_reminders_type_title_anniversary", "_bx_reminders_type_text_anniversary", "", "", 7, "14,7,3", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO bx_reminders_types (id, author, added, changed, name, title, text, link, 'when', show, notify, personal, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [3, 0, 1749429406, 1749429406, "new_year", "_bx_reminders_type_title_new_year", "_bx_reminders_type_text_new_year", "", "12-31", 7, "14,7,3", 0, 1, 10])
    Repo.execute("INSERT OR REPLACE INTO bx_reminders_types (id, author, added, changed, name, title, text, link, 'when', show, notify, personal, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [4, 0, 1749429406, 1749429406, "valentine_day", "_bx_reminders_type_title_valentine_day", "_bx_reminders_type_text_valentine_day", "", "02-14", 7, "14,7,3", 0, 1, 11])
    Repo.execute("INSERT OR REPLACE INTO bx_reminders_types (id, author, added, changed, name, title, text, link, 'when', show, notify, personal, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [5, 0, 1749429406, 1749429406, "easter", "_bx_reminders_type_title_easter", "_bx_reminders_type_text_easter", "", "04-21", 7, "14,7,3", 0, 1, 12])
    Repo.execute("INSERT OR REPLACE INTO bx_reminders_types (id, author, added, changed, name, title, text, link, 'when', show, notify, personal, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [6, 0, 1749429406, 1749429406, "halloween", "_bx_reminders_type_title_halloween", "_bx_reminders_type_text_halloween", "", "10-31", 7, "14,7,3", 0, 1, 13])
    Repo.execute("INSERT OR REPLACE INTO bx_reminders_types (id, author, added, changed, name, title, text, link, 'when', show, notify, personal, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [7, 0, 1749429406, 1749429406, "thanksgiving", "_bx_reminders_type_title_thanksgiving", "_bx_reminders_type_text_thanksgiving", "", "11-28", 7, "14,7,3", 0, 1, 14])
    Repo.execute("INSERT OR REPLACE INTO bx_reminders_types (id, author, added, changed, name, title, text, link, 'when', show, notify, personal, active, 'order') VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [8, 0, 1749429406, 1749429406, "christmas", "_bx_reminders_type_title_christmas", "_bx_reminders_type_text_christmas", "", "12-25", 7, "14,7,3", 0, 1, 15])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para bx_reminders_types executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para bx_reminders_types: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para bx_reminders_types...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed bx_reminders_types será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela bx_reminders_types...", module: __MODULE__)
    Repo.execute("DELETE FROM bx_reminders_types")
    Logger.info("Tabela bx_reminders_types limpa com sucesso.", module: __MODULE__)
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
