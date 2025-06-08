defmodule DeeperHub.Core.Data.Migrations.Seeds.SysSeoLinksSeed do
  @moduledoc """
  Seed para a tabela sys_seo_links.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_seo_links...")

    Repo.execute("INSERT INTO sys_seo_links (id, module, page_uri, param_name, param_value, uri, added) VALUES (?, ?)", [1, 1749379473])

    IO.puts("Registros inseridos com sucesso!")
  end
end
