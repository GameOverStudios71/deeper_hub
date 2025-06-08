defmodule DeeperHub.Core.Data.Seeds.SeedSysPagesContentPlaceholders do
  @doc """
  Executa o seed para a tabela sys_pages_content_placeholders.
  """
  def run do
    # Inserir dados para sys_pages_content_placeholders
    [
      %{ id: 1, module: "system", title: "_sys_page_content_ph_loading_indicator", template: "block_async_loading_indicator.html", order: 1 },
      %{ id: 2, module: "system", title: "_sys_page_content_ph_text", template: "block_async_text.html", order: 2 },
      %{ id: 3, module: "system", title: "_sys_page_content_ph_image", template: "block_async_image.html", order: 3 },
      %{ id: 4, module: "system", title: "_sys_page_content_ph_create_post", template: "block_async_create_post.html", order: 4 },
      %{ id: 100, module: "system", title: "_sys_page_content_ph_profile_units", template: "block_async_profile_units.html", order: 100 },
      %{ id: 110, module: "system", title: "_sys_page_content_ph_text_units_list", template: "block_async_text_units_list.html", order: 110 },
      %{ id: 120, module: "system", title: "_sys_page_content_ph_text_units_gallery", template: "block_async_text_units_gallery.html", order: 120 }
    ]
  end
end