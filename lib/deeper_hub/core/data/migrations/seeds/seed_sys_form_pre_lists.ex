defmodule DeeperHub.Core.Data.Migrations.Seeds.SysFormPreListsSeed do
  @moduledoc """
  Seed para a tabela sys_form_pre_lists.
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
    Logger.info("Inserindo registros na tabela sys_form_pre_lists...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [1, "system", "Country", "_adm_form_txt_pre_lists_country", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [2, "system", "Sex", "_adm_form_txt_pre_lists_sex", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [3, "system", "Language", "_adm_form_txt_pre_lists_language", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [4, "system", "Currency", "_adm_form_txt_pre_lists_currency", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [5, "system", "sys_report_types", "_sys_pre_lists_report_types", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [6, "system", "sys_vote_reactions", "_sys_pre_lists_vote_reactions", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [7, "system", "sys_relations", "_sys_pre_lists_relations", 0, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [8, "system", "sys_content_filter", "_sys_pre_lists_content_filter", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [9, "system", "sys_studio_widget_types", "_sys_pre_lists_studio_widget_types", 0, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_form_pre_lists (id, module, key, title, use_for_sets, extendable) VALUES (?, ?, ?, ?, ?, ?)", [10, "system", "sys_colors", "_sys_pre_lists_colors", 0, 0])
      Logger.info("Registros inseridos com sucesso na tabela sys_form_pre_lists!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_form_pre_lists: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_form_pre_lists...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_form_pre_lists")
    Logger.info("Tabela sys_form_pre_lists limpa com sucesso.", module: __MODULE__)
  end
end
