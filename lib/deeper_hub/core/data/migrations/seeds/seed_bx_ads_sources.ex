defmodule DeeperHub.Core.Data.Migrations.Seeds.BxAdsSourcesSeed do
  @moduledoc """
  Seed para a tabela bx_ads_sources.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "bx_ads_sources_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para bx_ads_sources já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela bx_ads_sources...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO bx_ads_sources (id, name, caption, description, option_prefix, active, 'order', class_name, class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", [1, "shopify_admin", "_bx_ads_src_cpt_shopify_admin", "_bx_ads_src_dsc_shopify_admin", "shf_adm_", 1, 1, "BxAdsSourceShopifyAdmin", ""])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para bx_ads_sources executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para bx_ads_sources: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para bx_ads_sources...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed bx_ads_sources será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela bx_ads_sources...", module: __MODULE__)
    Repo.execute("DELETE FROM bx_ads_sources")
    Logger.info("Tabela bx_ads_sources limpa com sucesso.", module: __MODULE__)
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
