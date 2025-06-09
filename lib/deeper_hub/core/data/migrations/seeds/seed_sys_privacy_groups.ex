defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPrivacyGroupsSeed do
  @moduledoc """
  Seed para a tabela sys_privacy_groups.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_privacy_groups_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_privacy_groups já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_privacy_groups...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [1, "", "", 1, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [2, "_sys_ps_group_title_me_only", "@me_only", 1, 1, 7])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [3, "_sys_ps_group_title_public", "@public", 1, 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [4, "_sys_ps_group_title_members", "@members", 0, 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [5, "_sys_ps_group_title_friends", "@friends", 1, 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [6, "_sys_ps_group_title_friends_selected", "@friends_selected_by_object", 1, 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [7, "_sys_ps_group_title_relations", "@relations", 1, 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [8, "_sys_ps_group_title_relations_selected", "@relations_selected_by_object", 1, 1, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [9, "_sys_ps_group_title_memberships_selected", "@memberships_selected_by_object", 1, 1, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_privacy_groups (id, title, 'check', active, visible, 'order') VALUES (?, ?, ?, ?, ?, ?)", [99, "_sys_ps_group_title_custom", "@custom_by_object", 0, 0, 0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_privacy_groups executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_privacy_groups: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_privacy_groups...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_privacy_groups será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_privacy_groups...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_privacy_groups")
    Logger.info("Tabela sys_privacy_groups limpa com sucesso.", module: __MODULE__)
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
