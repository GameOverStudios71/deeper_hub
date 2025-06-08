defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsRssSeed do
  @moduledoc """
  Seed para a tabela sys_objects_rss.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_rss...")

    Repo.execute("INSERT INTO sys_objects_rss (id, object, class_name, class_file) VALUES (?, ?, ?, ?)", [1, "sys_boonex", "BxDolRssBoonEx", ""])
    Repo.execute("INSERT INTO sys_objects_rss (id, object, class_name, class_file) VALUES (?, ?, ?, ?)", [2, "sys_page_block", "BxDolRssPageBlock", ""])
    Repo.execute("INSERT INTO sys_objects_rss (id, object, class_name, class_file) VALUES (?, ?, ?, ?)", [3, "sys_studio_page_help", "BxDolStudioRssPageHelp", ""])
    Repo.execute("INSERT INTO sys_objects_rss (id, object, class_name, class_file) VALUES (?, ?, ?, ?)", [4, "sys_studio_module_help", "BxDolStudioRssModuleHelp", ""])

    IO.puts("Registros inseridos com sucesso!")
  end
end
