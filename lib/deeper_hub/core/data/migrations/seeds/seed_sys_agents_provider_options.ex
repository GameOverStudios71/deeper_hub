defmodule DeeperHub.Core.Data.Migrations.Seeds.SysAgentsProviderOptionsSeed do
  @moduledoc """
  Seed para a tabela sys_agents_provider_options.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_agents_provider_options...")

    Repo.execute("INSERT INTO sys_agents_provider_options (id, provider_type_id, name, type, title, description, extra, check_type, check_params, check_error, order) VALUES (?, ?, ?)", [1, 1, 1])
    Repo.execute("INSERT INTO sys_agents_provider_options (id, provider_type_id, name, type, title, description, extra, check_type, check_params, check_error, order) VALUES (?, ?, ?)", [2, 1, 2])
    Repo.execute("INSERT INTO sys_agents_provider_options (id, provider_type_id, name, type, title, description, extra, check_type, check_params, check_error, order) VALUES (?, ?, ?)", [3, 1, 3])
    Repo.execute("INSERT INTO sys_agents_provider_options (id, provider_type_id, name, type, title, description, extra, check_type, check_params, check_error, order) VALUES (?, ?, ?)", [4, 1, 4])

    IO.puts("Registros inseridos com sucesso!")
  end
end
