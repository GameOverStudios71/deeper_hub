
defmodule DeeperHub.Inc.Classes.BxCoursesGridCntStructureManage do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/courses/classes/BxCoursesGridCntStructureManage.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aOptions,oTemplate=false

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct ($aOptions, $oTemplate = false)
    #     {
    #         $this->_sModule = 'bx_courses';
    #         $this->_oModule = BxDolModule::getInstance($this->_sModule);
    # 
    #         parent::__construct ($aOptions, $oTemplate);
    # 
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $this->_iEntryId = 0;
    #         if(($iEntryId = bx_get('entry_id')) !== false)
    #             $this->setEntryId($iEntryId);
    # 
    #         $this->setParentId(($iParentId = bx_get('parent_id')) !== false ? $iParentId : 0);            
    # 
    #         $this->_iLevel = $this->_getNodeLevel();
    #         $this->_iLevelMax = $this->_oModule->_oConfig->getContentLevelMax();
    #         $this->_aLevelToNode = $this->_oModule->_oConfig->getContentLevel2Node();
    #         $this->_aLevelToNodePl = $this->_oModule->_oConfig->getContentLevel2Node(false);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setEntryId

  ## Parametros
    - iEntryId

  ## Retorno
    - any
  """
  def setEntryId(%{}) do
    # TODO: Implementacao futura
        # public function setEntryId($iEntryId)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $this->_iEntryId = (int)$iEntryId;
    #         $this->_iEntryPid = ($oProfile = BxDolProfile::getInstanceByContentAndType($this->_iEntryId, $this->_sModule)) !== false ? $oProfile->id() : 0;
    # 
    #         $this->_sPageUrl = BxDolPermalinks::getInstance()->permalink($CNF['URL_MANAGE_STRUCTURE'], ['profile_id' => $this->_iEntryPid]);
    # 
    #         $this->_aQueryAppend['entry_id'] = $this->_iEntryId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setParentId

  ## Parametros
    - iParentId

  ## Retorno
    - any
  """
  def setParentId(%{}) do
    # TODO: Implementacao futura
        # public function setParentId($iParentId)
    #     {
    #         $this->_iParentId = (int)$iParentId;
    # 
    #         $this->_aParentInfo = [];
    #         if($this->_iParentId)
    #             $this->_aParentInfo = $this->_oModule->_oDb->getContentNodes(['sample' => 'id_full', 'id' => $this->_iParentId]);
    # 
    #         $this->_aQueryAppend['parent_id'] = $this->_iParentId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCode

  ## Parametros
    - isDisplayHeader=true

  ## Retorno
    - any
  """
  def getCode(%{}) do
    # TODO: Implementacao futura
        # public function getCode ($isDisplayHeader = true)
    #     {
    #         if($this->_iLevel > $this->_iLevelMax)
    #             return '';
    # 
    #         return parent::getCode($isDisplayHeader);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFormBlockTitleAPI

  ## Parametros
    - sAction,iId=0

  ## Retorno
    - any
  """
  def getFormBlockTitleAPI(%{}) do
    # TODO: Implementacao futura
        # public function getFormBlockTitleAPI($sAction, $iId = 0)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $sResult = '';
    # 
    #         switch($sAction) {
    #             case 'add':
    #                 $sResult = $CNF['T']['popup_title_content_node_add'];
    #                 break;
    # 
    #             case 'edit':
    #                 $sResult = $CNF['T']['popup_title_content_node_edit'];
    #                 break;
    #         }
    # 
    #         return $this->_parseNodeName(_t($sResult));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFormCallBackUrlAPI

  ## Parametros
    - sAction,iId=0

  ## Retorno
    - any
  """
  def getFormCallBackUrlAPI(%{}) do
    # TODO: Implementacao futura
        # public function getFormCallBackUrlAPI($sAction, $iId = 0)
    #     {
    #          return '/api.php?r=system/perfom_action_api/TemplServiceGrid/&params[]=&o=' . $this->_sObject . '&a=' . $sAction . '&entry_id=' . $this->_iEntryId . '&parent_id=' . $this->_iParentId . '&id=' . $iId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCodeAPI

  ## Parametros
    - bForceReturn=false

  ## Retorno
    - any
  """
  def getCodeAPI(%{}) do
    # TODO: Implementacao futura
        # public function getCodeAPI($bForceReturn = false)
    #     {
    #         if($this->_iLevel > $this->_iLevelMax)
    #             return [];
    # 
    #         return parent::getCodeAPI($bForceReturn);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getActionsAPI

  ## Parametros
    - sType

  ## Retorno
    - any
  """
  def _getActionsAPI(%{}) do
    # TODO: Implementacao futura
        # protected function _getActionsAPI ($sType)
    #     {
    #         $aResult = parent::_getActionsAPI($sType);
    # 
    #         if($aResult && $sType == 'independent') {
    #             if(!empty($aResult['add']))
    #                 $aResult['add']['title'] = $this->_parseNodeName($aResult['add']['title']);
    #         }
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP performActionAdd

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def performActionAdd(%{}) do
    # TODO: Implementacao futura
        # public function performActionAdd()
    #     {
    #     	$CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #     	$sAction = 'add';
    # 
    #         $aEntryInfo = $this->_oModule->_oDb->getContentInfoById($this->_iEntryId);
    #         if(($mixedResult = $this->_oModule->checkAllowedEdit($aEntryInfo)) !== CHECK_ACTION_RESULT_ALLOWED)
    #             return $this->_getActionResult(['msg' => $mixedResult]);
    # 
    #         $sForm = $CNF['OBJECT_FORM_CNT_NODE_DISPLAY_ADD'];
    #     	$oForm = BxDolForm::getObjectInstance($CNF['OBJECT_FORM_CNT_NODE'], $CNF['OBJECT_FORM_CNT_NODE_DISPLAY_ADD']);
    #     	$oForm->setId($sForm);
    #         $oForm->setName($sForm);
    #         $oForm->setAction(BX_DOL_URL_ROOT . bx_append_url_params('grid.php', ['o' => $this->_sObject, 'a' => $sAction, 'entry_id' => $this->_iEntryId, 'parent_id' => $this->_iParentId]));
    #         $oForm->setData($this->_iParentId, $this->_iLevel);
    # 
    #         $oForm->initChecker();
    #         if($oForm->isSubmittedAndValid()) {
    # 
    #             $iId = (int)$oForm->insert(['entry_id' => $this->_iEntryId, 'added' => time()]);
    #             if($iId != 0) {
    #                 $this->_oModule->_oDb->insertContentStructureNode([
    #                     'entry_id' => $this->_iEntryId,
    #                     'parent_id' => $this->_iParentId,
    #                     'node_id' => $iId,
    #                     'level' => $this->_iLevel,
    #                     'order' => $this->_oModule->_oDb->getContentStructureOrderMax($this->_iEntryId, $this->_iParentId) + 1
    #                 ]);
    # 
    #                 if($this->_iLevel > 1) 
    #                     $this->_oModule->_oDb->updateContentStructureCounters($this->_iParentId, $this->_iLevel, 1);
    # 
    #                 $aResult = $this->_bIsApi ? [] : ['grid' => $this->getCode(false), 'blink' => $iId];
    #             }
    #             else
    #                 $aResult = ['msg' => _t($CNF['T']['err_cannot_perform'])];
    # 
    #             return $this->_getActionResult($aResult);
    #         }
    # 
    #         if($this->_bIsApi)
    #             return $this->getFormBlockAPI($oForm, $sAction);
    # 
    #         bx_import('BxTemplFunctions');
    #         $sContent = BxTemplFunctions::getInstance()->popupBox($this->_oModule->_oConfig->getHtmlIds('popup_content_node'), $this->_parseNodeName(_t($CNF['T']['popup_title_content_node_add'])), $this->_oModule->_oTemplate->parseHtmlByName('popup_content_node.html', [
    #             'form_id' => $oForm->getId(),
    #             'form' => $oForm->getCode(true),
    #             'object' => $this->_sObject,
    #             'action' => $sAction
    #         ]));
    # 
    #         echoJson(['popup' => ['html' => $sContent, 'options' => ['closeOnOuterClick' => false]]]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP performActionEdit

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def performActionEdit(%{}) do
    # TODO: Implementacao futura
        # public function performActionEdit()
    #     {
    #     	$CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $sAction = 'edit';
    # 
    #         $aEntryInfo = $this->_oModule->_oDb->getContentInfoById($this->_iEntryId);
    #         if(($mixedResult = $this->_oModule->checkAllowedEdit($aEntryInfo)) !== CHECK_ACTION_RESULT_ALLOWED)
    #             return $this->_getActionResult(['msg' => $mixedResult]);
    # 
    #         $aIds = $this->_getIds();
    #         if($aIds === false)
    #             return $this->_getActionResult([]);
    # 
    #         $aNode = $this->_oModule->_oDb->getContentNodes(['sample' => 'id', 'id' => array_shift($aIds)]);
    #         if(!is_array($aNode) || empty($aNode))
    #             return $this->_getActionResult([]);
    # 
    #         $sForm = $CNF['OBJECT_FORM_CNT_NODE_DISPLAY_EDIT'];
    #         $oForm = BxDolForm::getObjectInstance($CNF['OBJECT_FORM_CNT_NODE'], $CNF['OBJECT_FORM_CNT_NODE_DISPLAY_EDIT']);
    #         $oForm->setId($sForm);
    #         $oForm->setName($sForm);
    #     	$oForm->setAction(BX_DOL_URL_ROOT . bx_append_url_params('grid.php', ['o' => $this->_sObject, 'a' => $sAction, 'entry_id' => $this->_iEntryId, 'parent_id' => $this->_iParentId, 'id' => $aNode['id']]));
    #         $oForm->setData($this->_iParentId);
    # 
    #         $oForm->initChecker($aNode);
    #         if($oForm->isSubmittedAndValid()) {
    #             if($oForm->update($aNode['id']) !== false)
    #                 $aResult = $this->_bIsApi ? [] : ['grid' => $this->getCode(false), 'blink' => $aNode['id']];
    #             else
    #                 $aResult = ['msg' => _t($CNF['T']['err_cannot_perform'])];
    # 
    #             return $this->_getActionResult($aResult);
    #         }
    # 
    #         if($this->_bIsApi)
    #             return $this->getFormBlockAPI($oForm, $sAction, $aNode['id']);
    # 
    #         bx_import('BxTemplFunctions');
    #         $sContent = BxTemplFunctions::getInstance()->popupBox($this->_oModule->_oConfig->getHtmlIds('popup_content_node'), $this->_parseNodeName(_t($CNF['T']['popup_title_content_node_edit'])), $this->_oModule->_oTemplate->parseHtmlByName('popup_content_node.html', [
    #             'form_id' => $oForm->getId(),
    #             'form' => $oForm->getCode(true),
    #             'object' => $this->_sObject,
    #             'action' => $sAction
    #         ]));
    # 
    #         return echoJson(['popup' => ['html' => $sContent, 'options' => ['closeOnOuterClick' => false]]]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getCellHeaderCnL2

  ## Parametros
    - sKey,aField

  ## Retorno
    - any
  """
  def _getCellHeaderCnL2(%{}) do
    # TODO: Implementacao futura
        # protected function _getCellHeaderCnL2($sKey, $aField)
    #     {
    #         if($this->_iLevelMax < 2 || $this->_iLevel >= 2)
    #             return $this->_bIsApi ? [] : '';
    # 
    #         $aField['title'] = ucfirst($this->_aLevelToNodePl[2]);
    #         return parent::_getCellHeaderDefault($sKey, $aField);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getCellHeaderCnL3

  ## Parametros
    - sKey,aField

  ## Retorno
    - any
  """
  def _getCellHeaderCnL3(%{}) do
    # TODO: Implementacao futura
        # protected function _getCellHeaderCnL3($sKey, $aField)
    #     {
    #         if($this->_iLevelMax < 3 || $this->_iLevel >= 3)
    #             return $this->_bIsApi ? [] : '';
    # 
    #         $aField['title'] = ucfirst($this->_aLevelToNodePl[3]);
    #         return parent::_getCellHeaderDefault($sKey, $aField);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getCellHeaderCounters

  ## Parametros
    - sKey,aField

  ## Retorno
    - any
  """
  def _getCellHeaderCounters(%{}) do
    # TODO: Implementacao futura
        # protected function _getCellHeaderCounters($sKey, $aField)
    #     {
    #         if($this->_iLevel != $this->_iLevelMax)
    #             return $this->_bIsApi ? [] : '';
    # 
    #         return parent::_getCellHeaderDefault($sKey, $aField);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getCellTitle

  ## Parametros
    - mixedValue,sKey,aField,aRow

  ## Retorno
    - any
  """
  def _getCellTitle(%{}) do
    # TODO: Implementacao futura
        # protected function _getCellTitle($mixedValue, $sKey, $aField, $aRow)
    #     {
    #         $sLink = bx_append_url_params($this->_sPageUrl, ['parent_id' => $aRow['id']]);
    # 
    #         if($this->_bIsApi)
    #             return ['type' => 'link', 'data' => [
    #                 'text' => $mixedValue,
    #                 'url' => bx_api_get_relative_url($sLink)
    #             ]];
    # 
    #         $mixedValue = $this->_oModule->_oTemplate->parseHtmlByName('name_link.html', [
    #             'href' => $sLink,
    #             'title' => bx_html_attribute($mixedValue),
    #             'content' => $mixedValue
    #         ]);
    # 
    #         return parent::_getCellDefault($mixedValue, $sKey, $aField, $aRow);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getCellCnL2

  ## Parametros
    - mixedValue,sKey,aField,aRow

  ## Retorno
    - any
  """
  def _getCellCnL2(%{}) do
    # TODO: Implementacao futura
        # protected function _getCellCnL2($mixedValue, $sKey, $aField, $aRow)
    #     {
    #         if($this->_iLevelMax < 2 || $this->_iLevel >= 2)
    #             return $this->_bIsApi ? [] : '';
    # 
    #         return parent::_getCellDefault($mixedValue, $sKey, $aField, $aRow);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getCellCnL3

  ## Parametros
    - mixedValue,sKey,aField,aRow

  ## Retorno
    - any
  """
  def _getCellCnL3(%{}) do
    # TODO: Implementacao futura
        # protected function _getCellCnL3($mixedValue, $sKey, $aField, $aRow)
    #     {
    #         if($this->_iLevelMax < 3 || $this->_iLevel >= 3)
    #             return $this->_bIsApi ? [] : '';
    # 
    #         return parent::_getCellDefault($mixedValue, $sKey, $aField, $aRow);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getCellCounters

  ## Parametros
    - mixedValue,sKey,aField,aRow

  ## Retorno
    - any
  """
  def _getCellCounters(%{}) do
    # TODO: Implementacao futura
        # protected function _getCellCounters($mixedValue, $sKey, $aField, $aRow)
    #     {
    #         if($this->_iLevel != $this->_iLevelMax)
    #             return $this->_bIsApi ? [] : '';
    # 
    #         $mixedCounters = '';
    #         if(!empty($mixedValue) && ($aCounters = json_decode(html_entity_decode($mixedValue), true)))
    #             $mixedCounters = $this->_oModule->_oTemplate->getCounters($aCounters);
    # 
    #         if($this->_bIsApi) {
    #             $sResult = '';
    #             foreach($mixedCounters as $sUsage => $aCounters) {
    #                 foreach($aCounters as $iKey => $aCounter)
    #                     $aCounters[$iKey] = $aCounter['value'] . ' ' . $aCounter['title'];
    #                 
    #                 $sResult .= ucfirst(_t('_bx_courses_txt_' . $sUsage)) . ': ' . implode(', ', $aCounters) . ' ';
    #             }
    # 
    #             return ['type' => 'text', 'value' => trim($sResult)];
    #         }
    # 
    #         return parent::_getCellDefault($mixedCounters, $sKey, $aField, $aRow);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getCellAdded

  ## Parametros
    - mixedValue,sKey,aField,aRow

  ## Retorno
    - any
  """
  def _getCellAdded(%{}) do
    # TODO: Implementacao futura
        # protected function _getCellAdded($mixedValue, $sKey, $aField, $aRow)
    #     {
    #         if($this->_bIsApi)
    #             return ['type' => 'time', 'data' => $mixedValue];
    # 
    #         return parent::_getCellDefault(bx_time_js($mixedValue), $sKey, $aField, $aRow);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getActionBack

  ## Parametros
    - sType,sKey,a,isSmall=false,isDisabled=false,aRow=[]

  ## Retorno
    - any
  """
  def _getActionBack(%{}) do
    # TODO: Implementacao futura
        # protected function _getActionBack($sType, $sKey, $a, $isSmall = false, $isDisabled = false, $aRow = [])
    #     {
    #         if(empty($this->_aParentInfo))
    #             return $this->_bIsApi ? [] : '';
    # 
    #         $sUrl = $this->_sPageUrl;
    #         if(!empty($this->_aParentInfo['parent_id']))
    #             $sUrl = bx_append_url_params($sUrl, ['parent_id' => $this->_aParentInfo['parent_id']]);
    # 
    #         if($this->_bIsApi)
    #             return array_merge($a, ['name' => $sKey, 'type' => 'link', 'link' => bx_api_get_relative_url($sUrl)]);
    # 
    #         $a['attr'] = array_merge($a['attr'], [
    #             "onclick" => "window.open('" . $sUrl . "','_self');"
    #     	]);
    # 
    #     	return $this->_getActionDefault ($sType, $sKey, $a, $isSmall, $isDisabled, $aRow);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getActionAdd

  ## Parametros
    - sType,sKey,a,isSmall=false,isDisabled=false,aRow=[]

  ## Retorno
    - any
  """
  def _getActionAdd(%{}) do
    # TODO: Implementacao futura
        # protected function _getActionAdd($sType, $sKey, $a, $isSmall = false, $isDisabled = false, $aRow = [])
    #     {
    #         if($this->_iLevel > $this->_iLevelMax)
    #             return '';
    # 
    #         $a['title'] = $this->_parseNodeName($a['title']);
    #     	return $this->_getActionDefault ($sType, $sKey, $a, $isSmall, $isDisabled, $aRow);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _delete

  ## Parametros
    - mixedId

  ## Retorno
    - any
  """
  def _delete(%{}) do
    # TODO: Implementacao futura
        # protected function _delete($mixedId)
    #     {
    #         if($this->_iLevel > 1) 
    #             $this->_oModule->_oDb->updateContentStructureCounters($this->_iParentId, $this->_iLevel, -1);
    # 
    #         $this->_oModule->_oDb->deleteContentStructureNode(['node_id' => (int)$mixedId]);
    # 
    #         return parent::_delete($mixedId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getDataSql

  ## Parametros
    - sFilter,sOrderField,sOrderDir,iStart,iPerPage

  ## Retorno
    - any
  """
  def _getDataSql(%{}) do
    # TODO: Implementacao futura
        # protected function _getDataSql($sFilter, $sOrderField, $sOrderDir, $iStart, $iPerPage)
    #     {
    #         if(!$this->_iEntryId)
    #             return [];
    # 
    #         $this->_aOptions['source'] .= $this->_oModule->_oDb->prepareAsString(" AND `tcn`.`entry_id`=? AND `tcs`.`parent_id`=?", $this->_iEntryId, $this->_iParentId);
    # 
    #         return parent::_getDataSql($sFilter, $sOrderField, $sOrderDir, $iStart, $iPerPage);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _updateOrder

  ## Parametros
    - mixedId,iOrder

  ## Retorno
    - any
  """
  def _updateOrder(%{}) do
    # TODO: Implementacao futura
        # protected function _updateOrder($mixedId, $iOrder)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $sTable = $CNF['TABLE_CNT_STRUCTURE'];
    #         $sFieldId = 'node_id';
    #         $sFieldOrder = $this->_aOptions['field_order'];
    # 
    #         return BxDolDb::getInstance()->query("UPDATE `{$sTable}` SET `{$sFieldOrder}` = :order WHERE `{$sFieldId}` = :id", [
    #             'id' => $mixedId,
    #             'order' => $iOrder
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _switcherChecked2State

  ## Parametros
    - isChecked

  ## Retorno
    - any
  """
  def _switcherChecked2State(%{}) do
    # TODO: Implementacao futura
        # protected function _switcherChecked2State($isChecked)
    #     {
    #         return $isChecked ? 'active' : 'hidden';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _switcherState2Checked

  ## Parametros
    - mixedState

  ## Retorno
    - any
  """
  def _switcherState2Checked(%{}) do
    # TODO: Implementacao futura
        # protected function _switcherState2Checked($mixedState)
    #     {
    #         return 'active' == $mixedState ? true : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getNodeLevel

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getNodeLevel(%{}) do
    # TODO: Implementacao futura
        # protected function _getNodeLevel()
    #     {
    #         return $this->_oModule->getNodeLevelByParent($this->_aParentInfo);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _parseNodeName

  ## Parametros
    - s

  ## Retorno
    - any
  """
  def _parseNodeName(%{}) do
    # TODO: Implementacao futura
        # protected function _parseNodeName($s)
    #     {
    #         return bx_replace_markers($s, [
    #             'node' => isset($this->_aLevelToNode[$this->_iLevel]) ? $this->_aLevelToNode[$this->_iLevel]: _t('_undefined')
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getIds

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getIds(%{}) do
    # TODO: Implementacao futura
        # protected function _getIds()
    #     {
    #         $aIds = bx_get('ids');
    #         if(!$aIds || !is_array($aIds)) {
    #             $iId = (int)bx_get('id');
    #             if(!$iId) 
    #                 return false;
    # 
    #             $aIds = [$iId];
    #         }
    # 
    #         return $aIds;
    #     }
    :ok
  end

end
