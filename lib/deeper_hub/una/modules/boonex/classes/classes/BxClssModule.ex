
defmodule DeeperHub.Inc.Classes.BxClssModule do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/classes/classes/BxClssModule.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - &aModule

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # 
    #     function __construct(&$aModule)
    #     {
    #         parent::__construct($aModule);
    # 
    #         $CNF = &$this->_oConfig->CNF;
    #         $this->_aSearchableNamesExcept = array_merge($this->_aSearchableNamesExcept, array(
    #             $CNF['FIELD_PUBLISHED'],
    #             $CNF['FIELD_CMTS_SETTINGS'],
    #             $CNF['FIELD_AVAIL_SETTINGS'],
    #             $CNF['FIELD_START_DATE'],
    #             $CNF['FIELD_END_DATE'],
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionMarkClassAsCompleted

  ## Parametros
    - iClassId=0

  ## Retorno
    - any
  """
  def actionMarkClassAsCompleted(%{}) do
    # TODO: Implementacao futura
        # public function actionMarkClassAsCompleted($iClassId = 0)
    #     {
    #         $iProfileId = bx_get_logged_profile_id();
    # 
    #         if (!($aClass = $this->_oDb->getContentInfoById($iClassId))) {
    #             echo _t('_sys_txt_not_found');
    #             return;
    #         }
    # 
    #         $mixedMsg = $this->checkAllowedMarkAsCompleted($aClass, $iProfileId);
    #         if (CHECK_ACTION_RESULT_ALLOWED !== $mixedMsg) {
    #             echo $mixedMsg;
    #             return;
    #         }
    # 
    #         if (!$this->_oDb->updateClassStatus($iClassId, $iProfileId, 'completed')) {
    #             echo _t('_sys_txt_error_occured');
    #             return;
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionReorderClasses

  ## Parametros
    - iProfileConextId=0

  ## Retorno
    - any
  """
  def actionReorderClasses(%{}) do
    # TODO: Implementacao futura
        # public function actionReorderClasses($iProfileConextId = 0)
    #     {
    #         $oProfileContext = $this->_validateActionAndGetContextProfile($iProfileConextId, 'html');
    # 
    #         foreach ($_REQUEST as $k => $v) {
    #             if (0 !== strncmp($k, 'classes_order_', 14))
    #                 continue;
    #             $iModuleId = (int)str_replace('classes_order_', '', $k);
    #             if (!$iModuleId)
    #                 continue;
    #             
    #             $aClassesOrder = explode(',', $v);
    #             if (!$aClassesOrder || !is_array($aClassesOrder))
    #                 continue;
    # 
    #             $this->_oDb->updateClassesOrder($iProfileConextId, $iModuleId, $aClassesOrder);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionReorderModules

  ## Parametros
    - iProfileConextId=0

  ## Retorno
    - any
  """
  def actionReorderModules(%{}) do
    # TODO: Implementacao futura
        # public function actionReorderModules($iProfileConextId = 0)
    #     {
    #         $oProfileContext = $this->_validateActionAndGetContextProfile($iProfileConextId, 'html');
    # 
    #         $aModulesOrder = bx_get('modules_order');
    #         if (!$aModulesOrder || !is_array($aModulesOrder)) {
    #             echo _t('_sys_txt_error_occured');
    #             exit;
    #         }
    # 
    #         $this->_oDb->updateModulesOrder($iProfileConextId, $aModulesOrder);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionDeleteModule

  ## Parametros
    - iProfileConextId=0,iModuleId=0

  ## Retorno
    - any
  """
  def actionDeleteModule(%{}) do
    # TODO: Implementacao futura
        # public function actionDeleteModule($iProfileConextId = 0, $iModuleId = 0)
    #     {
    #         $oProfileContext = $this->_validateActionAndGetContextProfile($iProfileConextId, 'html');
    # 
    #         if ($this->_oDb->getEntriesByModule($iModuleId)) {
    #             echo _t('_bx_classes_txt_err_modules_with_classes_cannot_be_deleted');
    #             exit;
    #         }
    # 
    #         if (!$this->_oDb->deleteModule($oProfileContext->id(), $iModuleId))
    #             echo _t('_sys_txt_error_occured');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionEditModule

  ## Parametros
    - iProfileConextId=0,iModuleId=0,sFormat='json'

  ## Retorno
    - any
  """
  def actionEditModule(%{}) do
    # TODO: Implementacao futura
        # public function actionEditModule($iProfileConextId = 0, $iModuleId = 0, $sFormat = 'json')
    #     {
    #         $this->_actionAddEditModule($iProfileConextId, $iModuleId, $sFormat);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionAddModule

  ## Parametros
    - iProfileConextId=0,sFormat='json'

  ## Retorno
    - any
  """
  def actionAddModule(%{}) do
    # TODO: Implementacao futura
        # public function actionAddModule($iProfileConextId = 0, $sFormat = 'json')
    #     {
    #         $this->_actionAddEditModule($iProfileConextId, 0, $sFormat);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _actionAddEditModule

  ## Parametros
    - iProfileConextId=0,iModuleId=0,sFormat='json'

  ## Retorno
    - any
  """
  def _actionAddEditModule(%{}) do
    # TODO: Implementacao futura
        # protected function _actionAddEditModule($iProfileConextId = 0, $iModuleId = 0, $sFormat = 'json')
    #     {
    #         $oProfileContext = $this->_validateActionAndGetContextProfile($iProfileConextId, $sFormat);
    # 
    #         $sFormAction = BX_DOL_URL_ROOT . 'modules/index.php?r=classes/';
    #         $sFormAction .= $iModuleId ? 'edit_module/' . $iProfileConextId . '/' . $iModuleId : 'add_module/' . $iProfileConextId;
    #         $aForm = array(
    #             'form_attrs' => array(
    #                 'id' => 'bx-classes-module-form',
    #                 'action' => $sFormAction,
    #                 'method' => 'post',
    #             ),
    #             'params' => array (
    #                 'db' => array(
    #                     'submit_name' => 'do_submit',
    #                     'table' => $this->_oConfig->CNF['TABLE_MODULES'],
    #                     'key' => 'id',
    #                 ),
    #             ),
    #             'inputs' => array(
    #                 'module_title' => array(
    #                     'type' => 'text',
    #                     'name' => 'module_title',
    #                     'caption' => _t('_bx_classes_form_entry_input_module_title'),
    #                     'checker' => array(
    #                         'func' => 'Avail',
    #                         'error' => _t('_bx_classes_form_entry_input_module_title_err'),
    #                     ),
    #                     'db' => array('pass' => 'Xss'),
    #                 ),
    #                 'submit' => array(
    #                     'type' => 'input_set',
    #                     0 => array (
    #                         'type' => 'submit',
    #                         'name' => 'do_submit',
    #                         'value' => _t('_Submit'),
    #                     ),
    #                     1 => array (
    #                         'type' => 'reset',
    #                         'name' => 'close',
    #                         'value' => _t('_Cancel'),
    #                         'attrs' => array(
    #                             'class' => 'bx-def-margin-sec-left',
    #                             'onclick' => "$('.bx-popup-applied:visible').dolPopupHide();",
    #                         ),
    #                     ),
    #                 ),
    #             ),
    #         );
    #         $oForm = new BxTemplFormView($aForm);
    # 
    #         if ($iModuleId && ($aModule = $this->_oDb->getModule($iProfileConextId, $iModuleId)))
    #             $oForm->initChecker($aModule);
    #         else
    #             $oForm->initChecker();
    # 
    #         if ($oForm->isSubmittedAndValid()) {
    # 
    #             if ($iModuleId) {
    #                 $oForm->update($iModuleId, array(
    #                     'changed' => time(),
    #                 ));
    #             } 
    #             else {
    #                 $iModuleId = $oForm->insert(array(
    #                     'profile_id' => $iProfileConextId,
    #                     'author' => bx_get_logged_profile_id(),
    #                     'added' => time(),
    #                     'changed' => time(),
    #                     'order' => $this->_oDb->getModuleMaxOrder ($iProfileConextId),
    #                 ));
    #             }
    #             if ($iModuleId) {
    #                 echoJson(array('action' => 'ReloadLessonsAndClosePopup'));
    #             }
    #             else {
    #                 echoJson(array('action' => 'ShowMsg', 'msg' => _t('_sys_txt_error_occured')));
    #             }
    #         } 
    #         else {
    #             echo $this->_oTemplate->parseHtmlByName('classes_add_module_form.html', array(
    #                 'form' => $oForm->getCode(),
    #                 'context_profile_id' => $iProfileConextId,
    #             ));
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _validateActionAndGetContextProfile

  ## Parametros
    - iProfileConextId=0,sFormat='json'

  ## Retorno
    - any
  """
  def _validateActionAndGetContextProfile(%{}) do
    # TODO: Implementacao futura
        # protected function _validateActionAndGetContextProfile($iProfileConextId = 0, $sFormat = 'json')
    #     {
    #         $oProfileContext = $iProfileConextId ? BxDolProfile::getInstance($iProfileConextId) : null;
    #         if (!$oProfileContext) {
    #             if ('json' == $sFormat)
    #                 echoJson(array('action' => 'ShowMsg', 'msg' => _t('_sys_txt_error_occured')));
    #             else
    #                 echo _t('_sys_txt_error_occured');
    #             exit;
    #         }
    # 
    #         if (!isAdmin() && !$this->serviceIsCourseAdmin($oProfileContext->id())) {
    #             if ('json' == $sFormat)
    #                 echoJson(array('action' => 'ShowMsg', 'msg' => _t('_sys_txt_access_denied')));
    #             else
    #                 echo _t('_sys_txt_access_denied');
    #             exit;
    #         }
    # 
    #         return $oProfileContext;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceCheckAllowedCommentsPost

  ## Parametros
    - iContentId,sObjectComments

  ## Retorno
    - any
  """
  def serviceCheckAllowedCommentsPost(%{}) do
    # TODO: Implementacao futura
        # public function serviceCheckAllowedCommentsPost($iContentId, $sObjectComments) 
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aContentInfo = $this->_oDb->getContentInfoById($iContentId);
    #         if ($aContentInfo && 1 == $aContentInfo[$CNF['FIELD_CMTS_SETTINGS']])
    #             return false;
    # 
    #         return parent::serviceCheckAllowedCommentsPost($iContentId, $sObjectComments);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceCheckAllowedCommentsView

  ## Parametros
    - iContentId,sObjectComments

  ## Retorno
    - any
  """
  def serviceCheckAllowedCommentsView(%{}) do
    # TODO: Implementacao futura
        # public function serviceCheckAllowedCommentsView($iContentId, $sObjectComments) 
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aContentInfo = $this->_oDb->getContentInfoById($iContentId);
    #         if (1 == $aContentInfo[$CNF['FIELD_CMTS_SETTINGS']])
    #             return false;
    # 
    #         return parent::serviceCheckAllowedCommentsView($iContentId, $sObjectComments);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceNextClass

  ## Parametros
    - iClassId=0

  ## Retorno
    - any
  """
  def serviceNextClass(%{}) do
    # TODO: Implementacao futura
        # public function serviceNextClass ($iClassId = 0)
    #     {
    #         return $this->_serviceNextClass ($iClassId, 'getNextEntry');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP servicePrevClass

  ## Parametros
    - iClassId=0

  ## Retorno
    - any
  """
  def servicePrevClass(%{}) do
    # TODO: Implementacao futura
        # public function servicePrevClass ($iClassId = 0)
    #     {
    #         return $this->_serviceNextClass ($iClassId, 'getPrevEntry');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _serviceNextClass

  ## Parametros
    - iClassId,sFunc

  ## Retorno
    - any
  """
  def _serviceNextClass(%{}) do
    # TODO: Implementacao futura
        # protected function _serviceNextClass ($iClassId, $sFunc)
    #     {
    #         if (!$iClassId)
    #             $iClassId = (int)bx_get('id');
    # 
    #         if (!($aClass = $this->_oDb->$sFunc ($iClassId)))
    #             return '';
    # 
    #         return $this->_getClassRow($aClass);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getClassRow

  ## Parametros
    - aClass,&iCounterCompleted=null,&iCounterAvail=null,&iCounterNa=null

  ## Retorno
    - any
  """
  def _getClassRow(%{}) do
    # TODO: Implementacao futura
        # protected function _getClassRow ($aClass, &$iCounterCompleted = null, &$iCounterAvail = null, &$iCounterNa = null)
    #     {
    #         $sStatusClass = '';
    #         // check class availability
    #         $mixedAvailability = $this->checkAllowedViewForProfile($aClass, bx_get_logged_profile_id());
    #         $sTip = '';
    #         if ($mixedAvailability !== CHECK_ACTION_RESULT_ALLOWED) {
    #             if (null !== $iCounterNa) ++$iCounterNa;
    #             $sStatusClass = 'bx-classes-class-status-na';
    #             $sTip = $mixedAvailability;
    #         }
    #         // check if class is completed
    #         elseif ($this->serviceIsClassCompleted($aClass['id'])) {
    #             if (null !== $iCounterCompleted) ++$iCounterCompleted;
    #             $sStatusClass = 'bx-classes-class-status-completed';
    #         }
    #         // class is available
    #         else {
    #             if (null !== $iCounterAvail) ++$iCounterAvail;
    #             $sStatusClass = 'bx-classes-class-status-avail';
    #         }
    # 
    #         $aContent = array (
    #             'title' => bx_process_output($aClass['title']),
    #             'url' => $this->serviceGetLink($aClass['id']),
    #             'tip' => $sTip,
    #             'date_created' => $aClass['added'] ? _t('_bx_classes_txt_added_x', bx_time_js($aClass['added'], BX_FORMAT_DATE_TIME)) : '',
    #             'start_date' => $aClass['start_date'] ? _t('_bx_classes_txt_start_x', bx_time_js($aClass['start_date'], BX_FORMAT_DATE_TIME)) : '',
    #             'end_date' => $aClass['end_date'] ? _t('_bx_classes_txt_due_x', bx_time_js($aClass['end_date'], BX_FORMAT_DATE_TIME)) : '',
    #         );
    # 
    #         return $this->_oTemplate->parseHtmlByName('classes_class_row.html', array(
    #             'id' => $aClass['id'],                        
    #             'status' => $sStatusClass,
    #             'bx_if:completed' => array(
    #                 'condition' => 'bx-classes-class-status-completed' == $sStatusClass,
    #                 'content' => $aContent,
    #             ),
    #             'bx_if:avail' => array(
    #                 'condition' => 'bx-classes-class-status-avail' == $sStatusClass,
    #                 'content' => $aContent,
    #             ),
    #             'bx_if:na' => array(
    #                 'condition' => 'bx-classes-class-status-na' == $sStatusClass,
    #                 'content' => $aContent,
    #             ),
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceClassesInContext

  ## Parametros
    - iContextProfileId=0

  ## Retorno
    - any
  """
  def serviceClassesInContext(%{}) do
    # TODO: Implementacao futura
        # public function serviceClassesInContext ($iContextProfileId = 0)
    #     {
    #         if (!$iContextProfileId)
    #             $iContextProfileId = (int)bx_get('profile_id');
    # 
    #         if (!($oContextProfile = BxDolProfile::getInstance($iContextProfileId)))
    #             return MsgBox(_t('_sys_txt_error_occured'));
    # 
    #         $mixedViewAllowed = $oContextProfile->checkAllowedProfileView();
    #         if (CHECK_ACTION_RESULT_ALLOWED !== $mixedViewAllowed)
    #             return MsgBox($mixedViewAllowed);
    # 
    #         $aInputs = array();
    #         $aModules = $this->_oDb->getEntriesModulesByContext($iContextProfileId);
    #         foreach ($aModules as $aModule) {
    #             $iCounterCompleted = 0;
    #             $iCounterAvail = 0;
    #             $iCounterNa = 0;
    # 
    #             $aInputs['module' . $aModule['id']] = array(
    #                 'type' => 'block_header',
    #                 'caption' => '&nbsp;' . bx_process_output($aModule['module_title']),
    #                 'collapsed' => false,
    #                 'attrs' => array('id' => 'module_' . $aModule['id'], 'class' => ''),
    #             );
    #             $aClasses = $this->_oDb->getEntriesByModule($aModule['id']);
    #             $sContent = '';
    #             if ($aClasses) {
    #                 foreach ($aClasses as $aClass) {
    #                     $sContent .= $this->_getClassRow($aClass, $iCounterCompleted, $iCounterAvail, $iCounterNa);
    #                 }
    #             }
    # 
    #             if (0 == $iCounterAvail) {
    #                 $aInputs['module' . $aModule['id']]['collapsed'] = true;
    #             }
    # 
    #             $aInputs['class_module' . $aModule['id']] = array(
    #                 'type' => 'custom',
    #                 'name' => 'class_module' . $aModule['id'],
    #                 'caption' => '',
    #                 'content' => $sContent,
    #             );
    # 
    #         }
    # 
    #         $aForm = array(
    #             'form_attrs' => array(
    #                 'id' => 'bx-classes-list-view',
    #             ),
    #             'inputs' => $aInputs,
    #         );
    #         $oForm = new BxTemplFormView($aForm);
    #         $oForm->setShowEmptySections(true);
    # 
    #         $bAdmin = isAdmin() || $this->serviceIsCourseAdmin($oContextProfile->id());
    # 
    #         $this->_oTemplate->addCss('main.css');
    #         $this->_oTemplate->addJs('main.js');
    #         if ($bAdmin)
    #             $this->_oTemplate->addJs('jquery-ui/jquery-ui.custom.min.js');
    # 
    #         return $this->_oTemplate->parseHtmlByName('classes_in_context.html', array(
    #             'form' => $aModules ? $oForm->getCode() : MsgBox(_t('_Empty')),
    #             'bx_if:edit_modules' => array(
    #                 'condition' => $bAdmin,
    #                 'content' => array(
    #                     'context_profile_id' => $iContextProfileId,
    #                 ),
    #             ),
    #             'bx_if:admin' => array(
    #                 'condition' => $bAdmin,
    #                 'content' => array(
    #                     'context_profile_id' => $iContextProfileId,
    #                     'new_class_url' => bx_absolute_url(BxDolPermalinks::getInstance()->permalink('page.php?i=create-class&profile_id=' . $oContextProfile->id())),
    #                 ),
    #             ),
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceIsClassCompleted

  ## Parametros
    - iClassId,iProfileId=0

  ## Retorno
    - any
  """
  def serviceIsClassCompleted(%{}) do
    # TODO: Implementacao futura
        # public function serviceIsClassCompleted ($iClassId, $iProfileId = 0)
    #     {
    #         if (!$iProfileId)
    #             $iProfileId = bx_get_logged_profile_id();
    # 
    #         return $this->_oDb->isClassCompleted($iClassId, $iProfileId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceIsCourseAdmin

  ## Parametros
    - iContextProfileId,iProfileId=0

  ## Retorno
    - any
  """
  def serviceIsCourseAdmin(%{}) do
    # TODO: Implementacao futura
        # public function serviceIsCourseAdmin ($iContextProfileId, $iProfileId = 0)
    #     {
    #         if (!$iProfileId)
    #             $iProfileId = bx_get_logged_profile_id();
    # 
    #         if (!($oProfileContext = BxDolProfile::getInstance($iContextProfileId)))
    #             return false;
    #         
    #         return bx_srv($oProfileContext->getModule(), 'is_admin', array($oProfileContext->id(), $iProfileId));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceIsClassAdmin

  ## Parametros
    - aDataEntry,iProfileId=0

  ## Retorno
    - any
  """
  def serviceIsClassAdmin(%{}) do
    # TODO: Implementacao futura
        # public function serviceIsClassAdmin ($aDataEntry, $iProfileId = 0)
    #     {
    #         if (!$iProfileId)
    #             $iProfileId = bx_get_logged_profile_id();
    # 
    #         if ($aDataEntry['allow_view_to'] >= 0 || !($oProfileContext = BxDolProfile::getInstance(abs($aDataEntry['allow_view_to']))))
    #             return false;
    #         
    #         return bx_srv($oProfileContext->getModule(), 'is_admin', array($oProfileContext->id(), $iProfileId));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceIsPrevClassCompleted

  ## Parametros
    - aDataEntry,iProfileId=0

  ## Retorno
    - any
  """
  def serviceIsPrevClassCompleted(%{}) do
    # TODO: Implementacao futura
        # public function serviceIsPrevClassCompleted ($aDataEntry, $iProfileId = 0)
    #     {
    #         if (!$iProfileId)
    #             $iProfileId = bx_get_logged_profile_id();
    # 
    #         if (!($aPrevClass = $this->_oDb->getPrevEntry ($aDataEntry['id'])))
    #             return true; // if there is no prev class it's considered as completed
    #         
    #         return $this->serviceIsClassCompleted($aPrevClass['id'], $iProfileId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceCheckAvailabilityForProfile

  ## Parametros
    - aDataEntry,iProfileId

  ## Retorno
    - any
  """
  def serviceCheckAvailabilityForProfile(%{}) do
    # TODO: Implementacao futura
        # public function serviceCheckAvailabilityForProfile ($aDataEntry, $iProfileId)
    #     {
    #         if (BX_CLASSES_AVAIL_ALWAYS == $aDataEntry['avail'] || isAdmin() || $this->serviceIsClassAdmin ($aDataEntry, $iProfileId))
    #             return CHECK_ACTION_RESULT_ALLOWED;
    # 
    #         // check start date
    #         $a = array(BX_CLASSES_AVAIL_AFTER_START_DATE, BX_CLASSES_AVAIL_AFTER_START_DATE_PREV_CLASS_COMPLETED, BX_CLASSES_AVAIL_BETWEEN_START_END_DATES, BX_CLASSES_AVAIL_BETWEEN_START_END_DATES_PREV_CLASS_COMPLETED);
    #         if (in_array($aDataEntry['avail'], $a) && $aDataEntry['start_date'] && $aDataEntry['start_date'] > time()) {
    #             return _t('_bx_classes_txt_err_not_avail_before_start_date', bx_time_js($aDataEntry['start_date'], BX_FORMAT_DATE_TIME, true));
    #         }
    # 
    #         // check due date
    #         $a = array(BX_CLASSES_AVAIL_BETWEEN_START_END_DATES, BX_CLASSES_AVAIL_BETWEEN_START_END_DATES_PREV_CLASS_COMPLETED);
    #         if (in_array($aDataEntry['avail'], $a) && $aDataEntry['end_date'] && $aDataEntry['end_date'] < time()) {
    #             return _t('_bx_classes_txt_err_not_avail_after_end_date', bx_time_js($aDataEntry['end_date'], BX_FORMAT_DATE_TIME, true));
    #         }
    # 
    #         // check availability
    #         $a = array(BX_CLASSES_AVAIL_PREV_CLASS_COMPLETED, BX_CLASSES_AVAIL_AFTER_START_DATE_PREV_CLASS_COMPLETED);
    #         if (in_array($aDataEntry['avail'], $a) && !$this->serviceIsPrevClassCompleted($aDataEntry, $iProfileId)) {
    #             if (!($aPrevClass = $this->_oDb->getPrevEntry ($aDataEntry['id'])))
    #                 return _t('_sys_txt_error_occured');
    #             return _t('_bx_classes_txt_err_not_avail_before_prev_class_completed', $this->serviceGetLink($aPrevClass['id']), bx_process_output($aPrevClass['title']));
    #         }
    #         
    # 
    #         return CHECK_ACTION_RESULT_ALLOWED;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _serviceCheckAllowedViewForProfile

  ## Parametros
    - aDataEntry,isPerformAction,iProfileId

  ## Retorno
    - any
  """
  def _serviceCheckAllowedViewForProfile(%{}) do
    # TODO: Implementacao futura
        # protected function _serviceCheckAllowedViewForProfile ($aDataEntry, $isPerformAction, $iProfileId)
    #     {
    #         $mixed = parent::_serviceCheckAllowedViewForProfile ($aDataEntry, $isPerformAction, $iProfileId);
    #         if (CHECK_ACTION_RESULT_ALLOWED === $mixed)
    #             return $this->serviceCheckAvailabilityForProfile ($aDataEntry, $iProfileId);
    #         else
    #             return $mixed;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkAllowedMarkAsCompleted

  ## Parametros
    - aClass,isPerformAction,iProfileId=0

  ## Retorno
    - any
  """
  def checkAllowedMarkAsCompleted(%{}) do
    # TODO: Implementacao futura
        # public function checkAllowedMarkAsCompleted($aClass, $isPerformAction, $iProfileId = 0)
    #     {
    #         if (!$iProfileId)
    #             $iProfileId = bx_get_logged_profile_id();
    # 
    #         $mixedMsg = $this->checkAllowedViewForProfile($aClass, $iProfileId);
    #         if (CHECK_ACTION_RESULT_ALLOWED !== $mixedMsg)
    #             return $mixedMsg;
    # 
    # 
    #         $a = array(
    #             BX_CLASSES_COMPLETED_WHEN_VIEWED => '_bx_classes_txt_err_view_class_needed_before_completion',
    #             BX_CLASSES_COMPLETED_WHEN_REPLIED => '_bx_classes_txt_err_reply_in_class_needed_before_completion',
    #         );
    #         if (isset($a[$aClass['completed_when']]) && !$this->_oDb->getClassStatus($aClass['id'], $iProfileId, (int)$aClass['completed_when']))
    #             return _t($a[$aClass['completed_when']]);
    # 
    #         return CHECK_ACTION_RESULT_ALLOWED;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkAllowedViewMarkAsCompletedButton

  ## Parametros
    - aClass,isPerformAction=false

  ## Retorno
    - any
  """
  def checkAllowedViewMarkAsCompletedButton(%{}) do
    # TODO: Implementacao futura
        # public function checkAllowedViewMarkAsCompletedButton($aClass, $isPerformAction = false)
    #     {
    #         if ($this->serviceIsClassCompleted($aClass['id']))
    #             return _t('_sys_txt_access_denied');
    #         else
    #             return CHECK_ACTION_RESULT_ALLOWED;
    #     }
    :ok
  end

end
