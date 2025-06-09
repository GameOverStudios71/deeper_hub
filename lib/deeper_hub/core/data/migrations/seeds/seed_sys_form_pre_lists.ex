defmodule DeeperHub.Core.Data.Migrations.Seeds.SysFormPreListsSeed do
  @moduledoc """
  Seed para a tabela sys_form_pre_lists.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_form_pre_lists_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_form_pre_lists já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_form_pre_lists...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [1, "system", "Country", "_adm_form_txt_pre_lists_country", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [2, "system", "Sex", "_adm_form_txt_pre_lists_sex", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [3, "system", "Language", "_adm_form_txt_pre_lists_language", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [4, "system", "Currency", "_adm_form_txt_pre_lists_currency", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [5, "system", "sys_report_types", "_sys_pre_lists_report_types", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [6, "system", "sys_vote_reactions", "_sys_pre_lists_vote_reactions", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [7, "system", "sys_relations", "_sys_pre_lists_relations", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [8, "system", "sys_content_filter", "_sys_pre_lists_content_filter", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [9, "system", "sys_studio_widget_types", "_sys_pre_lists_studio_widget_types", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, 'key', title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [10, "system", "sys_colors", "_sys_pre_lists_colors", 0, 0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_form_pre_lists executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_form_pre_lists: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_form_pre_lists...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_form_pre_lists será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_form_pre_lists...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_form_pre_lists")
    Logger.info("Tabela sys_form_pre_lists limpa com sucesso.", module: __MODULE__)
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
