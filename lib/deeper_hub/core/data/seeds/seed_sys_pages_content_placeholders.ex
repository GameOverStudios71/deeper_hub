defmodule DeeperHub.Core.Data.Seeds.SeedSysPagesContentPlaceholders do
  @doc """
  Executa o seed para a tabela sys_pages_content_placeholders.
  """
  def run do
    require DeeperHub.Core.Logger
    data = [
      [1, "system", "_sys_page_content_ph_loading_indicator", "block_async_loading_indicator.html", 1],
      [2, "system", "_sys_page_content_ph_text", "block_async_text.html", 2],
      [3, "system", "_sys_page_content_ph_image", "block_async_image.html", 3],
      [4, "system", "_sys_page_content_ph_create_post", "block_async_create_post.html", 4],
      [100, "system", "_sys_page_content_ph_profile_units", "block_async_profile_units.html", 100],
      [110, "system", "_sys_page_content_ph_text_units_list", "block_async_text_units_list.html", 110],
      [120, "system", "_sys_page_content_ph_text_units_gallery", "block_async_text_units_gallery.html", 120]
    ]
    
    table_name = "sys_pages_content_placeholders"
    columns = ["id", "module", "title", "template", "order"]
    placeholders = Enum.map(1..length(columns), fn _i -> "?" end) |> Enum.join(", ")
    sql = "INSERT INTO #{table_name} (#{Enum.join(columns, ", ")}) VALUES (#{placeholders})"
    
    Enum.each(data, fn record ->
      case DeeperHub.Core.Data.Repo.execute(sql, record) do
        { :ok, result } ->
          DeeperHub.Core.Logger.info("Registro inserido com sucesso na tabela #{table_name}: #{inspect(result)}")
        { :error, reason } ->
          DeeperHub.Core.Logger.warning("Erro ao inserir registro na tabela #{table_name}: #{inspect(reason)}", [])
      end
    end)
    
    data
  end
end