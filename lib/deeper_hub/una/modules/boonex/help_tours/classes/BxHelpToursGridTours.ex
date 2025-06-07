
defmodule DeeperHub.Inc.Classes.BxHelpToursGridTours do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/help_tours/classes/BxHelpToursGridTours.php
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
    #         $this->_sModule = 'bx_help_tours';
    #     	$this->_oModule = BxDolModule::getInstance($this->_sModule);
    #     	if(!$oTemplate)
    #             $oTemplate = $this->_oModule->_oTemplate;
    # 
    #         parent::__construct ($aOptions, $oTemplate);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getCellPage

  ## Parametros
    - mixedValue,sKey,aField,aRow

  ## Retorno
    - any
  """
  def _getCellPage(%{}) do
    # TODO: Implementacao futura
        # protected function _getCellPage($mixedValue, $sKey, $aField, $aRow)
    #     {
    #         $aPageTitle = $this->_oModule->_oDb->getPageTitleDetails($mixedValue);
    #         if ($aPageTitle)
    #             $mixedValue = $aPageTitle['module_title'].': '._t($aPageTitle['title_system']);
    # 
    #         return parent::_getCellDefault($mixedValue, $sKey, $aField, $aRow);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getCellItems

  ## Parametros
    - mixedValue,sKey,aField,aRow

  ## Retorno
    - any
  """
  def _getCellItems(%{}) do
    # TODO: Implementacao futura
        # protected function _getCellItems($mixedValue, $sKey, $aField, $aRow)
    #     {
    #         $sLink = 'javascript: glGrids.'.$this->_sObject.'.action(\'edit_items\', {id: '.$aRow['id'].'});';
    #         $mixedValue = $this->_oTemplate->parseLink($sLink, _t('_bx_help_tours_cpt_items_cnt', $this->_oModule->_oDb->getHelpTourItemsCount($aRow['id'])));
    #         return parent::_getCellDefault($mixedValue, $sKey, $aField, $aRow);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAddEditForm

  ## Parametros
    - iEntry

  ## Retorno
    - any
  """
  def getAddEditForm(%{}) do
    # TODO: Implementacao futura
        # private function getAddEditForm($iEntry) {
    #         $aEntry = false;
    # 
    #         if ($iEntry) {
    #             $aEntry = $this->_oModule->_oDb->getTourDetails($iEntry);
    #             if (!$aEntry) {
    #                 echoJson([]);
    #                 exit;
    #             }
    #         }
    # 
    #         $iTourVisibility = !$iEntry ? BX_DOL_INT_MAX : $this->_oModule->_oDb->getTourVisibility($iEntry);
    #         if (bx_get('visible_for'))
    #             $iTourVisibility = BxDolStudioUtils::getVisibilityValue(bx_get('visible_for'), bx_get('visible_for_levels'));
    #         $oForm = $this->getAddEditFormObject($iEntry, $iTourVisibility);
    # 
    #         $oForm->aFormAttrs['action'] = BX_DOL_URL_ROOT.'grid.php?o=' . $this->_sObject . '&a='.($aEntry ? 'edit' : 'add');
    # 
    #         $oForm->initChecker($aEntry);
    # 
    #         if ($oForm->isSubmittedAndValid()) {
    #             if ($aEntry) {
    #                 $oForm->update($aEntry['id']);
    #                 $iResult = $aEntry['id'];
    #             } else {
    #                 $iResult = $oForm->insert();
    #             }
    # 
    #             if ($iResult) {
    #                 $this->_oModule->_oDb->putHelpTourOnPage($iResult, $aEntry ? $aEntry['page'] : '', $iTourVisibility);
    #                 $aRes = ['grid' => $this->getCode(false), 'blink' => $iResult];
    #             } else {
    #                 $aRes = ['msg' => "Error occured"]; // if record adding failed, display error message
    #             }
    #             echoJson($aRes);
    #         } else {
    #             $s = '
    #                 <div>' . $oForm->getCode(true) . '</div>                
    #                 <script>                    
    #                     $(document).ready(function () {
    #                         $("#'.$oForm->aFormAttrs['id'].'").ajaxForm({
    #                             dataType: "json",
    #                             beforeSubmit: function (formData, jqForm, options) {
    #                                 bx_loading($("#' . $oForm->aFormAttrs['id'] . '"), true);
    #                             },
    #                             success: function (data) {
    #                                 $(".bx-popup-active:visible").dolPopupHide();
    #                                 glGrids.' . $this->_sObject . '.processJson(data, "'.($aEntry ? 'edit' : 'add').'");
    #                             }
    #                         });
    #                     });
    #                 </script>';
    # 
    #             echoJson(['popup' => [
    #                 'html' => BxTemplStudioFunctions::getInstance()->popupBox('bx-tour-details-popup', _t('_bx_help_tours_cpt_tour_details'), $s),
    #                 'options' => [
    #                     'onBeforeShow' => empty($aEntry) ? "$('#grid-popup-bx_help_tours_tours-edit').remove();" : "$('#grid-popup-bx_help_tours_tours-add').remove();",
    #                     'closeOnOuterClick' => false,
    #                 ]]]
    #             );
    #         }
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
    #         return $this->getAddEditForm(0);
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
    #         $iEntry = !is_null($_REQUEST) && isset($_REQUEST['id']) ? intval($_REQUEST['id']) : intval($_REQUEST['ids'][0]);
    #         if(!$iEntry) {
    #             echoJson([]);
    #             exit;
    #         }
    # 
    #         return $this->getAddEditForm($iEntry);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP performActionEditItems

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def performActionEditItems(%{}) do
    # TODO: Implementacao futura
        # public function performActionEditItems()
    #     {
    #         $iTourId = !is_null($_REQUEST) && isset($_REQUEST['id']) ? intval($_REQUEST['id']) : intval($_REQUEST['ids'][0]);
    # 
    #         if (!$iTourId) {
    #             echoJson(array());
    #             exit;
    #         }
    # 
    #         echoJson(array(
    #             'redirect' => BX_DOL_URL_STUDIO.'module.php?name=' . $this->_sModule . '&tour=' . $iTourId . '&page=items',
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP performActionDelete

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def performActionDelete(%{}) do
    # TODO: Implementacao futura
        # public function performActionDelete() {
    #         $aIds = bx_get('ids');
    #         if (!$aIds || !is_array($aIds)) {
    #             echoJson(array());
    #             exit;
    #         }
    # 
    #         $oLanguage = BxDolStudioLanguagesUtils::getInstance();
    # 
    #         foreach ($aIds as $iEntry) {
    #             $this->_oModule->_oDb->deleteHelpTourBlock($iEntry);
    #             $this->_oModule->_oDb->deleteHelpTourTrackingData($iEntry);
    # 
    #             $aItems = $this->_oModule->_oDb->getHelpTourItems($iEntry);
    #             if ($aItems) foreach ($aItems as $aItem) {
    #                 $oLanguage->deleteLanguageString($aItem['title']);
    #                 $oLanguage->deleteLanguageString($aItem['text']);
    #             }
    # 
    #             $this->_oModule->_oDb->deleteHelpTourItems($iEntry);
    #             $this->_delete($iEntry);
    #         }
    # 
    #         echoJson(array(
    #             'grid' => $this->getCode(false),
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAddEditFormObject

  ## Parametros
    - iEntry,iVisibility=BX_DOL_INT_MAX

  ## Retorno
    - any
  """
  def getAddEditFormObject(%{}) do
    # TODO: Implementacao futura
        # private function getAddEditFormObject($iEntry, $iVisibility = BX_DOL_INT_MAX) {
    #         $aForm = [
    #             'form_attrs' => [
    #                 'method' => 'post',
    #                 'action' => '',
    #                 'id' => 'bx-help-tour-details-form',
    #             ],
    #             'params' => [
    #                 'db' => [
    #                     'submit_name' => 'submit',
    #                     'table' => 'bx_help_tours',
    #                     'key' => 'id',
    #                     'uri' => '',
    #                     'uri_title' => '',
    #                 ],
    #             ],
    #             'inputs' => [
    #                 'id' => [
    #                     'type' => 'hidden',
    #                     'name' => 'id',
    #                     'value' => $iEntry,
    #                 ],
    #                 'page' => [
    #                     'type' => 'select',
    #                     'name' => 'page',
    #                     'required' => true,
    #                     'caption' => _t('_bx_help_tours_form_field_page'),
    #                     'values' => ['' => _t('_sys_please_select')] + $this->_oModule->_oDb->getSitePages(),
    #                     'checker' => [
    #                         'func' => 'Avail',
    #                         'error' => _t('_bx_help_tours_form_field_page_error'),
    #                     ],
    #                     'db' => [
    #                         'pass' => 'Xss',
    #                     ],
    #                 ],
    #                 'overlay' => [
    #                     'type' => 'switcher',
    #                     'name' => 'overlay',
    #                     'caption' => _t('_bx_help_tours_form_field_overlay'),
    #                     'info' => _t('_bx_help_tours_form_field_overlay_info'),
    #                     'value' => 1,
    #                     'db' => [
    #                         'pass' => 'Int',
    #                     ],
    #                 ],
    #                 'visible_for' => [
    #                     'type' => 'select',
    #                     'name' => 'visible_for',
    #                     'caption' => _t('_bx_help_tours_form_field_visible_for'),
    #                     'value' => $iVisibility == BX_DOL_INT_MAX ? BX_DOL_STUDIO_VISIBLE_ALL : BX_DOL_STUDIO_VISIBLE_SELECTED,
    #                     'values' => [
    #                         ['key' => BX_DOL_STUDIO_VISIBLE_ALL, 'value' => _t('_bx_help_tours_form_field_visible_for_all')],
    #                         ['key' => BX_DOL_STUDIO_VISIBLE_SELECTED, 'value' => _t('_bx_help_tours_form_field_visible_for_selected')],
    #                     ],
    #                     'attrs' => [
    #                         'onchange' => "$('#bx-form-element-visible_for_levels').bx_anim(this.value == 'all' ? 'hide' : 'show')",
    #                     ],
    #                 ],
    #                 'visible_for_levels' => [
    #                     'type' => 'checkbox_set',
    #                     'name' => 'visible_for_levels',
    #                     'caption' => _t('_bx_help_tours_form_field_visible_for_levels'),
    #                     'value' => '',
    #                     'values' => [],
    #                     'tr_attrs' => [
    #                         'style' => $iVisibility == BX_DOL_INT_MAX ? 'display:none' : ''
    #                     ],
    #                 ],
    #                 'actions' => [
    #                     'type' => 'input_set',
    #                     0 => [
    #                         'type' => 'submit',
    #                         'name' => 'submit',
    #                         'value' => _t('_Submit'),
    #                     ],
    #                     1 => [
    #                         'type' => 'button',
    #                         'name' => 'cancel',
    #                         'value' => _t('_Cancel'),
    #                         'attrs' => [
    #                             'style' => 'margin-left: 20px;',
    #                             'onclick' => '$(".bx-popup-active:visible").dolPopupHide();',
    #                         ],
    #                     ],
    #                 ],
    #             ],
    #         ];
    #         BxDolStudioUtils::getVisibilityValues($iVisibility, $aForm['inputs']['visible_for_levels']['values'], $aForm['inputs']['visible_for_levels']['value']);
    # 
    #         return new BxTemplFormView($aForm);
    #     }
    :ok
  end

end
