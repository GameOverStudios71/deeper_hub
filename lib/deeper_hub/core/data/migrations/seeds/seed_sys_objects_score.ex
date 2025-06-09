defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsScoreSeed do
  @moduledoc """
  Seed para a tabela sys_objects_score.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_score_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_score já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_score...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_objects_score (id, name, module, table_main, table_track, post_timeout, pruning, is_undo, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_score, trigger_field_cup, trigger_field_cdown, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_cmts", "system", "sys_cmts_scores", "sys_cmts_scores_track", 604800, 31536000, 0, 0, "sys_cmts_ids", "id", "author_id", "score", "sc_up", "sc_down", "BxTemplCmtsScore", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_score (id, name, module, table_main, table_track, post_timeout, pruning, is_undo, is_on, trigger_table, trigger_field_id, trigger_field_author, trigger_field_score, trigger_field_cup, trigger_field_cdown, class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons", "bx_persons_scores", "bx_persons_scores_track", 604800, 31536000, 0, 1, "bx_persons_data", "id", "author", "score", "sc_up", "sc_down", "", ""])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_score executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_score: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_score...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_score será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_score...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_score")
    Logger.info("Tabela sys_objects_score limpa com sucesso.", module: __MODULE__)
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
