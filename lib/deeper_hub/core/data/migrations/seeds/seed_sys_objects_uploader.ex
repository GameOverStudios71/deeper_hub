defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsUploaderSeed do
  @moduledoc """
  Seed para a tabela sys_objects_uploader.
  Insere os registros iniciais na tabela.
  """

  alias DeeperHub.Core.Data.Repo

  @doc """
  Insere os registros na tabela.
  """
  def run do
    IO.puts("Inserindo registros na tabela sys_objects_uploader...")

    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [1, "sys_html5", 1, "BxTemplUploaderHTML5", ""])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [2, "sys_video_recording", 1, "BxTemplUploaderVideoRecording", ""])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [3, "sys_crop", 1, "BxTemplUploaderCrop", ""])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [4, "sys_cmts_html5", 1, "BxTemplCmtsUploaderHTML5", ""])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [5, "sys_settings_html5", 1, "BxTemplStudioSettingsUploaderHTML5", ""])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [6, "sys_builder_page_html5", 1, "BxTemplStudioBuilderPageUploaderHTML5", ""])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [7, "sys_std_crop_cover", 1, "BxTemplStudioUploaderCropCover", ""])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [8, "bx_persons_cover_crop", 1, "BxPersonsUploaderCoverCrop", "modules/boonex/persons/classes/BxPersonsUploaderCoverCrop.php"])
    Repo.execute("INSERT INTO sys_objects_uploader (id, object, active, override_class_name, override_class_file) VALUES (?, ?, ?, ?, ?)", [9, "bx_persons_picture_crop", 1, "BxPersonsUploaderPictureCrop", "modules/boonex/persons/classes/BxPersonsUploaderPictureCrop.php"])

    IO.puts("Registros inseridos com sucesso!")
  end
end
