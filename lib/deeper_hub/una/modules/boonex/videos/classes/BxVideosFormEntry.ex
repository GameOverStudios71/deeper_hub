
defmodule DeeperHub.Inc.Classes.BxVideosFormCheckerHelper do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/videos/classes/BxVideosFormEntry.php
  """

  @doc """
  Funcao correspondente ao metodo PHP checkUploadVideoAvail

  ## Parametros
    - s

  ## Retorno
    - any
  """
  def checkUploadVideoAvail(%{}) do
    # TODO: Implementacao futura
        # public function checkUploadVideoAvail ($s)
    #     {
    #         $sSource = bx_get('video_source');
    #         if ($sSource != 'embed') $sSource = 'upload';
    # 
    #         if ($sSource == 'embed') return true; //if we are embedding then skip uploads check
    # 
    #         return parent::checkAvail($s);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkEmbedVideoAvail

  ## Parametros
    - s

  ## Retorno
    - any
  """
  def checkEmbedVideoAvail(%{}) do
    # TODO: Implementacao futura
        # public function checkEmbedVideoAvail ($s)
    #     {
    #         $sSource = bx_get('video_source');
    #         if ($sSource != 'embed') $sSource = 'upload';
    # 
    #         if ($sSource == 'upload') return true; //if we are uploading then skip embed check
    # 
    #         if (!parent::checkAvail($s)) return false;
    # 
    #         $oModule = BxDolModule::getInstance('bx_videos');
    #         if (!$oModule->parseEmbedLink($s)) return false;
    # 
    #         return true;
    #     }
    :ok
  end

end
