
defmodule DeeperHub.Inc.Classes.BxDolCmts do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolCmts.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - sSystem,iId,iInit=true,oTemplate=false

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # protected function __construct($sSystem, $iId, $iInit = true, $oTemplate = false)
    #     {
    #         parent::__construct();
    # 
    #         $this->_bIsApi = bx_is_api();
    # 
    #         $this->_sType = BX_DOL_CMT_TYPE_COMMENTS;
    # 
    #         $this->_aSystems = $this->getSystems();
    #         if(!isset($this->_aSystems[$sSystem]))
    #             return;
    # 
    #         $this->_sSystem = $sSystem;
    #         $this->_aSystem = $this->_aSystems[$sSystem];
    #         $this->_aSystem['is_browse_filter'] = (int)$this->_bBrowseFilter;
    # 
    #         $this->_iAuthorId = $this->_getAuthorId();
    # 
    #         $this->_iDpMaxLevel = (int)$this->_aSystem['number_of_levels'];
    #         $this->_sDisplayType = $this->_iDpMaxLevel == 0 ? BX_CMT_DISPLAY_FLAT : BX_CMT_DISPLAY_THREADED;
    #         $this->_sDpSessionKey = 'bx_' . $this->_sSystem . '_dp_';
    # 
    #         $this->_sBrowseType = $this->_aSystem['browse_type'];
    #         $this->_sBrowseFilter = BX_CMT_FILTER_ALL;
    #         $this->_sBpSessionKeyType = 'bx_' . $this->_sSystem . '_bpt_';
    #         $this->_sBpSessionKeyFilter = 'bx_' . $this->_sSystem . '_bpf_';
    #         $this->_aOrder = array(
    #             'by' => BX_CMT_ORDER_BY_DATE,
    #             'way' => BX_CMT_ORDER_WAY_ASC
    #         );
    # 
    #         list($mixedUserDp, $mixedUserBpType, $mixedUserBpFilter) = $this->_getUserChoice();
    #         if(!empty($mixedUserDp))
    #             $this->_sDisplayType = $mixedUserDp;
    #         if(!empty($mixedUserBpType))
    #             $this->_sBrowseType = $mixedUserBpType;
    #         if(!empty($mixedUserBpFilter))
    #             $this->_sBrowseFilter = $mixedUserBpFilter;
    # 
    #         $this->_sViewUrl = 'page.php?i=cmts-view';
    #         $this->_sBaseUrl = $this->_aSystem['base_url'];
    # 
    #         $this->_sListAnchor = "cmts-anchor-%s-%d";
    #         $this->_sItemAnchor = "cmt-anchor-%s-%d-%d";
    # 
    #         $this->_oQuery = new BxDolCmtsQuery($this);
    # 
    #         $this->_bPostQuote = false;
    #         $this->_bMinPostForm = true;
    #         $this->_sFormObject = 'sys_comment';
    #         $this->_sFormDisplayPost = 'sys_comment_post';
    #         $this->_sFormDisplayEdit = 'sys_comment_edit';
    # 
    #         $this->_sConnObjFriends = 'sys_profiles_friends';
    #         $this->_sConnObjSubscriptions = 'sys_profiles_subscriptions';
    # 
    #         $this->_sMenuObjManage = 'sys_cmts_item_manage';
    #         $this->_sMenuObjActions = 'sys_cmts_item_actions';
    #         $this->_sMenuObjCounters = 'sys_cmts_item_counters';
    #         $this->_sMenuObjMeta = 'sys_cmts_item_meta';
    # 
    #         $this->_sMetatagsObj = 'sys_cmts';
    # 
    #         if(($aParams = bx_get('params')) !== false) {
    #             if(is_string($aParams))
    #                 $aParams = json_decode($aParams, true);
    #             if(!empty($aParams) && is_array($aParams))
    #                 $this->_aParams = array_merge($this->_aParams, $aParams);
    #         }
    # 
    #         $this->_aT = [
    #             'block_comments_title' => '_cmt_block_comments_title',
    #             'txt_sample_single' => '_cmt_txt_sample_comment_single',
    #             'txt_sample_vote_single' => '_cmt_txt_sample_vote_single',
    #             'txt_sample_reaction_single' => '_cmt_txt_sample_reaction_single',
    #             'txt_sample_score_up_single' => '_cmt_txt_sample_score_up_single',
    #             'txt_sample_score_down_single' => '_cmt_txt_sample_score_down_single',
    #             'txt_min_form_placeholder' => '_cmt_txt_min_form_placeholder'
    #         ];
    # 
    #         if ($iInit)
    #             $this->init($iId);
    # 
    #         if ($oTemplate)
    #             $this->_oTemplate = $oTemplate;
    #         else
    #             $this->_oTemplate = BxDolTemplate::getInstance();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectInstance

  ## Parametros
    - sSys,iId,iInit=true,oTemplate=false

  ## Retorno
    - any
  """
  def getObjectInstance(%{}) do
    # TODO: Implementacao futura
        # public static function getObjectInstance($sSys, $iId, $iInit = true, $oTemplate = false)
    #     {
    #         if(isset($GLOBALS['bxDolClasses']['BxDolCmts!' . $sSys . $iId]))
    #             return $GLOBALS['bxDolClasses']['BxDolCmts!' . $sSys . $iId];
    # 
    #         $aSystems = self::getSystems();
    #         if (!isset($aSystems[$sSys]))
    #             return null;
    # 
    #         $sClassName = 'BxTemplCmts';
    #         if(!empty($aSystems[$sSys]['class_name'])) {
    #             $sClassName = $aSystems[$sSys]['class_name'];
    #             if(!empty($aSystems[$sSys]['class_file']))
    #                 require_once(BX_DIRECTORY_PATH_ROOT . $aSystems[$sSys]['class_file']);
    #         }
    # 
    #         $o = new $sClassName($sSys, $iId, $iInit, $oTemplate);
    #         return ($GLOBALS['bxDolClasses']['BxDolCmts!' . $sSys . $iId] = $o);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectInstanceByUniqId

  ## Parametros
    - iUniqId,iInit=true,oTemplate=false

  ## Retorno
    - any
  """
  def getObjectInstanceByUniqId(%{}) do
    # TODO: Implementacao futura
        # public static function getObjectInstanceByUniqId($iUniqId, $iInit = true, $oTemplate = false)
    #     {
    #         $aData = BxDolCmtsQuery::getInfoByUniqId($iUniqId);
    #         if(empty($aData) || !is_array($aData))
    #             return null;
    # 
    #         return self::getObjectInstance($aData['system_name'], $aData['cmt_object_id']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getGlobalInfo

  ## Parametros
    - iUniqueId

  ## Retorno
    - any
  """
  def getGlobalInfo(%{}) do
    # TODO: Implementacao futura
        # public static function getGlobalInfo ($iUniqueId)
    #     {
    #         return BxDolDb::getInstance()->getRow("SELECT `ti`.*, `ts`.`Name` AS `system_name` FROM `" . self::$sTableIds . "` AS `ti` LEFT JOIN `" . self::$sTableSystems . "` AS `ts` ON `ti`.`system_id`=`ts`.`ID` WHERE `ti`.`id`=:id LIMIT 1", array(
    #             'id' => (int)$iUniqueId
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getGlobalNumByParams

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getGlobalNumByParams(%{}) do
    # TODO: Implementacao futura
        # public static function getGlobalNumByParams($aParams = [])
    #     {
    #         $sQuery = "SELECT COUNT(*) FROM `" . self::$sTableIds . "` WHERE 1";
    #         foreach($aParams as $aValue)
    #             $sQuery .= " AND `" . $aValue['key'] ."` " . $aValue['operator'] . " '" . $aValue['value'] . "'";
    # 
    #         return BxDolDb::getInstance()->getOne($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP init

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function init ($iId)
    #     {
    #         if (empty($this->iId) && $iId)
    #             $this->setId($iId);
    # 
    #         $this->addMarkers(array(
    #             'object_id' => $this->getId(),
    #             'user_id' => $this->_getAuthorId()
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setParam

  ## Parametros
    - sName,sValue

  ## Retorno
    - any
  """
  def setParam(%{}) do
    # TODO: Implementacao futura
        # public function setParam($sName, $sValue)
    #     {
    #         $this->_aParams[$sName] = $sValue;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isParam

  ## Parametros
    - sName

  ## Retorno
    - any
  """
  def isParam(%{}) do
    # TODO: Implementacao futura
        # public function isParam($sName)
    #     {
    #         return isset($this->_aParams[$sName]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getParam

  ## Parametros
    - sName

  ## Retorno
    - any
  """
  def getParam(%{}) do
    # TODO: Implementacao futura
        # public function getParam($sName)
    #     {
    #         return $this->_aParams[$sName];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getId

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getId(%{}) do
    # TODO: Implementacao futura
        # public function getId ()
    #     {
    #         return $this->_iId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isEnabled

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isEnabled(%{}) do
    # TODO: Implementacao futura
        # public function isEnabled ()
    #     {
    #         return isset($this->_aSystem['is_on']) && $this->_aSystem['is_on'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSystemId

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getSystemId(%{}) do
    # TODO: Implementacao futura
        # public function getSystemId()
    #     {
    #         return $this->_aSystem['system_id'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSystemName

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getSystemName(%{}) do
    # TODO: Implementacao futura
        # public function getSystemName()
    #     {
    #         return $this->_sSystem;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSystemInfo

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getSystemInfo(%{}) do
    # TODO: Implementacao futura
        # public function getSystemInfo()
    #     {
    #         return $this->_aSystem;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStorageObjectName

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getStorageObjectName(%{}) do
    # TODO: Implementacao futura
        # public function getStorageObjectName()
    #     {
    #     	return $this->_getFormObject()->getStorageObjectName();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTranscoderPreviewName

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getTranscoderPreviewName(%{}) do
    # TODO: Implementacao futura
        # public function getTranscoderPreviewName()
    #     {
    #     	return $this->_getFormObject()->getTranscoderPreviewName();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFormObject

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getFormObject(%{}) do
    # TODO: Implementacao futura
        # public function getFormObject()
    #     {
    #     	return $this->_getFormObject();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTableNameImages

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getTableNameImages(%{}) do
    # TODO: Implementacao futura
        # public function getTableNameImages()
    #     {
    #         return $this->_sTableImages;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTableNameImages2Entries

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getTableNameImages2Entries(%{}) do
    # TODO: Implementacao futura
        # public function getTableNameImages2Entries()
    #     {
    #         return $this->_sTableImages2Entries;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguageKey

  ## Parametros
    - sIndex

  ## Retorno
    - any
  """
  def getLanguageKey(%{}) do
    # TODO: Implementacao futura
        # public function getLanguageKey($sIndex)
    #     {
    #         return isset($this->_aT[$sIndex]) ? $this->_aT[$sIndex] : '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getMaxLevel

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getMaxLevel(%{}) do
    # TODO: Implementacao futura
        # public function getMaxLevel()
    #     {
    #         return $this->_iDpMaxLevel;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrder

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getOrder(%{}) do
    # TODO: Implementacao futura
        # public function getOrder ()
    #     {
    #         return $this->_sOrder;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPerView

  ## Parametros
    - iCmtParentId=0

  ## Retorno
    - any
  """
  def getPerView(%{}) do
    # TODO: Implementacao futura
        # public function getPerView ($iCmtParentId = 0)
    #     {
    #         return $iCmtParentId == 0 ? $this->_aSystem['per_view'] : $this->_aSystem['per_view_replies'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStatusAdmin

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getStatusAdmin(%{}) do
    # TODO: Implementacao futura
        # public function getStatusAdmin()
    #     {
    #         return $this->isEditAllowedAll() || $this->isRemoveAllowedAll() || $this->isAutoApprove() ? BX_CMT_STATUS_ACTIVE : BX_CMT_STATUS_PENDING;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getViewUrl

  ## Parametros
    - iCmtId,bAbsolute=true

  ## Retorno
    - any
  """
  def getViewUrl(%{}) do
    # TODO: Implementacao futura
        # public function getViewUrl($iCmtId, $bAbsolute = true)
    #     {
    #     	if(empty($this->_aSystem['trigger_field_title']))
    #             return '';
    # 
    #         $s = BxDolPermalinks::getInstance()->permalink($this->_sViewUrl, [
    #             'sys' => $this->_sSystem,
    #             'id' => $this->_iId,
    #             'cmt_id' => $iCmtId
    #         ]);
    # 
    #     	return $bAbsolute ? bx_absolute_url($s) : $s;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getViewText

  ## Parametros
    - mixedItem

  ## Retorno
    - any
  """
  def getViewText(%{}) do
    # TODO: Implementacao futura
        # public function getViewText($mixedItem)
    #     {
    #         if(!is_array($mixedItem))
    #             $mixedItem = $this->getCommentSimple((int)$mixedItem);
    # 
    #         if(empty($mixedItem) || !is_array($mixedItem))
    #             return '';
    # 
    #         return $this->_prepareTextForOutput($mixedItem['cmt_text'], (int)$mixedItem['cmt_id']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getBaseUrl

  ## Parametros
    - sPrefix=BX_DOL_URL_ROOT

  ## Retorno
    - any
  """
  def getBaseUrl(%{}) do
    # TODO: Implementacao futura
        # public function getBaseUrl($sPrefix = BX_DOL_URL_ROOT)
    #     {
    #         $sUrl = $this->_replaceMarkers($this->_sBaseUrl);
    #         $sUrl = BxDolPermalinks::getInstance()->permalink($sUrl);
    #         return bx_absolute_url($sUrl, $sPrefix);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getListUrl

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getListUrl(%{}) do
    # TODO: Implementacao futura
        # public function getListUrl()
    #     {
    #         $sBaseUrl = $this->getBaseUrl();
    #         if(empty($sBaseUrl))
    #             return '';
    # 
    #         return $sBaseUrl . $this->getListAnchor(true);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getItemUrl

  ## Parametros
    - iItemId

  ## Retorno
    - any
  """
  def getItemUrl(%{}) do
    # TODO: Implementacao futura
        # public function getItemUrl($iItemId)
    #     {
    #         $sBaseUrl = $this->getBaseUrl();
    #         if(empty($sBaseUrl))
    #             return '';
    # 
    #         return $sBaseUrl . $this->getItemAnchor($iItemId, true);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getListAnchor

  ## Parametros
    - bWithHash=false

  ## Retorno
    - any
  """
  def getListAnchor(%{}) do
    # TODO: Implementacao futura
        # public function getListAnchor($bWithHash = false)
    #     {
    #         return ($bWithHash ? '#' : '') . sprintf($this->_sListAnchor, str_replace('_', '-', $this->getSystemName()), $this->getId());
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getItemAnchor

  ## Parametros
    - iItemId,bWithHash=false

  ## Retorno
    - any
  """
  def getItemAnchor(%{}) do
    # TODO: Implementacao futura
        # public function getItemAnchor($iItemId, $bWithHash = false)
    #     {
    #         return ($bWithHash ? '#' : '') . sprintf($this->_sItemAnchor, str_replace('_', '-', $this->getSystemName()), $this->getId(), $iItemId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAttachments

  ## Parametros
    - iCmtId

  ## Retorno
    - any
  """
  def getAttachments(%{}) do
    # TODO: Implementacao futura
        # public function getAttachments($iCmtId)
    #     {
    #         $aResult = array();
    # 
    #         if(!$this->isAttachImageEnabled())
    #             return $aResult; 
    # 
    #         $aFiles = $this->_oQuery->getFiles($this->_aSystem['system_id'], $iCmtId);
    #         if(empty($aFiles) || !is_array($aFiles)) 
    #             return $aResult;
    # 
    #         $oStorage = BxDolStorage::getObjectInstance($this->getStorageObjectName());
    #         $oTranscoder = BxDolTranscoderImage::getObjectInstance($this->getTranscoderPreviewName());
    # 
    #         foreach($aFiles as $aFile) {
    #             $bImage = $oTranscoder && $oTranscoder->isMimeTypeSupported($aFile['mime_type']);
    # 
    #             $sPreview = '';
    #             if($bImage)
    #                 $sPreview = $oTranscoder->getFileUrl($aFile['image_id']);
    # 
    #             if(!$sPreview)
    #                 $sPreview = $this->_oTemplate->getIconUrl($oStorage->getIconNameByFileName($aFile['file_name']));
    # 
    #             $sUrl = $oStorage->getFileUrlById($aFile['image_id']);
    # 
    #             $aResult[] = array(
    #                 'id' => $aFile['image_id'],
    #                 'src' => $sPreview,
    #                 'src_orig' => $bImage ? $sUrl : '',
    #                 'url' => !$bImage ? $sUrl : ''
    #             );
    #         }
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getConnectionObject

  ## Parametros
    - sType

  ## Retorno
    - any
  """
  def getConnectionObject(%{}) do
    # TODO: Implementacao futura
        # public function getConnectionObject($sType)
    #     {
    #         $sResult = '';
    # 
    #         switch($sType) {
    #             case BX_CMT_FILTER_FRIENDS:
    #                 $sResult = $this->_sConnObjFriends;
    #                 break;
    #             case BX_CMT_FILTER_SUBSCRIPTIONS:
    #                 $sResult = $this->_sConnObjSubscriptions;
    #                 break;
    #         }
    # 
    #         return $sResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getVoteObject

  ## Parametros
    - iEniqId

  ## Retorno
    - any
  """
  def getVoteObject(%{}) do
    # TODO: Implementacao futura
        # public function getVoteObject($iEniqId)
    #     {
    #         if(empty($this->_aSystem['object_vote']))
    #             $this->_aSystem['object_vote'] = 'sys_cmts';
    # 
    #         $oVote = BxDolVote::getObjectInstance($this->_aSystem['object_vote'], $iEniqId, true, $this->_oTemplate);
    #         if(!$oVote || !$oVote->isEnabled())
    #             return false;
    # 
    #         return $oVote;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getReactionObject

  ## Parametros
    - iEniqId

  ## Retorno
    - any
  """
  def getReactionObject(%{}) do
    # TODO: Implementacao futura
        # public function getReactionObject($iEniqId)
    #     {
    #         if(empty($this->_aSystem['object_reaction']))
    #             $this->_aSystem['object_reaction'] = 'sys_cmts_reactions';
    # 
    #         $oReaction = BxDolVote::getObjectInstance($this->_aSystem['object_reaction'], $iEniqId, true, $this->_oTemplate);
    #         if(!$oReaction || !$oReaction->isEnabled())
    #             return false;
    # 
    #         return $oReaction;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getScoreObject

  ## Parametros
    - iEniqId

  ## Retorno
    - any
  """
  def getScoreObject(%{}) do
    # TODO: Implementacao futura
        # public function getScoreObject($iEniqId)
    #     {
    #         if(empty($this->_aSystem['object_score']))
    #             $this->_aSystem['object_score'] = 'sys_cmts';
    # 
    #         $oScore = BxDolScore::getObjectInstance($this->_aSystem['object_score'], $iEniqId, true, $this->_oTemplate);
    #         if(!$oScore || !$oScore->isEnabled())
    #             return false;
    # 
    #         return $oScore;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getReportObject

  ## Parametros
    - iEniqId

  ## Retorno
    - any
  """
  def getReportObject(%{}) do
    # TODO: Implementacao futura
        # public function getReportObject($iEniqId)
    #     {
    #         if(empty($this->_aSystem['object_report']))
    #             $this->_aSystem['object_report'] = 'sys_cmts';
    # 
    #         $oReport = BxDolReport::getObjectInstance($this->_aSystem['object_report'], $iEniqId, true, $this->_oTemplate);
    #         if(!$oReport || !$oReport->isEnabled())
    #             return false;
    # 
    #         return $oReport;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getNotificationId

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getNotificationId(%{}) do
    # TODO: Implementacao futura
        # public function getNotificationId()
    #     {
    #         return 'cmts-notification-' . $this->_sSystem . '-' . $this->_iId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSocketName

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getSocketName(%{}) do
    # TODO: Implementacao futura
        # public function getSocketName()
    #     {
    #         return 'cmts_' . $this->_sSystem;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setTableNameFiles

  ## Parametros
    - sTable

  ## Retorno
    - any
  """
  def setTableNameFiles(%{}) do
    # TODO: Implementacao futura
        # public function setTableNameFiles($sTable)
    #     {
    #         $this->_sTableImages = $sTable;
    #     	$this->_oQuery->setTableNameFiles($sTable);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setTableNameFiles2Entries

  ## Parametros
    - sTable

  ## Retorno
    - any
  """
  def setTableNameFiles2Entries(%{}) do
    # TODO: Implementacao futura
        # public function setTableNameFiles2Entries($sTable)
    #     {
    #     	$this->_sTableImages2Entries = $sTable;
    #     	$this->_oQuery->setTableNameFiles2Entries($sTable);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isHtml

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isHtml(%{}) do
    # TODO: Implementacao futura
        # public function isHtml ()
    #     {
    #         return $this->_aSystem['html'] > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isRatable

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isRatable(%{}) do
    # TODO: Implementacao futura
        # public function isRatable ()
    #     {
    #         return $this->_aSystem['is_ratable'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAttachImageEnabled

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isAttachImageEnabled(%{}) do
    # TODO: Implementacao futura
        # public function isAttachImageEnabled()
    #     {
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAutoApprove

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isAutoApprove(%{}) do
    # TODO: Implementacao futura
        # public function isAutoApprove()
    #     {
    #         return getParam('sys_cmts_enable_auto_approve') == 'on';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setId

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def setId(%{}) do
    # TODO: Implementacao futura
        # public function setId ($iId)
    #     {
    #         if ($iId == $this->getId()) return;
    #         $this->_iId = $iId;
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
        # public function addMarkers ($a)
    #     {
    #         if (empty($a) || !is_array($a))
    #             return false;
    #         $this->_aMarkers = array_merge ($this->_aMarkers, $a);
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getQueryObject

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getQueryObject(%{}) do
    # TODO: Implementacao futura
        # public function getQueryObject ()
    #     {
    #         return $this->_oQuery;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsTableName

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getCommentsTableName(%{}) do
    # TODO: Implementacao futura
        # public function getCommentsTableName ()
    #     {
    #         return $this->_oQuery->getTableName ();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectAuthorId

  ## Parametros
    - iObjectId=0

  ## Retorno
    - any
  """
  def getObjectAuthorId(%{}) do
    # TODO: Implementacao futura
        # public function getObjectAuthorId ($iObjectId = 0)
    #     {
    #     	if(empty($this->_aSystem['trigger_field_author']))
    #     		return 0;
    # 
    #         return $this->_oQuery->getObjectAuthorId ($iObjectId ? $iObjectId : $this->getId());
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectTitle

  ## Parametros
    - iObjectId=0

  ## Retorno
    - any
  """
  def getObjectTitle(%{}) do
    # TODO: Implementacao futura
        # public function getObjectTitle ($iObjectId = 0)
    #     {
    #         if(empty($this->_aSystem['trigger_field_title']))
    #             return '';
    # 
    #         $sTitle = $this->_oQuery->getObjectTitle ($iObjectId ? $iObjectId : $this->getId());
    #         if(get_mb_substr($sTitle, 0, 1) == '_')
    #             $sTitle = _t($sTitle);
    # 
    #         return $sTitle;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectPrivacyView

  ## Parametros
    - iObjectId=0

  ## Retorno
    - any
  """
  def getObjectPrivacyView(%{}) do
    # TODO: Implementacao futura
        # public function getObjectPrivacyView ($iObjectId = 0)
    #     {
    #         if(empty($iObjectId))
    #             $iObjectId = $this->getId();
    # 
    #         $sFieldPrivacyView = '';
    #         if(!empty($this->_aSystem['trigger_field_privacy_view']))
    #             $sFieldPrivacyView = $this->_aSystem['trigger_field_privacy_view'];
    # 
    #         if(($iPrivacyView = $this->_oQuery->getObjectPrivacyView($iObjectId, $sFieldPrivacyView)) !== false)
    #             return $iPrivacyView;
    # 
    #         return BX_DOL_PG_ALL;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectContentFilter

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getObjectContentFilter(%{}) do
    # TODO: Implementacao futura
        # public function getObjectContentFilter ()
    #     {
    #         $oCf = BxDolContentFilter::getInstance();
    #         if(!$oCf->isEnabledForComments())
    #             return false;
    # 
    #         return $oCf;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsCountAll

  ## Parametros
    - iObjectId=0,bForceCalculate=false

  ## Retorno
    - any
  """
  def getCommentsCountAll(%{}) do
    # TODO: Implementacao futura
        # public function getCommentsCountAll ($iObjectId = 0, $bForceCalculate = false)
    #     {
    #         return $this->_oQuery->getCommentsCountAll ($iObjectId ? $iObjectId : $this->getId(), $this->_getAuthorId(), $bForceCalculate);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsCount

  ## Parametros
    - iObjectId=0,iCmtVParentId=-1,sFilter=''

  ## Retorno
    - any
  """
  def getCommentsCount(%{}) do
    # TODO: Implementacao futura
        # public function getCommentsCount ($iObjectId = 0, $iCmtVParentId = -1, $sFilter = '')
    #     {
    #         return $this->_oQuery->getCommentsCount ($iObjectId ? $iObjectId : $this->getId(), $iCmtVParentId, $this->_getAuthorId(), $sFilter);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsArray

  ## Parametros
    - iVParentId,sFilter,aOrder,iStart=0,iCount=-1

  ## Retorno
    - any
  """
  def getCommentsArray(%{}) do
    # TODO: Implementacao futura
        # public function getCommentsArray ($iVParentId, $sFilter, $aOrder, $iStart = 0, $iCount = -1)
    #     {
    #         return $this->_oQuery->getComments ($this->getId(), $iVParentId, $this->_getAuthorId(), $sFilter, $aOrder, $iStart, $iCount);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getCommentsBy(%{}) do
    # TODO: Implementacao futura
        # public function getCommentsBy ($aParams = [])
    #     {
    #         return $this->_oQuery->getCommentsBy($aParams); 
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentUniqId

  ## Parametros
    - iCmtId,iAuthorId=0

  ## Retorno
    - any
  """
  def getCommentUniqId(%{}) do
    # TODO: Implementacao futura
        # public function getCommentUniqId($iCmtId, $iAuthorId = 0)
    #     {
    #         return $this->_oQuery->getUniqId($this->getSystemId(), $iCmtId, ['author_id' => $iAuthorId]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentSimple

  ## Parametros
    - iCmtId

  ## Retorno
    - any
  """
  def getCommentSimple(%{}) do
    # TODO: Implementacao futura
        # public function getCommentSimple ($iCmtId)
    #     {
    #         return $this->_oQuery->getCommentSimple ($this->getId(), $iCmtId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentRow

  ## Parametros
    - iCmtId

  ## Retorno
    - any
  """
  def getCommentRow(%{}) do
    # TODO: Implementacao futura
        # public function getCommentRow ($iCmtId)
    #     {
    #         return $this->_oQuery->getComment ($this->getId(), $iCmtId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentParents

  ## Parametros
    - mixedCmt,iDepthMax=0

  ## Retorno
    - any
  """
  def getCommentParents(%{}) do
    # TODO: Implementacao futura
        # public function getCommentParents ($mixedCmt, $iDepthMax = 0)
    #     {
    #         if(!is_array($mixedCmt))
    #             $mixedCmt = $this->_oQuery->getCommentsBy(['type' => 'id', 'id' => (int)$mixedCmt]);
    # 
    #         $iDepth = 0;
    #         $aParents = [];
    #         $this->_getParents($mixedCmt, $iDepthMax, $iDepth, $aParents);
    # 
    #         return $aParents;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onObjectDelete

  ## Parametros
    - iObjectId=0

  ## Retorno
    - any
  """
  def onObjectDelete(%{}) do
    # TODO: Implementacao futura
        # public function onObjectDelete ($iObjectId = 0)
    #     {
    #         // delete comments
    #         $aFiles = $aCmtIds = [];
    #         $this->_oQuery->deleteObjectComments ($iObjectId ? $iObjectId : $this->getId(), $aFiles, $aCmtIds);
    # 
    #         // delete votes
    #         $this->deleteVotes($aCmtIds);
    # 
    #         // delete reactions
    #         $this->deleteReactions($aCmtIds);
    # 
    #         // delete scores
    #         $this->deleteScores($aCmtIds);
    # 
    #         // delete reports
    #         $this->deleteReports($aCmtIds);
    # 
    #         // delete meta info
    #         $this->deleteMetaInfo($aCmtIds);
    # 
    #         // delete files
    #         if ($aFiles) {
    #             $oStorage = BxDolStorage::getObjectInstance($this->getStorageObjectName());
    #             if ($oStorage)
    #                 $oStorage->queueFilesForDeletion($aFiles);
    #         }
    # 
    #         // delete unique IDs
    #         $this->deleteUniqueIds($aCmtIds);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onAuthorDelete

  ## Parametros
    - iAuthorId

  ## Retorno
    - any
  """
  def onAuthorDelete(%{}) do
    # TODO: Implementacao futura
        # public static function onAuthorDelete ($iAuthorId)
    #     {
    #         $aSystems = self::getSystems();
    #         foreach($aSystems as $sSystem => $aSystem) {
    #             $o = self::getObjectInstance($sSystem, 0);
    #             $oQuery = $o->getQueryObject();
    # 
    #             // delete comments
    #             $aFiles = $aCmtIds = array ();
    #             $oQuery->deleteAuthorComments($iAuthorId, $aFiles, $aCmtIds);
    # 
    #             // delete votes
    #             $o->deleteVotes($aCmtIds);
    # 
    #             // delete reactions
    #             $o->deleteReactions($aCmtIds);
    # 
    #             // delete scores
    #             $o->deleteScores($aCmtIds);
    # 
    #             // delete reports
    #             $o->deleteReports($aCmtIds);
    # 
    #             // delete meta info
    #             $o->deleteMetaInfo($aCmtIds);
    #     
    #             // delete files
    #             $oStorage = BxDolStorage::getObjectInstance($o->getStorageObjectName());
    #             if ($oStorage)
    #                 $oStorage->queueFilesForDeletion($aFiles);
    #             
    #             // delete unique IDs
    #             $o->deleteUniqueIds($aCmtIds);
    #         }
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onModuleEnable

  ## Parametros
    - sModuleName

  ## Retorno
    - any
  """
  def onModuleEnable(%{}) do
    # TODO: Implementacao futura
        # public static function onModuleEnable ($sModuleName)
    #     {
    #         $aSystems = self::getSystems();
    #         foreach($aSystems as $sSystem => $aSystem) {
    #             if ($sModuleName !== $aSystem['module'])
    #                 continue;
    # 
    #             $o = self::getObjectInstance($sSystem, 0);
    #             $o->registerTranscoders();
    #         }
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onModuleDisable

  ## Parametros
    - sModuleName

  ## Retorno
    - any
  """
  def onModuleDisable(%{}) do
    # TODO: Implementacao futura
        # public static function onModuleDisable ($sModuleName)
    #     {
    #         $aSystems = self::getSystems();
    #         foreach($aSystems as $sSystem => $aSystem) {
    #             if ($sModuleName !== $aSystem['module'])
    #                 continue;
    # 
    #             $o = self::getObjectInstance($sSystem, 0);
    #             $o->unregisterTranscoders();
    #         }
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onModuleUninstall

  ## Parametros
    - sModuleName,&iFiles=null

  ## Retorno
    - any
  """
  def onModuleUninstall(%{}) do
    # TODO: Implementacao futura
        # public static function onModuleUninstall ($sModuleName, &$iFiles = null)
    #     {
    #         $aSystems = self::getSystems();
    #         foreach($aSystems as $sSystem => $aSystem) {
    #             if ($sModuleName !== $aSystem['module'])
    #                 continue;
    # 
    #             $o = self::getObjectInstance($sSystem, 0);
    #             $oQuery = $o->getQueryObject();
    # 
    #             // delete comments
    #             $aFiles = $aCmtIds = array ();
    #             $oQuery->deleteAll($aSystem['system_id'], $aFiles, $aCmtIds);
    # 
    #             // delete votes
    #             $o->deleteVotes($aCmtIds);
    # 
    #             // delete reactions
    #             $o->deleteReactions($aCmtIds);
    # 
    #             // delete scores
    #             $o->deleteScores($aCmtIds);
    # 
    #             // delete reports
    #             $o->deleteReports($aCmtIds);
    # 
    #             // delete meta info
    #             $o->deleteMetaInfo($aCmtIds);
    # 
    #             // delete files
    #             $oStorage = BxDolStorage::getObjectInstance($o->getStorageObjectName());
    #             if ($oStorage && $aFiles)
    #                 $oStorage->queueFilesForDeletion($aFiles);
    # 
    #             if (null !== $iFiles)
    #                 $iFiles += count($aFiles);
    # 
    #             // delete unique IDs
    #             $o->deleteUniqueIds($aCmtIds);
    #         }
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteVotes

  ## Parametros
    - mixedCmtId

  ## Retorno
    - any
  """
  def deleteVotes(%{}) do
    # TODO: Implementacao futura
        # public function deleteVotes ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = [$mixedCmtId];
    # 
    #         foreach($mixedCmtId as $iCmtId)
    #             if(($oReport = $this->getVoteObject($this->getCommentUniqId($iCmtId))) !== false)
    #                 $oReport->onObjectDelete();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteReactions

  ## Parametros
    - mixedCmtId

  ## Retorno
    - any
  """
  def deleteReactions(%{}) do
    # TODO: Implementacao futura
        # public function deleteReactions ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = [$mixedCmtId];
    # 
    #         foreach($mixedCmtId as $iCmtId)
    #             if(($oReport = $this->getReactionObject($this->getCommentUniqId($iCmtId))) !== false)
    #                 $oReport->onObjectDelete();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteScores

  ## Parametros
    - mixedCmtId

  ## Retorno
    - any
  """
  def deleteScores(%{}) do
    # TODO: Implementacao futura
        # public function deleteScores ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = [$mixedCmtId];
    # 
    #         foreach($mixedCmtId as $iCmtId)
    #             if(($oReport = $this->getScoreObject($this->getCommentUniqId($iCmtId))) !== false)
    #                 $oReport->onObjectDelete();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteReports

  ## Parametros
    - mixedCmtId

  ## Retorno
    - any
  """
  def deleteReports(%{}) do
    # TODO: Implementacao futura
        # public function deleteReports ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = [$mixedCmtId];
    # 
    #         foreach($mixedCmtId as $iCmtId)
    #             if(($oReport = $this->getReportObject($this->getCommentUniqId($iCmtId))) !== false)
    #                 $oReport->onObjectDelete();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteMetaInfo

  ## Parametros
    - mixedCmtId

  ## Retorno
    - any
  """
  def deleteMetaInfo(%{}) do
    # TODO: Implementacao futura
        # public function deleteMetaInfo ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = array($mixedCmtId);
    # 
    #         $oMetatags = false;
    #         if(!empty($this->_sMetatagsObj))
    #             $oMetatags = BxDolMetatags::getObjectInstance($this->_sMetatagsObj);
    # 
    #         if($oMetatags)
    #             foreach($mixedCmtId as $iCmtId)
    #                 $oMetatags->onDeleteContent($this->getCommentUniqId($iCmtId));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteUniqueIds

  ## Parametros
    - mixedCmtId

  ## Retorno
    - any
  """
  def deleteUniqueIds(%{}) do
    # TODO: Implementacao futura
        # public function deleteUniqueIds ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = array($mixedCmtId);
    # 
    #         foreach($mixedCmtId as $iCmtId)
    #             $this->_oQuery->deleteCmtIds($this->_aSystem['system_id'], $iCmtId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAdmin

  ## Parametros
    - iCmtAuthorId

  ## Retorno
    - any
  """
  def isAdmin(%{}) do
    # TODO: Implementacao futura
        # public function isAdmin($iCmtAuthorId)
    #     {
    #         return BxDolAcl::getInstance()->isMemberLevelInSet(array(MEMBERSHIP_ID_MODERATOR, MEMBERSHIP_ID_ADMINISTRATOR), $iCmtAuthorId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkAction

  ## Parametros
    - sAction,isPerformAction=false

  ## Retorno
    - any
  """
  def checkAction(%{}) do
    # TODO: Implementacao futura
        # public function checkAction ($sAction, $isPerformAction = false)
    #     {
    #         $iId = $this->_getAuthorId();
    #         $a = checkActionModule($iId, $sAction, 'system', $isPerformAction);
    #         return $a[CHECK_ACTION_RESULT] === CHECK_ACTION_RESULT_ALLOWED;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkActionErrorMsg

  ## Parametros
    - sAction

  ## Retorno
    - any
  """
  def checkActionErrorMsg(%{}) do
    # TODO: Implementacao futura
        # public function checkActionErrorMsg ($sAction)
    #     {
    #         $iId = $this->_getAuthorId();
    #         $a = checkActionModule($iId, $sAction, 'system');
    #         return $a[CHECK_ACTION_RESULT] !== CHECK_ACTION_RESULT_ALLOWED ? $a[CHECK_ACTION_MESSAGE] : '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isViewAllowed

  ## Parametros
    - isPerformAction=false

  ## Retorno
    - any
  """
  def isViewAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isViewAllowed ($isPerformAction = false)
    #     {
    #         if (BxDolRequest::serviceExists($this->_aSystem['module'], 'check_allowed_comments_view')) {
    #             $mixedResult = BxDolService::call($this->_aSystem['module'], 'check_allowed_comments_view', array($this->getId(), $this->getSystemName()));
    #             if($mixedResult !== CHECK_ACTION_RESULT_ALLOWED)
    #                 return $mixedResult;
    #         }
    # 
    #         return CHECK_ACTION_RESULT_ALLOWED;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isVoteAllowed

  ## Parametros
    - aCmt,isPerformAction=false

  ## Retorno
    - any
  """
  def isVoteAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isVoteAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if(!$this->isRatable())
    #             return false;
    # 
    #         $oVote = $this->getVoteObject($this->getCommentUniqId($aCmt['cmt_id']));
    #         if($oVote === false)
    #             return false;
    # 
    #         $iUserId = (int)$this->_getAuthorId();
    #         if($iUserId == 0)
    #             return false;
    # 
    #         if(isAdmin())
    #             return true;
    # 
    #         return $oVote->isAllowedVote($isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isScoreAllowed

  ## Parametros
    - aCmt,isPerformAction=false

  ## Retorno
    - any
  """
  def isScoreAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isScoreAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if(!$this->isRatable())
    #             return false;
    # 
    #         $oScore = $this->getScoreObject($this->getCommentUniqId($aCmt['cmt_id']));
    #         if($oScore === false)
    #             return false;
    # 
    #         $iUserId = (int)$this->_getAuthorId();
    #         if($iUserId == 0)
    #             return false;
    # 
    #         if(isAdmin())
    #             return true;
    # 
    #         return $oScore->isAllowedVote($isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isReportAllowed

  ## Parametros
    - aCmt,isPerformAction=false

  ## Retorno
    - any
  """
  def isReportAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isReportAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         $oReport = $this->getReportObject($aCmt['cmt_id']);
    #         if($oReport === false)
    #             return false;
    # 
    #         $iUserId = (int)$this->_getAuthorId();
    #         if($iUserId == 0)
    #             return false;
    # 
    #         if(isAdmin())
    #             return true;
    # 
    #         return $oReport->isAllowedReport($isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isPostAllowed

  ## Parametros
    - isPerformAction=false

  ## Retorno
    - any
  """
  def isPostAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isPostAllowed ($isPerformAction = false)
    #     {
    #         if (BxDolRequest::serviceExists($this->_aSystem['module'], 'check_allowed_comments_post')) {
    #             $mixedResult = BxDolService::call($this->_aSystem['module'], 'check_allowed_comments_post', array($this->getId(), $this->getSystemName()));
    #             if($mixedResult !== CHECK_ACTION_RESULT_ALLOWED)
    #                 return false;
    #         }
    # 
    #         return $this->checkAction ('comments post', $isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrPostAllowed

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def msgErrPostAllowed(%{}) do
    # TODO: Implementacao futura
        # public function msgErrPostAllowed ()
    #     {
    #         return $this->checkActionErrorMsg('comments post');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isReplyAllowed

  ## Parametros
    - mixedCmt,isPerformAction=false

  ## Retorno
    - any
  """
  def isReplyAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isReplyAllowed ($mixedCmt, $isPerformAction = false)
    #     {
    #         return $this->isPostAllowed($isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrReplyAllowed

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def msgErrReplyAllowed(%{}) do
    # TODO: Implementacao futura
        # public function msgErrReplyAllowed ()
    #     {
    #         return $this->msgErrPostAllowed ();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isQuoteAllowed

  ## Parametros
    - mixedCmt,isPerformAction=false

  ## Retorno
    - any
  """
  def isQuoteAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isQuoteAllowed ($mixedCmt, $isPerformAction = false)
    #     {
    #         return $this->_bPostQuote && $this->isReplyAllowed ($mixedCmt, $isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrQuoteAllowed

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def msgErrQuoteAllowed(%{}) do
    # TODO: Implementacao futura
        # public function msgErrQuoteAllowed ()
    #     {
    #         return $this->msgErrReplyAllowed ();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isPinAllowed

  ## Parametros
    - aCmt,isPerformAction=false

  ## Retorno
    - any
  """
  def isPinAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isPinAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if((int)$aCmt['cmt_parent_id'] != 0 || (int)$aCmt['cmt_pinned'] != 0)
    #             return false;
    # 
    #         if(isAdmin())
    #             return true;
    #         
    #         return $this->checkAction ('comments pin', $isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrPinAllowed

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def msgErrPinAllowed(%{}) do
    # TODO: Implementacao futura
        # public function msgErrPinAllowed ()
    #     {
    #         return $this->checkActionErrorMsg('comments pin');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isUnpinAllowed

  ## Parametros
    - aCmt,isPerformAction=false

  ## Retorno
    - any
  """
  def isUnpinAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isUnpinAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if((int)$aCmt['cmt_pinned'] == 0)
    #             return false;
    # 
    #         if(isAdmin())
    #             return true;
    #         
    #         return $this->checkAction ('comments pin', $isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrUnpinAllowed

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def msgErrUnpinAllowed(%{}) do
    # TODO: Implementacao futura
        # public function msgErrUnpinAllowed ()
    #     {
    #         return $this->checkActionErrorMsg('comments pin');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isEditAllowed

  ## Parametros
    - aCmt,isPerformAction=false

  ## Retorno
    - any
  """
  def isEditAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isEditAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if(isAdmin())
    #             return true;
    # 
    #         if($this->isEditAllowedAll($isPerformAction))
    #             return true;
    # 
    #         $mixedResult = BxDolService::call($this->_aSystem['module'], 'check_allowed_comments_post', array($this->getId(), $this->getSystemName()));
    #         if($mixedResult !== CHECK_ACTION_RESULT_ALLOWED)
    #             return false;
    # 
    #         return abs($aCmt['cmt_author_id']) == $this->_getAuthorId() && $this->checkAction ('comments edit own', $isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrEditAllowed

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def msgErrEditAllowed(%{}) do
    # TODO: Implementacao futura
        # public function msgErrEditAllowed ()
    #     {
    #         return $this->checkActionErrorMsg ('comments edit own');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isEditAllowedAll

  ## Parametros
    - isPerformAction=false

  ## Retorno
    - any
  """
  def isEditAllowedAll(%{}) do
    # TODO: Implementacao futura
        # public function isEditAllowedAll ($isPerformAction = false)
    #     {
    #         return $this->checkAction('comments edit all', $isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isRemoveAllowed

  ## Parametros
    - aCmt,isPerformAction=false

  ## Retorno
    - any
  """
  def isRemoveAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isRemoveAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if(isAdmin())
    #             return true;
    # 
    #         if($this->isRemoveAllowedAll($isPerformAction))
    #             return true;
    # 
    #         if(abs($aCmt['cmt_author_id']) == $this->_getAuthorId() && $this->checkAction ('comments remove own', $isPerformAction))
    #             return true;
    #         
    #         $aContentInfo = BxDolRequest::serviceExists($this->_aSystem['module'], 'get_all') ? BxDolService::call($this->_aSystem['module'], 'get_all', array(array('type' => 'id', 'id' => $this->getId()))) : array();
    #         $oModule = BxDolModule::getInstance($this->_aSystem['module']);
    #         $CNF = $oModule->_oConfig->CNF;
    #         
    #         if (isset($CNF['FIELD_AUTHOR']) && $aContentInfo[$CNF['FIELD_AUTHOR']] == $this->_getAuthorId() && $this->checkAction('comments remove in own content', $isPerformAction)){
    #             return true;
    #         }
    #         
    #         if (isset($CNF['FIELD_ALLOW_VIEW_TO']) &&  $aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']] < 0){
    #             $iGroupProfileId = -(int)$aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']];
    #             $oProfileContext = BxDolProfile::getInstance($iGroupProfileId);
    #             $oModule = BxDolModule::getInstance($oProfileContext->getModule()); 
    #             if ($oModule->_oConfig->isRoles() && $oModule->getRole($iGroupProfileId, $this->_getAuthorId()) === BX_BASE_MOD_GROUPS_ROLE_ADMINISTRATOR && $this->checkAction('comments remove in group context', $isPerformAction)){
    #                 return true;
    #             }
    #         }
    #         
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isRemoveAllowedAll

  ## Parametros
    - isPerformAction=false

  ## Retorno
    - any
  """
  def isRemoveAllowedAll(%{}) do
    # TODO: Implementacao futura
        # public function isRemoveAllowedAll ($isPerformAction = false)
    #     {
    #         return $this->checkAction ('comments remove all', $isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrRemoveAllowed

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def msgErrRemoveAllowed(%{}) do
    # TODO: Implementacao futura
        # public function msgErrRemoveAllowed ()
    #     {
    #         return $this->checkActionErrorMsg('comments remove own');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isMoreAllowed

  ## Parametros
    - aCmt,isPerformAction=false

  ## Retorno
    - any
  """
  def isMoreAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isMoreAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         $oMenuManage = BxDolMenu::getObjectInstance($this->_sMenuObjManage);
    #         $oMenuManage->setCmtsData($this, $aCmt['cmt_id']);
    #     	return $oMenuManage->isVisible();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isModerator

  ## Parametros
    - isPerformAction=false

  ## Retorno
    - any
  """
  def isModerator(%{}) do
    # TODO: Implementacao futura
        # public function isModerator($isPerformAction = false)
    #     {
    #         return $this->isEditAllowedAll($isPerformAction) || $this->isRemoveAllowedAll($isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionPin

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionPin(%{}) do
    # TODO: Implementacao futura
        # public function actionPin ()
    #     {
    #         if (!$this->isEnabled())
    #             return echoJson(array());
    # 
    #         $iCmtId = 0;
    #         if(bx_get('Cmt') !== false)
    #             $iCmtId = bx_process_input(bx_get('Cmt'), BX_DATA_INT);
    # 
    #         $aCmt = $this->getCommentRow($iCmtId);
    #         if(empty($aCmt) || !is_array($aCmt))
    #             return echoJson(array());
    # 
    #         $iWay = 0;
    #         if(bx_get('way') !== false)
    #             $iWay = bx_process_input(bx_get('way'), BX_DATA_INT);
    # 
    #         if(!$this->_oQuery->updateComments(array('cmt_pinned' => $iWay ? time() : 0), array('cmt_id' => $iCmtId)))
    #             return echoJson(array());
    # 
    #         $aBp = $aDp = array();
    #         $this->_getParams($aBp, $aDp);
    #         $this->_prepareParams($aBp, $aDp);
    # 
    #         echoJson(array(
    #             'parent_id' => $aCmt['cmt_parent_id'],
    #             'per_view' => $aBp['per_view']
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetFormPost

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionGetFormPost(%{}) do
    # TODO: Implementacao futura
        # public function actionGetFormPost ()
    #     {
    #         if (!$this->isEnabled())
    #             return '';
    # 
    #         $iCmtParentId = bx_get('CmtParent');
    #         $iCmtParentId = $iCmtParentId !== false ? bx_process_input($iCmtParentId, BX_DATA_INT) : 0;
    #         
    #         $sCmtBrowse = bx_get('CmtBrowse');
    #         $sCmtBrowse = $sCmtBrowse !== false ? bx_process_input($sCmtBrowse, BX_DATA_TEXT) : '';
    # 
    #         $sCmtDisplay = bx_get('CmtDisplay');
    #         $sCmtDisplay = $sCmtDisplay !== false ? bx_process_input($sCmtDisplay, BX_DATA_TEXT) : '';
    # 
    #         $bQuote = bx_get('CmtQuote');
    #         $bQuote = $bQuote !== false ? bx_process_input($bQuote, BX_DATA_INT) == 1 : false;
    # 
    #         $bMinPostForm = bx_get('CmtMinPostForm');
    #         $bMinPostForm = $bMinPostForm !== false ? bx_process_input($bMinPostForm, BX_DATA_INT) == 1 : $this->_bMinPostForm;
    # 
    #         return $this->getFormBoxPost(array('parent_id' => $iCmtParentId, 'type' => $sCmtBrowse), array('type' => $sCmtDisplay, 'dynamic_mode' => true, 'quote' => $bQuote, 'min_post_form' => $bMinPostForm));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetFormEdit

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionGetFormEdit(%{}) do
    # TODO: Implementacao futura
        # public function actionGetFormEdit ()
    #     {
    #         if (!$this->isEnabled())
    #             return echoJson(array());
    # 
    #         $iCmtId = bx_process_input(bx_get('Cmt'), BX_DATA_INT);
    #         echoJson($this->getFormEdit($iCmtId, array('dynamic_mode' => true)));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetCmt

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionGetCmt(%{}) do
    # TODO: Implementacao futura
        # public function actionGetCmt ()
    #     {
    #         if(!$this->isEnabled())
    #             return '';
    # 
    #         if($this->isViewAllowed() !== CHECK_ACTION_RESULT_ALLOWED)
    #             return '';
    # 
    #         $iCmtId = bx_process_input($_REQUEST['Cmt'], BX_DATA_INT);
    #         $sCmtBrowse = isset($_REQUEST['CmtBrowse']) ? bx_process_input($_REQUEST['CmtBrowse'], BX_DATA_TEXT) : '';
    #         $sCmtDisplay = isset($_REQUEST['CmtDisplay']) ? bx_process_input($_REQUEST['CmtDisplay'], BX_DATA_TEXT) : '';
    # 
    #         $aCmt = $this->getCommentRow($iCmtId);
    #         echoJson([
    #             'parent_id' => $aCmt['cmt_parent_id'],
    #             'vparent_id' => $aCmt['cmt_parent_id'],
    #             'content' => $this->getComment($aCmt, ['type' => $sCmtBrowse], ['type' => $sCmtDisplay, 'dynamic_mode' => true])
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetCmts

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionGetCmts(%{}) do
    # TODO: Implementacao futura
        # public function actionGetCmts ()
    #     {
    #         if (!$this->isEnabled())
    #             return '';
    # 
    #         if($this->isViewAllowed() !== CHECK_ACTION_RESULT_ALLOWED)
    #             return '';
    # 
    #         $aBp = $aDp = array();
    #         $this->_getParams($aBp, $aDp);
    # 
    #         $aDp['dynamic_mode'] = true;
    # 
    #         //--- Beg: Using pregenerated structure
    #         if(isset($aDp['structure']) && $aDp['structure'] === true) {
    #             $iCmtId = isset($aBp['parent_id']) ? (int)$aBp['parent_id'] : 0;
    # 
    #             $mixedStructure = $this->getCommentStructure($iCmtId, $aBp, $aDp);
    #             if($mixedStructure === false || empty($mixedStructure[$iCmtId]['items'])) 
    #                 return '';
    # 
    #             $aDp['structure'] = $mixedStructure[$iCmtId]['items'];
    #             return $this->getCommentsByStructure($aBp, $aDp);
    #         }
    #         //--- End: Using pregenerated structure
    #         else
    #             return $this->{'getComments' . ($aBp['pinned'] ? 'Pinned' : '')}($aBp, $aDp);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionSubmitPostForm

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionSubmitPostForm(%{}) do
    # TODO: Implementacao futura
        # public function actionSubmitPostForm()
    #     {
    #         if(!$this->isEnabled())
    #             return echoJson(array());
    # 
    #         $iCmtParentId = 0;
    #         if(bx_get('cmt_parent_id') !== false)
    #             $iCmtParentId = bx_process_input(bx_get('cmt_parent_id'), BX_DATA_INT);
    # 
    #         echoJson($this->getFormPost($iCmtParentId, array('dynamic_mode' => true)));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionSubmitEditForm

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionSubmitEditForm(%{}) do
    # TODO: Implementacao futura
        # public function actionSubmitEditForm()
    #     {
    #         if (!$this->isEnabled()) {
    #             echoJson(array());
    #             return;
    #         };
    # 
    #         $iCmtId = 0;
    #         if(bx_get('cmt_id') !== false)
    #             $iCmtId = bx_process_input(bx_get('cmt_id'), BX_DATA_INT);
    # 
    #         echoJson($this->getFormEdit($iCmtId, array('dynamic_mode' => true)));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionRemove

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionRemove(%{}) do
    # TODO: Implementacao futura
        # public function actionRemove()
    #     {
    #         if (!$this->isEnabled())
    #             return echoJson([]);
    # 
    #         $iCmtId = 0;
    #         if(bx_get('Cmt') !== false)
    #             $iCmtId = bx_process_input(bx_get('Cmt'), BX_DATA_INT);
    # 
    #         echoJson($this->remove($iCmtId));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP remove

  ## Parametros
    - iCmtId

  ## Retorno
    - any
  """
  def remove(%{}) do
    # TODO: Implementacao futura
        # public function remove($iCmtId)
    #     {
    #         $aCmt = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iCmtId));
    #         if(!$aCmt)
    #             return array('msg' => _t('_No such comment'));
    #         
    #         $iObjId = $this->getId();
    #         if(!$iObjId){
    #             $this->setId($aCmt['cmt_object_id']);
    #             $iObjId = $aCmt['cmt_object_id'];
    #         }
    #         $iObjAthrId = $this->getObjectAuthorId($iObjId);
    #         $iObjAthrPrivacyView = $this->getObjectPrivacyView($iObjId);
    # 
    #         if($aCmt['cmt_replies'] > 0) {
    #             if(!$this->isModerator())
    #                 return array('msg' => _t('_Can not delete comments with replies'));
    # 
    #             $aReplies = $this->_oQuery->getCommentsBy(array('type' => 'parent_id', 'parent_id' => $iCmtId));
    #             foreach($aReplies as $aReply)
    #                 $this->remove($aReply['cmt_id']);
    #         }
    # 
    #         $iPerformerId = $this->_getAuthorId();
    #         if(!$this->isRemoveAllowed($aCmt))
    #             return array('msg' => $aCmt['cmt_author_id'] == $iPerformerId ? strip_tags($this->msgErrRemoveAllowed()) : _t('_Access denied'));
    # 
    #         $iCmtPrntId = (int)$aCmt['cmt_parent_id'];
    #         if(!$this->_oQuery->removeComment($iObjId, $iCmtId, $iCmtPrntId)) 
    #             return array('msg' => _t('_cmt_err_cannot_perform_action'));
    # 
    #         $this->_triggerComment();
    # 
    #         $oStorage = BxDolStorage::getObjectInstance($this->getStorageObjectName());
    # 
    #         $aImages = $this->_oQuery->getFiles($this->_aSystem['system_id'], $iCmtId);
    #         foreach($aImages as $aImage)
    #             $oStorage->deleteFile($aImage['image_id']);
    # 
    #         $this->_oQuery->deleteImages($this->_aSystem['system_id'], $iCmtId);
    # 
    #         $this->isRemoveAllowed($aCmt, true);
    # 
    #         $this->deleteVotes($iCmtId);
    # 
    #         $this->deleteReactions($iCmtId);
    # 
    #         $this->deleteScores($iCmtId);
    # 
    #         $this->deleteReports($iCmtId);
    # 
    #         $this->deleteMetaInfo($iCmtId);
    # 
    #         $aAuditParams = $this->_prepareAuditParams($iCmtId, array('comment_author_id' => $aCmt['cmt_author_id'], 'comment_text' => $aCmt['cmt_text']));
    #         bx_audit($iObjId, $this->_aSystem['module'], '_sys_audit_action_delete_comment', $aAuditParams);
    # 
    #         $aAlertParams = $this->_prepareAlertParams($aCmt);
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_dol_comment-commentRemoved '{object_name}', 'commentRemoved' - hook after a comment was removed
    #          * - $unit_name - comment object name
    #          * - $action - equals `commentRemoved`
    #          * - $object_id - commented object id
    #          * - $sender_id - profile id who performed the action
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `source` - [string] unique comment source string
    #          *      - `object_system` - [string] comment object name
    #          *      - `object_id` - [int] commented object id
    #          *      - `object_author_id` - [int] commented object author profile id
    #          *      - `comment_id` - [int] comment id unique in the comment object scope
    #          *      - `comment_uniq_id` - [int] system wide unique comment id
    #          *      - `comment_author_id` - [int] comment author profile id
    #          *      - `comment_text` - [string] comment text
    #          *      - `privacy_view` - [int] or [string] privacy for view comment action, @see BxDolPrivacy
    #          *      - `cf` - [int] comment's audience filter value
    #          * @hook @ref hook-bx_dol_comment-commentRemoved
    #          */
    #         bx_alert($this->_sSystem, 'commentRemoved', $iObjId, $iPerformerId, $aAlertParams);
    #         
    #         /**
    #          * @hooks
    #          * @hookdef hook-comment-deleted 'comment', 'deleted' - hook after a comment was removed
    #          * It's equivalent to @ref hook-bx_dol_comment-commentRemoved
    #          * except 'comment id' is provided in $object_id
    #          * @hook @ref hook-comment-deleted
    #          */
    #         bx_alert('comment', 'deleted', $iCmtId, $iPerformerId, $aAlertParams);
    # 
    #         if(!empty($iCmtPrntId)) {
    #             $aCmtPrnt = $this->_oQuery->getCommentSimple($iObjId, $iCmtPrntId);
    #             if(!empty($aCmtPrnt) && is_array($aCmtPrnt)) {
    #                 $aAlertParamsReply = $this->_prepareAlertParamsReply($aCmt, $aCmtPrnt);
    # 
    #                 /**
    #                  * @hooks
    #                  * @hookdef hook-bx_dol_comment-replyRemoved '{object_name}', 'replyRemoved' - hook after a reply was removed
    #                  * - $unit_name - comment object name
    #                  * - $action - equals `replyRemoved`
    #                  * - $object_id - commented object id
    #                  * - $sender_id - profile id who performed the action
    #                  * - $extra_params - array of additional params with the following array keys:
    #                  *      - `source` - [string] unique comment source string
    #                  *      - `object_system` - [string] comment object name
    #                  *      - `object_id` - [int] commented object id
    #                  *      - `object_author_id` - [int] commented object author profile id
    #                  *      - `object_author_id` - [int] commented object author profile id
    #                  *      - `parent_id` - [int] parent comment id unique in the comment object scope
    #                  *      - `parent_uniq_id` - [int] system wide unique parent comment id
    #                  *      - `parent_author_id` - [int] parent comment author profile id
    #                  *      - `comment_id` - [int] comment id unique in the comment object scope
    #                  *      - `comment_uniq_id` - [int] system wide unique comment id
    #                  *      - `comment_author_id` - [int] comment author profile id
    #                  *      - `comment_text` - [string] comment text
    #                  *      - `privacy_view` - [int] or [string] privacy for view comment action, @see BxDolPrivacy
    #                  * @hook @ref hook-bx_dol_comment-replyRemoved
    #                  */
    #                 bx_alert($this->_sSystem, 'replyRemoved', $iCmtPrntId, $iPerformerId, $aAlertParamsReply);
    #                 
    #                 /**
    #                  * @hooks
    #                  * @hookdef hook-reply-deleted 'reply', 'deleted' - hook after a reply was removed
    #                  * It's equivalent to @ref hook-bx_dol_comment-replyRemoved
    #                  * except 'comment id' is provided in $object_id
    #                  * @hook @ref hook-reply-deleted
    #                  */
    #                 bx_alert('reply', 'deleted', $iCmtId, $iPerformerId, $aAlertParamsReply);
    #             }
    #         }
    # 
    #         $this->deleteUniqueIds($iCmtId);
    # 
    #         $iCount = (int)$this->getCommentsCountAll(0, true);
    #         $aResult = [
    #             'id' => $iCmtId,
    #             'count' => $iCount,
    #             'countf' => $iCount > 0 ? $this->getCounter() : ''
    #         ];
    # 
    #         if(($oSockets = BxDolSockets::getInstance()) && $oSockets->isEnabled()) {
    #             $oSockets->sendEvent($this->getSocketName(), $iObjId, 'comment_deleted', json_encode(array_merge($aResult, [
    #                 'author_id' => $iPerformerId
    #             ])));
    # 
    #             /**
    #              * Send 'content edited' event.
    #              * Note. 0 is used as $iContentId to allow to subscribe on all events at once.
    #              */
    #             $oSockets->sendEvent($this->_aSystem['module'], 0, 'edited', json_encode([
    #                 'id' => $iObjId,
    #                 'author_id' => $this->getObjectAuthorId(),
    #                 'cmt_author_id' => $aCmt['cmt_author_id'],
    #                 'peformer_id' => $iPerformerId
    #             ]));
    #         }
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP add

  ## Parametros
    - aValues

  ## Retorno
    - any
  """
  def add(%{}) do
    # TODO: Implementacao futura
        # public function add($aValues)
    #     {
    #         return $this->_getFormAdd($aValues);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionResumeLiveUpdate

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionResumeLiveUpdate(%{}) do
    # TODO: Implementacao futura
        # public function actionResumeLiveUpdate()
    #     {
    #     	$sKey = $this->getNotificationId();
    # 
    #     	bx_import('BxDolSession');
    #     	BxDolSession::getInstance()->unsetValue($sKey);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionPauseLiveUpdate

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionPauseLiveUpdate(%{}) do
    # TODO: Implementacao futura
        # public function actionPauseLiveUpdate()
    #     {
    #     	$sKey = $this->getNotificationId();
    # 
    #     	bx_import('BxDolSession');
    #     	BxDolSession::getInstance()->setValue($sKey, 1);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetSiblingFiles

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionGetSiblingFiles(%{}) do
    # TODO: Implementacao futura
        # public function actionGetSiblingFiles()
    #     {
    #         $iFileId = 0;
    #         if(bx_get('file_id') !== false)
    #             $iFileId = bx_process_input(bx_get('file_id'), BX_DATA_INT);
    # 
    #         if(!($aFileInfo = $this->_oQuery->getFileInfoById((int)$iFileId))) 
    #             return echoJson(['error' => _t('_sys_txt_error_occured')]);
    # 
    #         $aSiblings = [];
    #         $aFiles = $this->_oQuery->getFiles($aFileInfo['system_id'], $aFileInfo['cmt_id']);
    #         foreach($aFiles as $iIndex => $aFile) {
    #             if($aFile['id'] != $iFileId)
    #                 continue;
    # 
    #             $aSiblings['prev'] = isset($aFiles[$iIndex - 1]) ? $aFiles[$iIndex - 1] : false;
    #             $aSiblings['next'] = isset($aFiles[$iIndex + 1]) ? $aFiles[$iIndex + 1] : false;
    #         }
    # 
    #         $oStorage = BxDolStorage::getObjectInstance($this->getStorageObjectName());
    #         $oTranscoder = BxDolTranscoderImage::getObjectInstance($this->getTranscoderPreviewName());
    # 
    #         foreach($aSiblings as $sSibling => $aSibling) {
    #             if(!$aSibling)
    #                 continue;
    # 
    #             $sFile = '';
    #             if($oTranscoder && $oTranscoder->isMimeTypeSupported($aSibling['mime_type']))
    #                 $sFile = $oStorage->getFileUrlById($aSibling['image_id']);
    #             else
    #                 $sFile = $this->_oTemplate->getIconUrl($oStorage->getIconNameByFileName($aFile['file_name']));
    # 
    #             $aImageInfo = BxDolImageResize::getInstance()->getImageSize($sFile);
    # 
    #             $iWidth = $iHeight = 0;
    #             if(isset($aImageInfo['w']))
    #                 $iWidth = (int)$aImageInfo['w'];
    #             if(isset($aImageInfo['h']))
    #                 $iHeight = (int)$aImageInfo['h'];
    # 
    #             $aSiblings[$sSibling] = array_merge($aSibling, [
    #                 'file' => $sFile,
    #                 'file_id' => $aSibling['id'],
    #                 'w' => $iWidth, 
    #                 'h' => $iHeight
    #             ]);
    #         }
    # 
    #         return echoJson($aSiblings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onPostAfter

  ## Parametros
    - iCmtId,aDp=[]

  ## Retorno
    - any
  """
  def onPostAfter(%{}) do
    # TODO: Implementacao futura
        # public function onPostAfter($iCmtId, $aDp = [])
    #     {
    #         $iObjId = (int)$this->getId();
    # 
    #         $aCmt = $this->_oQuery->getCommentSimple($iObjId, $iCmtId);
    #         if(empty($aCmt) || !is_array($aCmt))
    #             return false;
    # 
    #         $iCmtPrntId = (int)$aCmt['cmt_parent_id'];
    #         $iPerformerId = (int)$aCmt['cmt_author_id'];
    # 
    #         $aAlertParams = $this->_prepareAlertParams($aCmt);
    #         
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_dol_comment-commentPost '{object_name}', 'commentPost' - hook after a comment was added
    #          * - $unit_name - comment object name
    #          * - $action - equals `commentPost`
    #          * - $object_id - commented object id
    #          * - $sender_id - profile id who performed the action
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `source` - [string] unique comment source string
    #          *      - `object_system` - [string] comment object name
    #          *      - `object_id` - [int] commented object id
    #          *      - `object_author_id` - [int] commented object author profile id
    #          *      - `comment_id` - [int] comment id unique in the comment object scope
    #          *      - `comment_uniq_id` - [int] system wide unique comment id
    #          *      - `comment_author_id` - [int] comment author profile id
    #          *      - `comment_text` - [string] comment text
    #          *      - `privacy_view` - [int] or [string] privacy for view comment action, @see BxDolPrivacy
    #          *      - `cf` - [int] comment's audience filter value
    #          * @hook @ref hook-bx_dol_comment-commentPost
    #          */
    #         bx_alert($this->_sSystem, 'commentPost', $iObjId, $iPerformerId, $aAlertParams);
    #         
    #         /**
    #          * @hooks
    #          * @hookdef hook-comment-added 'comment', 'added' - hook after a comment was added
    #          * It's equivalent to @hook @ref hook-bx_dol_comment-commentPost
    #          * except 'comment id' is provided in $object_id
    #          * @hook @ref hook-comment-added
    #          */
    #         bx_alert('comment', 'added', $iCmtId, $iPerformerId, $aAlertParams);
    # 
    #         $aAuditParams = $this->_prepareAuditParams($iCmtId, array('comment_author_id' => $aCmt['cmt_author_id'], 'comment_text' => $aCmt['cmt_text']));
    #         bx_audit($iObjId, $this->_aSystem['module'], '_sys_audit_action_add_comment', $aAuditParams);
    # 
    #         if(!empty($iCmtPrntId)) {
    #             $aCmtPrnt = $this->_oQuery->getCommentSimple($iObjId, $iCmtPrntId);
    #             if(!empty($aCmtPrnt) && is_array($aCmtPrnt)) {
    #                 $aAlertParamsReply = $this->_prepareAlertParamsReply($aCmt, $aCmtPrnt);
    #                 
    #                 /**
    #                  * @hooks
    #                  * @hookdef hook-bx_dol_comment-replyPost '{object_name}', 'replyPost' - hook after a reply was added
    #                  * - $unit_name - comment object name
    #                  * - $action - equals `replyPost`
    #                  * - $object_id - parent comment id
    #                  * - $sender_id - profile id who performed the action
    #                  * - $extra_params - array of additional params with the following array keys:
    #                  *      - `source` - [string] unique comment source string
    #                  *      - `object_system` - [string] comment object name
    #                  *      - `object_id` - [int] commented object id
    #                  *      - `object_author_id` - [int] commented object author profile id
    #                  *      - `object_author_id` - [int] commented object author profile id
    #                  *      - `parent_id` - [int] parent comment id unique in the comment object scope
    #                  *      - `parent_uniq_id` - [int] system wide unique parent comment id
    #                  *      - `parent_author_id` - [int] parent comment author profile id
    #                  *      - `comment_id` - [int] comment id unique in the comment object scope
    #                  *      - `comment_uniq_id` - [int] system wide unique comment id
    #                  *      - `comment_author_id` - [int] comment author profile id
    #                  *      - `comment_text` - [string] comment text
    #                  *      - `privacy_view` - [int] or [string] privacy for view comment action, @see BxDolPrivacy
    #                  * @hook @ref hook-bx_dol_comment-replyPost
    #                  */
    #                 bx_alert($this->_sSystem, 'replyPost', $iCmtPrntId, $iPerformerId, $aAlertParamsReply);
    #                 
    #                 /**
    #                  * @hooks
    #                  * @hookdef hook-comment-replied 'comment', 'replied' - hook after a reply was added
    #                  * It's equivalent to @ref hook-bx_dol_comment-replyPost
    #                  * except 'comment id' is provided in $object_id
    #                  * @hook @ref hook-comment-replied
    #                  */
    #                 bx_alert('comment', 'replied', $iCmtId, $iPerformerId, $aAlertParamsReply);
    #             }
    #         }
    # 
    #         $iCount = (int)$this->getCommentsCountAll(0, true);
    #         $aResult = [
    #             'id' => $iCmtId, 
    #             'parent_id' => $iCmtPrntId,
    #             'count' => $iCount,
    #             'countf' => $iCount > 0 ? $this->getCounter(['show_script' => false]) : ''
    #         ];
    # 
    #         if(($oSockets = BxDolSockets::getInstance()) && $oSockets->isEnabled()) {
    #             $oSockets->sendEvent($this->getSocketName(), $iObjId, 'comment_added', json_encode(array_merge($aResult, [
    #                 'author_id' => $iPerformerId, 
    #                 'anchor' => $this->getItemAnchor($iCmtId)
    #             ])));
    # 
    #             /**
    #              * Send 'content edited' event.
    #              * Note. 0 is used as $iContentId to allow to subscribe on all events at once.
    #              */
    #             $oSockets->sendEvent($this->_aSystem['module'], 0, 'edited', json_encode([
    #                 'id' => $iObjId,
    #             ]));
    #         }
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onEditAfter

  ## Parametros
    - iCmtId,aDp=[]

  ## Retorno
    - any
  """
  def onEditAfter(%{}) do
    # TODO: Implementacao futura
        # public function onEditAfter($iCmtId, $aDp = [])
    #     {
    #     	$aCmt = $this->getCommentRow($iCmtId);
    #         if(empty($aCmt) || !is_array($aCmt))
    #             return false;
    # 
    #         $aBp = [];
    #         $this->_getParams($aBp, $aDp);
    # 
    #         $iObjId = (int)$this->getId();
    #         $iPerformerId = $this->_getAuthorId();
    # 
    #         $aAlertParams = $this->_prepareAlertParams($aCmt);
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_dol_comment-commentUpdated '{object_name}', 'commentUpdated' - hook after a comment was updated (edited)
    #          * - $unit_name - comment object name
    #          * - $action - equals `commentUpdated`
    #          * - $object_id - commented object id
    #          * - $sender_id - profile id who performed the action
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `source` - [string] unique comment source string
    #          *      - `object_system` - [string] comment object name
    #          *      - `object_id` - [int] commented object id
    #          *      - `object_author_id` - [int] commented object author profile id
    #          *      - `comment_id` - [int] comment id unique in the comment object scope
    #          *      - `comment_uniq_id` - [int] system wide unique comment id
    #          *      - `comment_author_id` - [int] comment author profile id
    #          *      - `comment_text` - [string] comment text
    #          *      - `privacy_view` - [int] or [string] privacy for view comment action, @see BxDolPrivacy
    #          *      - `cf` - [int] comment's audience filter value
    #          * @hook @ref hook-bx_dol_comment-commentUpdated
    #          */
    #         bx_alert($this->_sSystem, 'commentUpdated', $iObjId, $iPerformerId, $aAlertParams);
    #         
    #         /**
    #          * @hooks
    #          * @hookdef hook-comment-edited 'comment', 'edited' - hook after a comment was updated (edited)
    #          * It's equivalent to @ref hook-bx_dol_comment-commentUpdated
    #          * except 'comment id' is provided in $object_id
    #          * @hook @ref hook-comment-edited
    #          */
    #         bx_alert('comment', 'edited', $iCmtId, $iPerformerId, $aAlertParams);
    # 
    #         $aAuditParams = $this->_prepareAuditParams($iCmtId, ['comment_author_id' => $aCmt['cmt_author_id'], 'comment_text' => $aCmt['cmt_text']]);
    #         bx_audit($iObjId, $this->_aSystem['module'], '_sys_audit_action_edit_comment', $aAuditParams);
    # 
    #         $aResult = [
    #             'id' => $iCmtId, 
    #             'content' => $this->_getContent($aCmt, $aBp, $aDp)
    #         ];
    # 
    #         if(($oSockets = BxDolSockets::getInstance()) && $oSockets->isEnabled()) {
    #             $oSockets->sendEvent($this->getSocketName(), $iObjId, 'comment_edited', json_encode(array_merge($aResult, [
    #                 'author_id' => $iPerformerId, 
    #                 'anchor' => $this->getItemAnchor($iCmtId)
    #             ])));
    # 
    #             /**
    #              * Send 'content edited' event.
    #              * Note. 0 is used as $iContentId to allow to subscribe on all events at once.
    #              */
    #             $oSockets->sendEvent($this->_aSystem['module'], 0, 'edited', json_encode([
    #                 'id' => $iObjId,
    #             ]));
    #         }
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetAuthor

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetAuthor(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetAuthor ($iContentId)
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    #         $this->setId($aComment['cmt_object_id']);
    # 
    #         return $aComment['cmt_author_id'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetDateAdded

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetDateAdded(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetDateAdded ($iContentId)
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    #         $this->setId($aComment['cmt_object_id']);
    # 
    #         return $aComment['cmt_time'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetDateChanged

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetDateChanged(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetDateChanged ($iContentId)
    #     {
    #         return 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetLink

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetLink(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetLink ($iContentId)
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    #         $this->setId($aComment['cmt_object_id']);
    # 
    #         return $this->getViewUrl($iContentId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetTitle

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetTitle(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetTitle ($iContentId)
    #     {
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetText

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetText(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetText ($iContentId)
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    #         $this->setId($aComment['cmt_object_id']);
    # 
    #         return $aComment['cmt_text'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetThumb

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetThumb(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetThumb ($iContentId)
    #     {
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetInfo

  ## Parametros
    - iContentId,bSearchableFieldsOnly=true

  ## Retorno
    - any
  """
  def serviceGetInfo(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetInfo ($iContentId, $bSearchableFieldsOnly = true)
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    #         $this->setId($aComment['cmt_object_id']);
    # 
    #         return BxDolContentInfo::formatFields($aComment);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetInfoApi

  ## Parametros
    - iContentId,bExtendedUnits=false

  ## Retorno
    - any
  """
  def serviceGetInfoApi(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetInfoApi ($iContentId, $bExtendedUnits = false)
    #     {
    #         $aData = $this->serviceGetInfo($iContentId, false);
    #         if($aData)
    #             $aData = $this->getDataAPI($aData, ['extended' => $bExtendedUnits]);
    # 
    #         return $aData;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetSearchResultUnit

  ## Parametros
    - iContentId,sUnitTemplate=''

  ## Retorno
    - any
  """
  def serviceGetSearchResultUnit(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetSearchResultUnit ($iContentId, $sUnitTemplate = '')
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    #         if(empty($aComment) || !is_array($aComment))
    #             return '';
    # 
    #         $this->setId($aComment['cmt_object_id']);
    # 
    #         return $this->getComment($aComment, array(), array('type' => BX_CMT_DISPLAY_FLAT, 'view_only' => true));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetSearchResultExtended

  ## Parametros
    - aParams,iStart=0,iPerPage=0,bFilterMode=false

  ## Retorno
    - any
  """
  def serviceGetSearchResultExtended(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetSearchResultExtended($aParams, $iStart = 0, $iPerPage = 0, $bFilterMode = false)
    #     {
    #         if((empty($aParams) || !is_array($aParams)) && !$bFilterMode)
    #             return array();
    # 
    #         return $this->_oQuery->getCommentsBy(array('type' => 'search_ids', 'search_params' => $aParams, 'start' => $iStart, 'per_page' => $iPerPage));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAuthorInfo

  ## Parametros
    - iAuthorId=0

  ## Retorno
    - any
  """
  def getAuthorInfo(%{}) do
    # TODO: Implementacao futura
        # public function getAuthorInfo($iAuthorId = 0)
    #     {
    #         return $this->_getAuthorInfo($iAuthorId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getParams

  ## Parametros
    - &aBp,&aDp

  ## Retorno
    - any
  """
  def getParams(%{}) do
    # TODO: Implementacao futura
        # public function getParams(&$aBp, &$aDp)
    #     {
    #         return $this->_getParams($aBp, $aDp);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP prepareParams

  ## Parametros
    - &aBp,&aDp

  ## Retorno
    - any
  """
  def prepareParams(%{}) do
    # TODO: Implementacao futura
        # public function prepareParams(&$aBp, &$aDp)
    #     {
    #          return $this->_prepareParams($aBp, $aDp);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getAuthorId

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getAuthorId(%{}) do
    # TODO: Implementacao futura
        # protected function _getAuthorId ()
    #     {
    #         return isMember() ? bx_get_logged_profile_id() : 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getAuthorPassword

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getAuthorPassword(%{}) do
    # TODO: Implementacao futura
        # protected function _getAuthorPassword ()
    #     {
    #         return getLoggedPassword();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getAuthorIp

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getAuthorIp(%{}) do
    # TODO: Implementacao futura
        # protected function _getAuthorIp ()
    #     {
    #         return getVisitorIP();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getAuthorInfo

  ## Parametros
    - iAuthorId=0

  ## Retorno
    - any
  """
  def _getAuthorInfo(%{}) do
    # TODO: Implementacao futura
        # protected function _getAuthorInfo($iAuthorId = 0)
    #     {
    #         $iUserId = $this->_getAuthorId();
    #         $iAuthorId = (int)$iAuthorId;
    #         $oProfile = $this->_getAuthorObject($iAuthorId);
    #         if (!$oProfile->isActive() && !isAdmin() && !BxDolAcl::getInstance()->isMemberLevelInSet(array(MEMBERSHIP_ID_MODERATOR, MEMBERSHIP_ID_ADMINISTRATOR)))
    #             $oProfile = BxDolProfileUndefined::getInstance();
    # 
    #         return array(
    #             $oProfile->getDisplayName(),
    #             $oProfile->getUrl(),
    #             $oProfile->getThumb(),
    #             $oProfile->getUnit(0, array('template' => 'unit_wo_info')),
    #             $oProfile->getBadges()
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getAuthorObject

  ## Parametros
    - iAuthorId=0

  ## Retorno
    - any
  """
  def _getAuthorObject(%{}) do
    # TODO: Implementacao futura
        # protected function _getAuthorObject($iAuthorId = 0)
    #     {
    #         return BxDolProfile::getInstanceMagic((int)$iAuthorId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getFormObject

  ## Parametros
    - sAction=BX_CMT_ACTION_POST

  ## Retorno
    - any
  """
  def _getFormObject(%{}) do
    # TODO: Implementacao futura
        # protected function _getFormObject($sAction = BX_CMT_ACTION_POST)
    #     {
    #         $sDisplayName = '_sFormDisplay' . ucfirst($sAction);
    # 
    #         return BxDolForm::getObjectInstance($this->_sFormObject, $this->$sDisplayName, $this->_oTemplate, $this->_sSystem);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _unsetFormObject

  ## Parametros
    - sAction=BX_CMT_ACTION_POST

  ## Retorno
    - any
  """
  def _unsetFormObject(%{}) do
    # TODO: Implementacao futura
        # protected function _unsetFormObject($sAction = BX_CMT_ACTION_POST)
    #     {
    #         $sDisplayName = '_sFormDisplay' . ucfirst($sAction);
    # 
    #         return BxDolForm::unsetObjectInstance($this->_sFormObject, $this->$sDisplayName, $this->_oTemplate, $this->_sSystem);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getParams

  ## Parametros
    - &aBp,&aDp

  ## Retorno
    - any
  """
  def _getParams(%{}) do
    # TODO: Implementacao futura
        # protected function _getParams(&$aBp, &$aDp)
    #     {
    #         //--- Process 'Browse' params. 
    #         $aBp['parent_id'] = isset($aBp['parent_id']) ? (int)$aBp['parent_id'] : 0;
    # 
    #         $aBp['vparent_id'] = isset($aBp['vparent_id']) ? (int)$aBp['vparent_id'] : 0;
    #         if(bx_get('CmtParent') !== false)
    #             $aBp['vparent_id'] = bx_process_input(bx_get('CmtParent'), BX_DATA_INT);
    # 
    #     	$aBp['type'] = isset($aBp['type']) ? $aBp['type'] : '';
    #     	if(bx_get('CmtBrowse') !== false) 
    #         	$aBp['type'] = bx_process_input(bx_get('CmtBrowse'), BX_DATA_TEXT);
    # 
    #     	$aBp['filter'] = isset($aBp['filter']) ? $aBp['filter'] : '';
    #     	if(bx_get('CmtFilter') !== false) 
    #     	    $aBp['filter'] = bx_process_input(bx_get('CmtFilter'), BX_DATA_TEXT);
    # 
    #         $aBp['start'] = isset($aBp['start']) ? (int)$aBp['start'] : -1;
    #         if(bx_get('CmtStart') !== false) 
    #             $aBp['start'] = bx_process_input($_REQUEST['CmtStart'], BX_DATA_INT);
    # 
    #         $aBp['per_view'] = isset($aBp['per_view']) ? (int)$aBp['per_view'] : -1;
    #         if(bx_get('CmtPerView') !== false) 
    #             $aBp['per_view'] = bx_process_input($_REQUEST['CmtPerView'], BX_DATA_INT);
    # 
    #         $aBp['pinned'] = isset($aBp['pinned']) ? (int)$aBp['pinned'] : 0;
    #         if(bx_get('CmtPinned') !== false) 
    #             $aBp['pinned'] = bx_process_input(bx_get('CmtPinned'), BX_DATA_INT);
    # 
    #         //--- Process 'Display' params.
    #         $aDp['type'] = isset($aDp['type']) ? $aDp['type'] : '';
    #         if(bx_get('CmtDisplay') !== false) 
    #             $aDp['type'] = bx_process_input($_REQUEST['CmtDisplay'], BX_DATA_TEXT);
    # 
    #         if(bx_get('CmtDisplayStructure') !== false) {
    #             $aDp['structure'] = bx_process_input($_REQUEST['CmtDisplayStructure'], BX_DATA_INT) == 1;
    # 
    #             if($aDp['structure'] && bx_get('CmtParent') !== false)
    #                 $aBp['parent_id'] = bx_process_input(bx_get('CmtParent'), BX_DATA_INT);
    #         }
    # 
    #         $aDp['blink'] = isset($aDp['blink']) ? $aDp['blink'] : '';
    #         if(bx_get('CmtBlink') !== false) 
    #             $aDp['blink'] = bx_process_input($_REQUEST['CmtBlink'], BX_DATA_TEXT);
    # 
    #         $aDp['quote'] = isset($aDp['quote']) ? (int)$aDp['quote'] : 0;
    #         if(bx_get('CmtQuote') !== false) 
    #             $aDp['quote'] = bx_process_input($_REQUEST['CmtQuote'], BX_DATA_INT);
    # 
    #         $aDp['min_post_form'] = isset($aDp['min_post_form']) ? (bool)$aDp['min_post_form'] : $this->_bMinPostForm;
    #         if(bx_get('CmtMinPostForm') !== false)
    #             $aDp['min_post_form'] = bx_process_input(bx_get('CmtMinPostForm'), BX_DATA_INT) == 1;
    # 
    #         $aDp['in_designbox'] = isset($aDp['in_designbox']) ? (bool)$aDp['in_designbox'] : true;
    #         $aDp['dynamic_mode'] = isset($aDp['dynamic_mode']) ? (bool)$aDp['dynamic_mode'] : false;
    #         $aDp['show_empty'] = isset($aDp['show_empty']) ? (bool)$aDp['show_empty'] : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _prepareAlertParams

  ## Parametros
    - aCmt

  ## Retorno
    - any
  """
  def _prepareAlertParams(%{}) do
    # TODO: Implementacao futura
        # protected function _prepareAlertParams($aCmt)
    #     {
    #         $iObjId = (int)$this->getId();
    #         $iObjAthrId = $this->getObjectAuthorId($iObjId);
    #         $iObjAthrPrivacyView = $this->getObjectPrivacyView($iObjId);
    # 
    #         $iCmtId = (int)$aCmt['cmt_id'];
    #         $iCmtUniqId = $this->getCommentUniqId($iCmtId);
    #         $iCmtCf = isset($aCmt['cmt_cf']) ? (int)$aCmt['cmt_cf'] : BxDolContentFilter::getInstance()->getDefaultValue();
    # 
    #         return array(
    #             'source' => 'sys_cmts_' . $iCmtUniqId,
    # 
    #             'object_system' => $this->_sSystem, 
    #             'object_id' => $iObjId, 
    #             'object_author_id' => $iObjAthrId,
    # 
    #             'comment_id' => $iCmtId, 
    #             'comment_uniq_id' => $iCmtUniqId,
    #             'comment_author_id' => $aCmt['cmt_author_id'], 
    #             'comment_parent_id' => $aCmt['cmt_parent_id'], 
    #             'comment_text' => $aCmt['cmt_text'],
    # 
    #             'privacy_view' => $iObjAthrPrivacyView,
    #             'cf' => $iCmtCf
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _prepareAlertParamsReply

  ## Parametros
    - aCmt,aCmtPrnt

  ## Retorno
    - any
  """
  def _prepareAlertParamsReply(%{}) do
    # TODO: Implementacao futura
        # protected function _prepareAlertParamsReply($aCmt, $aCmtPrnt)
    #     {
    #         $iObjId = (int)$this->getId();
    #         $iObjAthrId = $this->getObjectAuthorId($iObjId);
    #         $iObjAthrPrivacyView = $this->getObjectPrivacyView($iObjId);
    # 
    #         $iCmtPrntId = (int)$aCmt['cmt_parent_id'];
    #         $iCmtPrntUniqId = $this->getCommentUniqId($iCmtPrntId);
    # 
    #         $iCmtId = (int)$aCmt['cmt_id'];
    #         $iCmtUniqId = $this->getCommentUniqId($iCmtId);
    # 
    #         return array(
    #             'source' => 'sys_cmts_' . $iCmtUniqId,
    # 
    #             'object_system' => $this->_sSystem, 
    #             'object_id' => $iObjId, 
    #             'object_author_id' => $iObjAthrId,
    # 
    #             'parent_id' => $iCmtPrntId,
    #             'parent_uniq_id' => $iCmtPrntUniqId,
    #             'parent_author_id' => $aCmtPrnt['cmt_author_id'],
    # 
    #             'comment_id' => $iCmtId,
    #             'comment_uniq_id' => $iCmtUniqId,
    #             'comment_author_id' => $aCmt['cmt_author_id'],  
    #             'comment_text' => $aCmt['cmt_text'],
    # 
    #             'privacy_view' => $iObjAthrPrivacyView,
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _prepareAuditParams

  ## Parametros
    - iId,aData

  ## Retorno
    - any
  """
  def _prepareAuditParams(%{}) do
    # TODO: Implementacao futura
        # protected function _prepareAuditParams($iId, $aData)
    #     {
    #         $sModule = $this->_aSystem['module'];
    #         $oModule = BxDolModule::getInstance($sModule);
    #         $CNF = isset($oModule->_oConfig->CNF) ? $oModule->_oConfig->CNF : array();
    # 
    #         $aContentInfo = BxDolRequest::serviceExists($sModule, 'get_all') ? BxDolService::call($sModule, 'get_all', array(array('type' => 'id', 'id' => $this->getId()))) : array();
    #         $iContextId = 0;
    #         if (!empty($aContentInfo)){
    #             $iContextId = isset($CNF['FIELD_ALLOW_VIEW_TO']) && (!empty($aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']]) && (int)$aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']] < 0) ? - $aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']] : 0; 
    #         }
    #         
    #         $AuditParams = array(
    #             'content_title' => $this->getObjectTitle() ,
    #             'context_profile_id' => $iContextId,
    #             'content_info_object' =>  isset($CNF['OBJECT_CMTS_CONTENT_INFO']) ? $CNF['OBJECT_CMTS_CONTENT_INFO'] : '',
    #             'data' => array_merge(array('comment_id' => $iId), $aData)
    #         );
    #         if ($iContextId > 0)
    #             $AuditParams['context_profile_title'] = BxDolProfile::getInstance($iContextId)->getDisplayName();
    #         
    #         return $AuditParams;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _prepareTextForOutput

  ## Parametros
    - s,iCmtId=0

  ## Retorno
    - any
  """
  def _prepareTextForOutput(%{}) do
    # TODO: Implementacao futura
        # protected function _prepareTextForOutput ($s, $iCmtId = 0)
    #     {
    #     	$iDataAction = !$this->isHtml() ? BX_DATA_TEXT_MULTILINE : BX_DATA_HTML;
    #     	$s = bx_process_output($s, $iDataAction);
    #     	$s = bx_linkify_html($s, 'class="' . BX_DOL_LINK_CLASS . '"');
    # 
    #         if($iCmtId && $this->_sMetatagsObj && ($oMetatags = BxDolMetatags::getObjectInstance($this->_sMetatagsObj)) !== false)
    #             $s = $oMetatags->metaParse($this->_oQuery->getUniqId($this->_aSystem['system_id'], $iCmtId), $s);
    # 
    #         return $s;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _prepareStructureBp

  ## Parametros
    - sDType,&aBp

  ## Retorno
    - any
  """
  def _prepareStructureBp(%{}) do
    # TODO: Implementacao futura
        # protected function _prepareStructureBp($sDType, &$aBp)
    #     {
    #         $aBp['type'] = !empty($aBp['type']) ? $aBp['type'] : $this->_sBrowseType;
    #         $aBp['filter'] = !empty($aBp['filter']) ? $aBp['filter'] : $this->_sBrowseFilter;
    #         $aBp['parent_id'] = isset($aBp['parent_id']) ? $aBp['parent_id'] : 0;
    #         $aBp['start'] = isset($aBp['start']) ? $aBp['start'] : -1;
    #         $aBp['init_view'] = isset($aBp['init_view']) ? $aBp['init_view'] : -1;
    #         $aBp['per_view'] = isset($aBp['per_view']) ? $aBp['per_view'] : -1;
    #         $aBp['order']['by'] = isset($aBp['order_by']) ? $aBp['order_by'] : $this->_aOrder['by'];
    #         $aBp['order']['way'] = isset($aBp['order_way']) ? $aBp['order_way'] : $this->_aOrder['way'];
    # 
    #         if($aBp['per_view'] == -1)
    #             switch($sDType) {
    #                 case BX_CMT_DISPLAY_FLAT:
    #                     $aBp['per_view'] = $this->getPerView(0);
    #                     break;
    # 
    #                 case BX_CMT_DISPLAY_THREADED:
    #                     $aBp['per_view'] = $this->getPerView($aBp['parent_id']);
    #                     break;
    #             }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _prepareParams

  ## Parametros
    - &aBp,&aDp

  ## Retorno
    - any
  """
  def _prepareParams(%{}) do
    # TODO: Implementacao futura
        # protected function _prepareParams(&$aBp, &$aDp)
    #     {
    #         $aBp['type'] = !empty($aBp['type']) ? $aBp['type'] : $this->_sBrowseType;
    #         $aBp['filter'] = !empty($aBp['filter']) ? $aBp['filter'] : $this->_sBrowseFilter;
    #         $aBp['parent_id'] = isset($aBp['parent_id']) ? $aBp['parent_id'] : 0;
    #         $aBp['start'] = isset($aBp['start']) ? $aBp['start'] : -1;
    #         $aBp['init_view'] = isset($aBp['init_view']) ? $aBp['init_view'] : -1;
    #         $aBp['per_view'] = isset($aBp['per_view']) ? $aBp['per_view'] : -1;
    #         $aBp['pinned'] = isset($aBp['pinned']) ? (int)$aBp['pinned'] : 0;
    #         $aBp['order']['by'] = isset($aBp['order_by']) ? $aBp['order_by'] : $this->_aOrder['by'];
    #         $aBp['order']['way'] = isset($aBp['order_way']) ? $aBp['order_way'] : $this->_aOrder['way'];
    # 
    #         $aDp['type'] = !empty($aDp['type']) ? $aDp['type'] : $this->_sDisplayType;
    #         $aDp['blink'] = !empty($aDp['blink']) ? $aDp['blink'] : array();
    #         if(!is_array($aDp['blink']))
    #             $aDp['blink'] = explode(',', $aDp['blink']);
    #         $aDp['quote'] = !empty($aDp['quote']) ? (int)$aDp['quote'] : 0;
    #         if(!isset($aDp['min_post_form']))
    #             $aDp['min_post_form'] = $this->_bMinPostForm;
    # 
    #         switch($aDp['type']) {
    #             case BX_CMT_DISPLAY_FLAT:
    #                 $aBp['vparent_id'] = -1;
    #                 $aBp['per_view'] = $aBp['per_view'] != -1 ? $aBp['per_view'] : $this->getPerView(0);
    #                 break;
    # 
    #             case BX_CMT_DISPLAY_THREADED:
    #                 $iParent = 0;
    #                 if(isset($aBp['vparent_id']))
    #                     $iParent = $aBp['vparent_id'];
    #                 else if(isset($aBp['parent_id']))
    #                     $iParent = $aBp['parent_id'];
    # 
    #                 $aBp['per_view'] = $aBp['per_view'] != -1 ? $aBp['per_view'] : $this->getPerView($iParent);
    #                 break;
    #         }
    # 
    #         switch ($aBp['type']) {
    #             case BX_CMT_BROWSE_POPULAR:
    #                 $aBp['order'] = array(
    #                     'by' => BX_CMT_ORDER_BY_POPULAR,
    #                     'way' => BX_CMT_ORDER_WAY_DESC
    #                 );
    #                 break;
    #         }
    # 
    #         if(!isset($aBp['count']))
    #             $aBp['count'] = $this->getCommentsCount($this->_iId, $aBp['vparent_id'], $aBp['filter']);
    # 
    #         if($aBp['start'] != -1)
    #             return;
    # 
    #         $aBp['start'] = 0;
    #         if($aBp['type'] == BX_CMT_BROWSE_TAIL) {
    #             $sPerView = ($aBp['init_view'] != -1 ? 'init' : 'per') . '_view';
    # 
    #             $aBp['start'] = $aBp['count'] - $aBp[$sPerView];
    #             if($aBp['start'] < 0) {
    #                 $aBp[$sPerView] += $aBp['start'];
    #                 $aBp['start'] = 0;
    #             }
    #         }
    # 
    #         $this->_setUserChoice($aDp['type'], $aBp['type'], $aBp['filter']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _triggerComment

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _triggerComment(%{}) do
    # TODO: Implementacao futura
        # protected function _triggerComment()
    #     {
    #         if(!$this->_aSystem['trigger_table'] || !$this->_aSystem['trigger_field_id'] || !$this->_aSystem['trigger_field_comments'])
    #             return false;
    # 
    #         $iId = $this->getId();
    #         if(!$iId)
    #             return false;
    # 
    #         $iCount = $this->getCommentsCount($iId);
    #         return $this->_oQuery->updateTriggerTable($iId, $iCount);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _replaceMarkers

  ## Parametros
    - mixed

  ## Retorno
    - any
  """
  def _replaceMarkers(%{}) do
    # TODO: Implementacao futura
        # protected function _replaceMarkers ($mixed)
    #     {
    #         return bx_replace_markers($mixed, $this->_aMarkers);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getUserChoice

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getUserChoice(%{}) do
    # TODO: Implementacao futura
        # protected function _getUserChoice()
    #     {
    #         $mixedDp = $mixedBpType = $mixedBpFilter = false;
    #         if(!isLogged())
    #             return array($mixedDp, $mixedBpType, $mixedBpFilter);
    # 
    #         $iUserId = $this->_getAuthorId();
    # 
    #         $oSession = BxDolSession::getInstance();
    # 
    #         $mixedDp = $oSession->getValue($this->_sDpSessionKey . $iUserId);
    #         $mixedBpType = $oSession->getValue($this->_sBpSessionKeyType . $iUserId);
    #         $mixedBpFilter = $oSession->getValue($this->_sBpSessionKeyFilter . $iUserId);
    # 
    #         return array($mixedDp, $mixedBpType, $mixedBpFilter);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _setUserChoice

  ## Parametros
    - sDp,sBpType,sBpFilter

  ## Retorno
    - any
  """
  def _setUserChoice(%{}) do
    # TODO: Implementacao futura
        # protected function _setUserChoice($sDp, $sBpType, $sBpFilter)
    #     {
    #         if(!isLogged())
    #             return;
    # 
    #         $iUserId = $this->_getAuthorId();
    # 
    #         $oSession = BxDolSession::getInstance();
    # 
    #         if(!empty($sDp))
    #             $oSession->setValue($this->_sDpSessionKey . $iUserId, $sDp);
    # 
    #         if(!empty($sBpType))
    #             $oSession->setValue($this->_sBpSessionKeyType . $iUserId, $sBpType);
    # 
    #         if(!empty($sBpFilter))
    #             $oSession->setValue($this->_sBpSessionKeyFilter . $iUserId, $sBpFilter);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _sendNotificationEmail

  ## Parametros
    - iCmtId,iCmtParentId

  ## Retorno
    - any
  """
  def _sendNotificationEmail(%{}) do
    # TODO: Implementacao futura
        # protected function _sendNotificationEmail($iCmtId, $iCmtParentId)
    #     {
    #         $aCmt = $this->getCommentRow($iCmtId);
    #         $aCmtParent = $this->getCommentRow($iCmtParentId);
    #         if(empty($aCmt) || !is_array($aCmt) || empty($aCmtParent) || !is_array($aCmtParent) || (int)$aCmt['cmt_author_id'] == (int)$aCmtParent['cmt_author_id'])
    #             return;
    # 
    #         $oProfile = $this->_getAuthorObject($aCmtParent['cmt_author_id']);
    # 
    #         if($oProfile instanceof BxDolProfileUndefined)
    #         	return;
    # 
    #         $iAccount = $oProfile->getAccountId();
    #         $aAccount = BxDolAccount::getInstance($iAccount)->getInfo();
    # 
    #         $aPlus = array();
    #         $aPlus['sender_display_name'] = $oProfile->getDisplayName();
    #         $aPlus['reply_text'] = $this->_prepareTextForOutput($aCmt['cmt_text'], $iCmtId);
    # 
    #         $sPageUrl = $this->getBaseUrl();
    #         if(empty($sPageUrl))
    #             $sPageUrl = $this->getViewUrl($iCmtParentId);
    #         else 
    #             $sPageUrl .= $this->getItemAnchor($iCmtParentId, true);
    #         $aPlus['page_url'] = $sPageUrl;
    # 
    #         $sPageTitle = $this->getObjectTitle();
    #         if(empty($sPageTitle))
    #             $sPageTitle = _t('_Content');
    #         $aPlus['page_title'] = $sPageTitle;
    # 
    #         $aTemplate = BxDolEmailTemplates::getInstance()->parseTemplate('t_CommentReplied', $aPlus);
    #         return $aTemplate && sendMail($aAccount['email'], $aTemplate['Subject'], $aTemplate['Body']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isShowDoComment

  ## Parametros
    - aParams,isAllowedComment,bCount

  ## Retorno
    - any
  """
  def _isShowDoComment(%{}) do
    # TODO: Implementacao futura
        # protected function _isShowDoComment($aParams, $isAllowedComment, $bCount)
    #     {
    #         $bShowDoComment = !isset($aParams['show_do_comment']) || $aParams['show_do_comment'] == true;
    # 
    #         return $bShowDoComment && ($isAllowedComment || $bCount);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isShowCounter

  ## Parametros
    - aParams,isAllowedComment,bCount

  ## Retorno
    - any
  """
  def _isShowCounter(%{}) do
    # TODO: Implementacao futura
        # protected function _isShowCounter($aParams, $isAllowedComment, $bCount)
    #     {
    #         $bShowCounter = isset($aParams['show_counter']) && $aParams['show_counter'] === true;
    # 
    #         return $bShowCounter && ($isAllowedComment || $bCount);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getImageDo

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getImageDo(%{}) do
    # TODO: Implementacao futura
        # protected function _getImageDo()
    #     {
    #     	return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getIconDo

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getIconDo(%{}) do
    # TODO: Implementacao futura
        # protected function _getIconDo()
    #     {
    #     	return 'far comment';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getTitleDo

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getTitleDo(%{}) do
    # TODO: Implementacao futura
        # protected function _getTitleDo()
    #     {
    #     	return '_cmt_txt_do';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getParents

  ## Parametros
    - aCmt,iDepthMax,&iDepth,&aParents

  ## Retorno
    - any
  """
  def _getParents(%{}) do
    # TODO: Implementacao futura
        # protected function _getParents($aCmt, $iDepthMax, &$iDepth, &$aParents)
    #     {
    #         $iParentId = (int)$aCmt['cmt_parent_id'];
    #         if($iParentId == 0)
    #             return;
    # 
    #         $aParents[] = $iParentId;
    #         $iDepth++;
    # 
    #         if($iDepthMax != 0 && $iDepth == $iDepthMax)
    #             return;
    # 
    #         $aCmt = $this->_oQuery->getCommentsBy(['type' => 'id', 'id' => $iParentId]);
    #         $this->_getParents($aCmt, $iDepthMax, $iDepth, $aParents);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getStructure

  ## Parametros
    - mixedItem,aBp,&iLevel,&aStructure

  ## Retorno
    - any
  """
  def _getStructure(%{}) do
    # TODO: Implementacao futura
        # public function _getStructure($mixedItem, $aBp, &$iLevel, &$aStructure)
    #     {
    #         $bItem = !empty($mixedItem) && is_array($mixedItem);
    # 
    #         $iCmtId = $bItem ? (int)$mixedItem['cmt_id'] : 0;
    #         $iCmtIndex = $iCmtId;
    # 
    #         if($bItem)
    #             $aStructure[$iCmtIndex] = [
    #                 'id' => $mixedItem['cmt_id'], 
    #                 'order' => isset($mixedItem['cmt_order']) ? $mixedItem['cmt_order'] : 0, 
    #                 'items' => [],
    #             ];
    # 
    #         if(!$bItem || (int)$mixedItem['cmt_replies'] > 0) {
    #             $aItems = $this->_oQuery->getStructure($this->_iId, $this->_iAuthorId, $iCmtId, $aBp['filter'], $aBp['order']);
    #             if(!empty($aItems)) {
    #                 if($bItem && $iLevel < (int)$this->_aSystem['number_of_levels']) {
    #                     $iPassLevel = $iLevel + 1;
    #                     $aPassStructure = &$aStructure[$iCmtIndex]['items'];
    #                 }
    #                 else {
    #                     $iPassLevel = $iLevel;
    #                     $aPassStructure = &$aStructure; //--- Is NEEDED here to correctly check sublevels.
    #                 }
    # 
    #                 foreach($aItems as $aItem)
    #                     $this->_getStructure($aItem, $aBp, $iPassLevel, $aPassStructure);
    # 
    #                 //--- Sort subitems
    #                 $iWay = isset($aBp['order']['way']) && $aBp['order']['way'] == 'desc' ? -1 : 1;
    #                 uasort($aPassStructure, function($aItem1, $aItem2) use ($iWay) {
    #                     if($aItem1['order'] == $aItem2['order'])
    #                         return 0;
    # 
    #                     return $iWay * ($aItem1['order'] < $aItem2['order'] ? -1 : 1);
    #                 });
    #             }
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getStructureAPI

  ## Parametros
    - mixedItem,aBp,&iLevel,&aStructure

  ## Retorno
    - any
  """
  def _getStructureAPI(%{}) do
    # TODO: Implementacao futura
        # public function _getStructureAPI($mixedItem, $aBp, &$iLevel, &$aStructure)
    #     {
    #         $bItem = !empty($mixedItem) && is_array($mixedItem);
    # 
    #         $iCmtId = $bItem ? (int)$mixedItem['cmt_id'] : 0;
    #         $sCmtIndex = 'i' . $iCmtId;
    # 
    #         if($bItem) {
    #             $aMenuActions = [];
    #             if(($oMenuActions = BxDolMenu::getObjectInstance($this->_sMenuObjActions)) !== false) {
    #                 $oMenuActions->setCmtsData($this, $iCmtId, $aBp);
    #                 $aMenuActions = $oMenuActions->getCodeAPI();
    #             }
    # 
    #             $aMenuManage = [];
    #             if(($oMenuManage = BxDolMenu::getObjectInstance($this->_sMenuObjManage)) !== false) {
    #                 $oMenuManage->setCmtsData($this, $iCmtId, $aBp);
    #                 if($oMenuManage->isVisible())
    #                     $aMenuManage = $oMenuManage->getShortCodeAPI();
    #             }
    # 
    #             $aData = $this->getCommentSimple($iCmtId);
    # 
    #             bx_import('BxDolEmbed');
    #             $aData['embed'] = bx_linkify_embeded($aData['cmt_text']);
    # 
    #             $aData = array_merge($this->getDataAPI($aData), [
    #                 'menu_actions' => $aMenuActions,
    #                 'menu_manage' => $aMenuManage,
    #             ]);
    # 
    #             $aStructure[$sCmtIndex] = [
    #                 'id' => $iCmtId, 
    #                 'order' => isset($mixedItem['cmt_order']) ? $mixedItem['cmt_order'] : 0, 
    #                 'data' => $aData,
    #                 'files' => $this->_getAttachments($mixedItem),
    #                 'items' => [],
    #             ];
    #         }
    # 
    #         if(!$bItem || (int)$mixedItem['cmt_replies'] > 0) {
    #             $aItems = $this->_oQuery->getStructure($this->_iId, $this->_iAuthorId, $iCmtId, $aBp['filter'], $aBp['order']);
    #             if(!empty($aItems)) {
    #                 if($bItem && $iLevel < (int)$this->_aSystem['number_of_levels']) {
    #                     $iPassLevel = $iLevel + 1;
    #                     $aPassStructure = &$aStructure[$sCmtIndex]['items'];
    #                 }
    #                 else {
    #                     $iPassLevel = $iLevel;
    #                     $aPassStructure = [];
    #                 }
    #                 
    #                 foreach($aItems as $aItem)
    #                     $this->_getStructureAPI($aItem, $aBp, $iPassLevel, $aPassStructure);
    #                 
    #                 //--- Sort subitems
    #                 $iWay = isset($aBp['order']['way']) && $aBp['order']['way'] == 'desc' ? -1 : 1;
    # 
    #                 uasort($aPassStructure, function($aItem1, $aItem2) use ($iWay) {
    #                     if($aItem1['order'] == $aItem2['order'])
    #                         return 0;
    # 
    #                     return $iWay * ($aItem1['order'] < $aItem2['order'] ? -1 : 1);
    #                 });
    # 
    #                 $aStructure[$sCmtIndex]['items'] = $aPassStructure;
    #             }
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getDataAPI

  ## Parametros
    - aData,aParams=[]

  ## Retorno
    - any
  """
  def getDataAPI(%{}) do
    # TODO: Implementacao futura
        # public function getDataAPI($aData, $aParams = [])
    #     {
    #         $aDataApi = array_merge($aData, [
    #             'cmt_url' => '/' . $this->getViewUrl($aData['cmt_id'], false),
    #             'author_data' => BxDolProfile::getData($aData['cmt_author_id']),
    #         ]);
    # 
    #         $sModule = $this->_aSystem['module'];
    #         $aExtras = [
    #             'module' => $sModule,
    #             'data' => $aData,
    #             'params' => $aParams,
    #             'data_api' => &$aDataApi,
    #         ];
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-system-decode_comment_data_api 'system', 'decode_comment_data_api' - hook to override comment data prepared for sending in API response
    #          * - $unit_name - equals `system`
    #          * - $action - equals `decode_comment_data_api`
    #          * - $object_id - not used
    #          * - $sender_id - not used
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `module` - [string] module name
    #          *      - `data` - [array] comment info array as key&value pairs
    #          *      - `params` - [array] params array as key&value pairs
    #          *      - `data_api` - [array] by ref, comment data prepared for sending in API response, can be overridden in hook processing
    #          * @hook @ref hook-system-decode_comment_data_api
    #          */
    #         bx_alert('system', 'decode_comment_data_api', 0, 0, $aExtras);
    #         
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_dol_comment-decode_comment_data_api '{object_name}', 'decode_comment_data_api' - hook to override comment data prepared for sending in API response
    #          * It's equivalent to @ref hook-system-decode_comment_data_api
    #          * @hook @ref hook-bx_dol_comment-decode_comment_data_api
    #          */
    #         bx_alert($sModule, 'decode_comment_data_api', 0, 0, $aExtras);
    # 
    #         return $aDataApi;
    #     }
    :ok
  end

end
