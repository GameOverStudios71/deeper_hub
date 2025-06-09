defmodule DeeperHub.Core.Data.Migrations.Seeds.SysPreloaderSeed do
  @moduledoc """
  Seed para a tabela sys_preloader.
  Insere os registros iniciais na tabela usando INSERT OR REPLACE para evitar conflitos.
  Inclui controle de execução para evitar re-execução desnecessária.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @seed_name "sys_preloader_seed"
  @seeds_dir "seeds_executed"

  @doc """
  Executa o seed com controle de execução.
  Verifica se já foi executado antes de inserir os dados.
  """
  def run do
    if seed_already_executed?() do
      Logger.info("Seed para sys_preloader já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed para a tabela sys_preloader...", module: __MODULE__)

      try do
        Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [1, "system", "css_system", "{dir_plugins_public}marka/|marka.min.css", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [2, "system", "css_system", "{dir_plugins_public}at.js/css/|jquery.atwho.min.css", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [3, "system", "css_system", "{dir_plugins_public}prism/|prism.css", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [4, "system", "css_system", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:21:\"get_preloader_content\";s:6:\"params\";a:1:{i:0;s:8:\"tailwind\";}s:5:\"class\";s:12:\"BaseServices\";}", 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [5, "system", "css_system", "common.css", 1, 10])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [6, "system", "css_system", "default.less", 1, 11])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [7, "system", "css_system", "general.css", 1, 12])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [8, "system", "css_system", "a:4:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:21:\"get_preloader_content\";s:6:\"params\";a:1:{i:0;s:5:\"icons\";}s:5:\"class\";s:12:\"BaseServices\";}", 1, 13])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [9, "system", "css_system", "colors.css", 1, 14])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [10, "system", "css_system", "forms.css", 1, 15])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [11, "system", "css_system", "media-desktop.css", 1, 20])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [12, "system", "css_system", "media-tablet.css", 1, 21])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [13, "system", "css_system", "media-phone.css", 1, 22])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [14, "system", "css_system", "media-print.css", 1, 23])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [15, "system", "css_system", "cmts.css", 1, 30])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [16, "system", "css_system", "favorite.css", 1, 31])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [17, "system", "css_system", "feature.css", 1, 32])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [18, "system", "css_system", "report.css", 1, 33])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [19, "system", "css_system", "score.css", 1, 34])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [20, "system", "css_system", "view.css", 1, 35])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [21, "system", "css_system", "vote.css", 1, 36])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [22, "system", "css_system", "{dir_plugins_public}spin.js/|spin.css", 1, 37])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [23, "system", "js_system", "pusher/pusher.min.js", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [24, "system", "js_system", "jquery/jquery.min.js", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [25, "system", "js_system", "jquery/jquery-migrate.min.js", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [26, "system", "js_system", "jquery-ui/jquery-ui.min.js", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [27, "system", "js_system", "jquery.easing.js", 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [28, "system", "js_system", "jquery.cookie.min.js", 1, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [29, "system", "js_system", "jquery.form.min.js", 1, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [30, "system", "js_system", "spin.js/spin.js", 1, 7])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [31, "system", "js_system", "moment-with-locales.min.js", 1, 8])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [32, "system", "js_system", "marka/marka.min.js", 1, 9])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [33, "system", "js_system", "headroom.min.js", 1, 10])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [34, "system", "js_system", "at.js/js/jquery.atwho.min.js", 1, 11])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [35, "system", "js_system", "prism/prism.js", 1, 12])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [36, "system", "js_system", "htmx/htmx.min.js", 1, 13])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [37, "system", "js_system", "htmx/head-support.js", 1, 14])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [38, "system", "js_system", "htmx/preload.js", 1, 15])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [39, "system", "js_system", "functions.js", 1, 20])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [40, "system", "js_system", "jquery.webForms.js", 1, 21])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [41, "system", "js_system", "jquery.dolPopup.js", 1, 22])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [42, "system", "js_system", "jquery.dolConverLinks.js", 1, 23])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [43, "system", "js_system", "jquery.anim.js", 1, 24])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [44, "system", "js_system", "jquery.ba-resize.min.js", 1, 25])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [45, "system", "js_system", "BxDolCmts.js", 1, 30])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [46, "system", "js_system", "BxDolFavorite.js", 1, 31])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [47, "system", "js_system", "BxDolFeature.js", 1, 32])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [48, "system", "js_system", "BxDolReport.js", 1, 33])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [49, "system", "js_system", "BxDolScore.js", 1, 34])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [50, "system", "js_system", "BxDolView.js", 1, 35])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [51, "system", "js_system", "BxDolVote.js", 1, 36])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [52, "system", "js_system", "BxDolVoteLikes.js", 1, 37])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [53, "system", "js_system", "BxDolVoteReactions.js", 1, 38])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [54, "system", "js_system", "BxDolVoteStars.js", 1, 39])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [55, "system", "js_system", "BxDolCmtsReviews.js", 1, 40])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [56, "system", "js_system", "BxDolMenuMoreAuto.js", 1, 41])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [57, "system", "js_system", "BxDolForm.js", 1, 42])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [58, "system", "js_system", "BxDolNestedForm.js", 1, 43])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [59, "system", "js_system", "BxDolConnection.js", 1, 44])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [60, "system", "js_system", "BxDolSockets.js", 1, 45])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [61, "system", "js_translation", "_Are_you_sure", 1, 1])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [62, "system", "js_translation", "_error occured", 1, 2])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [63, "system", "js_translation", "_sys_loading", 1, 3])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [64, "system", "js_translation", "_copyright", 1, 4])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [65, "system", "js_translation", "_sys_redirect_confirmation", 1, 5])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [66, "system", "js_translation", "_sys_form_input_password_show", 1, 6])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [67, "system", "js_translation", "_sys_form_input_password_hide", 1, 7])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [68, "bx_artificer", "css_system", "modules/boonex/artificer/template/css/|main.css", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [69, "bx_artificer", "js_system", "modules/boonex/artificer/js/|utils.js", 1, 0])
    Repo.execute("INSERT OR REPLACE INTO sys_preloader (id, module, 'type', content, active, 'order') VALUES (?, ?, ?, ?, ?, ?)", [70, "bx_artificer", "js_system", "modules/boonex/artificer/js/|sidebar.js", 1, 0])

        # Marcar como executado
        mark_seed_executed()
        Logger.info("Seed para sys_preloader executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = "#{Exception.message(error)}"
          Logger.error("Erro ao executar seed para sys_preloader: #{error_message}", module: __MODULE__)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed removendo o arquivo de controle.
  """
  def reset do
    Logger.info("Resetando seed para sys_preloader...", module: __MODULE__)
    seed_file = Path.join(@seeds_dir, @seed_name)
    File.rm(seed_file)
    Logger.info("Seed sys_preloader será re-executado na próxima inicialização.", module: __MODULE__)
  end

  @doc """
  Limpa todos os registros da tabela (use com cuidado!).
  """
  def clear_table do
    Logger.warning("Limpando todos os registros da tabela sys_preloader...", module: __MODULE__)
    Repo.execute("DELETE FROM sys_preloader")
    Logger.info("Tabela sys_preloader limpa com sucesso.", module: __MODULE__)
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
