
defmodule DeeperHub.Inc.Classes.BxDolCmts do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C:\\Users\\Admin\\deeper_hub\\una\\inc\classes\BxDolCmts.php
  """

  # Heranca de BxDolFactory

  # Implementa interfaces: iBxDolReplaceable, iBxDolContentInfoService


  @doc """
  Funcao correspondente ao metodo PHP construct

  ## Parametros
    - $sSystem
    -  $iId
    -  $iInit = true
    -  $oTemplate = false

  ## Retorno
    - any
  """
  def construct(params) do
    # TODO: Implementacao futura
        # protected function __construct($sSystem, $iId, $iInit = true, $oTemplate = false)
    #     {
    #         parent::__construct();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectInstance

  ## Parametros
    - $sSys
    -  $iId
    -  $iInit = true
    -  $oTemplate = false

  ## Retorno
    - any
  """
  def getObjectInstance(params) do
    # TODO: Implementacao futura
        # public static function getObjectInstance($sSys, $iId, $iInit = true, $oTemplate = false)
    #     {
    #         if(isset($GLOBALS['bxDolClasses']['BxDolCmts!' . $sSys . $iId]))
    #             return $GLOBALS['bxDolClasses']['BxDolCmts!' . $sSys . $iId];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectInstanceByUniqId

  ## Parametros
    - $iUniqId
    -  $iInit = true
    -  $oTemplate = false

  ## Retorno
    - any
  """
  def getObjectInstanceByUniqId(params) do
    # TODO: Implementacao futura
        # public static function getObjectInstanceByUniqId($iUniqId, $iInit = true, $oTemplate = false)
    #     {
    #         $aData = BxDolCmtsQuery::getInfoByUniqId($iUniqId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getGlobalInfo

  ## Parametros
    - $iUniqueId

  ## Retorno
    - any
  """
  def getGlobalInfo(params) do
    # TODO: Implementacao futura
        # public static function getGlobalInfo ($iUniqueId)
    #     {
    #         return BxDolDb::getInstance()->getRow("SELECT `ti`.*, `ts`.`Name` AS `system_name` FROM `" . self::$sTableIds . "` AS `ti` LEFT JOIN `" . self::$sTableSystems . "` AS `ts` ON `ti`.`system_id`=`ts`.`ID` WHERE `ti`.`id`=:id LIMIT 1", array(
    #             'id' => (int)$iUniqueId
    #         ));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getGlobalNumByParams

  ## Parametros
    - $aParams = []

  ## Retorno
    - any
  """
  def getGlobalNumByParams(params) do
    # TODO: Implementacao futura
        # public static function getGlobalNumByParams($aParams = [])
    #     {
    #         $sQuery = "SELECT COUNT(*) FROM `" . self::$sTableIds . "` WHERE 1";
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP init

  ## Parametros
    - $iId

  ## Retorno
    - any
  """
  def init(params) do
    # TODO: Implementacao futura
        # public function init ($iId)
    #     {
    #         if (empty($this->iId) && $iId)
    #             $this->setId($iId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setParam

  ## Parametros
    - $sName
    -  $sValue

  ## Retorno
    - any
  """
  def setParam(params) do
    # TODO: Implementacao futura
        # public function setParam($sName, $sValue)
    #     {
    #         $this->_aParams[$sName] = $sValue;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isParam

  ## Parametros
    - $sName

  ## Retorno
    - any
  """
  def isParam(params) do
    # TODO: Implementacao futura
        # public function isParam($sName)
    #     {
    #         return isset($this->_aParams[$sName]);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getParam

  ## Parametros
    - $sName

  ## Retorno
    - any
  """
  def getParam(params) do
    # TODO: Implementacao futura
        # public function getParam($sName)
    #     {
    #         return $this->_aParams[$sName];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getId

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getId(params) do
    # TODO: Implementacao futura
        # public function getId ()
    #     {
    #         return $this->_iId;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isEnabled

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isEnabled(params) do
    # TODO: Implementacao futura
        # public function isEnabled ()
    #     {
    #         return isset($this->_aSystem['is_on']) && $this->_aSystem['is_on'];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSystemId

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getSystemId(params) do
    # TODO: Implementacao futura
        # public function getSystemId()
    #     {
    #         return $this->_aSystem['system_id'];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSystemName

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getSystemName(params) do
    # TODO: Implementacao futura
        # public function getSystemName()
    #     {
    #         return $this->_sSystem;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSystemInfo

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getSystemInfo(params) do
    # TODO: Implementacao futura
        # public function getSystemInfo()
    #     {
    #         return $this->_aSystem;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStorageObjectName

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getStorageObjectName(params) do
    # TODO: Implementacao futura
        # public function getStorageObjectName()
    #     {
    #     	return $this->_getFormObject()->getStorageObjectName();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTranscoderPreviewName

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getTranscoderPreviewName(params) do
    # TODO: Implementacao futura
        # public function getTranscoderPreviewName()
    #     {
    #     	return $this->_getFormObject()->getTranscoderPreviewName();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFormObject

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getFormObject(params) do
    # TODO: Implementacao futura
        # public function getFormObject()
    #     {
    #     	return $this->_getFormObject();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTableNameImages

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getTableNameImages(params) do
    # TODO: Implementacao futura
        # public function getTableNameImages()
    #     {
    #         return $this->_sTableImages;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTableNameImages2Entries

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getTableNameImages2Entries(params) do
    # TODO: Implementacao futura
        # public function getTableNameImages2Entries()
    #     {
    #         return $this->_sTableImages2Entries;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguageKey

  ## Parametros
    - $sIndex

  ## Retorno
    - any
  """
  def getLanguageKey(params) do
    # TODO: Implementacao futura
        # public function getLanguageKey($sIndex)
    #     {
    #         return isset($this->_aT[$sIndex]) ? $this->_aT[$sIndex] : '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getMaxLevel

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getMaxLevel(params) do
    # TODO: Implementacao futura
        # public function getMaxLevel()
    #     {
    #         return $this->_iDpMaxLevel;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrder

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getOrder(params) do
    # TODO: Implementacao futura
        # public function getOrder ()
    #     {
    #         return $this->_sOrder;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPerView

  ## Parametros
    - $iCmtParentId = 0

  ## Retorno
    - any
  """
  def getPerView(params) do
    # TODO: Implementacao futura
        # public function getPerView ($iCmtParentId = 0)
    #     {
    #         return $iCmtParentId == 0 ? $this->_aSystem['per_view'] : $this->_aSystem['per_view_replies'];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStatusAdmin

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getStatusAdmin(params) do
    # TODO: Implementacao futura
        # public function getStatusAdmin()
    #     {
    #         return $this->isEditAllowedAll() || $this->isRemoveAllowedAll() || $this->isAutoApprove() ? BX_CMT_STATUS_ACTIVE : BX_CMT_STATUS_PENDING;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getViewUrl

  ## Parametros
    - $iCmtId
    -  $bAbsolute = true

  ## Retorno
    - any
  """
  def getViewUrl(params) do
    # TODO: Implementacao futura
        # public function getViewUrl($iCmtId, $bAbsolute = true)
    #     {
    #     	if(empty($this->_aSystem['trigger_field_title']))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getViewText

  ## Parametros
    - $mixedItem

  ## Retorno
    - any
  """
  def getViewText(params) do
    # TODO: Implementacao futura
        # public function getViewText($mixedItem)
    #     {
    #         if(!is_array($mixedItem))
    #             $mixedItem = $this->getCommentSimple((int)$mixedItem);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getBaseUrl

  ## Parametros
    - $sPrefix = BX_DOL_URL_ROOT

  ## Retorno
    - any
  """
  def getBaseUrl(params) do
    # TODO: Implementacao futura
        # public function getBaseUrl($sPrefix = BX_DOL_URL_ROOT)
    #     {
    #         $sUrl = $this->_replaceMarkers($this->_sBaseUrl);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getListUrl

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getListUrl(params) do
    # TODO: Implementacao futura
        # public function getListUrl()
    #     {
    #         $sBaseUrl = $this->getBaseUrl();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getItemUrl

  ## Parametros
    - $iItemId

  ## Retorno
    - any
  """
  def getItemUrl(params) do
    # TODO: Implementacao futura
        # public function getItemUrl($iItemId)
    #     {
    #         $sBaseUrl = $this->getBaseUrl();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getListAnchor

  ## Parametros
    - $bWithHash = false

  ## Retorno
    - any
  """
  def getListAnchor(params) do
    # TODO: Implementacao futura
        # public function getListAnchor($bWithHash = false)
    #     {
    #         return ($bWithHash ? '#' : '') . sprintf($this->_sListAnchor, str_replace('_', '-', $this->getSystemName()), $this->getId());
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getItemAnchor

  ## Parametros
    - $iItemId
    -  $bWithHash = false

  ## Retorno
    - any
  """
  def getItemAnchor(params) do
    # TODO: Implementacao futura
        # public function getItemAnchor($iItemId, $bWithHash = false)
    #     {
    #         return ($bWithHash ? '#' : '') . sprintf($this->_sItemAnchor, str_replace('_', '-', $this->getSystemName()), $this->getId(), $iItemId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAttachments

  ## Parametros
    - $iCmtId

  ## Retorno
    - any
  """
  def getAttachments(params) do
    # TODO: Implementacao futura
        # public function getAttachments($iCmtId)
    #     {
    #         $aResult = array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getConnectionObject

  ## Parametros
    - $sType

  ## Retorno
    - any
  """
  def getConnectionObject(params) do
    # TODO: Implementacao futura
        # public function getConnectionObject($sType)
    #     {
    #         $sResult = '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getVoteObject

  ## Parametros
    - $iEniqId

  ## Retorno
    - any
  """
  def getVoteObject(params) do
    # TODO: Implementacao futura
        # public function getVoteObject($iEniqId)
    #     {
    #         if(empty($this->_aSystem['object_vote']))
    #             $this->_aSystem['object_vote'] = 'sys_cmts';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getReactionObject

  ## Parametros
    - $iEniqId

  ## Retorno
    - any
  """
  def getReactionObject(params) do
    # TODO: Implementacao futura
        # public function getReactionObject($iEniqId)
    #     {
    #         if(empty($this->_aSystem['object_reaction']))
    #             $this->_aSystem['object_reaction'] = 'sys_cmts_reactions';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getScoreObject

  ## Parametros
    - $iEniqId

  ## Retorno
    - any
  """
  def getScoreObject(params) do
    # TODO: Implementacao futura
        # public function getScoreObject($iEniqId)
    #     {
    #         if(empty($this->_aSystem['object_score']))
    #             $this->_aSystem['object_score'] = 'sys_cmts';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getReportObject

  ## Parametros
    - $iEniqId

  ## Retorno
    - any
  """
  def getReportObject(params) do
    # TODO: Implementacao futura
        # public function getReportObject($iEniqId)
    #     {
    #         if(empty($this->_aSystem['object_report']))
    #             $this->_aSystem['object_report'] = 'sys_cmts';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getNotificationId

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getNotificationId(params) do
    # TODO: Implementacao futura
        # public function getNotificationId()
    #     {
    #         return 'cmts-notification-' . $this->_sSystem . '-' . $this->_iId;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSocketName

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getSocketName(params) do
    # TODO: Implementacao futura
        # public function getSocketName()
    #     {
    #         return 'cmts_' . $this->_sSystem;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setTableNameFiles

  ## Parametros
    - $sTable

  ## Retorno
    - any
  """
  def setTableNameFiles(params) do
    # TODO: Implementacao futura
        # public function setTableNameFiles($sTable)
    #     {
    #         $this->_sTableImages = $sTable;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setTableNameFiles2Entries

  ## Parametros
    - $sTable

  ## Retorno
    - any
  """
  def setTableNameFiles2Entries(params) do
    # TODO: Implementacao futura
        # public function setTableNameFiles2Entries($sTable)
    #     {
    #     	$this->_sTableImages2Entries = $sTable;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isHtml

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isHtml(params) do
    # TODO: Implementacao futura
        # public function isHtml ()
    #     {
    #         return $this->_aSystem['html'] > 0;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isRatable

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isRatable(params) do
    # TODO: Implementacao futura
        # public function isRatable ()
    #     {
    #         return $this->_aSystem['is_ratable'];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAttachImageEnabled

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isAttachImageEnabled(params) do
    # TODO: Implementacao futura
        # public function isAttachImageEnabled()
    #     {
    #         return true;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAutoApprove

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isAutoApprove(params) do
    # TODO: Implementacao futura
        # public function isAutoApprove()
    #     {
    #         return getParam('sys_cmts_enable_auto_approve') == 'on';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setId

  ## Parametros
    - $iId

  ## Retorno
    - any
  """
  def setId(params) do
    # TODO: Implementacao futura
        # public function setId ($iId)
    #     {
    #         if ($iId == $this->getId()) return;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addMarkers

  ## Parametros
    - $a

  ## Retorno
    - any
  """
  def addMarkers(params) do
    # TODO: Implementacao futura
        # public function addMarkers ($a)
    #     {
    #         if (empty($a) || !is_array($a))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getQueryObject

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getQueryObject(params) do
    # TODO: Implementacao futura
        # public function getQueryObject ()
    #     {
    #         return $this->_oQuery;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsTableName

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getCommentsTableName(params) do
    # TODO: Implementacao futura
        # public function getCommentsTableName ()
    #     {
    #         return $this->_oQuery->getTableName ();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectAuthorId

  ## Parametros
    - $iObjectId = 0

  ## Retorno
    - any
  """
  def getObjectAuthorId(params) do
    # TODO: Implementacao futura
        # public function getObjectAuthorId ($iObjectId = 0)
    #     {
    #     	if(empty($this->_aSystem['trigger_field_author']))
    #     		return 0;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectTitle

  ## Parametros
    - $iObjectId = 0

  ## Retorno
    - any
  """
  def getObjectTitle(params) do
    # TODO: Implementacao futura
        # public function getObjectTitle ($iObjectId = 0)
    #     {
    #         if(empty($this->_aSystem['trigger_field_title']))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectPrivacyView

  ## Parametros
    - $iObjectId = 0

  ## Retorno
    - any
  """
  def getObjectPrivacyView(params) do
    # TODO: Implementacao futura
        # public function getObjectPrivacyView ($iObjectId = 0)
    #     {
    #         if(empty($iObjectId))
    #             $iObjectId = $this->getId();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectContentFilter

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getObjectContentFilter(params) do
    # TODO: Implementacao futura
        # public function getObjectContentFilter ()
    #     {
    #         $oCf = BxDolContentFilter::getInstance();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsCountAll

  ## Parametros
    - $iObjectId = 0
    -  $bForceCalculate = false

  ## Retorno
    - any
  """
  def getCommentsCountAll(params) do
    # TODO: Implementacao futura
        # public function getCommentsCountAll ($iObjectId = 0, $bForceCalculate = false)
    #     {
    #         return $this->_oQuery->getCommentsCountAll ($iObjectId ? $iObjectId : $this->getId(), $this->_getAuthorId(), $bForceCalculate);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsCount

  ## Parametros
    - $iObjectId = 0
    -  $iCmtVParentId = -1
    -  $sFilter = ''

  ## Retorno
    - any
  """
  def getCommentsCount(params) do
    # TODO: Implementacao futura
        # public function getCommentsCount ($iObjectId = 0, $iCmtVParentId = -1, $sFilter = '')
    #     {
    #         return $this->_oQuery->getCommentsCount ($iObjectId ? $iObjectId : $this->getId(), $iCmtVParentId, $this->_getAuthorId(), $sFilter);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsArray

  ## Parametros
    - $iVParentId
    -  $sFilter
    -  $aOrder
    -  $iStart = 0
    -  $iCount = -1

  ## Retorno
    - any
  """
  def getCommentsArray(params) do
    # TODO: Implementacao futura
        # public function getCommentsArray ($iVParentId, $sFilter, $aOrder, $iStart = 0, $iCount = -1)
    #     {
    #         return $this->_oQuery->getComments ($this->getId(), $iVParentId, $this->_getAuthorId(), $sFilter, $aOrder, $iStart, $iCount);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsBy

  ## Parametros
    - $aParams = []

  ## Retorno
    - any
  """
  def getCommentsBy(params) do
    # TODO: Implementacao futura
        # public function getCommentsBy ($aParams = [])
    #     {
    #         return $this->_oQuery->getCommentsBy($aParams); 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentUniqId

  ## Parametros
    - $iCmtId
    -  $iAuthorId = 0

  ## Retorno
    - any
  """
  def getCommentUniqId(params) do
    # TODO: Implementacao futura
        # public function getCommentUniqId($iCmtId, $iAuthorId = 0)
    #     {
    #         return $this->_oQuery->getUniqId($this->getSystemId(), $iCmtId, ['author_id' => $iAuthorId]);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentSimple

  ## Parametros
    - $iCmtId

  ## Retorno
    - any
  """
  def getCommentSimple(params) do
    # TODO: Implementacao futura
        # public function getCommentSimple ($iCmtId)
    #     {
    #         return $this->_oQuery->getCommentSimple ($this->getId(), $iCmtId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentRow

  ## Parametros
    - $iCmtId

  ## Retorno
    - any
  """
  def getCommentRow(params) do
    # TODO: Implementacao futura
        # public function getCommentRow ($iCmtId)
    #     {
    #         return $this->_oQuery->getComment ($this->getId(), $iCmtId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentParents

  ## Parametros
    - $mixedCmt
    -  $iDepthMax = 0

  ## Retorno
    - any
  """
  def getCommentParents(params) do
    # TODO: Implementacao futura
        # public function getCommentParents ($mixedCmt, $iDepthMax = 0)
    #     {
    #         if(!is_array($mixedCmt))
    #             $mixedCmt = $this->_oQuery->getCommentsBy(['type' => 'id', 'id' => (int)$mixedCmt]);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onObjectDelete

  ## Parametros
    - $iObjectId = 0

  ## Retorno
    - any
  """
  def onObjectDelete(params) do
    # TODO: Implementacao futura
        # public function onObjectDelete ($iObjectId = 0)
    #     {
    #         // delete comments
    #         $aFiles = $aCmtIds = [];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onAuthorDelete

  ## Parametros
    - $iAuthorId

  ## Retorno
    - any
  """
  def onAuthorDelete(params) do
    # TODO: Implementacao futura
        # public static function onAuthorDelete ($iAuthorId)
    #     {
    #         $aSystems = self::getSystems();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onModuleEnable

  ## Parametros
    - $sModuleName

  ## Retorno
    - any
  """
  def onModuleEnable(params) do
    # TODO: Implementacao futura
        # public static function onModuleEnable ($sModuleName)
    #     {
    #         $aSystems = self::getSystems();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onModuleDisable

  ## Parametros
    - $sModuleName

  ## Retorno
    - any
  """
  def onModuleDisable(params) do
    # TODO: Implementacao futura
        # public static function onModuleDisable ($sModuleName)
    #     {
    #         $aSystems = self::getSystems();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onModuleUninstall

  ## Parametros
    - $sModuleName
    -  &$iFiles = null

  ## Retorno
    - any
  """
  def onModuleUninstall(params) do
    # TODO: Implementacao futura
        # public static function onModuleUninstall ($sModuleName, &$iFiles = null)
    #     {
    #         $aSystems = self::getSystems();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteVotes

  ## Parametros
    - $mixedCmtId

  ## Retorno
    - any
  """
  def deleteVotes(params) do
    # TODO: Implementacao futura
        # public function deleteVotes ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = [$mixedCmtId];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteReactions

  ## Parametros
    - $mixedCmtId

  ## Retorno
    - any
  """
  def deleteReactions(params) do
    # TODO: Implementacao futura
        # public function deleteReactions ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = [$mixedCmtId];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteScores

  ## Parametros
    - $mixedCmtId

  ## Retorno
    - any
  """
  def deleteScores(params) do
    # TODO: Implementacao futura
        # public function deleteScores ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = [$mixedCmtId];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteReports

  ## Parametros
    - $mixedCmtId

  ## Retorno
    - any
  """
  def deleteReports(params) do
    # TODO: Implementacao futura
        # public function deleteReports ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = [$mixedCmtId];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteMetaInfo

  ## Parametros
    - $mixedCmtId

  ## Retorno
    - any
  """
  def deleteMetaInfo(params) do
    # TODO: Implementacao futura
        # public function deleteMetaInfo ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = array($mixedCmtId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteUniqueIds

  ## Parametros
    - $mixedCmtId

  ## Retorno
    - any
  """
  def deleteUniqueIds(params) do
    # TODO: Implementacao futura
        # public function deleteUniqueIds ($mixedCmtId)
    #     {
    #         if(!is_array($mixedCmtId))
    #             $mixedCmtId = array($mixedCmtId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAdmin

  ## Parametros
    - $iCmtAuthorId

  ## Retorno
    - any
  """
  def isAdmin(params) do
    # TODO: Implementacao futura
        # public function isAdmin($iCmtAuthorId)
    #     {
    #         return BxDolAcl::getInstance()->isMemberLevelInSet(array(MEMBERSHIP_ID_MODERATOR, MEMBERSHIP_ID_ADMINISTRATOR), $iCmtAuthorId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkAction

  ## Parametros
    - $sAction
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def checkAction(params) do
    # TODO: Implementacao futura
        # public function checkAction ($sAction, $isPerformAction = false)
    #     {
    #         $iId = $this->_getAuthorId();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkActionErrorMsg

  ## Parametros
    - $sAction

  ## Retorno
    - any
  """
  def checkActionErrorMsg(params) do
    # TODO: Implementacao futura
        # public function checkActionErrorMsg ($sAction)
    #     {
    #         $iId = $this->_getAuthorId();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isViewAllowed

  ## Parametros
    - $isPerformAction = false

  ## Retorno
    - any
  """
  def isViewAllowed(params) do
    # TODO: Implementacao futura
        # public function isViewAllowed ($isPerformAction = false)
    #     {
    #         if (BxDolRequest::serviceExists($this->_aSystem['module'], 'check_allowed_comments_view')) {
    #             $mixedResult = BxDolService::call($this->_aSystem['module'], 'check_allowed_comments_view', array($this->getId(), $this->getSystemName()));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isVoteAllowed

  ## Parametros
    - $aCmt
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def isVoteAllowed(params) do
    # TODO: Implementacao futura
        # public function isVoteAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if(!$this->isRatable())
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isScoreAllowed

  ## Parametros
    - $aCmt
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def isScoreAllowed(params) do
    # TODO: Implementacao futura
        # public function isScoreAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if(!$this->isRatable())
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isReportAllowed

  ## Parametros
    - $aCmt
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def isReportAllowed(params) do
    # TODO: Implementacao futura
        # public function isReportAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         $oReport = $this->getReportObject($aCmt['cmt_id']);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isPostAllowed

  ## Parametros
    - $isPerformAction = false

  ## Retorno
    - any
  """
  def isPostAllowed(params) do
    # TODO: Implementacao futura
        # public function isPostAllowed ($isPerformAction = false)
    #     {
    #         if (BxDolRequest::serviceExists($this->_aSystem['module'], 'check_allowed_comments_post')) {
    #             $mixedResult = BxDolService::call($this->_aSystem['module'], 'check_allowed_comments_post', array($this->getId(), $this->getSystemName()));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrPostAllowed

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def msgErrPostAllowed(params) do
    # TODO: Implementacao futura
        # public function msgErrPostAllowed ()
    #     {
    #         return $this->checkActionErrorMsg('comments post');
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isReplyAllowed

  ## Parametros
    - $mixedCmt
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def isReplyAllowed(params) do
    # TODO: Implementacao futura
        # public function isReplyAllowed ($mixedCmt, $isPerformAction = false)
    #     {
    #         return $this->isPostAllowed($isPerformAction);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrReplyAllowed

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def msgErrReplyAllowed(params) do
    # TODO: Implementacao futura
        # public function msgErrReplyAllowed ()
    #     {
    #         return $this->msgErrPostAllowed ();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isQuoteAllowed

  ## Parametros
    - $mixedCmt
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def isQuoteAllowed(params) do
    # TODO: Implementacao futura
        # public function isQuoteAllowed ($mixedCmt, $isPerformAction = false)
    #     {
    #         return $this->_bPostQuote && $this->isReplyAllowed ($mixedCmt, $isPerformAction);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrQuoteAllowed

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def msgErrQuoteAllowed(params) do
    # TODO: Implementacao futura
        # public function msgErrQuoteAllowed ()
    #     {
    #         return $this->msgErrReplyAllowed ();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isPinAllowed

  ## Parametros
    - $aCmt
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def isPinAllowed(params) do
    # TODO: Implementacao futura
        # public function isPinAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if((int)$aCmt['cmt_parent_id'] != 0 || (int)$aCmt['cmt_pinned'] != 0)
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrPinAllowed

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def msgErrPinAllowed(params) do
    # TODO: Implementacao futura
        # public function msgErrPinAllowed ()
    #     {
    #         return $this->checkActionErrorMsg('comments pin');
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isUnpinAllowed

  ## Parametros
    - $aCmt
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def isUnpinAllowed(params) do
    # TODO: Implementacao futura
        # public function isUnpinAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if((int)$aCmt['cmt_pinned'] == 0)
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrUnpinAllowed

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def msgErrUnpinAllowed(params) do
    # TODO: Implementacao futura
        # public function msgErrUnpinAllowed ()
    #     {
    #         return $this->checkActionErrorMsg('comments pin');
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isEditAllowed

  ## Parametros
    - $aCmt
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def isEditAllowed(params) do
    # TODO: Implementacao futura
        # public function isEditAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if(isAdmin())
    #             return true;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrEditAllowed

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def msgErrEditAllowed(params) do
    # TODO: Implementacao futura
        # public function msgErrEditAllowed ()
    #     {
    #         return $this->checkActionErrorMsg ('comments edit own');
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isEditAllowedAll

  ## Parametros
    - $isPerformAction = false

  ## Retorno
    - any
  """
  def isEditAllowedAll(params) do
    # TODO: Implementacao futura
        # public function isEditAllowedAll ($isPerformAction = false)
    #     {
    #         return $this->checkAction('comments edit all', $isPerformAction);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isRemoveAllowed

  ## Parametros
    - $aCmt
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def isRemoveAllowed(params) do
    # TODO: Implementacao futura
        # public function isRemoveAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         if(isAdmin())
    #             return true;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isRemoveAllowedAll

  ## Parametros
    - $isPerformAction = false

  ## Retorno
    - any
  """
  def isRemoveAllowedAll(params) do
    # TODO: Implementacao futura
        # public function isRemoveAllowedAll ($isPerformAction = false)
    #     {
    #         return $this->checkAction ('comments remove all', $isPerformAction);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrRemoveAllowed

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def msgErrRemoveAllowed(params) do
    # TODO: Implementacao futura
        # public function msgErrRemoveAllowed ()
    #     {
    #         return $this->checkActionErrorMsg('comments remove own');
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isMoreAllowed

  ## Parametros
    - $aCmt
    -  $isPerformAction = false

  ## Retorno
    - any
  """
  def isMoreAllowed(params) do
    # TODO: Implementacao futura
        # public function isMoreAllowed ($aCmt, $isPerformAction = false)
    #     {
    #         $oMenuManage = BxDolMenu::getObjectInstance($this->_sMenuObjManage);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isModerator

  ## Parametros
    - $isPerformAction = false

  ## Retorno
    - any
  """
  def isModerator(params) do
    # TODO: Implementacao futura
        # public function isModerator($isPerformAction = false)
    #     {
    #         return $this->isEditAllowedAll($isPerformAction) || $this->isRemoveAllowedAll($isPerformAction);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionPin

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionPin(params) do
    # TODO: Implementacao futura
        # public function actionPin ()
    #     {
    #         if (!$this->isEnabled())
    #             return echoJson(array());
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetFormPost

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionGetFormPost(params) do
    # TODO: Implementacao futura
        # public function actionGetFormPost ()
    #     {
    #         if (!$this->isEnabled())
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetFormEdit

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionGetFormEdit(params) do
    # TODO: Implementacao futura
        # public function actionGetFormEdit ()
    #     {
    #         if (!$this->isEnabled())
    #             return echoJson(array());
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetCmt

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionGetCmt(params) do
    # TODO: Implementacao futura
        # public function actionGetCmt ()
    #     {
    #         if(!$this->isEnabled())
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetCmts

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionGetCmts(params) do
    # TODO: Implementacao futura
        # public function actionGetCmts ()
    #     {
    #         if (!$this->isEnabled())
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionSubmitPostForm

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionSubmitPostForm(params) do
    # TODO: Implementacao futura
        # public function actionSubmitPostForm()
    #     {
    #         if(!$this->isEnabled())
    #             return echoJson(array());
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionSubmitEditForm

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionSubmitEditForm(params) do
    # TODO: Implementacao futura
        # public function actionSubmitEditForm()
    #     {
    #         if (!$this->isEnabled()) {
    #             echoJson(array());
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionRemove

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionRemove(params) do
    # TODO: Implementacao futura
        # public function actionRemove()
    #     {
    #         if (!$this->isEnabled())
    #             return echoJson([]);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP remove

  ## Parametros
    - $iCmtId

  ## Retorno
    - any
  """
  def remove(params) do
    # TODO: Implementacao futura
        # public function remove($iCmtId)
    #     {
    #         $aCmt = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iCmtId));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP add

  ## Parametros
    - $aValues

  ## Retorno
    - any
  """
  def add(params) do
    # TODO: Implementacao futura
        # public function add($aValues)
    #     {
    #         return $this->_getFormAdd($aValues);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionResumeLiveUpdate

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionResumeLiveUpdate(params) do
    # TODO: Implementacao futura
        # public function actionResumeLiveUpdate()
    #     {
    #     	$sKey = $this->getNotificationId();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionPauseLiveUpdate

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionPauseLiveUpdate(params) do
    # TODO: Implementacao futura
        # public function actionPauseLiveUpdate()
    #     {
    #     	$sKey = $this->getNotificationId();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetSiblingFiles

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def actionGetSiblingFiles(params) do
    # TODO: Implementacao futura
        # public function actionGetSiblingFiles()
    #     {
    #         $iFileId = 0;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onPostAfter

  ## Parametros
    - $iCmtId
    -  $aDp = []

  ## Retorno
    - any
  """
  def onPostAfter(params) do
    # TODO: Implementacao futura
        # public function onPostAfter($iCmtId, $aDp = [])
    #     {
    #         $iObjId = (int)$this->getId();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onEditAfter

  ## Parametros
    - $iCmtId
    -  $aDp = []

  ## Retorno
    - any
  """
  def onEditAfter(params) do
    # TODO: Implementacao futura
        # public function onEditAfter($iCmtId, $aDp = [])
    #     {
    #     	$aCmt = $this->getCommentRow($iCmtId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetAuthor

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetAuthor(params) do
    # TODO: Implementacao futura
        # public function serviceGetAuthor ($iContentId)
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetDateAdded

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetDateAdded(params) do
    # TODO: Implementacao futura
        # public function serviceGetDateAdded ($iContentId)
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetDateChanged

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetDateChanged(params) do
    # TODO: Implementacao futura
        # public function serviceGetDateChanged ($iContentId)
    #     {
    #         return 0;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetLink

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetLink(params) do
    # TODO: Implementacao futura
        # public function serviceGetLink ($iContentId)
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetTitle

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetTitle(params) do
    # TODO: Implementacao futura
        # public function serviceGetTitle ($iContentId)
    #     {
    #         return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetText

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetText(params) do
    # TODO: Implementacao futura
        # public function serviceGetText ($iContentId)
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetThumb

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetThumb(params) do
    # TODO: Implementacao futura
        # public function serviceGetThumb ($iContentId)
    #     {
    #         return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetInfo

  ## Parametros
    - $iContentId
    -  $bSearchableFieldsOnly = true

  ## Retorno
    - any
  """
  def serviceGetInfo(params) do
    # TODO: Implementacao futura
        # public function serviceGetInfo ($iContentId, $bSearchableFieldsOnly = true)
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetInfoApi

  ## Parametros
    - $iContentId
    -  $bExtendedUnits = false

  ## Retorno
    - any
  """
  def serviceGetInfoApi(params) do
    # TODO: Implementacao futura
        # public function serviceGetInfoApi ($iContentId, $bExtendedUnits = false)
    #     {
    #         $aData = $this->serviceGetInfo($iContentId, false);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetSearchResultUnit

  ## Parametros
    - $iContentId
    -  $sUnitTemplate = ''

  ## Retorno
    - any
  """
  def serviceGetSearchResultUnit(params) do
    # TODO: Implementacao futura
        # public function serviceGetSearchResultUnit ($iContentId, $sUnitTemplate = '')
    #     {
    #         $aComment = $this->_oQuery->getCommentsBy(array('type' => 'id', 'id' => $iContentId));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP registerTranscoders

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def registerTranscoders(params) do
    # TODO: Implementacao futura
        # public function registerTranscoders()
    #     {}
    # 
    # 	/**
    #      * Overwrite this method and unregister transcoder(s) if comments object uses custom transcoder(s), 
    #      * which differs from default one 'sys_cmts_images_preview'
    #      */
    #     public function unregisterTranscoders()
    #     {}
    # 
    #     public function serviceGetSearchResultExtended($aParams, $iStart = 0, $iPerPage = 0, $bFilterMode = false)
    #     {
    #         if((empty($aParams) || !is_array($aParams)) && !$bFilterMode)
    #             return array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP unregisterTranscoders

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def unregisterTranscoders(params) do
    # TODO: Implementacao futura
        # public function unregisterTranscoders()
    #     {}
    # 
    #     public function serviceGetSearchResultExtended($aParams, $iStart = 0, $iPerPage = 0, $bFilterMode = false)
    #     {
    #         if((empty($aParams) || !is_array($aParams)) && !$bFilterMode)
    #             return array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetSearchResultExtended

  ## Parametros
    - $aParams
    -  $iStart = 0
    -  $iPerPage = 0
    -  $bFilterMode = false

  ## Retorno
    - any
  """
  def serviceGetSearchResultExtended(params) do
    # TODO: Implementacao futura
        # public function serviceGetSearchResultExtended($aParams, $iStart = 0, $iPerPage = 0, $bFilterMode = false)
    #     {
    #         if((empty($aParams) || !is_array($aParams)) && !$bFilterMode)
    #             return array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAuthorInfo

  ## Parametros
    - $iAuthorId = 0

  ## Retorno
    - any
  """
  def getAuthorInfo(params) do
    # TODO: Implementacao futura
        # public function getAuthorInfo($iAuthorId = 0)
    #     {
    #         return $this->_getAuthorInfo($iAuthorId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getParams

  ## Parametros
    - &$aBp
    -  &$aDp

  ## Retorno
    - any
  """
  def getParams(params) do
    # TODO: Implementacao futura
        # public function getParams(&$aBp, &$aDp)
    #     {
    #         return $this->_getParams($aBp, $aDp);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP prepareParams

  ## Parametros
    - &$aBp
    -  &$aDp

  ## Retorno
    - any
  """
  def prepareParams(params) do
    # TODO: Implementacao futura
        # public function prepareParams(&$aBp, &$aDp)
    #     {
    #          return $this->_prepareParams($aBp, $aDp);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAuthorId

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getAuthorId(params) do
    # TODO: Implementacao futura
        # protected function _getAuthorId ()
    #     {
    #         return isMember() ? bx_get_logged_profile_id() : 0;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAuthorPassword

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getAuthorPassword(params) do
    # TODO: Implementacao futura
        # protected function _getAuthorPassword ()
    #     {
    #         return getLoggedPassword();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAuthorIp

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getAuthorIp(params) do
    # TODO: Implementacao futura
        # protected function _getAuthorIp ()
    #     {
    #         return getVisitorIP();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAuthorInfo

  ## Parametros
    - $iAuthorId = 0

  ## Retorno
    - any
  """
  def getAuthorInfo(params) do
    # TODO: Implementacao futura
        # protected function _getAuthorInfo($iAuthorId = 0)
    #     {
    #         $iUserId = $this->_getAuthorId();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAuthorObject

  ## Parametros
    - $iAuthorId = 0

  ## Retorno
    - any
  """
  def getAuthorObject(params) do
    # TODO: Implementacao futura
        # protected function _getAuthorObject($iAuthorId = 0)
    #     {
    #         return BxDolProfile::getInstanceMagic((int)$iAuthorId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFormObject

  ## Parametros
    - $sAction = BX_CMT_ACTION_POST

  ## Retorno
    - any
  """
  def getFormObject(params) do
    # TODO: Implementacao futura
        # protected function _getFormObject($sAction = BX_CMT_ACTION_POST)
    #     {
    #         $sDisplayName = '_sFormDisplay' . ucfirst($sAction);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP unsetFormObject

  ## Parametros
    - $sAction = BX_CMT_ACTION_POST

  ## Retorno
    - any
  """
  def unsetFormObject(params) do
    # TODO: Implementacao futura
        # protected function _unsetFormObject($sAction = BX_CMT_ACTION_POST)
    #     {
    #         $sDisplayName = '_sFormDisplay' . ucfirst($sAction);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getParams

  ## Parametros
    - &$aBp
    -  &$aDp

  ## Retorno
    - any
  """
  def getParams(params) do
    # TODO: Implementacao futura
        # protected function _getParams(&$aBp, &$aDp)
    #     {
    #         //--- Process 'Browse' params. 
    #         $aBp['parent_id'] = isset($aBp['parent_id']) ? (int)$aBp['parent_id'] : 0;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP prepareAlertParams

  ## Parametros
    - $aCmt

  ## Retorno
    - any
  """
  def prepareAlertParams(params) do
    # TODO: Implementacao futura
        # protected function _prepareAlertParams($aCmt)
    #     {
    #         $iObjId = (int)$this->getId();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP prepareAlertParamsReply

  ## Parametros
    - $aCmt
    -  $aCmtPrnt

  ## Retorno
    - any
  """
  def prepareAlertParamsReply(params) do
    # TODO: Implementacao futura
        # protected function _prepareAlertParamsReply($aCmt, $aCmtPrnt)
    #     {
    #         $iObjId = (int)$this->getId();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP prepareAuditParams

  ## Parametros
    - $iId
    -  $aData

  ## Retorno
    - any
  """
  def prepareAuditParams(params) do
    # TODO: Implementacao futura
        # protected function _prepareAuditParams($iId, $aData)
    #     {
    #         $sModule = $this->_aSystem['module'];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP prepareTextForOutput

  ## Parametros
    - $s
    -  $iCmtId = 0

  ## Retorno
    - any
  """
  def prepareTextForOutput(params) do
    # TODO: Implementacao futura
        # protected function _prepareTextForOutput ($s, $iCmtId = 0)
    #     {
    #     	$iDataAction = !$this->isHtml() ? BX_DATA_TEXT_MULTILINE : BX_DATA_HTML;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP prepareStructureBp

  ## Parametros
    - $sDType
    -  &$aBp

  ## Retorno
    - any
  """
  def prepareStructureBp(params) do
    # TODO: Implementacao futura
        # protected function _prepareStructureBp($sDType, &$aBp)
    #     {
    #         $aBp['type'] = !empty($aBp['type']) ? $aBp['type'] : $this->_sBrowseType;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP prepareParams

  ## Parametros
    - &$aBp
    -  &$aDp

  ## Retorno
    - any
  """
  def prepareParams(params) do
    # TODO: Implementacao futura
        # protected function _prepareParams(&$aBp, &$aDp)
    #     {
    #         $aBp['type'] = !empty($aBp['type']) ? $aBp['type'] : $this->_sBrowseType;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP triggerComment

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def triggerComment(params) do
    # TODO: Implementacao futura
        # protected function _triggerComment()
    #     {
    #         if(!$this->_aSystem['trigger_table'] || !$this->_aSystem['trigger_field_id'] || !$this->_aSystem['trigger_field_comments'])
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP replaceMarkers

  ## Parametros
    - $mixed

  ## Retorno
    - any
  """
  def replaceMarkers(params) do
    # TODO: Implementacao futura
        # protected function _replaceMarkers ($mixed)
    #     {
    #         return bx_replace_markers($mixed, $this->_aMarkers);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUserChoice

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getUserChoice(params) do
    # TODO: Implementacao futura
        # protected function _getUserChoice()
    #     {
    #         $mixedDp = $mixedBpType = $mixedBpFilter = false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setUserChoice

  ## Parametros
    - $sDp
    -  $sBpType
    -  $sBpFilter

  ## Retorno
    - any
  """
  def setUserChoice(params) do
    # TODO: Implementacao futura
        # protected function _setUserChoice($sDp, $sBpType, $sBpFilter)
    #     {
    #         if(!isLogged())
    #             return;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP sendNotificationEmail

  ## Parametros
    - $iCmtId
    -  $iCmtParentId

  ## Retorno
    - any
  """
  def sendNotificationEmail(params) do
    # TODO: Implementacao futura
        # protected function _sendNotificationEmail($iCmtId, $iCmtParentId)
    #     {
    #         $aCmt = $this->getCommentRow($iCmtId);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isShowDoComment

  ## Parametros
    - $aParams
    -  $isAllowedComment
    -  $bCount

  ## Retorno
    - any
  """
  def isShowDoComment(params) do
    # TODO: Implementacao futura
        # protected function _isShowDoComment($aParams, $isAllowedComment, $bCount)
    #     {
    #         $bShowDoComment = !isset($aParams['show_do_comment']) || $aParams['show_do_comment'] == true;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isShowCounter

  ## Parametros
    - $aParams
    -  $isAllowedComment
    -  $bCount

  ## Retorno
    - any
  """
  def isShowCounter(params) do
    # TODO: Implementacao futura
        # protected function _isShowCounter($aParams, $isAllowedComment, $bCount)
    #     {
    #         $bShowCounter = isset($aParams['show_counter']) && $aParams['show_counter'] === true;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getImageDo

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getImageDo(params) do
    # TODO: Implementacao futura
        # protected function _getImageDo()
    #     {
    #     	return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getIconDo

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getIconDo(params) do
    # TODO: Implementacao futura
        # protected function _getIconDo()
    #     {
    #     	return 'far comment';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTitleDo

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getTitleDo(params) do
    # TODO: Implementacao futura
        # protected function _getTitleDo()
    #     {
    #     	return '_cmt_txt_do';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getParents

  ## Parametros
    - $aCmt
    -  $iDepthMax
    -  &$iDepth
    -  &$aParents

  ## Retorno
    - any
  """
  def getParents(params) do
    # TODO: Implementacao futura
        # protected function _getParents($aCmt, $iDepthMax, &$iDepth, &$aParents)
    #     {
    #         $iParentId = (int)$aCmt['cmt_parent_id'];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStructure

  ## Parametros
    - $mixedItem
    -  $aBp
    -  &$iLevel
    -  &$aStructure

  ## Retorno
    - any
  """
  def getStructure(params) do
    # TODO: Implementacao futura
        # public function _getStructure($mixedItem, $aBp, &$iLevel, &$aStructure)
    #     {
    #         $bItem = !empty($mixedItem) && is_array($mixedItem);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStructureAPI

  ## Parametros
    - $mixedItem
    -  $aBp
    -  &$iLevel
    -  &$aStructure

  ## Retorno
    - any
  """
  def getStructureAPI(params) do
    # TODO: Implementacao futura
        # public function _getStructureAPI($mixedItem, $aBp, &$iLevel, &$aStructure)
    #     {
    #         $bItem = !empty($mixedItem) && is_array($mixedItem);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getDataAPI

  ## Parametros
    - $aData
    -  $aParams = []

  ## Retorno
    - any
  """
  def getDataAPI(params) do
    # TODO: Implementacao futura
        # public function getDataAPI($aData, $aParams = [])
    #     {
    #         $aDataApi = array_merge($aData, [
    #             'cmt_url' => '/' . $this->getViewUrl($aData['cmt_id'], false),
    #             'author_data' => BxDolProfile::getData($aData['cmt_author_id']),
    #         ]);
    # 
    :ok
  end
end
