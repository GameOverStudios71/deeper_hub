defmodule DeeperHub.Core.Data.Migrations.Seeds.SysKeysSeed do
  @moduledoc """
  Seed para a tabela sys_keys.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_keys...")

    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749465885])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749465901])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749465931])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749465909])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749465942])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749465945])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749465945])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749465947])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749465994])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749465955])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749467006])
    Repo.execute("INSERT INTO sys_keys (key, data, expire, salt) VALUES (?)", [1749467006])

    IO.puts("Registros inseridos com sucesso!")
  end
end
