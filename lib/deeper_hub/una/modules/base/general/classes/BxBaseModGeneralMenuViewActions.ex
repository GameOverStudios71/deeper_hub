
defmodule DeeperHub.Inc.Classes.BxBaseModGeneralMenuViewActions do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/general/classes/BxBaseModGeneralMenuViewActions.php
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
    #         parent::__construct($aObject, $oTemplate);
    # 
    #         $this->_oModule = BxDolModule::getInstance($this->_sModule);
    # 
    #         $this->setContentId(bx_process_input(bx_get('id'), BX_DATA_INT));
    # 
    #         $this->_oMenuActions = null;
    #         $this->_oMenuActionsMore = null;
    #         $this->_oMenuSocialSharing = null;
    # 
    #         $this->_sTmplContent = $this->_oTemplate->getHtml($this->getTemplateName('menu_custom_actions.html'));
    #         $this->_sTmplContentItem = $this->_oTemplate->getHtml($this->getTemplateNameItem('menu_custom_item_actions.html'));
    #         $this->_bShowAsButton = true;
    #         $this->_bShowTitle = true;
    #         $this->_sClassMiSa = 'bx-base-general-ea-sa';
    # 
    #         $this->addMarkers(array(
    #             'module' => $this->_oModule->_oConfig->getName(),
    #             'module_uri' => $this->_oModule->_oConfig->getUri(),
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addMarkers

  ## Parametros
    - a

  ## Retorno
    - any
  """
  def addMarkers(%{}) do
    # TODO: Implementacao futura
        # public function addMarkers($a)
    #     {
    #         $bResult = parent::addMarkers($a);
    #         if($bResult) {
    #             if(empty($this->_oMenuSocialSharing))
    #                 $this->_initMenuSocialSharing();
    # 
    #             //it still may be false in case the sys_social_sharing menu is turned off
    #             if (!empty($this->_oMenuSocialSharing)) {
    #                 $this->_oMenuSocialSharing->addMarkers($a);
    #                 parent::addMarkers($this->_oMenuSocialSharing->getMarkers());
    #             }
    #         }
    # 
    #         return $bResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setContentId

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def setContentId(%{}) do
    # TODO: Implementacao futura
        # public function setContentId($iContentId)
    #     {
    #         $this->_iContentId = (int)$iContentId;
    # 
    #         $this->_aContentInfo = $this->_oModule->_oDb->getContentInfoById($this->_iContentId);
    #         if($this->_aContentInfo)
    #             $this->addMarkers(array('content_id' => (int)$this->_iContentId));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setShowAsButton

  ## Parametros
    - bShowAsButton

  ## Retorno
    - any
  """
  def setShowAsButton(%{}) do
    # TODO: Implementacao futura
        # public function setShowAsButton($bShowAsButton)
    #     {
    #         $this->_bShowAsButton = $bShowAsButton;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isVisible

  ## Parametros
    - a

  ## Retorno
    - any
  """
  def _isVisible(%{}) do
    # TODO: Implementacao futura
        # protected function _isVisible($a)
    #     {
    #         if(!parent::_isVisible($a))
    #             return false;
    # 
    #         return $this->_oModule->isMenuItemVisible($this->_sObject, $a, $this->_aContentInfo);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isContentPublic

  ## Parametros
    - iContentId,aPublicGroups=[]

  ## Retorno
    - any
  """
  def _isContentPublic(%{}) do
    # TODO: Implementacao futura
        # protected function _isContentPublic($iContentId, $aPublicGroups = [])
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if(empty($CNF['FIELD_ALLOW_VIEW_TO'])) 
    #             return true;
    # 
    #         $aContentInfo = $iContentId == $this->_iContentId ? $this->_aContentInfo : $this->_oModule->_oDb->getContentInfoById($iContentId);
    #         if(!isset($aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']]))
    #             return true;
    # 
    #         if(empty($aPublicGroups))
    #             $aPublicGroups = [BX_DOL_PG_ALL, BX_DOL_PG_MEMBERS];
    # 
    #         return in_array($aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']], $aPublicGroups);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _initMenuSocialSharing

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _initMenuSocialSharing(%{}) do
    # TODO: Implementacao futura
        # protected function _initMenuSocialSharing()
    #     {
    #         $this->_oMenuSocialSharing = BxDolMenu::getObjectInstance('sys_social_sharing');
    #         if(!$this->_oMenuSocialSharing)
    #             return false;
    # 
    #         /**
    #          * Adding current markers to social sharing menu object to force it to generate its own markers.
    #          * Getting generated social sharing markers back and adding all of them to current menu object. So, now these markers can be parsed for any menu item.
    #          */
    #         $this->_oMenuSocialSharing->addMarkers($this->_aMarkers); 
    #         $this->addMarkers($this->_oMenuSocialSharing->getMarkers());
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemDefault

  ## Parametros
    - aItem

  ## Retorno
    - any
  """
  def _getMenuItemDefault(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemDefault($aItem)
    #     {
    #         if(empty($this->_oMenuSocialSharing)) 
    #             $this->_initMenuSocialSharing();
    # 
    #         $aItem['class_wrp'] = 'bx-base-general-entity-action' . (!empty($aItem['class_wrp']) ? ' ' . $aItem['class_wrp'] : '');
    # 
    #         if($this->_bShowAsButton)
    #             $aItem['class_link'] = 'bx-btn' . (isset($aItem['primary']) && (int)$aItem['primary'] == 1 ? ' bx-btn-primary' : '') . (!empty($aItem['class_link']) ? ' ' . $aItem['class_link'] : '');
    # 
    #         if(!$this->_bShowTitle)
    #             $aItem['bx_if:title']['condition'] = false;
    # 
    #         if($this->_bIsApi)
    #             return $aItem;
    #         else
    #             return parent::_getMenuItemDefault ($aItem);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemRepostWithText

  ## Parametros
    - aItem,aParams=[]

  ## Retorno
    - any
  """
  def _getMenuItemRepostWithText(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemRepostWithText($aItem, $aParams = [])
    #     {
    #         return $this->_getMenuItemRepost($aItem, array_merge($aParams, [
    #             'do' => 'repost_with'
    #         ]));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemRepostToContext

  ## Parametros
    - aItem,aParams=[]

  ## Retorno
    - any
  """
  def _getMenuItemRepostToContext(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemRepostToContext($aItem, $aParams = [])
    #     {
    #         return $this->_getMenuItemRepost($aItem, array_merge($aParams, [
    #             'do' => 'repost_to'
    #         ]));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemByNameActionDelete

  ## Parametros
    - aItem

  ## Retorno
    - any
  """
  def _getMenuItemByNameActionDelete(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemByNameActionDelete($aItem)
    #     {
    #         $oProfile = $this->_oModule->getProfileObject(($this->_iContentId));
    #         if (!$this->_oModule->isAllowDeleteOrDisable(bx_get_logged_profile_id(), $oProfile->id()))
    #             return false;
    #         
    #         return $this->_getMenuItemByNameActionsMore($aItem);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemByNameActionsMore

  ## Parametros
    - aItem

  ## Retorno
    - any
  """
  def _getMenuItemByNameActionsMore(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemByNameActionsMore($aItem)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if(empty($this->_oMenuActionsMore)) {
    #             if(empty($CNF['OBJECT_MENU_ACTIONS_VIEW_ENTRY_MORE']))
    #                 return '';
    # 
    #             $this->_oMenuActionsMore = BxDolMenu::getObjectInstance($CNF['OBJECT_MENU_ACTIONS_VIEW_ENTRY_MORE']);
    #             if(!$this->_oMenuActionsMore)
    #                 return '';
    # 
    #             $this->_oMenuActionsMore->setContentId($this->_iContentId);
    #             
    #             $this->addMarkers($this->_oMenuActionsMore->getMarkers());
    #         }
    # 
    #         $aItem = $this->_oMenuActionsMore->getMenuItem($aItem['name']);
    #         if(empty($aItem) || !is_array($aItem))
    #             return false;
    # 
    #         if($this->_bIsApi)
    #             return $aItem;
    #         else
    #             return $this->_getMenuItemDefault($aItem);
    #     }
    :ok
  end

end
