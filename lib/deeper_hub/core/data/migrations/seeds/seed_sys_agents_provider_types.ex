defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAgentsProviderTypesSeed do
  @moduledoc """
  Seed para a tabela sys_agents_provider_types.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_agents_provider_types...")

    Repo.execute("INSERT INTO sys_agents_provider_types (id, name, title, option_prefix, active, order, class_name, class_file) VALUES (?, ?, ?)", [1, 1, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
