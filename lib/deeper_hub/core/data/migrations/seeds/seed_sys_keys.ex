defmodule DeeperHub.Core.Data.Migrations.Seeds.SysKeysSeed do
  @moduledoc """
  Seed para a tabela sys_keys.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_keys_seed"
  @seeds_dir "priv/seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_keys já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_keys...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["ee2634e0a58569840c68f8431afe989e", "", 1749465885, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["5c31503eb5398d9a77363427fd573a01", "", 1749465901, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["220d863ec83d857240d99b7f3cf69546", "", 1749465931, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["4b14f32b93ca0fac8030e5214edd995c", "", 1749465909, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["b1b93afa454d0732368a6a3e44e12126", "", 1749465942, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["407eb3dea88237e56c89a0a4336c0f46", "", 1749465945, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["497eacfe00d012bc7f8d0bdea3766e93", "", 1749465945, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["574c00225802a81f9b81afd33c78500a", "", 1749465947, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["72cc24c176b0122c50333b41787a6484", "", 1749465994, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["b9331e3865a4d5a0e03dd3af157bfa0b", "", 1749465955, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["95b03df2090fea2c7fbb5f308c30e96e", "", 1749467006, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["dc25e40aa860f0a4ff13777dd448be4d", "", 1749467006, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["6026d191364c454f2fa5b0cf8a09db3d", "", 1749515524, "vXebv?W86yVk+vbdqHBHQWxUrAGtE=s&"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["d1329a15e8d963d3c77022beadde2147", "", 1749515524, "vXebv?W86yVk+vbdqHBHQWxUrAGtE=s&"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["56bb04d59fe53c0b2cdbe9c59bd217a6", "", 1749515787, "vXebv?W86yVk+vbdqHBHQWxUrAGtE=s&"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["e39fc0b0ddff1a704bb58888b3b5b91f", "", 1749515933, "vXebv?W86yVk+vbdqHBHQWxUrAGtE=s&"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys ('key', data, expire, salt) VALUES (?, ?, ?, ?)", ["ad92f115a76489d0f909dbf9f87428d6", "", 1749515945, "vXebv?W86yVk+vbdqHBHQWxUrAGtE=s&"])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_keys executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_keys: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_keys...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_keys será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_keys...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_keys")
    Logger.info("Tabela sys_keys limpa com sucesso.", module: __MODULE__)
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
