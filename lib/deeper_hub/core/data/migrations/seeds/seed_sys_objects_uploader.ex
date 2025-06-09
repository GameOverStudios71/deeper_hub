defmodule DeeperHub.Core.Data.Migrations.Seeds.SysObjectsUploaderSeed do
  @moduledoc """
  Seed para a tabela sys_objects_uploader.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_objects_uploader_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_objects_uploader já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_objects_uploader...", module: __MODULE__)

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

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_objects_uploader executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_objects_uploader: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_objects_uploader...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_objects_uploader será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_objects_uploader...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_objects_uploader")
    Logger.info("Tabela sys_objects_uploader limpa com sucesso.", module: __MODULE__)
  end

  # Funções privadas para controle de execução
  defp seed_already_executed? do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.exists?(seed_file)
  end

  defp mark_seed_executed do
    ensure_seeds_dir()
    seed_file = Path.join(@seeds_dir, @seed_name)
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    File.write(seed_file, "executed_at: #{timestamp}")
  end

  defp ensure_seeds_dir do
    unless File.exists?(@seeds_dir) do
      File.mkdir_p(@seeds_dir)
    end
  end
end
