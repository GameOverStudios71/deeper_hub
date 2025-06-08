defmodule DeeperHub.Core.Data.Migrations.Seeds.SysKeysSeed do
  @moduledoc """
  Seed para a tabela sys_keys.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Insere os registros na tabela.
  Usa INSERT OR REPLACE para evitar erros de UNIQUE CONSTRAINT.
  """
  def run do
    Logger.info("Inserindo registros na tabela sys_keys...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["ee2634e0a58569840c68f8431afe989e", "", 1749465885, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["5c31503eb5398d9a77363427fd573a01", "", 1749465901, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["220d863ec83d857240d99b7f3cf69546", "", 1749465931, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["4b14f32b93ca0fac8030e5214edd995c", "", 1749465909, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["b1b93afa454d0732368a6a3e44e12126", "", 1749465942, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["407eb3dea88237e56c89a0a4336c0f46", "", 1749465945, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["497eacfe00d012bc7f8d0bdea3766e93", "", 1749465945, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["574c00225802a81f9b81afd33c78500a", "", 1749465947, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["72cc24c176b0122c50333b41787a6484", "", 1749465994, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["b9331e3865a4d5a0e03dd3af157bfa0b", "", 1749465955, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["95b03df2090fea2c7fbb5f308c30e96e", "", 1749467006, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
    Repo.execute("INSERT OR REPLACE INTO sys_keys (key, data, expire, salt) VALUES (?, ?, ?, ?)", ["dc25e40aa860f0a4ff13777dd448be4d", "", 1749467006, "Zj?G+?qi5qGbWynUYNge9TN+pjWs?eyz"])
      Logger.info("Registros inseridos com sucesso na tabela sys_keys!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_keys: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_keys...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_keys")
    Logger.info("Tabela sys_keys limpa com sucesso.", module: __MODULE__)
  end
end
