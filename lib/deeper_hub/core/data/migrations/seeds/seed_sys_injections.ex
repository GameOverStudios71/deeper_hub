defmodule DeeperHub.Core.Data.Migrations.Seeds.SysInjectionsSeed do
  @moduledoc """
  Seed para a tabela sys_injections.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_injections...")

    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "update_cache", 150, "injection_head", "service", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:17:\"get_cache_updater\";s:6:\"params\";a:0:{}s:5:\"class\";s:19:\"TemplStudioLauncher\";}", 0, 1])
    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_head", 0, "injection_head", "text", "", 0, 1])
    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_body_class", 0, "injection_body_class", "service", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:13:\"get_injection\";s:6:\"params\";a:1:{i:0;s:10:\"body_class\";}s:5:\"class\";s:21:\"TemplTemplateServices\";}", 0, 1])
    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_body", 0, "injection_footer", "text", "", 0, 1])
    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [5, "bx_artificer_head", 0, "injection_head", "service", "a:3:{s:6:\"module\";s:12:\"bx_artificer\";s:6:\"method\";s:14:\"include_css_js\";s:6:\"params\";a:1:{i:0;s:4:\"head\";}}", 0, 1])
    Repo.execute("INSERT INTO sys_injections (id, name, page_index, key, type, data, replace, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [6, "bx_artificer_footer", 0, "injection_footer", "service", "a:3:{s:6:\"module\";s:12:\"bx_artificer\";s:6:\"method\";s:14:\"include_css_js\";s:6:\"params\";a:1:{i:0;s:6:\"footer\";}}", 0, 1])

    IO.puts("Registros inseridos com sucesso!")
  end
end
