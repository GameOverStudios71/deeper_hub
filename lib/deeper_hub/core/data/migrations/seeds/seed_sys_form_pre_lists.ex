defmodule DeeperHub.Core.Data.Migrations.Seeds.SysFormPreListsSeed do
  @moduledoc """
  Seed para a tabela sys_form_pre_lists.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_form_pre_lists...")

    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [1, "system", "Country", "_adm_form_txt_pre_lists_country", 0, 1])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [2, "system", "Sex", "_adm_form_txt_pre_lists_sex", 1, 1])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [3, "system", "Language", "_adm_form_txt_pre_lists_language", 0, 1])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [4, "system", "Currency", "_adm_form_txt_pre_lists_currency", 0, 1])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [5, "system", "sys_report_types", "_sys_pre_lists_report_types", 0, 0])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [6, "system", "sys_vote_reactions", "_sys_pre_lists_vote_reactions", 0, 0])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [7, "system", "sys_relations", "_sys_pre_lists_relations", 0, 1])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [8, "system", "sys_content_filter", "_sys_pre_lists_content_filter", 1, 0])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [9, "system", "sys_studio_widget_types", "_sys_pre_lists_studio_widget_types", 0, 0])
    Repo.execute("INSERT INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [10, "system", "sys_colors", "_sys_pre_lists_colors", 0, 0])

    IO.puts("Registros inseridos com sucesso!")
  end
end
