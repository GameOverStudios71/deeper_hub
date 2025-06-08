defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPagesContentPlaceholdersSeed do
  @moduledoc """
  Seed para a tabela sys_pages_content_placeholders.
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
    Logger.info("Inserindo registros na tabela sys_pages_content_placeholders...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_pages_content_placeholders (id, module, title, template, 'order') VALUES (?, ?, ?, ?, ?)", [1, "system", "_sys_page_content_ph_loading_indicator", "block_async_loading_indicator.html", 1])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_content_placeholders (id, module, title, template, 'order') VALUES (?, ?, ?, ?, ?)", [2, "system", "_sys_page_content_ph_text", "block_async_text.html", 2])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_content_placeholders (id, module, title, template, 'order') VALUES (?, ?, ?, ?, ?)", [3, "system", "_sys_page_content_ph_image", "block_async_image.html", 3])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_content_placeholders (id, module, title, template, 'order') VALUES (?, ?, ?, ?, ?)", [4, "system", "_sys_page_content_ph_create_post", "block_async_create_post.html", 4])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_content_placeholders (id, module, title, template, 'order') VALUES (?, ?, ?, ?, ?)", [100, "system", "_sys_page_content_ph_profile_units", "block_async_profile_units.html", 100])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_content_placeholders (id, module, title, template, 'order') VALUES (?, ?, ?, ?, ?)", [110, "system", "_sys_page_content_ph_text_units_list", "block_async_text_units_list.html", 110])
    Repo.execute("INSERT OR REPLACE INTO sys_pages_content_placeholders (id, module, title, template, 'order') VALUES (?, ?, ?, ?, ?)", [120, "system", "_sys_page_content_ph_text_units_gallery", "block_async_text_units_gallery.html", 120])
      Logger.info("Registros inseridos com sucesso na tabela sys_pages_content_placeholders!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_pages_content_placeholders: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_pages_content_placeholders...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_pages_content_placeholders")
    Logger.info("Tabela sys_pages_content_placeholders limpa com sucesso.", module: __MODULE__)
  end
end
