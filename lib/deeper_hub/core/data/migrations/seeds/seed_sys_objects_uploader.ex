defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsUploaderSeed do
  @moduledoc """
  Seed para a tabela sys_objects_uploader.
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
    Logger.info("Inserindo registros na tabela sys_objects_uploader...", module: __MODULE__)

    try do
      Repo.execute("INSERT OR REPLACE INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [1, "sys_html5", 1, "BxTemplUploaderHTML5", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [2, "sys_video_recording", 1, "BxTemplUploaderVideoRecording", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [3, "sys_crop", 1, "BxTemplUploaderCrop", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [4, "sys_cmts_html5", 1, "BxTemplCmtsUploaderHTML5", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [5, "sys_settings_html5", 1, "BxTemplStudioSettingsUploaderHTML5", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [6, "sys_builder_page_html5", 1, "BxTemplStudioBuilderPageUploaderHTML5", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [7, "sys_std_crop_cover", 1, "BxTemplStudioUploaderCropCover", ""])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [8, "bx_persons_cover_crop", 1, "BxPersonsUploaderCoverCrop", "modules/boonex/persons/classes/BxPersonsUploaderCoverCrop.php"])
    Repo.execute("INSERT OR REPLACE INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [9, "bx_persons_picture_crop", 1, "BxPersonsUploaderPictureCrop", "modules/boonex/persons/classes/BxPersonsUploaderPictureCrop.php"])
      Logger.info("Registros inseridos com sucesso na tabela sys_objects_uploader!", module: __MODULE__)
    rescue
      error ->
        Logger.error("Erro ao inserir registros na tabela sys_objects_uploader: #{inspect(error)}", module: __MODULE__)
        reraise error, __STACKTRACE__
    end
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_uploader...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_uploader")
    Logger.info("Tabela sys_objects_uploader limpa com sucesso.", module: __MODULE__)
  end
end
