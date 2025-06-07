
defmodule DeeperHub.Inc.Classes.BxAlbumsMenuViewActionsMedia do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/albums/classes/BxAlbumsMenuViewActionsMedia.php
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
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setContentId

  ## Parametros
    - iMediaId

  ## Retorno
    - any
  """
  def setContentId(%{}) do
    # TODO: Implementacao futura
        # public function setContentId($iMediaId)
    #     {
    #         $this->_iMediaId = (int)$iMediaId;
    #         $this->_aMediaInfo = $this->_oModule->_oDb->getMediaInfoById($this->_iMediaId);
    #         if($this->_aMediaInfo) {
    #             $this->_sJsObjectMoreAuto .= $this->_iMediaId;
    #             $this->_aHtmlIds['main'] .= '-' . $this->_iMediaId;
    # 
    #             $this->addMarkers(array('media_id' => (int)$this->_iMediaId));
    # 
    #             $this->_iContentId = (int)$this->_aMediaInfo['content_id'];
    #             $this->_aContentInfo = $this->_oModule->_oDb->getContentInfoById($this->_iContentId);
    #             if($this->_aContentInfo)
    #                 $this->addMarkers(array('content_id' => (int)$this->_iContentId));
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isContentPublic

  ## Parametros
    - iMediaId,aPublicGroups=[]

  ## Retorno
    - any
  """
  def _isContentPublic(%{}) do
    # TODO: Implementacao futura
        # protected function _isContentPublic($iMediaId, $aPublicGroups = [])
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if(empty($CNF['FIELD_ALLOW_VIEW_TO'])) 
    #             return true;
    # 
    #         $aContentInfo = array();
    #         if($iMediaId != $this->_iMediaId) {
    #             $aMediaInfo = $this->_oModule->_oDb->getMediaInfoById($iMediaId);
    #             if(!empty($aMediaInfo['content_id']))
    #                 $aContentInfo = (int)$aMediaInfo['content_id'] == $this->_iContentId ? $this->_aContentInfo : $this->_oModule->_oDb->getContentInfoById((int)$aMediaInfo['content_id']);
    #         }
    #         else 
    #             $aContentInfo = $this->_aContentInfo;
    # 
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
  Funcao correspondente ao metodo PHP _getMenuItemAddImagesToAlbum

  ## Parametros
    - aItem

  ## Retorno
    - any
  """
  def _getMenuItemAddImagesToAlbum(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemAddImagesToAlbum($aItem)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         return $this->_getMenuItemByNameActions($aItem, array(
    #             'object_menu' => $CNF['OBJECT_MENU_ACTIONS_VIEW_MEDIA']
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemEditAlbum

  ## Parametros
    - aItem

  ## Retorno
    - any
  """
  def _getMenuItemEditAlbum(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemEditAlbum($aItem)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         return $this->_getMenuItemByNameActions($aItem, array(
    #             'object_menu' => $CNF['OBJECT_MENU_ACTIONS_VIEW_MEDIA']
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemEditImage

  ## Parametros
    - aItem

  ## Retorno
    - any
  """
  def _getMenuItemEditImage(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemEditImage($aItem)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         return $this->_getMenuItemByNameActions($aItem, array(
    #             'object_menu' => $CNF['OBJECT_MENU_ACTIONS_VIEW_MEDIA']
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemDeleteImage

  ## Parametros
    - aItem

  ## Retorno
    - any
  """
  def _getMenuItemDeleteImage(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemDeleteImage($aItem)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         return $this->_getMenuItemByNameActions($aItem, array(
    #             'object_menu' => $CNF['OBJECT_MENU_ACTIONS_VIEW_MEDIA']
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemMoveImage

  ## Parametros
    - aItem

  ## Retorno
    - any
  """
  def _getMenuItemMoveImage(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemMoveImage($aItem)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         return $this->_getMenuItemByNameActions($aItem, array(
    #             'object_menu' => $CNF['OBJECT_MENU_ACTIONS_VIEW_MEDIA']
    #         ));
    #     }
    :ok
  end

end
