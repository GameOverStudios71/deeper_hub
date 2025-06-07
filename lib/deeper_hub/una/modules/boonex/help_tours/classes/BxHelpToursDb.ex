
defmodule DeeperHub.Inc.Classes.BxHelpToursDb do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/help_tours/classes/BxHelpToursDb.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - &oConfig

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct(&$oConfig)
    #     {
    #         parent::__construct($oConfig);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTourDetails

  ## Parametros
    - iTourId

  ## Retorno
    - any
  """
  def getTourDetails(%{}) do
    # TODO: Implementacao futura
        # public function getTourDetails($iTourId) {
    #         return $this->getRow("SELECT * FROM `bx_help_tours` WHERE `id` = :id", ['id' => $iTourId]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTourPageUrl

  ## Parametros
    - iTourId

  ## Retorno
    - any
  """
  def getTourPageUrl(%{}) do
    # TODO: Implementacao futura
        # public function getTourPageUrl($iTourId) {
    #         $aTour = $this->getTourDetails($iTourId);
    #         if (!$aTour) return false;
    # 
    #         if ($aTour['page'] == 'sys_home') return '/';
    # 
    #         return $this->getOne("SELECT `url` FROM `sys_objects_page` WHERE `object` = :page", ['page' => $aTour['page']]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSitePages

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getSitePages(%{}) do
    # TODO: Implementacao futura
        # public function getSitePages() {
    #         $aPages = $this->getAll("SELECT `object`, `module`, `title_system` AS `name`  FROM `sys_objects_page` WHERE `title_system` <> '' ORDER BY `title_system` ASC");
    #         $aPagesByModules = [];
    #         foreach ($aPages as $aPage) {
    #             $aPagesByModules[$aPage['module']][$aPage['object']] = _t($aPage['name']);
    #         }
    # 
    #         $aResult = [];
    #         foreach ($aPagesByModules as $sModule => $aPages) {
    #             $oModule = BxDolModule::getInstance($sModule);
    #             $sTitle = $oModule && isset($oModule->_aModule) ? $oModule->_aModule['title'] : ucfirst($sModule);
    # 
    #             $aResult[$sModule.'_start'] = ['type' => 'group_header', 'value' => $sTitle];
    #             $aResult = $aResult + $aPages;
    #             $aResult[$sModule.'_end'] = ['type' => 'group_end'];
    #         }
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteHelpTourItems

  ## Parametros
    - iEntry

  ## Retorno
    - any
  """
  def deleteHelpTourItems(%{}) do
    # TODO: Implementacao futura
        # public function deleteHelpTourItems($iEntry) {
    #         $this->query("DELETE FROM `bx_help_tours_items` WHERE `tour` = :tour", ['tour' => $iEntry]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPageTitleDetails

  ## Parametros
    - sPageObject

  ## Retorno
    - any
  """
  def getPageTitleDetails(%{}) do
    # TODO: Implementacao futura
        # public function getPageTitleDetails($sPageObject) {
    #         $aData = $this->getRow("SELECT `module`, `title_system` FROM `sys_objects_page` WHERE `object` = :page", ['page' => $sPageObject]);
    #         if (!$aData) return false;
    # 
    #         $oModule = BxDolModule::getInstance($aData['module']);
    #         $aData['module_title'] = $oModule && isset($oModule->_aModule) ? $oModule->_aModule['title'] : ucfirst($aData['module']);
    # 
    #         return $aData;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP putHelpTourOnPage

  ## Parametros
    - iTourId,sOldPage,iPageBlockVisibility

  ## Retorno
    - any
  """
  def putHelpTourOnPage(%{}) do
    # TODO: Implementacao futura
        # public function putHelpTourOnPage($iTourId, $sOldPage, $iPageBlockVisibility) {
    #         $aTour = $this->getTourDetails($iTourId);
    #         $sPage = $aTour['page'];
    # 
    #         $sServiceCall = str_replace('__tour_id__', $iTourId, $this->_sTourBlockTemplate);
    # 
    #         if ($sOldPage != $sPage) {
    #             if (!empty($sOldPage)) {
    #                 $this->query("DELETE FROM `sys_pages_blocks` WHERE `object` = :page AND `module` = 'bx_help_tours' AND `content` = :service_call", [
    #                     'page' => $sOldPage,
    #                     'service_call' => $sServiceCall,
    #                 ]);
    #             }
    # 
    #             $iOrder = intval($this->getOne("SELECT MAX(`order`) FROM `sys_pages_blocks` WHERE `object` = :page and `cell_id` = 1", ['page' => $sPage])) + 1;
    # 
    #             $this->query("
    #                 INSERT INTO `sys_pages_blocks` (`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES
    #                 (:page, 1, 'bx_help_tours', '_bx_help_tours_page_block_caption', 0, :visibility, 'service', :service_call, 0, 0, :order);
    #             ", [
    #                 'page' => $sPage,
    #                 'service_call' => $sServiceCall,
    #                 'order' => $iOrder,
    #                 'visibility' => $iPageBlockVisibility,
    #             ]);
    # 
    #             // disable the built-in site tour on homepage to avoid tours conflicts
    #             if ($sPage == 'sys_home') setParam('site_tour_home', '');
    #         } else {
    #             $this->query("UPDATE `sys_pages_blocks` SET `visible_for_levels` = :visibility WHERE `object` = :page AND `module` = 'bx_help_tours' AND `content` = :service_call", [
    #                 'page' => $sPage,
    #                 'service_call' => $sServiceCall,
    #                 'visibility' => $iPageBlockVisibility,
    #             ]);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteHelpTourBlock

  ## Parametros
    - iTourId

  ## Retorno
    - any
  """
  def deleteHelpTourBlock(%{}) do
    # TODO: Implementacao futura
        # public function deleteHelpTourBlock($iTourId) {
    #         $aTour = $this->getTourDetails($iTourId);
    # 
    #         $this->query("DELETE FROM `sys_pages_blocks` WHERE `module` = 'bx_help_tours' AND `object` = :page AND `content` = :call", [
    #             'page' => $aTour['page'],
    #             'call' => str_replace('__tour_id__', $iTourId, $this->_sTourBlockTemplate),
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteHelpTourTrackingData

  ## Parametros
    - iTourId

  ## Retorno
    - any
  """
  def deleteHelpTourTrackingData(%{}) do
    # TODO: Implementacao futura
        # public function deleteHelpTourTrackingData($iTourId) {
    #         $this->query("DELETE FROM `bx_help_tours_track_views` WHERE `tour` = :tour", ['tour' => $iTourId]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getHelpTourItemsCount

  ## Parametros
    - iTourId

  ## Retorno
    - any
  """
  def getHelpTourItemsCount(%{}) do
    # TODO: Implementacao futura
        # public function getHelpTourItemsCount($iTourId) {
    #         return $this->getOne("SELECT COUNT(*) FROM `bx_help_tours_items` WHERE `tour` = :tour", [
    #             'tour' => $iTourId,
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getHelpTourItems

  ## Parametros
    - iTourId

  ## Retorno
    - any
  """
  def getHelpTourItems(%{}) do
    # TODO: Implementacao futura
        # public function getHelpTourItems($iTourId) {
    #         return $this->getAll("SELECT * FROM `bx_help_tours_items` WHERE `tour` = :tour ORDER BY `order` ASC", [
    #             'tour' => $iTourId,
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTourItemDetails

  ## Parametros
    - iItemId

  ## Retorno
    - any
  """
  def getTourItemDetails(%{}) do
    # TODO: Implementacao futura
        # public function getTourItemDetails($iItemId) {
    #         return $this->getRow("SELECT * FROM `bx_help_tours_items` WHERE `id` = :id", ['id' => $iItemId]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPageBlocksForHelpTour

  ## Parametros
    - iTourId

  ## Retorno
    - any
  """
  def getPageBlocksForHelpTour(%{}) do
    # TODO: Implementacao futura
        # public function getPageBlocksForHelpTour($iTourId) {
    #         $aTour = $this->getTourDetails($iTourId);
    #         if (!$aTour) return [];
    # 
    #         $aResult = [];
    # 
    #         $aRes = $this->getAll("SELECT `id`, `title_system`, `title` FROM `sys_pages_blocks` WHERE `object` = :page AND `cell_id` > 0 AND `active` AND `module` <> 'bx_help_tours' AND (`title_system` <> '' OR `title` <> '') ORDER BY `cell_id` ASC, `order` ASC", ['page' => $aTour['page']]);
    #         if ($aRes) {
    #             foreach ($aRes as $aRow) {
    #                 $aResult[str_replace('__block_id__', $aRow['id'], $this->_sBlockSelectorTemplate)] = !empty($aRow['title_system']) ? _t($aRow['title_system']) : _t($aRow['title']);
    #             }
    #         }
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getHelpToursOptions

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getHelpToursOptions(%{}) do
    # TODO: Implementacao futura
        # public function getHelpToursOptions() {
    #         return $this->getPairs("SELECT `id`, `page` FROM `bx_help_tours` ORDER BY `order` ASC", 'id', 'page');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteAccountData

  ## Parametros
    - iAccount

  ## Retorno
    - any
  """
  def deleteAccountData(%{}) do
    # TODO: Implementacao futura
        # public function deleteAccountData($iAccount) {
    #         $this->query("DELETE FROM `bx_help_tours_track_views` WHERE `account` = :account", ['account' => $iAccount]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP trackTourSeen

  ## Parametros
    - iAccount,iTour

  ## Retorno
    - any
  """
  def trackTourSeen(%{}) do
    # TODO: Implementacao futura
        # public function trackTourSeen($iAccount, $iTour) {
    #         $this->query("INSERT IGNORE INTO `bx_help_tours_track_views` (`account`, `tour`) VALUES(:account, :tour)", ['account' => $iAccount, 'tour' => $iTour]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isHelpTourSeen

  ## Parametros
    - iAccount,iTour

  ## Retorno
    - any
  """
  def isHelpTourSeen(%{}) do
    # TODO: Implementacao futura
        # public function isHelpTourSeen($iAccount, $iTour) {
    #         if (isset($_COOKIE['bx-help-tours-seen-'.$iTour])) return true;
    #         if (!$iAccount) return false;
    #         return $this->getOne("SELECT COUNT(*) FROM `bx_help_tours_track_views` WHERE `account` = :account AND `tour` = :tour", ['account' => $iAccount, 'tour' => $iTour]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTourVisibility

  ## Parametros
    - iTour

  ## Retorno
    - any
  """
  def getTourVisibility(%{}) do
    # TODO: Implementacao futura
        # public function getTourVisibility($iTour) {
    #         $aTour = $this->getTourDetails($iTour);
    # 
    #         return $this->getOne("SELECT `visible_for_levels` FROM `sys_pages_blocks` WHERE `module` = 'bx_help_tours' AND `object` = :page AND `content` = :call", [
    #             'page' => $aTour['page'],
    #             'call' => str_replace('__tour_id__', $iTour, $this->_sTourBlockTemplate),
    #         ]);
    #     }
    :ok
  end

end
