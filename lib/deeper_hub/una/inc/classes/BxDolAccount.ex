
defmodule DeeperHub.Inc.Classes.BxDolAccount do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolAccount.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - iAccountId

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # protected function __construct ($iAccountId)
    #     {
    #         $iAccountId = (int)$iAccountId;
    #         $sClass = get_class($this) . '_' . $iAccountId;
    #         if (isset($GLOBALS['bxDolClasses'][$sClass]))
    #             trigger_error ('Multiple instances are not allowed for the class: ' . get_class($this), E_USER_ERROR);
    # 
    #         parent::__construct();
    # 
    #         $this->_iAccountID = $iAccountId; // since constructor is protected $iAccountId is always valid
    #         $this->_oQuery = BxDolAccountQuery::getInstance();
    # 
    #         $this->_sImageField = 'picture';
    #         $this->_aImageTranscoders = [
    #             'icon' => 'sys_accounts_icon',
    #             'thumb' => 'sys_accounts_thumb',
    #             'ava' => 'sys_accounts_avatar',
    #             'ava_big' => 'sys_accounts_avatar_big',
    #             'picture' => 'sys_accounts_picture'
    #         ];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP __clone

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def __clone(%{}) do
    # TODO: Implementacao futura
        # public function __clone()
    #     {
    #         $sClass = get_class($this) . '_' . $this->_iProfileID;
    #         if (isset($GLOBALS['bxDolClasses'][$sClass]))
    #             trigger_error('Clone is not allowed for the class: ' . get_class($this), E_USER_ERROR);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInstance

  ## Parametros
    - mixedAccountId=false,bClearCache=false

  ## Retorno
    - any
  """
  def getInstance(%{}) do
    # TODO: Implementacao futura
        # public static function getInstance($mixedAccountId = false,  $bClearCache = false)
    #     {
    #         if (!$mixedAccountId)
    #             $mixedAccountId = getLoggedId();
    # 
    #         $iAccountId = self::getID($mixedAccountId);
    #         if (!$iAccountId)
    #             return false;
    # 
    #         $sClass = __CLASS__ . '_' . $iAccountId;
    #         
    #         if ($bClearCache && isset($GLOBALS['bxDolClasses'][$sClass]))
    #             unset($GLOBALS['bxDolClasses'][$sClass]);
    #         
    #         if(!isset($GLOBALS['bxDolClasses'][$sClass]))
    #             $GLOBALS['bxDolClasses'][$sClass] = new BxDolAccount($iAccountId);
    # 
    #         return $GLOBALS['bxDolClasses'][$sClass];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInstanceStudioOperator

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getInstanceStudioOperator(%{}) do
    # TODO: Implementacao futura
        # public static function getInstanceStudioOperator()
    #     {
    #         $oQuery = BxDolAccountQuery::getInstance();
    #         if (!($iId = $oQuery->getStudioOperatorId()))
    #             return false;
    # 
    #         return self::getInstance($iId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP id

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def id(%{}) do
    # TODO: Implementacao futura
        # public function id()
    #     {
    #         $a = $this->getInfo($this->_iAccountID);
    #         return isset($a['id']) ? $a['id'] : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isConfirmed

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def isConfirmed(%{}) do
    # TODO: Implementacao futura
        # public function isConfirmed($iAccountId = false)
    #     {
    #         $iId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    # 
    #         $a = $this->getInfo($iId);
    # 
    #         $bResult = false;
    #         $sConfirmationType = getParam('sys_account_confirmation_type');
    #         switch($sConfirmationType) {
    #             case BX_ACCOUNT_CONFIRMATION_NONE:
    #                 $bResult = true;
    #                 break;
    # 
    #             case BX_ACCOUNT_CONFIRMATION_EMAIL:
    #                 if($a['email_confirmed'])
    #                     $bResult = true;
    #                 break;
    # 
    #             case BX_ACCOUNT_CONFIRMATION_PHONE:
    #                 if($a['phone_confirmed'])
    #                     $bResult = true;
    #                 break;
    # 
    #             case BX_ACCOUNT_CONFIRMATION_EMAIL_PHONE:
    #                 if($a['email_confirmed'] && $a['phone_confirmed'])
    #                     $bResult = true;
    #                 break;
    #                 
    #             case BX_ACCOUNT_CONFIRMATION_EMAIL_OR_PHONE:
    #                 if($a['email_confirmed'] || $a['phone_confirmed'])
    #                     $bResult = true;
    #                 break;  
    #                 
    #         }
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-account-is_confirmed 'account', 'is_confirmed' - hook in  $oAccount->isConfirmed check
    #          * - $unit_name - equals `account`
    #          * - $action - equals `is_confirmed` 
    #          * - $object_id - account id 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `type` - [string] confirmation type can be none/phone/email/email_and_phone/email_or_phone
    #          *      - `override_result` - [bool] by ref, if account confirmed = true, otherwise false, can be overridden in hook processing
    #          * @hook @ref hook-account-is_confirmed
    #          */
    #         bx_alert('account', 'is_confirmed', $iId, false, array('type' => $sConfirmationType, 'override_result' => &$bResult));
    # 
    #         return $bResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCurrentConfirmationStatusValue

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getCurrentConfirmationStatusValue(%{}) do
    # TODO: Implementacao futura
        # public function getCurrentConfirmationStatusValue($iAccountId = false)
    #     {
    #         $a = $this->getInfo((int)$iAccountId);
    #         $sTmp = $a['email_confirmed'] . $a['phone_confirmed'];
    #         switch ($sTmp) {
    #             case '01':
    #                 return BX_ACCOUNT_CONFIRMATION_PHONE;
    #             case '10':
    #                 return BX_ACCOUNT_CONFIRMATION_EMAIL;
    #             case '11':
    #                 return BX_ACCOUNT_CONFIRMATION_EMAIL_PHONE;
    #         }
    #         return BX_ACCOUNT_CONFIRMATION_NONE;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isConfirmedEmail

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def isConfirmedEmail(%{}) do
    # TODO: Implementacao futura
        # public function isConfirmedEmail($iAccountId = false)
    #     {
    #         $iId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    # 
    #         $bResult = false;
    #         if(self::isNeedConfirmEmail()) {
    #             $a = $this->getInfo($iId);
    # 
    #             $bResult = $a['email_confirmed'] ? true : false;
    #         }
    #         else 
    #             $bResult = true;
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-account-is_confirmed 'account', 'is_confirmed_email' - hook in  $oAccount->isConfirmedEmail check
    #          * - $unit_name - equals `account`
    #          * - $action - equals `is_confirmed_email` 
    #          * - $object_id - account id 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `override_result` - [bool] by ref, if email confirmed = true, otherwise false, can be overridden in hook processing
    #          * @hook @ref hook-account-is_confirmed_email
    #          */
    #         bx_alert('account', 'is_confirmed_email', $iId, false, array('override_result' => &$bResult));
    # 
    #         return $bResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isConfirmedPhone

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def isConfirmedPhone(%{}) do
    # TODO: Implementacao futura
        # public function isConfirmedPhone($iAccountId = false)
    #     {
    #         $iId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    # 
    #         $bResult = false;        
    #         if(self::isNeedConfirmPhone()) {
    #             $a = $this->getInfo((int)$iAccountId);
    # 
    #             $bResult = $a['phone_confirmed'] ? true : false;
    #         }
    #         else
    #             $bResult = true;
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-account-is_confirmed_phone 'account', 'is_confirmed_phone' - hook in  $oAccount->isConfirmedPhone check
    #          * - $unit_name - equals `account`
    #          * - $action - equals `is_confirmed_phone` 
    #          * - $object_id - account id 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `override_result` - [bool] by ref, if phone confirmed = true, otherwise false, can be overridden in hook processing
    #          * @hook @ref hook-account-is_confirmed_phone
    #          */
    #         bx_alert('account', 'is_confirmed_phone', $iId, false, array('override_result' => &$bResult));
    # 
    #         return $bResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isNeedConfirmEmail

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isNeedConfirmEmail(%{}) do
    # TODO: Implementacao futura
        # public function isNeedConfirmEmail()
    #     {
    #         if(in_array(getParam('sys_account_confirmation_type'), array(BX_ACCOUNT_CONFIRMATION_EMAIL, BX_ACCOUNT_CONFIRMATION_EMAIL_PHONE, BX_ACCOUNT_CONFIRMATION_EMAIL_OR_PHONE)))
    #             return true;
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isNeedConfirmPhone

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isNeedConfirmPhone(%{}) do
    # TODO: Implementacao futura
        # public function isNeedConfirmPhone()
    #     {
    #         if(in_array(getParam('sys_account_confirmation_type'), array(BX_ACCOUNT_CONFIRMATION_PHONE, BX_ACCOUNT_CONFIRMATION_EMAIL_PHONE, BX_ACCOUNT_CONFIRMATION_EMAIL_OR_PHONE)))
    #             return true;
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isLocked

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def isLocked(%{}) do
    # TODO: Implementacao futura
        # public function isLocked($iAccountId = false)
    #     {
    #         $a = $this->getInfo((int)$iAccountId);
    #         return $a['locked'] ? true : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateEmailConfirmed

  ## Parametros
    - isConfirmed,isAutoSendConfrmationEmail=true,iAccountId=false

  ## Retorno
    - any
  """
  def updateEmailConfirmed(%{}) do
    # TODO: Implementacao futura
        # public function updateEmailConfirmed($isConfirmed, $isAutoSendConfrmationEmail = true, $iAccountId = false)
    #     {
    #         $iId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    # 
    #         if (!$isConfirmed && $isAutoSendConfrmationEmail && self::isNeedConfirmEmail()) // if email_confirmation procedure is enabled - send email confirmation letter
    #             $this->sendConfirmationEmail($iId);
    # 
    #         if ($this->_oQuery->updateEmailConfirmed($isConfirmed, $iId)) {
    #             $this->_aInfo = false;
    #             /**
    #              * @hooks
    #              * @hookdef hook-account-confirm 'account', 'confirm' - hook in email confirmation $oAccount->updateEmailConfirmed 
    #              * - $unit_name - equals `account`
    #              * - $action - can be confirm/unconfirm
    #              * - $object_id - account id 
    #              * - $sender_id - not used 
    #              * - $extra_params - not used 
    #              * @hook @ref hook-account-confirm
    #              */
    #             bx_alert('account', $this->isConfirmed() ? 'confirm' : 'unconfirm', $iId);
    #             return true;
    #         }
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updatePhoneConfirmed

  ## Parametros
    - isConfirmed,iAccountId=false

  ## Retorno
    - any
  """
  def updatePhoneConfirmed(%{}) do
    # TODO: Implementacao futura
        # public function updatePhoneConfirmed($isConfirmed, $iAccountId = false)
    #     {
    #         $iId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    #         
    #         if ($this->_oQuery->updatePhoneConfirmed($isConfirmed, $iId)) {
    #             $this->_aInfo = false;
    #             bx_alert('account', $this->isConfirmed() ? 'confirm' : 'unconfirm', $iId);
    #             return true;
    #         }
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updatePassword

  ## Parametros
    - sPassword,iAccountId=false

  ## Retorno
    - any
  """
  def updatePassword(%{}) do
    # TODO: Implementacao futura
        # public function updatePassword($sPassword, $iAccountId = false)
    #     {
    #         $iId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    # 
    #         $sSalt = genRndSalt();
    #         $sPasswordHash = encryptUserPwd($sPassword, $sSalt);
    # 
    #         $this->_oQuery->logPassword($iId);
    #         
    #         if((int)$this->_oQuery->updatePassword($sPasswordHash, $sSalt, $iId) > 0) {
    #             /**
    #              * @hooks
    #              * @hookdef hook-account-edited 'account', 'edited' - hook on account edited $oAccount->updatePassword 
    #              * - $unit_name - equals `account`
    #              * - $action - equals edited
    #              * - $object_id - account id 
    #              * - $sender_id - account sender id 
    #              * - $extra_params - array of additional params with the following array keys:
    #              *      - `action` - [string] action's name, can be reset_password
    #              * @hook @ref hook-account-edited
    #              */
    #             bx_alert('account', 'edited', $iId, ($iSenderId = getLoggedId()) != 0 ? $iSenderId : $iId, [
    #                 'action' => 'reset_password'
    #             ]);
    # 
    #             $this->doAudit($iId, '_sys_audit_action_account_reset_password');
    #             return true;
    #         }
    # 
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updatePhone

  ## Parametros
    - sPhone,iAccountId=false

  ## Retorno
    - any
  """
  def updatePhone(%{}) do
    # TODO: Implementacao futura
        # public function updatePhone($sPhone, $iAccountId = false)
    #     {
    #         $iId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    #         if ($this->_oQuery->updatePhone($sPhone, $iId)) {
    #             /**
    #              * @hooks
    #              * @hookdef hook-account-set_phone 'account', 'set_phone' - hook after accout password changed
    #              * - $unit_name - equals `account`
    #              * - $action - equals `set_phone` 
    #              * - $object_id - account id 
    #              * - $sender_id - not used 
    #              * - $extra_params - not used
    #              * @hook @ref hook-account-set_phone
    #              */
    #             bx_alert('account', 'set_phone', $iId);
    #             return true;
    #         }
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateProfileContextAuto

  ## Parametros
    - iProfileIdFilterOut=false,iAccountId=false

  ## Retorno
    - any
  """
  def updateProfileContextAuto(%{}) do
    # TODO: Implementacao futura
        # public function updateProfileContextAuto($iProfileIdFilterOut = false, $iAccountId = false)
    #     {
    #         $oAccount = (!$iAccountId || $iAccountId == $this->_iAccountID ? $this : BxDolAccount::getInstance ($iAccountId));
    #         if (!$oAccount)
    #             return false;
    #         $aAccountInfo = $oAccount->getInfo();
    #         $aProfiles = $oAccount->getProfiles();
    #         $oProfileAccount = BxDolProfile::getInstanceAccountProfile($oAccount->id());
    # 
    #         // unset deleted profile and account profile
    #         if ($iProfileIdFilterOut)
    #             unset($aProfiles[$iProfileIdFilterOut]);
    #         unset($aProfiles[$oProfileAccount->id()]);
    # 
    #         if ($aProfiles) {
    #             // try to use another profile
    #             reset($aProfiles);
    #             $iProfileId = key($aProfiles);
    #         } 
    #         else {
    #             // if no profiles exist, use account profile
    #             $iProfileId = $oProfileAccount->id();
    #         }
    # 
    #         return $oAccount->updateProfileContext($iProfileId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateProfileContext

  ## Parametros
    - iSwitchToProfileId,iAccountId=false

  ## Retorno
    - any
  """
  def updateProfileContext(%{}) do
    # TODO: Implementacao futura
        # public function updateProfileContext($iSwitchToProfileId, $iAccountId = false)
    #     {
    #         $iId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    #         $aInfo = $this->getInfo((int)$iId);
    #         if (!$aInfo)
    #             return false;
    # 
    #         $ret = null;
    #         /**
    #          * @hooks
    #          * @hookdef hook-account-before_switch_context 'account', 'before_switch_context' - hook before switch profile_id frof current logged user
    #          * - $unit_name - equals `account`
    #          * - $action - equals `before_switch_context` 
    #          * - $object_id - account id 
    #          * - $sender_id - profile_id to switch to
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `profile_id_current` - [int] current profile_id
    #          *      - `override_result` - [int] by ref, profile_id to switch to, can be overridden in hook processing
    #          * @hook @ref hook-account-before_switch_context
    #          */
    #         bx_alert('account', 'before_switch_context', $iId, $iSwitchToProfileId, array('profile_id_current' => $aInfo['profile_id'], 'override_result' => &$ret));
    #         if ($ret !== null)
    #             return $ret;
    # 
    #         if (!$this->_oQuery->updateCurrentProfile($iId, $iSwitchToProfileId))
    #             return false;
    # 
    #         $this->_aInfo = false;
    #         
    #         /**
    #          * @hooks
    #          * @hookdef hook-account-switch_context 'account', 'switch_context' - hook before switch profile_id frof current logged user
    #          * - $unit_name - equals `account`
    #          * - $action - equals `switch_context` 
    #          * - $object_id - account id 
    #          * - $sender_id - profile_id to switch to
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `profile_id_old` - [int] old profile_id
    #          * @hook @ref hook-account-switch_context
    #          */
    #         bx_alert('account', 'switch_context', $iId, $iSwitchToProfileId, array('profile_id_old' => $aInfo['profile_id']));
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP sendConfirmationEmail

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def sendConfirmationEmail(%{}) do
    # TODO: Implementacao futura
        # public function sendConfirmationEmail($iAccountId = false)
    #     {
    #         $iAccountId = (int)$iAccountId;
    #         if(!$iAccountId)
    #             $iAccountId = $this->_iAccountID;
    # 
    #         $aAccountInfo = $this->getInfo($iAccountId);
    #         if(empty($aAccountInfo) || !is_array($aAccountInfo))
    #             return false;
    # 
    #         $oKey = BxDolKey::getInstance();
    #         $sConfirmationCode = $oKey->getNewKeyNumeric(['account_id' => $iAccountId]);
    #         $sConfirmationLink = bx_append_url_params(BX_DOL_URL_ROOT . BxDolPermalinks::getInstance()->permalink('page.php?i=confirm-email'), ['code' => $sConfirmationCode]);
    # 
    #         $sEmailTemplate = 't_Confirmation';
    #         $aEmailReplaceVars = [
    #             'name' => $this->getDisplayName($iAccountId),
    #             'email' => $aAccountInfo['email'],
    #             'conf_code' => $sConfirmationCode,
    #             'conf_link' => $sConfirmationLink,
    #             'conf_form_link' => BX_DOL_URL_ROOT . BxDolPermalinks::getInstance()->permalink('page.php?i=confirm-email')
    #         ];
    # 
    #         $bResult = sendMailTemplate($sEmailTemplate, $iAccountId, (int)$aAccountInfo['profile_id'], $aEmailReplaceVars, BX_EMAIL_SYSTEM);
    #         if($bResult)
    #             $this->doAudit($iAccountId, '_sys_audit_action_account_resend_confirmation_email');
    # 
    #         return $bResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP sendResetPasswordEmail

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def sendResetPasswordEmail(%{}) do
    # TODO: Implementacao futura
        # public function sendResetPasswordEmail($iAccountId = false)
    #     {
    #         $iAccountId = (int)$iAccountId;
    #         if(!$iAccountId)
    #             $iAccountId = $this->_iAccountID;
    # 
    #         $aAccountInfo = $this->getInfo($iAccountId);
    #         if(empty($aAccountInfo) || !is_array($aAccountInfo))
    #             return false;
    # 
    #         $sKey = bx_get_reset_password_key($aAccountInfo['email']);
    # 
    #         $aReplaceVars = array(
    #             'name' => $this->getDisplayName($iAccountId),
    #             'email' => $aAccountInfo['email'],
    #             'key' => $sKey,
    #             'forgot_password_url' => bx_get_reset_password_link_by_key($sKey)
    #         );
    # 
    #         return sendMailTemplate('t_Forgot', $iAccountId, (int)$aAccountInfo['profile_id'], $aReplaceVars, BX_EMAIL_SYSTEM);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInfo

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getInfo(%{}) do
    # TODO: Implementacao futura
        # public function getInfo($iAccountId = false)
    #     {        
    #         if ($iAccountId && $iAccountId != $this->_iAccountID)
    #             return $this->_oQuery->getInfoById((int)$iAccountId ? (int)$iAccountId : $this->_iAccountID);
    # 
    #         if ($this->_aInfo)
    #             return $this->_aInfo;
    # 
    #         $this->_aInfo = $this->_oQuery->getInfoById($this->_iAccountID);
    #         return $this->_aInfo;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getDisplayName

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getDisplayName(%{}) do
    # TODO: Implementacao futura
        # public function getDisplayName($iAccountId = false)
    #     {
    #         $aInfo = $this->getInfo($iAccountId);
    # 
    #         $sDisplayName = !empty($aInfo['name']) ? $aInfo['name'] : _t('_sys_txt_user_n', $aInfo['id']);
    #         
    #         /**
    #          * @hooks
    #          * @hookdef hook-account-account_name 'account', 'account_name' - hook on get account display name
    #          * - $unit_name - equals `account`
    #          * - $action - equals `account_name` 
    #          * - $object_id - account id 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `info` - [array] contains account info from $oAccount->getInfo()
    #          *      - `display_name` - [string] by ref, account display name,  can be overridden in hook processing
    #          * @hook @ref hook-account-account_name
    #          */
    #         bx_alert('account', 'account_name', $iAccountId, 0, array('info' => $aInfo, 'display_name' => &$sDisplayName));
    # 
    #         return bx_process_output($sDisplayName);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUrl

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getUrl(%{}) do
    # TODO: Implementacao futura
        # public function getUrl($iAccountId = false)
    #     {
    #         return 'javascript:void(0);';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPicture

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getPicture(%{}) do
    # TODO: Implementacao futura
        # public function getPicture($iAccountId = false)
    #     {
    #         $sImageUrl = $this->_getImageUrl('picture', $iAccountId);
    #         if(!$sImageUrl)
    #             $sImageUrl = BxDolTemplate::getInstance()->getImageUrl('account.svg');
    # 
    #         return $sImageUrl;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAvatarBig

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getAvatarBig(%{}) do
    # TODO: Implementacao futura
        # public function getAvatarBig($iAccountId = false)
    #     {
    #         $sImageUrl = $this->_getImageUrl('ava_big', $iAccountId);
    #         if(!$sImageUrl)
    #             $sImageUrl = BxDolTemplate::getInstance()->getImageUrl('account.svg');
    # 
    #         return $sImageUrl;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAvatar

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getAvatar(%{}) do
    # TODO: Implementacao futura
        # public function getAvatar($iAccountId = false)
    #     {
    #         $sImageUrl = $this->_getImageUrl('ava', $iAccountId);
    #         if(!$sImageUrl)
    #             $sImageUrl = BxDolTemplate::getInstance()->getImageUrl('account.svg');
    # 
    #         return $sImageUrl;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getThumb

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getThumb(%{}) do
    # TODO: Implementacao futura
        # public function getThumb($iAccountId = false)
    #     {
    #         $sImageUrl = $this->_getImageUrl('thumb', $iAccountId);
    #         if(!$sImageUrl)
    #             $sImageUrl = BxDolTemplate::getInstance()->getImageUrl('account.svg');
    # 
    #         return $sImageUrl;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getIcon

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getIcon(%{}) do
    # TODO: Implementacao futura
        # public function getIcon($iAccountId = false)
    #     {
    #         $sImageUrl = $this->_getImageUrl('icon', $iAccountId);
    #         if(!$sImageUrl)
    #             $sImageUrl = BxDolTemplate::getInstance()->getImageUrl('account.svg');
    # 
    #         return $sImageUrl;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getEmail

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getEmail(%{}) do
    # TODO: Implementacao futura
        # public function getEmail($iAccountId = false)
    #     {
    #         $iAccountId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    #         $aAccountInfo = $this->getInfo($iAccountId);
    #         return $aAccountInfo['email'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguageId

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getLanguageId(%{}) do
    # TODO: Implementacao futura
        # public function getLanguageId($iAccountId = false)
    #     {
    #         $iAccountId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    #         $aAccountInfo = $this->getInfo($iAccountId);
    #         return $aAccountInfo['lang_id'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isOnline

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def isOnline(%{}) do
    # TODO: Implementacao futura
        # public function isOnline($iAccountId = false)
    #     {
    #         $iAccountId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    #         return $this->_oQuery->isOnline($iAccountId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getID

  ## Parametros
    - s

  ## Retorno
    - any
  """
  def getID(%{}) do
    # TODO: Implementacao futura
        # public function getID($s)
    #     {
    #         $oQuery = BxDolAccountQuery::getInstance();
    # 
    #         bx_import('BxDolForm');
    #         if (BxDolFormCheckerHelper::checkEmail($s)) {
    #             $iId = (int)$oQuery->getIdByEmail($s);
    #             return $iId ? $iId : false;
    #         }
    #         if (preg_match("/^\+[0-9\s]+$/", $s)) {
    #             $iId = (int)$oQuery->getIdByPhone($s);
    #             return $iId ? $iId : false;
    #         }
    #         
    #         $iId = $oQuery->getIdById((int)$s);
    #         return $iId ? $iId : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isProfilesLimitReached

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isProfilesLimitReached(%{}) do
    # TODO: Implementacao futura
        # public function isProfilesLimitReached ()
    #     {
    #         $iProfilesLimit = (int)getParam('sys_account_limit_profiles_number');
    #         /**
    #          * @hooks
    #          * @hookdef hook-account-get_limit_profiles_number 'account', 'get_limit_profiles_number' - hook on get account limit on the number of profiles
    #          * - $unit_name - equals `account`
    #          * - $action - equals `get_limit_profiles_number` 
    #          * - $object_id - not used 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `account_id` - [int] account id 
    #          *      - `number` - [int] by ref, account limit on the number of profiles,  can be overridden in hook processing
    #          * @hook @ref hook-account-get_limit_profiles_number
    #          */
    #         bx_alert('account', 'get_limit_profiles_number', 0, 0, array('account_id' => $this->_iAccountID, 'number' => &$iProfilesLimit));
    #         if (!isAdmin() && $iProfilesLimit && ($iProfilesNum = $this->getProfilesNumber()) && $iProfilesNum >= $iProfilesLimit)
    #             return true;
    # 
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProfilesNumber

  ## Parametros
    - isFilterNonSwitchableProfiles=true

  ## Retorno
    - any
  """
  def getProfilesNumber(%{}) do
    # TODO: Implementacao futura
        # public function getProfilesNumber ($isFilterNonSwitchableProfiles = true)
    #     {
    #         $a = $this->getProfilesIds($isFilterNonSwitchableProfiles);
    #         return count($a);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProfilesIds

  ## Parametros
    - isFilterNonSwitchableProfiles=true,isFilterSystemProfiles=true

  ## Retorno
    - any
  """
  def getProfilesIds(%{}) do
    # TODO: Implementacao futura
        # public function getProfilesIds ($isFilterNonSwitchableProfiles = true, $isFilterSystemProfiles = true)
    #     {
    #         $a = $this->getProfiles ($isFilterNonSwitchableProfiles, $isFilterSystemProfiles);
    #         return $a ? array_keys($a) : array();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProfiles

  ## Parametros
    - isFilterNonSwitchableProfiles=true,isFilterSystemProfiles=true

  ## Retorno
    - any
  """
  def getProfiles(%{}) do
    # TODO: Implementacao futura
        # public function getProfiles ($isFilterNonSwitchableProfiles = true, $isFilterSystemProfiles = true)
    #     {
    #         $oProfileQuery = BxDolProfileQuery::getInstance();
    #         $aProfiles = $oProfileQuery->getProfilesByAccount($this->_iAccountID);
    # 
    #         if ($isFilterNonSwitchableProfiles) {
    #             foreach ($aProfiles as $iProfileId => $aProfile) {
    #                 if ('system' == $aProfile['type'])
    #                     continue;
    #                 if (!BxDolService::call($aProfile['type'], 'act_as_profile'))
    #                     unset($aProfiles[$iProfileId]);
    #             }
    #         }
    # 
    #         if ($isFilterSystemProfiles) {
    #             foreach ($aProfiles as $iProfileId => $aProfile) {
    #                 if ('system' == $aProfile['type'])
    #                     unset($aProfiles[$iProfileId]);
    #             }
    #         }
    # 
    #         return $aProfiles;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP delete

  ## Parametros
    - bDeleteWithContent=false,bScheduled=false

  ## Retorno
    - any
  """
  def delete(%{}) do
    # TODO: Implementacao futura
        # 
    #     function delete($bDeleteWithContent = false, $bScheduled = false)
    #     {
    #         if ($bScheduled)
    #             return BxDolBackgroundJobs::getInstance()->add('account_delete_' . $this->_iAccountID, ['system', 'account_delete', [$this->_iAccountID, $bDeleteWithContent], 'TemplServiceAccount']);
    # 
    #         $aAccountInfo = $this->_oQuery->getInfoById($this->_iAccountID);
    #         if (!$aAccountInfo)
    #             return false;
    # 
    #         // create system event before deletion
    #         $isStopDeletion = false;
    #         /**
    #          * @hooks
    #          * @hookdef hook-account-before_delete 'account', 'before_delete' - hook on before delete account, 
    #          * - $unit_name - equals `account`
    #          * - $action - equals `before_delete` 
    #          * - $object_id - account id 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `delete_with_content` - [bool] if account will delete with content = true, otherwise = false
    #          *      - `stop_deletion` - [bool] by ref, if it set to true account deletion will stopped, can be overridden in hook processing
    #          * @hook @ref hook-account-before_delete
    #          */
    #         bx_alert('account', 'before_delete', $this->_iAccountID, 0, array('delete_with_content' => $bDeleteWithContent, 'stop_deletion' => &$isStopDeletion));
    #         if ($isStopDeletion)
    #             return false;
    # 
    #         $oAccountQuery = BxDolAccountQuery::getInstance();
    # 
    #         $oProfileQuery = BxDolProfileQuery::getInstance();
    #         $aProfiles = $oProfileQuery->getProfilesByAccount($this->_iAccountID);
    #         foreach ($aProfiles as $iProfileId => $aRow) {
    #             $oProfile = BxDolProfile::getInstance($iProfileId);
    #             if (!$oProfile)
    #                 continue;
    #             $oProfile->delete(false, $bDeleteWithContent, true);
    #         }
    # 
    #         // delete profile
    #         if (!$oAccountQuery->delete($this->_iAccountID))
    #             return false;
    # 
    #         // unset class instance to prevent creating the instance again
    #         $sClass = __CLASS__ . '_' . $this->_iAccountID;
    #         unset($GLOBALS['bxDolClasses'][$sClass]);
    # 
    #        /**
    #          * @hooks
    #          * @hookdef hook-account-delete 'account', 'delete' - hook on after delete account 
    #          * - $unit_name - equals `account`
    #          * - $action - equals `delete` 
    #          * - $object_id - account id 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `delete_with_content` - [bool] if account will delete with content = true, otherwise = false
    #          * @hook @ref hook-account-delete
    #          */
    #         bx_alert('account', 'delete', $this->_iAccountID, 0, array ('delete_with_content' => $bDeleteWithContent));
    #         
    #         $this->doAudit($this->_iAccountID, $bDeleteWithContent ? '_sys_audit_action_account_deleted_with_content' : '_sys_audit_action_account_deleted');
    #         
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addInformerPermanentMessages

  ## Parametros
    - oInformer

  ## Retorno
    - any
  """
  def addInformerPermanentMessages(%{}) do
    # TODO: Implementacao futura
        # public function addInformerPermanentMessages ($oInformer)
    #     {
    #         if (!$this->isConfirmed()) {
    #             if (!$this->isConfirmedEmail()) {
    #                 $sUrl = BxDolPermalinks::getInstance()->permalink('page.php?i=confirm-email');
    #                 $aAccountInfo = $this->getInfo();
    #                 $oInformer->add('sys-account-unconfirmed-email', _t('_sys_txt_account_unconfirmed_email', $sUrl . '&resend=1', $aAccountInfo['email'], $sUrl), BX_INFORMER_ALERT);
    #             }
    #             if (!$this->isConfirmedPhone()) {
    #                 $sUrl = BxDolPermalinks::getInstance()->permalink('page.php?i=confirm-phone') . '';
    #                 $aAccountInfo = $this->getInfo();
    #                 $oInformer->add('sys-account-unconfirmed-phone', _t('_sys_txt_account_unconfirmed_phone', $sUrl), BX_INFORMER_ALERT);
    #             }
    #         }
    # 
    #         $this->isNeedChangePassword(false, $oInformer);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addInformerDeletionScheduled

  ## Parametros
    - oInformer

  ## Retorno
    - any
  """
  def addInformerDeletionScheduled(%{}) do
    # TODO: Implementacao futura
        # public function addInformerDeletionScheduled($oInformer)
    #     {
    #         if(BxDolBackgroundJobs::getInstance()->exists('account_delete_' . $this->_iAccountID))
    #             $oInformer->add('sys-account-deletion-scheduled', _t('_sys_txt_account_deletion_scheduled'), BX_INFORMER_ALERT);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUnsubscribeLink

  ## Parametros
    - iEmailType,iAccountId=false

  ## Retorno
    - any
  """
  def getUnsubscribeLink(%{}) do
    # TODO: Implementacao futura
        # public function getUnsubscribeLink($iEmailType, $iAccountId = false)
    #     {
    #         $iAccountId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    #         $sUrl = '';
    #         switch ($iEmailType) {
    #             case BX_EMAIL_NOTIFY:
    #                 $sUrl = 'page.php?i=unsubscribe-notifications';
    #                 break;
    #             case BX_EMAIL_MASS:
    #                 $sUrl = 'page.php?i=unsubscribe-news';
    #                 break;
    #             default:
    #                 return '';
    #         }
    #         return BxDolPermalinks::getInstance()->permalink($sUrl) . '&id=' . $iAccountId . '&code=' . $this->getEmailHash();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getEmailHash

  ## Parametros
    - iAccountId=false

  ## Retorno
    - any
  """
  def getEmailHash(%{}) do
    # TODO: Implementacao futura
        # public function getEmailHash($iAccountId = false)
    #     {
    #         $iAccountId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    #         $a = $this->getInfo();
    #         return md5($a['email'] . $a['salt'] . BX_DOL_SECRET);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPasswordChangedDate

  ## Parametros
    - mixedAccount=false

  ## Retorno
    - any
  """
  def getPasswordChangedDate(%{}) do
    # TODO: Implementacao futura
        # public function getPasswordChangedDate($mixedAccount = false)
    #     {
    #         if(($bEmpty = empty($mixedAccount)) || !is_array($mixedAccount))
    #             $mixedAccount = $this->_oQuery->getInfoById(!$bEmpty ? (int)$mixedAccount : $this->_iAccountID);
    # 
    #         $iLastChanged = (int)$mixedAccount['password_changed'];
    #         return $iLastChanged ? $iLastChanged : (int)$mixedAccount['added'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPasswordExpiredDate

  ## Parametros
    - iPasswordExpiredForMembership,mixedAccount=false

  ## Retorno
    - any
  """
  def getPasswordExpiredDate(%{}) do
    # TODO: Implementacao futura
        # public function getPasswordExpiredDate($iPasswordExpiredForMembership, $mixedAccount = false)
    #     {
    #         if($iPasswordExpiredForMembership == 0)
    #             return 0;
    # 
    #         return $iPasswordExpiredForMembership * 86400 + $this->getPasswordChangedDate($mixedAccount);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isNeedChangePassword

  ## Parametros
    - iAccountId=false,oInformer=false

  ## Retorno
    - any
  """
  def isNeedChangePassword(%{}) do
    # TODO: Implementacao futura
        # public function isNeedChangePassword($iAccountId = false, $oInformer = false)
    #     {
    #         $iAccountId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    # 
    #         list($sPageLink, $aPageParams) = bx_get_base_url_inline();
    # 
    #         $sChangePasswordUri = 'account-settings-password';
    #         $bNeedRedirectToChangePassword = true;
    #         if(isset($aPageParams['i']) && $aPageParams['i'] == $sChangePasswordUri)
    #             $bNeedRedirectToChangePassword = false;
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-account-is_need_to_change_password 'account', 'is_need_to_change_password' - hook on after delete account 
    #          * - $unit_name - equals `account`
    #          * - $action - equals `is_need_to_change_password` 
    #          * - $object_id - account id 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `override_result` - [bool] by ref, if Need Redirect To Change Password = true, otherwise = false, can be overridden in hook processing
    #          * @hook @ref hook-account-is_need_to_change_password
    #          */
    #         bx_alert('account', 'is_need_to_change_password',  $iAccountId, false, [
    #             'override_result' => &$bNeedRedirectToChangePassword
    #         ]);
    # 
    #         if(!$bNeedRedirectToChangePassword)
    #             return;
    # 
    #         $aAccountInfo = $this->getInfo();
    #         $aMembershipInfo = BxDolAcl::getInstance()->getMemberMembershipInfo($aAccountInfo['profile_id']);
    #         $sChangePasswordUrl = BX_DOL_URL_ROOT . BxDolPermalinks::getInstance()->permalink('page.php?i=' . $sChangePasswordUri);
    # 
    #         if(($iPasswordExpiredDate = $this->getPasswordExpiredDate($aMembershipInfo['password_expired'], $aAccountInfo)) && $iPasswordExpiredDate < time()) {
    #             if(getParam('sys_account_accounts_force_password_change_after_expiration') == 'on') {
    #                 header('Location: ' . $sChangePasswordUrl);
    #                 exit;
    #             }
    #             else {
    #                 if(!$oInformer)
    #                     $oInformer = BxDolInformer::getInstance();
    # 
    #                 $oInformer->add('sys-account-need-to-change-password', _t('_sys_txt_account_need_to_change_password', $sChangePasswordUrl), BX_INFORMER_ALERT);
    #             }
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP doAudit

  ## Parametros
    - iAccountId,sAction,aData=[]

  ## Retorno
    - any
  """
  def doAudit(%{}) do
    # TODO: Implementacao futura
        # public function doAudit($iAccountId, $sAction, $aData = [])
    #     {
    #         $iAccountId = (int)$iAccountId ? (int)$iAccountId : $this->_iAccountID;
    # 
    #         bx_audit($iAccountId, 'bx_accounts', $sAction,  [
    #             'content_title' => $this->getEmail(), 
    #             'data' => $aData
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowedCreate

  ## Parametros
    - iProfileId,isPerformAction=false

  ## Retorno
    - any
  """
  def isAllowedCreate(%{}) do
    # TODO: Implementacao futura
        # public function isAllowedCreate ($iProfileId, $isPerformAction = false)
    #     {
    #         $aCheck = checkActionModule($iProfileId, 'create account', 'system', $isPerformAction);
    #         if ($aCheck[CHECK_ACTION_RESULT] !== CHECK_ACTION_RESULT_ALLOWED)
    #             return MsgBox($aCheck[CHECK_ACTION_MESSAGE]);
    #         return CHECK_ACTION_RESULT_ALLOWED;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowedCreateMultiple

  ## Parametros
    - iProfileId,isPerformAction=false

  ## Retorno
    - any
  """
  def isAllowedCreateMultiple(%{}) do
    # TODO: Implementacao futura
        # public function isAllowedCreateMultiple ($iProfileId, $isPerformAction = false)
    #     {
    #         $iLimit = (int)getParam('sys_account_limit_profiles_number');
    # 
    #         $bResult = false;
    #         if(isAdmin() || $iLimit != 1)
    #             $bResult = true;
    # 
    #         $oProfile = BxDolProfile::getInstance($iProfileId);
    #         if($iLimit == 1 && $oProfile->getModule() == 'system')
    #             $bResult = true;
    # 
    #         if($oProfile && $oProfile->getAccountId() != getLoggedId())
    #             $bResult = false;
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-account-allow_create_another_profile 'profile', 'allow_create_another_profile' - hook on check allow create profile 
    #          * - $unit_name - equals `profile`
    #          * - $action - equals `allow_create_another_profile` 
    #          * - $object_id - profile id 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `override_result` - [bool] by ref, if allow create another profile = true, otherwise = false, can be overridden in hook processing
    #          * @hook @ref hook-account-allow_create_another_profile
    #          */
    #         bx_alert('profile', 'allow_create_another_profile', $iProfileId, 0, [
    #             'override_result' => &$bResult
    #         ]);
    # 
    #         return $bResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowedEdit

  ## Parametros
    - iProfileId,aContentInfo,isPerformAction=false

  ## Retorno
    - any
  """
  def isAllowedEdit(%{}) do
    # TODO: Implementacao futura
        # public function isAllowedEdit ($iProfileId, $aContentInfo, $isPerformAction = false)
    #     {
    #         $oProfile = BxDolProfile::getInstance($iProfileId);
    #         if (!$oProfile)
    #             return _t('_sys_txt_access_denied');
    # 
    #         $aProfileInfo = $oProfile->getInfo();
    #         if (!$aProfileInfo || getLoggedId() != $aProfileInfo['account_id'])
    #             return _t('_sys_txt_access_denied');
    # 
    #         return CHECK_ACTION_RESULT_ALLOWED;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowedDelete

  ## Parametros
    - iProfileId,aContentInfo,isPerformAction=false

  ## Retorno
    - any
  """
  def isAllowedDelete(%{}) do
    # TODO: Implementacao futura
        # public function isAllowedDelete ($iProfileId, $aContentInfo, $isPerformAction = false)
    #     {
    #         $iAccountId = (int)BxDolProfile::getInstance($iProfileId)->getAccountId();
    #         if(isAdmin($iAccountId) && $iAccountId == (int)$aContentInfo['id'])
    #             return _t('_sys_txt_account_cannot_delete');
    # 
    #         $aCheck = checkActionModule($iProfileId, 'delete account', 'system', $isPerformAction);
    #         if ($aCheck[CHECK_ACTION_RESULT] !== CHECK_ACTION_RESULT_ALLOWED)
    #             return $aCheck[CHECK_ACTION_MESSAGE];
    # 
    #         return CHECK_ACTION_RESULT_ALLOWED;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP pruning

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def pruning(%{}) do
    # TODO: Implementacao futura
        # public function pruning ()
    #     {
    #         $iCount = 0;
    #         $iTime = time() - getParam('sys_account_accounts_pruning_interval') * 86400;
    #         $oAccountQuery = BxDolAccountQuery::getInstance();
    #         $aAccounts = [];
    #         $aAccountsSuspend = [];
    #         $bSuspend = false;
    #         $aPruning = explode(',', getParam('sys_account_accounts_pruning'));
    #         foreach ($aPruning as $sPruning) {
    #             switch($sPruning) {
    #                  case 'no_login_suspend':
    #                     $aAccountsSuspend = $oAccountQuery->getAccountsForPruning('no_login', $iTime);   
    #                     break;  
    # 
    #                 case 'no_login_delete':
    #                     $aAccounts = array_merge($aAccounts, $oAccountQuery->getAccountsForPruning('no_login', $iTime));   
    #                     break;
    # 
    # 
    # 
    #                 case 'no_confirm_delete':
    #                     $aAccounts1 = $oAccountQuery->getAccountsForPruning('no_confirm', $iTime);
    #                     foreach ($aAccounts1 as $k => $aAccount) {
    #                         $oAccount = BxDolAccount::getInstance($aAccount['id']);
    #                         if($oAccount->isConfirmed()){
    #                             unset($aAccounts1[$k]);
    #                         }
    #                     }
    #                     $aAccounts = array_merge($aAccounts, $aAccounts1);   
    #                     break;
    # 
    #                 case 'no_profile_delete':
    #                     $aAccounts = array_merge($aAccounts, $aAccounts = $oAccountQuery->getAccountsForPruning('no_profile', $iTime));
    #                     break;
    #             }
    #         }
    #         
    #         foreach ($aAccountsSuspend as $k => $aAccount) {
    #             $oAccount = BxDolAccount::getInstance($aAccount['id']);
    #             $oProfile = BxDolProfile::getInstanceAccountProfile($aAccount['id']);
    #             $oProfile->suspend(BX_PROFILE_ACTION_AUTO, 0 ,false);
    #             $aProfiles = $oAccount->getProfiles();
    #             foreach($aProfiles as $aProfile){
    #                 BxDolProfile::getInstance($aProfile['id'])->suspend(BX_PROFILE_ACTION_AUTO, 0 ,false);
    #             }
    #             $iCount++;
    #         }
    # 
    #         
    #         foreach ($aAccounts as $k => $aAccount) {
    #             $oAccount = BxDolAccount::getInstance($aAccount['id']);
    #             $oAccount->delete(false);
    #             $iCount++;
    #         }
    # 
    #         return $iCount;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getImageUrl

  ## Parametros
    - sSize,mixedData

  ## Retorno
    - any
  """
  def _getImageUrl(%{}) do
    # TODO: Implementacao futura
        # protected function _getImageUrl($sSize, $mixedData)
    #     {
    #         if(!is_array($mixedData))
    #             $mixedData = $this->getInfo((int)$mixedData);
    # 
    #         $sImageUrl = '';
    #         if(!empty($mixedData[$this->_sImageField]) && !empty($this->_aImageTranscoders[$sSize]) && ($oImagesTranscoder = BxDolTranscoderImage::getObjectInstance($this->_aImageTranscoders[$sSize])) !== false)
    #             $sImageUrl = $oImagesTranscoder->getFileUrl($mixedData[$this->_sImageField]);
    # 
    #         return $sImageUrl;
    #     }
    :ok
  end

end
