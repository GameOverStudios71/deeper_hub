
defmodule DeeperHub.Inc.Classes.BxVideosPageEntry do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/videos/classes/BxVideosPageEntry.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aObject,oTemplate=false

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($aObject, $oTemplate = false)
    #     {
    #         $this->MODULE = 'bx_videos';
    #         parent::__construct($aObject, $oTemplate);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _setSubmenu

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def _setSubmenu(%{}) do
    # TODO: Implementacao futura
        # protected function _setSubmenu($aParams)
    #     {
    #     	parent::_setSubmenu(array_merge($aParams, array(
    #     		'icon' => ''
    #     	)));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getThumbForMetaObject

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getThumbForMetaObject(%{}) do
    # TODO: Implementacao futura
        # protected function _getThumbForMetaObject ()
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    # 		$sPosterSrc = !empty($CNF['FIELD_POSTER']) ? $CNF['FIELD_POSTER'] : $CNF['FIELD_THUMB'];
    #         if(!empty($sPosterSrc) && !empty($this->_aContentInfo[$sPosterSrc]))
    #             return array('id' => $this->_aContentInfo[$sPosterSrc], 'transcoder' => $CNF['OBJECT_IMAGES_TRANSCODER_POSTER']);
    # 
    #         if(!empty($CNF['FIELD_VIDEO']) && !empty($this->_aContentInfo[$CNF['FIELD_VIDEO']]))
    #             return array('id' => $this->_aContentInfo[$CNF['FIELD_VIDEO']], 'transcoder' => $CNF['OBJECT_VIDEOS_TRANSCODERS']['poster']);
    # 
    #         return false;
    #     }
    :ok
  end

end
