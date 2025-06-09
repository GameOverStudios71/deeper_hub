defmodule DeeperHub.Core.Data.Migrations.Seeds.SysContentInfoGridsSeed do
  @moduledoc """
  Seed para a tabela sys_content_info_grids.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_content_info_grids_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_content_info_grids já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_content_info_grids...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [1, "bx_persons", "bx_persons_administration", "td`.`id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [2, "bx_persons", "bx_persons_common", "td`.`id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [24, "bx_groups", "bx_groups_common", "td`.`id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [23, "bx_groups", "bx_groups_administration", "td`.`id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [28, "bx_reviews", "bx_reviews_common", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [27, "bx_reviews", "bx_reviews_administration", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [43, "bx_classes", "bx_classes_common", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [42, "bx_classes", "bx_classes_administration", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [33, "bx_ads", "bx_ads_administration", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [18, "bx_forum", "bx_forum", "id", "", "a:1:{s:4:\"sort\";a:2:{s:5:\"stick\";s:4:\"desc\";s:12:\"lr_timestamp\";s:4:\"desc\";}}"])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [19, "bx_forum", "bx_forum_administration", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [20, "bx_forum", "bx_forum_common", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [21, "bx_glossary", "bx_glossary_administration", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [22, "bx_glossary", "bx_glossary_common", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [25, "bx_events", "bx_events_administration", "td`.`id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [26, "bx_events", "bx_events_common", "td`.`id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [41, "bx_albums", "bx_albums_common", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [34, "bx_ads", "bx_ads_common", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [44, "bx_channels", "bx_channels_administration", "td`.`id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [48, "bx_courses", "bx_courses_common", "td`.`id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [40, "bx_albums", "bx_albums_administration", "id", "", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_content_info_grids (id, object, grid_object, grid_field_id, condition, selection) VALUES (?, ?, ?, ?, ?, ?)", [47, "bx_courses", "bx_courses_administration", "td`.`id", "", ""])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_content_info_grids executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_content_info_grids: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_content_info_grids...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_content_info_grids será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_content_info_grids...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_content_info_grids")
    Logger.info("Tabela sys_content_info_grids limpa com sucesso.", module: __MODULE__)
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
