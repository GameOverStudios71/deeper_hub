
defmodule DeeperHub.Inc.Classes.BxBaseModGroupsFormsEntryHelper do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/groups/classes/BxBaseModGroupsFormsEntryHelper.php
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
  Funcao correspondente ao metodo PHP getObjectFormInvite

  ## Parametros
    - sDisplay=false

  ## Retorno
    - any
  """
  def getObjectFormInvite(%{}) do
    # TODO: Implementacao futura
        # public function getObjectFormInvite ($sDisplay = false)
    #     {
    #     	$CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if($sDisplay === false)
    #             $sDisplay = $CNF['OBJECT_FORM_ENTRY_DISPLAY_INVITE'];
    # 
    #         $oForm = BxDolForm::getObjectInstance($CNF['OBJECT_FORM_ENTRY'], $sDisplay, $this->_oModule->_oTemplate);
    #         if($this->_bAjaxMode)
    #             $oForm->setAjaxMode($this->_bAjaxMode);
    # 
    #         if($this->_bAbsoluteActionUrl)
    #             $this->_setAbsoluteActionUrl('edit', $oForm);
    # 
    #         return $oForm;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP inviteForm

  ## Parametros
    - iContentId,sDisplay=false,sCheckFunction=false,bErrorMsg=true

  ## Retorno
    - any
  """
  def inviteForm(%{}) do
    # TODO: Implementacao futura
        # public function inviteForm ($iContentId, $sDisplay = false, $sCheckFunction = false, $bErrorMsg = true)
    #     {
    #         if (!$sCheckFunction)
    #             $sCheckFunction = 'checkAllowedInvite';
    # 
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         // get content data and profile info
    #         list($oProfile, $aContentInfo) = $this->_getProfileAndContentData($iContentId);
    # 
    #         if(!$aContentInfo)
    #             return $bErrorMsg ? ($this->_bIsApi ? [bx_api_get_msg('_sys_txt_error_entry_is_not_defined')] : MsgBox('_sys_txt_error_entry_is_not_defined')) : '';
    # 
    #         // check access
    #         if(($sMsg = $this->_oModule->$sCheckFunction($aContentInfo)) !== CHECK_ACTION_RESULT_ALLOWED)
    #             return $bErrorMsg ? ($this->_bIsApi ? [bx_api_get_msg($sMsg)] : MsgBox($sMsg)) : '';
    # 
    #         // check and display form
    #         $oForm = $this->getObjectFormInvite($sDisplay);
    # 
    #         if(!$oForm)
    #             return $bErrorMsg ? ($this->_bIsApi ? [bx_api_get_msg('_sys_txt_error_occured')] : MsgBox(_t('_sys_txt_error_occured'))) : '';
    # 
    #         $oForm->initChecker($aContentInfo);
    #         if (!$oForm->isSubmittedAndValid())
    #             return $this->_bIsApi ? [bx_api_get_block('form', $oForm->getCodeAPI(), ['ext' => ['name' => $this->_oModule->getName(), 'request' => ['url' => '/api.php?r=' . $this->_oModule->getName() . '/entity_invite&params[]=' . $iContentId . '&params[]=' . $sDisplay, 'immutable' => true]]])] : $oForm->getCode();
    # 
    #         $this->onDataInviteBefore($aContentInfo[$CNF['FIELD_ID']], $aContentInfo);
    # 
    #         if (!$oForm->update($aContentInfo[$CNF['FIELD_ID']])) {
    #             if (!$oForm->isValid())
    #                 return $this->_bIsApi ? [bx_api_get_block('form', $oForm->getCodeAPI(), ['ext' => ['name' => $this->_oModule->getName(), 'request' => ['url' => '/api.php?r=' . $this->_oModule->getName() . '/entity_invit&params[]=' . $iContentId . '&params[]=' . $sDisplay, 'immutable' => true]]])] : $oForm->getCode();
    #             else
    #                 return $this->_bIsApi ?  [bx_api_get_msg('_sys_txt_error_entry_update')] : MsgBox(_t('_sys_txt_error_entry_update'));
    #         }
    # 
    #         list($oProfile, $aContentInfo) = $this->_getProfileAndContentData($iContentId);
    # 
    #         $sResult = $this->onDataInviteAfter($aContentInfo[$CNF['FIELD_ID']], $aContentInfo);
    #         if($sResult)
    #             return $sResult;
    # 
    #         // Perform ACL action
    #         $this->_oModule->$sCheckFunction($aContentInfo, true);
    # 
    #         // Redirect
    #          if (bx_is_api())
    #             return [$this->redirectAfterEdit($aContentInfo)];
    #         else
    #         $this->redirectAfterEdit($aContentInfo);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getProfileAndContentData

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def _getProfileAndContentData(%{}) do
    # TODO: Implementacao futura
        # protected function _getProfileAndContentData ($iContentId)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $aContentInfo = $this->_oModule->_oDb->getContentInfoById($iContentId);
    #         if(!$aContentInfo)
    #             return array(false, false);
    # 
    #         $oProfile = BxDolProfile::getInstanceMagic($aContentInfo[$CNF['FIELD_AUTHOR']]);
    #         return array($oProfile, $aContentInfo);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _processPermissionsCheckForViewDataForm

  ## Parametros
    - aContentInfo,oProfile

  ## Retorno
    - any
  """
  def _processPermissionsCheckForViewDataForm(%{}) do
    # TODO: Implementacao futura
        # protected function _processPermissionsCheckForViewDataForm ($aContentInfo, $oProfile)
    #     {
    #         $sMsg = parent::_processPermissionsCheckForViewDataForm ($aContentInfo, $oProfile);
    # 
    #         $oPrivacy = BxDolPrivacy::getObjectInstance($this->_oModule->_oConfig->CNF['OBJECT_PRIVACY_VIEW']);
    #         if ($sMsg && $oPrivacy->isPartiallyVisible($aContentInfo[$this->_oModule->_oConfig->CNF['FIELD_ALLOW_VIEW_TO']]))
    #             return '';
    # 
    #         return $sMsg;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onDataAddAfter

  ## Parametros
    - iAccountId,iContentId

  ## Retorno
    - any
  """
  def onDataAddAfter(%{}) do
    # TODO: Implementacao futura
        # public function onDataAddAfter ($iAccountId, $iContentId)
    #     {
    #         if($s = parent::onDataAddAfter($iAccountId, $iContentId))
    #             return $s;
    # 
    #         $oGroupProfile = BxDolProfile::getInstanceByContentAndType($iContentId, $this->_oModule->_oConfig->getName());
    #         if(!$oGroupProfile)
    #             return '';
    # 
    #         $mInitialMembers = bx_get('initial_members');
    #         if($this->_bIsApi && $mInitialMembers && is_string($mInitialMembers))
    #             $mInitialMembers = explode(',', $mInitialMembers);
    # 
    #         $this->makeAuthorAdmin($oGroupProfile, $mInitialMembers);
    # 
    #         $this->inviteMembers($oGroupProfile, $mInitialMembers);
    # 
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onDataEditAfter

  ## Parametros
    - iContentId,aContentInfo,aTrackTextFieldsChanges,oProfile,oForm

  ## Retorno
    - any
  """
  def onDataEditAfter(%{}) do
    # TODO: Implementacao futura
        # public function onDataEditAfter ($iContentId, $aContentInfo, $aTrackTextFieldsChanges, $oProfile, $oForm)
    #     {
    #         if($s = parent::onDataEditAfter($iContentId, $aContentInfo, $aTrackTextFieldsChanges, $oProfile, $oForm))
    #             return $s;
    # 
    #         $oGroupProfile = BxDolProfile::getInstanceByContentAndType($iContentId, $this->_oModule->_oConfig->getName());
    #         if(!$oGroupProfile)
    #             return ''; 
    # 
    #         $this->inviteMembers ($oGroupProfile, bx_get('initial_members'));
    # 
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onDataInviteBefore

  ## Parametros
    - iContentId,aContentInfo

  ## Retorno
    - any
  """
  def onDataInviteBefore(%{}) do
    # TODO: Implementacao futura
        # public function onDataInviteBefore ($iContentId, $aContentInfo)
    #     {
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onDataInviteAfter

  ## Parametros
    - iContentId,aContentInfo

  ## Retorno
    - any
  """
  def onDataInviteAfter(%{}) do
    # TODO: Implementacao futura
        # public function onDataInviteAfter ($iContentId, $aContentInfo)
    #     {
    #         $oGroupProfile = BxDolProfile::getInstanceByContentAndType($iContentId, $this->_oModule->_oConfig->getName());
    #         if(!$oGroupProfile)
    #             return '';
    # 
    #         $this->inviteMembers($oGroupProfile, bx_get('initial_members'));
    # 
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP redirectAfterEdit

  ## Parametros
    - aContentInfo,sUrl=''

  ## Retorno
    - any
  """
  def redirectAfterEdit(%{}) do
    # TODO: Implementacao futura
        # protected function redirectAfterEdit($aContentInfo, $sUrl = '')
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $sUrl = '';
    #         if(bx_get('initial_members')) {
    #             if(isset($CNF['URL_ENTRY_MANAGE']))
    #                 $sUrl = $CNF['URL_ENTRY_MANAGE'];
    #             else if(isset($CNF['URL_ENTRY_FANS']))
    #                 $sUrl = $CNF['URL_ENTRY_FANS'];
    # 
    #             $sUrl = bx_append_url_params($sUrl, ['profile_id' => $aContentInfo['profile_id']]);
    #         }
    #         else
    #             $sUrl = 'page.php?i=' . $CNF['URI_VIEW_ENTRY'] . '&id=' . $aContentInfo[$CNF['FIELD_ID']];
    # 
    #         if(bx_is_api())
    #             return bx_api_get_block('redirect', ['uri' => '/' . BxDolPermalinks::getInstance()->permalink($sUrl), 'timeout' => 1000]);
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_base_groups-redirect_after_edit '{module_name}', 'redirect_after_edit' - hook to override redirect URL which is used after content changing
    #          * It's equivalent to @ref hook-bx_base_general-redirect_after_edit
    #          * @hook @ref hook-bx_base_groups-redirect_after_edit
    #          */
    #         bx_alert($this->_oModule->getName(), 'redirect_after_edit', 0, false, [
    #             'content' => $aContentInfo,
    #             'override_result' => &$sUrl,
    #         ]);
    # 
    #         $this->_redirectAndExit($sUrl);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onDataDeleteAfter

  ## Parametros
    - iContentId,aContentInfo,oProfile

  ## Retorno
    - any
  """
  def onDataDeleteAfter(%{}) do
    # TODO: Implementacao futura
        # public function onDataDeleteAfter ($iContentId, $aContentInfo, $oProfile)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $oGroupProfile = BxDolProfile::getInstanceByContentAndType($iContentId, $this->_oModule->_oConfig->getName());
    # 
    #         if(isset($CNF['TABLE_QUESTIONS'], $CNF['TABLE_ANSWERS']))
    #             $this->_oModule->_oDb->deleteQuestionnaires($iContentId);
    # 
    #         if ($oGroupProfile && isset($CNF['TABLE_ADMINS']))
    #             $this->_oModule->_oDb->deleteAdminsByGroupId($oGroupProfile->id());
    # 
    #         if (isset($CNF['OBJECT_CONNECTIONS']) && $oGroupProfile && ($oConnection = BxDolConnection::getObjectInstance($CNF['OBJECT_CONNECTIONS'])))
    #             $oConnection->onDeleteInitiatorAndContent($oGroupProfile->id());
    # 
    #         if((isset($CNF['OBJECT_PRIVACY_VIEW']) && $oPrivacyView = BxDolPrivacy::getObjectInstance($CNF['OBJECT_PRIVACY_VIEW'])) !== false)
    #             $oPrivacyView->deleteGroupCustomByContentId($iContentId);
    # 
    #         if((isset($CNF['OBJECT_PRIVACY_POST']) && $oPrivacyPost = BxDolPrivacy::getObjectInstance($CNF['OBJECT_PRIVACY_POST'])) !== false)
    #             $oPrivacyPost->deleteGroupCustomByContentId($iContentId);
    # 
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP inviteMembers

  ## Parametros
    - oGroupProfile,aInitialProfiles

  ## Retorno
    - any
  """
  def inviteMembers(%{}) do
    # TODO: Implementacao futura
        # protected function inviteMembers ($oGroupProfile, $aInitialProfiles)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if(empty($CNF['OBJECT_CONNECTIONS']) || !$aInitialProfiles)
    #             return;
    # 
    #         $oConnection = BxDolConnection::getObjectInstance($CNF['OBJECT_CONNECTIONS']);
    #         if(!$oConnection)
    #             return;
    # 
    #         $iGroupId = $oGroupProfile->id();
    # 
    #         if (!is_array($aInitialProfiles))
    # 			$aInitialProfiles = [$aInitialProfiles];
    #         
    #         // insert invited members, so they will join without confirmation
    #         foreach($aInitialProfiles as $iProfileId) {
    #             $oProfile = BxDolProfile::getInstance($iProfileId);
    #             if(!$oProfile)
    #                 continue;
    # 
    #             if($oConnection->isConnected($iGroupId, $iProfileId, true) || $oConnection->isConnected($iGroupId, $iProfileId))
    #                 continue;
    # 
    #             $this->_oModule->serviceAddMutualConnection ($iGroupId, $iProfileId, true);            
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP makeAuthorAdmin

  ## Parametros
    - oGroupProfile,aInitialProfiles

  ## Retorno
    - any
  """
  def makeAuthorAdmin(%{}) do
    # TODO: Implementacao futura
        # protected function makeAuthorAdmin ($oGroupProfile, $aInitialProfiles)
    #     {
    #         $iAdminProfileId = bx_get_logged_profile_id();
    #         if(!is_array($aInitialProfiles))
    #             $aInitialProfiles = [];
    #         if(!in_array($iAdminProfileId, $aInitialProfiles))
    #             $aInitialProfiles[] = $iAdminProfileId;
    # 
    #         $this->makeAdmin($iAdminProfileId, $oGroupProfile, $aInitialProfiles);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP makeAdmin

  ## Parametros
    - iProfileId,oGroupProfile,aInitialProfiles

  ## Retorno
    - any
  """
  def makeAdmin(%{}) do
    # TODO: Implementacao futura
        # protected function makeAdmin ($iProfileId, $oGroupProfile, $aInitialProfiles)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if (!isset($CNF['OBJECT_CONNECTIONS']) || !$CNF['OBJECT_CONNECTIONS'] || !is_array($aInitialProfiles) || !in_array($iProfileId, $aInitialProfiles))
    #             return;
    # 
    #         if (!($oConnection = BxDolConnection::getObjectInstance($CNF['OBJECT_CONNECTIONS'])))
    #             return;
    # 
    #         if (!$oConnection->isConnected($oGroupProfile->id(), (int)$iProfileId))
    #             $oConnection->addConnection($oGroupProfile->id(), (int)$iProfileId);
    #         if (!$oConnection->isConnected((int)$iProfileId, $oGroupProfile->id()))
    #             $oConnection->addConnection((int)$iProfileId, $oGroupProfile->id());
    # 
    #         if (!$this->_oModule->_oDb->isAdmin ($oGroupProfile->id(), $iProfileId))
    #             $this->_oModule->_oDb->toAdmins ($oGroupProfile->id(), $iProfileId);
    #     }
    :ok
  end

end
