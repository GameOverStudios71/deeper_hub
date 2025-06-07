
defmodule DeeperHub.Inc.Classes.BxBaseModFilesFormsEntryHelper do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/files/classes/BxBaseModFilesFormsEntryHelper.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - oModule

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($oModule)
    #     {
    #         parent::__construct($oModule);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectFormAdd

  ## Parametros
    - sDisplay=false

  ## Retorno
    - any
  """
  def getObjectFormAdd(%{}) do
    # TODO: Implementacao futura
        # public function getObjectFormAdd ($sDisplay = false)
    #     {
    #         if (false === $sDisplay)
    #             $sDisplay = $this->_sDisplayForFormAdd;
    # 
    #         $oForm = BxDolForm::getObjectInstance($this->_sObjectNameForFormAdd, $sDisplay, $this->_oModule->_oTemplate);
    #         if($this->_bAjaxMode)
    #             $oForm->setAjaxMode($this->_bAjaxMode);
    # 
    #         if($this->_bAbsoluteActionUrl)
    #             $this->_setAbsoluteActionUrl('add', $oForm);
    # 
    #         return $oForm;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addDataForm

  ## Parametros
    - sDisplay=false,sCheckFunction=false

  ## Retorno
    - any
  """
  def addDataForm(%{}) do
    # TODO: Implementacao futura
        # public function addDataForm ($sDisplay = false, $sCheckFunction = false)
    #     {
    #         $mixedContent = $this->addDataFormAction($sDisplay, $sCheckFunction);
    #         if(!is_array($mixedContent) || empty($mixedContent['need_redirect_after_action'])) 
    #             return $mixedContent;
    # 
    #         $sUrl = $this->getRedirectUrlAfterAdd($mixedContent);
    #         if($this->_bIsApi)
    #             return !empty($sUrl) ? [bx_api_get_block('redirect', ['uri' => BxDolPermalinks::getInstance()->permalink($sUrl), 'timeout' => 1000])] : [];
    # 
    #         if($this->_bAjaxMode) {
    #             echoJson($this->prepareResponse($sUrl, $this->_bAjaxMode, 'redirect'));
    #             exit;
    #         }
    #         else
    #             $this->_redirectAndExit($sUrl);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addDataFormAction

  ## Parametros
    - sDisplay=false,sCheckFunction=false

  ## Retorno
    - any
  """
  def addDataFormAction(%{}) do
    # TODO: Implementacao futura
        # protected function addDataFormAction ($sDisplay = false, $sCheckFunction = false)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $bAsJson = false;
    # 
    #         // get form object
    #         $oForm = $this->getObjectFormAdd();
    #         if (!$oForm)
    #             return ($sKey = '_sys_txt_error_occured') && $this->_bIsApi ? [bx_api_get_msg($sKey)] : $this->prepareResponse(MsgBox(_t($sKey)), $bAsJson, 'msg');
    # 
    #         $bAsJson = $this->_bAjaxMode && $oForm->isSubmitted();
    #         $sModule = $this->_oModule->getName();
    # 
    #         // check access
    #         if (CHECK_ACTION_RESULT_ALLOWED !== ($sMsg = $this->_oModule->checkAllowedAdd()))
    #             return $this->_bIsApi ? [bx_api_get_msg($sMsg)] : $this->prepareResponse(MsgBox($sMsg), $bAsJson, 'msg');
    # 
    #         // check and display form
    #         $oForm->initChecker();
    #         if (!$oForm->isSubmittedAndValid())
    #             return $this->_bIsApi ? [bx_api_get_block('form', $oForm->getCodeAPI(), ['ext' => ['name' => $sModule, 'request' => ['url' => '/api.php?r=' . $sModule . '/entity_create', 'immutable' => true]]])] : $this->prepareResponse($oForm->getCode($this->_bDynamicMode), $bAsJson, 'form', [
    #             	'form_id' => $oForm->getId()
    #             ]);
    # 
    #         // insert data into database
    #         $aValsToAdd = [];
    #         $aContentIds = $oForm->insert ($aValsToAdd);
    #         if (false === $aContentIds || !is_array($aContentIds)) {
    #             if (!$oForm->isValid() || !is_array($aContentIds))
    #                 return $this->_bIsApi ? [bx_api_get_block('form', $oForm->getCodeAPI(), ['ext' => ['name' => $sModule, 'request' => ['url' => '/api.php?r=' . $sModule . '/entity_create', 'immutable' => true]]])] : $this->prepareResponse($oForm->getCode($this->_bDynamicMode), $bAsJson, 'form', [
    #                     'form_id' => $oForm->getId()
    #                 ]);
    #             else
    #                 return ($sKey = '_sys_txt_error_entry_creation') && $this->_bIsApi ? [bx_api_get_msg($sKey)] : $this->prepareResponse(MsgBox(_t($sKey)), $bAsJson, 'msg');
    #         }
    # 
    #         foreach ($aContentIds as $iContentId) {
    #             $sResult = $this->onDataAddAfter (getLoggedId(), $iContentId);
    #             if ($sResult)
    #                 return $this->_bIsApi ? [bx_api_get_msg($sResult)] : $this->prepareResponse($sResult, $bAsJson, 'msg');
    # 
    #             if (!($aContentInfo = $this->_oModule->_oDb->getContentInfoById($iContentId)))
    #                 return ($sKey = '_sys_txt_error_occured') && $this->_bIsApi ? [bx_api_get_msg($sKey)] : $this->prepareResponse(MsgBox(_t($sKey)), $bAsJson, 'msg');
    # 
    #             // Create alert about the completed action.
    #             $this->_oModule->alertAfterAdd($aContentInfo);
    #         }
    # 
    #         return ['need_redirect_after_action' => true, 'content_ids_array' => $aContentIds];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getRedirectUrlAfterAdd

  ## Parametros
    - mixedContent

  ## Retorno
    - any
  """
  def getRedirectUrlAfterAdd(%{}) do
    # TODO: Implementacao futura
        # protected function getRedirectUrlAfterAdd($mixedContent)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    #             
    #         $iProfileId = false;
    #         $sUri = $CNF['URI_AUTHOR_ENTRIES'];
    # 
    #         $sKeyIds = 'content_ids_array';
    #         if(!empty($mixedContent[$sKeyIds]) && is_array($mixedContent[$sKeyIds])) {
    #             $aContentInfo = $this->_oModule->_oDb->getContentInfoById(array_pop($mixedContent[$sKeyIds]));
    # 
    #             if(($sKey = 'FIELD_AUTHOR') && isset($CNF[$sKey]) && ($iAuthor = (int)$aContentInfo[$CNF[$sKey]])) {
    #                 $iProfileId = $iAuthor;
    #             }
    # 
    #             if(($sKey = 'FIELD_ALLOW_VIEW_TO') && isset($CNF[$sKey]) && ($iVisibility = (int)$aContentInfo[$CNF[$sKey]]) < 0) {
    #                 $iProfileId = abs($iVisibility);
    #                 $sUri = $CNF['URI_ENTRIES_BY_CONTEXT'];
    #             }
    #         }
    # 
    #         $sUrl = 'page.php?i=' . $sUri . '&profile_id=' . (($oProfile = BxDolProfile::getInstance($iProfileId)) !== false ? $oProfile->id() : bx_get_logged_profile_id());
    # 
    #         if(($mixedUrl = $this->_getRedirectFromContext('add', $aContentInfo)) !== false)
    #             $sUrl = $mixedUrl;
    # 
    #         return $sUrl;
    #     }
    :ok
  end

end
