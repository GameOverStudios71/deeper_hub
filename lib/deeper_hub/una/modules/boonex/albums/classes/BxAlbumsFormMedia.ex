
defmodule DeeperHub.Inc.Classes.BxAlbumsFormMedia do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/albums/classes/BxAlbumsFormMedia.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aInfo,oTemplate=false

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($aInfo, $oTemplate = false)
    #     {
    #         $this->_sModule = 'bx_albums';
    #         $this->_oModule = BxDolModule::getInstance($this->_sModule);
    # 
    #         parent::__construct($aInfo, $oTemplate);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP initForm

  ## Parametros
    - aAction,iMediaId

  ## Retorno
    - any
  """
  def initForm(%{}) do
    # TODO: Implementacao futura
        # public function initForm($aAction, $iMediaId)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $this->_iMediaId = $iMediaId;
    #         $this->_aMediaInfo = $this->_oModule->_oDb->getMediaInfoById($iMediaId);
    # 
    #         $this->aFormAttrs['action'] = BX_DOL_URL_ROOT . $this->_oModule->_oConfig->getBaseUri() . $aAction . '_media/' . $iMediaId;
    # 
    #         if(isset($this->aInputs['content_id'])) {
    #             $aAlbums = $this->_oModule->_oDb->getEntriesBy(array('type' => 'author', 'author' => $this->_aMediaInfo['author']));
    #             foreach($aAlbums as $aAlbum)
    #                 $this->aInputs['content_id']['values'][] = ['key' => $aAlbum[$CNF['FIELD_ID']], 'value' => $aAlbum[$CNF['FIELD_TITLE']]];
    #         }
    #     }
    :ok
  end

end
