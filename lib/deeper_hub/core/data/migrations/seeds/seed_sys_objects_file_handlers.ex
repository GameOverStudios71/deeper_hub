defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsFileHandlersSeed do
  @moduledoc """
  Seed para a tabela sys_objects_file_handlers.
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
    Logger.info("Inserindo registros na tabela sys_objects_file_handlers...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [1, "sys_ms_viewer", "_sys_file_handlers_ms_viewer", "/\\.(doc|docx|xls|xlsx|ppt|pptx)$/i", 1, 1, "BxTemplFileHandlerMsViewer", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [2, "sys_google_viewer", "_sys_file_handlers_google_viewer", "/\\.(pdf|doc|docx|xls|xlsx|ppt|pptx|ai|svg|ps|tif|tiff)$/i", 1, 2, "BxTemplFileHandlerGoogleViewer", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [3, "sys_images_viewer", "_sys_file_handlers_images_viewer", "/\\.(jpg|jpeg|png|gif|webp)$/i", 1, 3, "BxTemplFileHandlerImagesViewer", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [4, "sys_code_viewer", "_sys_file_handlers_code_viewer", "/\\.(1st|aspx|asp|json|js|jsp|java|php|xml|html|htm|rdf|xsd|xsl|xslt|sax|rss|cfm|js|asm|pl|prl|bas|b|vbs|fs|src|cs|ws|cgi|bat|py|c|cpp|cc|cp|h|hh|cxx|hxx|c++|m|lua|swift|sh|as|cob|tpl|lsp|x|cmd|rb|cbl|pas|pp|vb|f|perl|jl|lol|bal|pli|css|less|sass|saas|bcc|coffee|jade|j|tea|c#|sas|diff|pro|for|sh|bsh|bash|twig|csh|lisp|lsp|cobol|pl|d|git|rb|hrl|cr|inp|a|go|as3|m|sql|md|txt|csv)$/i", 1, 4, "BxTemplFileHandlerCodeViewer", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [5, "sys_sounds_viewer", "_sys_file_handlers_sounds_viewer", "/\\.(mp3|m4a|m4b|wma|wav|3gp)$/i", 1, 5, "BxTemplFileHandlerSoundsViewer", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_file_handlers (id, object, title, preg_ext, active, order, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", [6, "sys_videos_viewer", "_sys_file_handlers_videos_viewer", "/\\.(avi|flv|mpg|mpeg|wmv|mp4|m4v|mov|qt|divx|xvid|3gp|3g2|webm|mkv|ogv|ogg|rm|rmvb|asf|drc|ts)$/i", 1, 5, "BxTemplFileHandlerVideosViewer", ""])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_file_handlers!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_file_handlers: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_file_handlers...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_file_handlers")
    Logger.info("Tabela sys_objects_file_handlers limpa com sucesso.", module: __MODULE__)
  end
end
