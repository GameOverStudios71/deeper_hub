defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAlertsCacheTriggersSeed do
  @moduledoc """
  Seed para a tabela sys_alerts_cache_triggers.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_alerts_cache_triggers...")

    Repo.execute("INSERT INTO sys_alerts_cache_triggers (id, unit, action, cache_key) VALUES (?)", [1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
