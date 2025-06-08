defmodule DeeperHub.Core.Data.Migrations.Seeds.SysSessionsSeed do
  @moduledoc """
  Seed para a tabela sys_sessions.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_sessions...")

    Repo.execute("INSERT INTO sys_sessions (id, user_id, data, date) VALUES (?, ?)", [1, 1749385393])

    IO.puts("Registros inseridos com sucesso!")
  end
end
