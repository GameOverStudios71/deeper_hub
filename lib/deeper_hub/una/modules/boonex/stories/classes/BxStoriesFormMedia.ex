
defmodule DeeperHub.Inc.Classes.BxStoriesFormMedia do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/stories/classes/BxStoriesFormMedia.php
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
    #         $this->_sModule = 'bx_stories';
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
    #             $aStories = $this->_oModule->_oDb->getEntriesBy(array('type' => 'author', 'author' => $this->_aMediaInfo['author']));
    #             foreach($aStories as $aStory)
    #                 $this->aInputs['content_id']['values'][] = ['key' => $aStory[$CNF['FIELD_ID']], 'value' => $aStory[$CNF['FIELD_TITLE']]];
    #         }
    #     }
    :ok
  end

end
