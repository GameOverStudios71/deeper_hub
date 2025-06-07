
defmodule DeeperHub.Inc.Classes.BxDolCmtsQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolCmtsQuery.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - &oMain

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct(&$oMain)
    #     {
    #         $this->_sTableSystems = BxDolCmts::$sTableSystems;
    #         $this->_sTableIds = BxDolCmts::$sTableIds;
    # 
    #         $this->_oMain = $oMain;
    # 
    #         $this->_sTableFiles = $this->_oMain->getTableNameImages();
    #         $this->_sTableFiles2Entries = $this->_oMain->getTableNameImages2Entries();
    # 
    #         $aSystem = $this->_oMain->getSystemInfo();
    #         $this->_sTable = $aSystem['table'];
    #         $this->_sTriggerTable = $aSystem['trigger_table'];
    #         $this->_sTriggerFieldId = $aSystem['trigger_field_id'];
    #         $this->_sTriggerFieldAuthor = $aSystem['trigger_field_author'];
    #         $this->_sTriggerFieldTitle = $aSystem['trigger_field_title'];
    #         $this->_sTriggerFieldComments = $aSystem['trigger_field_comments'];
    # 
    #         parent::__construct();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSystemBy

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getSystemBy(%{}) do
    # TODO: Implementacao futura
        # public static function getSystemBy($aParams)
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query', 1 => []]];
    #         $sSelectClause = $sJoinClause = $sWhereClause = $sOrderClause = $sLimitClause = "";
    # 
    #         $sSelectClause = "`ts`.*";
    # 
    #         switch($aParams['type']) {
    #             case 'name':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1]['name'] = $aParams['name'];
    # 
    #                 $sWhereClause .= " AND `ts`.`Name` = :name";
    #                 break;
    # 
    #             case 'all':
    #                 break;
    #         }
    # 
    #         if(!empty($sOrderClause))
    #             $sOrderClause = 'ORDER BY ' . $sOrderClause;
    # 
    #         if(!empty($sLimitClause))
    #             $sLimitClause = 'LIMIT ' . $sLimitClause;
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . " FROM `" . BxDolCmts::$sTableSystems . "` AS `ts` " . $sJoinClause . " WHERE 1 " . $sWhereClause . " " . $sOrderClause . " " . $sLimitClause;
    #         return call_user_func_array(array($oDb, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInfoBy

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getInfoBy(%{}) do
    # TODO: Implementacao futura
        # public static function getInfoBy($aParams)
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $aMethod = array('name' => 'getAll', 'params' => array(0 => 'query', 1 => array()));
    #         $sSelectClause = $sJoinClause = $sWhereClause = $sOrderClause = $sLimitClause = "";
    #         
    #         $sSelectClause = "`ti`.*";
    # 
    #         switch($aParams['type']) {
    #             case 'uniq_id':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1]['uniq_id'] = (int)$aParams['uniq_id'];
    # 
    #                 $sWhereClause .= " AND `ti`.`id` = :uniq_id";
    #                 break;
    # 
    #             case 'all':
    #                 if(isset($aParams['count']) && $aParams['count'] === true) {
    #                     $aMethod['name'] = 'getOne';
    #                     $sSelectClause = "COUNT(`ti`.`id`)";
    #                 }
    #                 break;
    #         }
    # 
    #         if(!empty($sOrderClause))
    #             $sOrderClause = 'ORDER BY ' . $sOrderClause;
    # 
    #         if(!empty($sLimitClause))
    #             $sLimitClause = 'LIMIT ' . $sLimitClause;
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . " FROM `" . BxDolCmts::$sTableIds . "` AS `ti` " . $sJoinClause . " WHERE 1 " . $sWhereClause . " " . $sOrderClause . " " . $sLimitClause;
    #         return call_user_func_array(array($oDb, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInfoByUniqId

  ## Parametros
    - iUniqId

  ## Retorno
    - any
  """
  def getInfoByUniqId(%{}) do
    # TODO: Implementacao futura
        # public static function getInfoByUniqId($iUniqId)
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $sQuery = "SELECT 
    #                 `ti`.`cmt_id` AS `cmt_id`, 
    #                 `to`.`Name` AS `system_name`, 
    #                 `to`.`Table` AS `table_name` 
    #             FROM `" . BxDolCmts::$sTableIds . "` AS `ti` 
    #             INNER JOIN  `" . BxDolCmts::$sTableSystems . "` AS `to` ON  `ti`.`system_id` = `to`.`ID`
    #             WHERE `ti`.`id` = :uniq_ig 
    #             LIMIT 1";
    # 
    #         $aRow = $oDb->getRow($sQuery, array('uniq_ig' => $iUniqId));
    #         if(empty($aRow) || !is_array($aRow))
    #             return $aRow;
    # 
    #         $aRow['cmt_object_id'] = $oDb->getOne("SELECT `cmt_object_id` FROM `" . $aRow['table_name'] . "` WHERE `cmt_id` = :cmt_id LIMIT 1", array(
    #             'cmt_id' => $aRow['cmt_id']
    #         ));
    # 
    #         return $aRow;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentByUniq

  ## Parametros
    - iUnicId

  ## Retorno
    - any
  """
  def getCommentByUniq(%{}) do
    # TODO: Implementacao futura
        # public static function getCommentByUniq ($iUnicId)
    #     {
    #         return self::getInfoByUniqId($iUnicId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentSimpleByUniqId

  ## Parametros
    - iUniqId

  ## Retorno
    - any
  """
  def getCommentSimpleByUniqId(%{}) do
    # TODO: Implementacao futura
        # public static function getCommentSimpleByUniqId($iUniqId)
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $sQuery = "SELECT 
    #                 `ti`.`cmt_id` AS `cmt_id`, 
    #                 `to`.`Table` AS `cmt_table` 
    #             FROM `" . BxDolCmts::$sTableIds . "` as `ti` 
    #             INNER JOIN  `" . BxDolCmts::$sTableSystems . "` as `to` ON  `ti`.`system_id` = `to`.`ID`
    #             WHERE `ti`.`id` = :uniq_ig 
    #             LIMIT 1";
    # 
    #         $aData = $oDb->getRow($sQuery, array('uniq_ig' => $iUniqId));
    #         if(empty($aData) || !is_array($aData))
    #             return array();
    # 
    #         return $oDb->getRow("SELECT * FROM `" . $aData['cmt_table'] . "` WHERE `cmt_id` = :cmt_id LIMIT 1", array(
    #             'cmt_id' => $aData['cmt_id']
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentExtendedByUniqId

  ## Parametros
    - iUniqId

  ## Retorno
    - any
  """
  def getCommentExtendedByUniqId(%{}) do
    # TODO: Implementacao futura
        # public static function getCommentExtendedByUniqId($iUniqId)
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $sQuery = "SELECT 
    #                 `ti`.`cmt_id` AS `cmt_id`, 
    #                 `ti`.`system_id` AS `cmt_system_id`, 
    #                 `to`.`Table` AS `cmt_table` 
    #             FROM `" . BxDolCmts::$sTableIds . "` AS `ti` 
    #             INNER JOIN  `" . BxDolCmts::$sTableSystems . "` AS `to` ON  `ti`.`system_id` = `to`.`ID`
    #             WHERE `ti`.`id` = :uniq_ig 
    #             LIMIT 1";
    # 
    #         $aData = $oDb->getRow($sQuery, array('uniq_ig' => $iUniqId));
    #         if(empty($aData) || !is_array($aData))
    #             return array();
    # 
    #         $sQuery = "SELECT 
    #                 `tc`.*,
    #                 `ti`.`rate`, `ti`.`votes`,
    #                 `ti`.`rrate`, `ti`.`rvotes`,
    #                 `ti`.`score`, `ti`.`sc_up`, `ti`.`sc_down`,
    #                 `ti`.`reports` 
    #             FROM `" . $aData['cmt_table'] . "` AS `tc`
    #             LEFT JOIN `" . BxDolCmts::$sTableIds . "` AS `ti` ON `ti`.`system_id` = :cmt_system_id AND `tc`.`cmt_id` = `ti`.`cmt_id` 
    #             WHERE `tc`.`cmt_id` = :cmt_id 
    #             LIMIT 1";       
    # 
    #         return $oDb->getRow($sQuery, array(
    #             'cmt_id' => $aData['cmt_id'],
    #             'cmt_system_id' => $aData['cmt_system_id']
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTableName

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getTableName(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getTableName ()
    #     {
    #         return $this->_sTable;
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
        # 
    #     function setTableNameFiles($sTable)
    #     {
    #     	$this->_sTableFiles = $sTable;
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
        # 
    #     function setTableNameFiles2Entries($sTable)
    #     {
    #     	$this->_sTableFiles2Entries = $sTable;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsCountAll

  ## Parametros
    - iId,iAuthorId=0,bForceCalculate=false

  ## Retorno
    - any
  """
  def getCommentsCountAll(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getCommentsCountAll ($iId, $iAuthorId = 0, $bForceCalculate = false)
    #     {
    #         $iCount = false;
    #         /**
    #          * @hooks
    #          * @hookdef hook-comment-get_comments_count 'comment', 'get_comments_count' - hook to override number of comments for commented object
    #          * - $unit_name - equals `comment`
    #          * - $action - equals `get_comments_count`
    #          * - $object_id - not used
    #          * - $sender_id - profile id
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `system` - [string] comment object name
    #          *      - `object_id` - [int] commented object id
    #          *      - `result` - [int] by ref, number of comments, can be overridden in hook processing
    #          * @hook @ref hook-comment-get_comments_count
    #          */
    #         bx_alert('comment', 'get_comments_count', 0, $iAuthorId, [
    #             'system' => $this->_oMain->getSystemInfo(), 
    #             'object_id' => $iId, 
    #             'result' => &$iCount
    #         ]);
    #         if ($iCount !== false)
    #             return $iCount;
    # 
    #         if ($this->_sTriggerFieldComments && !$bForceCalculate)
    #             return (int)$this->getOne("SELECT `{$this->_sTriggerFieldComments}` FROM `{$this->_sTriggerTable}` WHERE `{$this->_sTriggerFieldId}` = :id", [
    #                 'id' => $iId
    #             ]);
    #         else
    #             return $this->getCommentsCount($iId, -1, $iAuthorId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsCount

  ## Parametros
    - iId,iCmtVParentId=-1,iAuthorId=0,sFilter=''

  ## Retorno
    - any
  """
  def getCommentsCount(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getCommentsCount ($iId, $iCmtVParentId = -1, $iAuthorId = 0, $sFilter = '')
    #     {
    #     	$aBindings = array(
    #             'cmt_object_id' => $iId,
    #             'system_id' => $this->_oMain->getSystemId()
    #     	);
    # 
    #         $sWhereClause = $this->getCommentsCheckStatus($iAuthorId);
    # 
    #         if((int)$iCmtVParentId >= 0) {
    #             $aBindings['cmt_vparent_id'] = $iCmtVParentId;
    # 
    #             $sWhereClause .= " AND `{$this->_sTable}`.`cmt_vparent_id` = :cmt_vparent_id";
    #         }
    # 
    #         $sJoinClause = '';
    #         switch($sFilter) {
    #             case BX_CMT_FILTER_FRIENDS:
    #             case BX_CMT_FILTER_SUBSCRIPTIONS:
    #                 $oConnection = BxDolConnection::getObjectInstance($this->_oMain->getConnectionObject($sFilter));
    # 
    #                 $aQueryParts = $oConnection->getConnectedContentAsSQLParts($this->_sTable, 'cmt_author_id', $iAuthorId);
    #                 $sJoinClause .= ' ' . $aQueryParts['join'];
    #                 break;
    # 
    #             case BX_CMT_FILTER_OTHERS:
    #                 $aBindings['cmt_author_id'] = $iAuthorId;
    # 
    #                 $sWhereClause .= " AND `{$this->_sTable}`.`cmt_author_id` <> :cmt_author_id";
    #                 break;
    #         }
    # 
    #         if(($oCf = $this->_oMain->getObjectContentFilter()) !== false)
    #             $sWhereClause .= $oCf->getSQLParts($this->_sTable, 'cmt_cf');
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-comment-get_comments 'comment', 'get_comments' - hook to override comments list. Is used during comments count retrieving.
    #          * - $unit_name - equals `comment`
    #          * - $action - equals `get_comments`
    #          * - $object_id - not used
    #          * - $sender_id - currently logged in profile id
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `system` - [string] comment object name
    #          *      - `join_clause` - [string] by ref, 'join' part of SQL query, can be overridden in hook processing
    #          *      - `where_clause` - [string] by ref, 'where' part of SQL query, can be overridden in hook processing
    #          *      - `params` - [array] by ref, SQL query bindings array as key&value pairs, can be overridden in hook processing
    #          * @hook @ref hook-comment-get_comments
    #          */
    #         bx_alert('comment', 'get_comments', 0, bx_get_logged_profile_id(), [
    #             'system' => $this->_oMain->getSystemInfo(), 
    #             'join_clause' => &$sJoinClause, 
    #             'where_clause' => &$sWhereClause, 
    #             'params' => &$aBindings
    #         ]);
    #         
    #         $sQuery = "SELECT
    #                 COUNT(*) 
    #             FROM `{$this->_sTable}` 
    #             LEFT JOIN `{$this->_sTableIds}` ON (`{$this->_sTable}`.`cmt_id` = `{$this->_sTableIds}`.`cmt_id` AND `{$this->_sTableIds}`.`system_id` = :system_id) $sJoinClause 
    #             WHERE `{$this->_sTable}`.`cmt_object_id` = :cmt_object_id" . $sWhereClause;
    #         return (int)$this->getOne($sQuery, $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentsCheckStatus

  ## Parametros
    - iAuthorId,sStatus=BX_CMT_STATUS_ACTIVE

  ## Retorno
    - any
  """
  def getCommentsCheckStatus(%{}) do
    # TODO: Implementacao futura
        # protected function getCommentsCheckStatus($iAuthorId, $sStatus = BX_CMT_STATUS_ACTIVE)
    #     {
    #         if($this->_oMain->isModerator()) 
    #             return '';
    # 
    #         //--- Check viewer as comment author.
    #         $sWhereClause = $this->prepareAsString("`{$this->_sTable}`.`cmt_author_id`=?", $iAuthorId);
    # 
    #         //--- Check viewer as an administrator/moderator of comment author.
    #         $aGroups = [];
    #         $aModules = bx_srv('system', 'get_modules_by_type', ['profile']);
    #         foreach($aModules as $aModule) {
    #             $oModule = BxDolModule::getInstance($aModule['name']);
    #             if(!$oModule || !($oModule instanceof BxBaseModGroupsModule))
    #                 continue;
    # 
    #             $aGroups = array_merge($aGroups, $oModule->getGroupsByFan($iAuthorId, [
    #                 BX_BASE_MOD_GROUPS_ROLE_ADMINISTRATOR,
    #                 BX_BASE_MOD_GROUPS_ROLE_MODERATOR
    #             ]));
    #         }
    # 
    #         if(!empty($aGroups))
    #             $sWhereClause .= " OR `{$this->_sTable}`.`cmt_author_id` IN (" . $this->implode_escape($aGroups) . ")";
    # 
    #         return $this->prepareAsString(" AND IF(" . $sWhereClause . ", 1, `{$this->_sTableIds}`.`status_admin`=?) ", $sStatus);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getComment

  ## Parametros
    - iId,iCmtId

  ## Retorno
    - any
  """
  def getComment(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getComment ($iId, $iCmtId)
    #     {
    #         $sFields = $sJoin = "";
    # 
    #         $oVote = $this->_oMain->getVoteObject($iCmtId);
    #         if($oVote !== false) {
    #             $aSql = $oVote->getSqlParts($this->_sTableIds, 'id');
    # 
    #             $sFields .= $aSql['fields'];
    #             $sJoin .= $aSql['join'];
    #         }
    # 
    #         $sQuery = $this->prepare("SELECT
    #                 `{$this->_sTable}`.*,
    #                 `{$this->_sTableIds}`.`id` AS `cmt_unique_id`,
    #                 `{$this->_sTableIds}`.`status_admin` AS `cmt_status_admin`
    #                 $sFields
    #             FROM `{$this->_sTable}`
    #             LEFT JOIN `{$this->_sTableIds}` ON (`{$this->_sTable}`.`cmt_id` = `{$this->_sTableIds}`.`cmt_id` AND `{$this->_sTableIds}`.`system_id` = ?)
    #             $sJoin
    #             WHERE `{$this->_sTable}`.`cmt_object_id` = ? AND `{$this->_sTable}`.`cmt_id` = ?
    #             LIMIT 1", $this->_oMain->getSystemId(), $iId, $iCmtId);
    #         return $this->getRow($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCommentSimple

  ## Parametros
    - iId,iCmtId

  ## Retorno
    - any
  """
  def getCommentSimple(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getCommentSimple ($iId, $iCmtId)
    #     {
    #         $sQuery = $this->prepare("SELECT * FROM {$this->_sTable} AS `c` WHERE `cmt_object_id` = ? AND `cmt_id` = ? LIMIT 1", $iId, $iCmtId);
    #         return $this->getRow($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP removeComment

  ## Parametros
    - iId,iCmtId,iCmtParentId

  ## Retorno
    - any
  """
  def removeComment(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function removeComment ($iId, $iCmtId, $iCmtParentId)
    #     {
    #         $sQuery = $this->prepare("DELETE FROM {$this->_sTable} WHERE `cmt_object_id` = ? AND `cmt_id` = ? LIMIT 1", $iId, $iCmtId);
    #         if (!$this->query($sQuery))
    #             return false;
    # 
    #         if($iCmtParentId)
    #             $this->updateRepliesCount($iCmtParentId, -1);
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP saveImages

  ## Parametros
    - iSystemId,iCmtId,iImageId

  ## Retorno
    - any
  """
  def saveImages(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function saveImages($iSystemId, $iCmtId, $iImageId)
    #     {
    #         $sQuery = $this->prepare("INSERT IGNORE INTO `{$this->_sTableFiles2Entries}` SET `system_id`=?, `cmt_id`=?, `image_id`=?", $iSystemId, $iCmtId, $iImageId);
    #         return (int)$this->query($sQuery) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFiles

  ## Parametros
    - iSystemId,iCmtId,iId=false

  ## Retorno
    - any
  """
  def getFiles(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getFiles($iSystemId, $iCmtId, $iId = false)
    #     {
    #     	$aBindings = array(
    #     		'system_id' => $iSystemId
    #     	);
    # 
    #         $sJoin = "";
    #         $sWhere = " AND `tf2e`.`system_id` = :system_id ";
    # 
    #         if($iCmtId !== false) {
    #         	$aBindings['cmt_id'] = $iCmtId;
    # 
    #             $sWhere .= " AND `tf2e`.`cmt_id` = :cmt_id ";
    #         }
    # 
    #         if($iId !== false) {
    #         	$aBindings['cmt_object_id'] = $iId;
    # 
    #             $sWhere .= " AND `te`.`cmt_object_id` = :cmt_object_id";
    #             $sJoin .= " INNER JOIN `{$this->_sTable}` AS `te` ON (`tf2e`.`cmt_id` = `te`.`cmt_id`) ";
    #         }
    # 
    #         $sQuery = "SELECT 
    #         		`tf2e`.*,
    #         		`tf`.`file_name` AS `file_name`,
    #         		`tf`.`mime_type` AS `mime_type`,
    #         		`tf`.`size` AS `size`,
    #                         `tf`.`dimensions` AS `dimensions`
    #         	FROM `{$this->_sTableFiles2Entries}` AS `tf2e` 
    #         	LEFT JOIN `{$this->_sTableFiles}` AS `tf` ON (`tf2e`.`image_id` = `tf`.`id`) " . $sJoin . " 
    #         	WHERE 1 " . $sWhere;
    # 
    #         return $this->getAll($sQuery, $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFileInfoById

  ## Parametros
    - iFileId

  ## Retorno
    - any
  """
  def getFileInfoById(%{}) do
    # TODO: Implementacao futura
        # public function getFileInfoById($iFileId)
    #     {
    #         $sQuery = "SELECT 
    #                 `tf2e`.*,
    #                 `tf`.`file_name` AS `file_name`,
    #                 `tf`.`mime_type` AS `mime_type`,
    #                 `tf`.`size` AS `size` 
    #             FROM `{$this->_sTableFiles2Entries}` AS `tf2e` 
    #             LEFT JOIN `{$this->_sTableFiles}` AS `tf` ON (`tf2e`.`image_id` = `tf`.`id`) 
    #             WHERE `tf2e`.`id`=:id ";
    # 
    #         return $this->getRow($sQuery, array(
    #             'id' => $iFileId
    #     	));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteImages

  ## Parametros
    - iSystemId,iCmtId,iImageId=false

  ## Retorno
    - any
  """
  def deleteImages(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function deleteImages($iSystemId, $iCmtId, $iImageId = false)
    #     {
    #         $sWhereAddon = "";
    #         $aBindings = array();
    # 
    #         if ($iSystemId !== false) {
    #             $aBindings['system_id'] = $iSystemId;
    # 
    #             $sWhereAddon .= " AND `system_id` = :system_id ";
    #         }
    # 
    #         if ($iCmtId !== false) {
    #             $aBindings['cmt_id'] = $iCmtId;
    # 
    #             $sWhereAddon .= " AND `cmt_id` = :cmt_id ";
    #         }
    # 
    #         if ($iImageId !== false) {
    #             $aBindings['image_id'] = $iImageId;
    # 
    #             $sWhereAddon .= " AND `image_id` = :image_id ";
    #         }
    # 
    #         return $this->query("DELETE FROM `{$this->_sTableFiles2Entries}` WHERE 1" . $sWhereAddon, $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateComments

  ## Parametros
    - aSetClause,aWhereClause

  ## Retorno
    - any
  """
  def updateComments(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function updateComments($aSetClause, $aWhereClause)
    #     {
    #         if(empty($aSetClause) || empty($aWhereClause))
    #             return;
    # 
    #         return (int)$this->query("UPDATE `{$this->_sTable}` SET " . $this->arrayToSQL($aSetClause) . " WHERE " . $this->arrayToSQL($aWhereClause)) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateRepliesCount

  ## Parametros
    - iCmtId,iCount

  ## Retorno
    - any
  """
  def updateRepliesCount(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function updateRepliesCount($iCmtId, $iCount)
    #     {
    #         $sQuery = $this->prepare("UPDATE `{$this->_sTable}` SET `cmt_replies`=`cmt_replies`+? WHERE `cmt_id`=? LIMIT 1", $iCount, $iCmtId);
    #         return $this->query($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteAuthorComments

  ## Parametros
    - iAuthorId,&aFiles=null,&aCmtIds=null

  ## Retorno
    - any
  """
  def deleteAuthorComments(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function deleteAuthorComments ($iAuthorId, &$aFiles = null, &$aCmtIds = null)
    #     {
    #         $aSystem = $this->_oMain->getSystemInfo();
    # 
    #         $isDelOccured = 0;
    #         $sQuery = $this->prepare("SELECT `cmt_id`, `cmt_parent_id` FROM {$this->_sTable} WHERE `cmt_author_id` = ? AND `cmt_replies` = 0", $iAuthorId);
    #         $a = $this->getAll ($sQuery);
    # 		foreach ($a as $r) {
    #             $sQuery = $this->prepare("DELETE FROM {$this->_sTable} WHERE `cmt_id` = ?", $r['cmt_id']);
    #             $this->query ($sQuery);
    # 
    #             $sQuery = $this->prepare("UPDATE {$this->_sTable} SET `cmt_replies` = `cmt_replies` - 1 WHERE `cmt_id` = ?", $r['cmt_parent_id']);
    #             $this->query ($sQuery);
    # 
    #             $aFilesMore = $this->convertImagesArray($this->getFiles($aSystem['system_id'], $r['cmt_id']));
    #             $this->deleteImages($aSystem['system_id'], $r['cmt_id']);
    #             if ($aFilesMore && null !== $aFiles)
    #                 $aFiles = array_merge($aFiles, $aFilesMore);
    # 
    #             if (null !== $aCmtIds)
    #                 $aCmtIds[] = $r['cmt_id'];
    # 
    #             $isDelOccured = 1;
    #         }
    #         $sQuery = $this->prepare("UPDATE {$this->_sTable} SET `cmt_author_id` = 0 WHERE `cmt_author_id` = ? AND `cmt_replies` != 0", $iAuthorId);
    #         $this->query ($sQuery);
    #         if ($isDelOccured)
    #             $this->query ("OPTIMIZE TABLE {$this->_sTable}");
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteObjectComments

  ## Parametros
    - iObjectId,&aFilesReturn=null,&aCmtIds=null

  ## Retorno
    - any
  """
  def deleteObjectComments(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function deleteObjectComments ($iObjectId, &$aFilesReturn = null, &$aCmtIds = null)
    #     {
    #         $aSystem = $this->_oMain->getSystemInfo();
    #         $aFiles = $this->convertImagesArray($this->getFiles($aSystem['system_id'], false, $iObjectId));
    # 
    #         if ($aFiles) {
    #             $sQuery = $this->prepare("DELETE FROM {$this->_sTableFiles2Entries} WHERE `system_id` = ? AND `image_id` IN(" . $this->implode_escape($aFiles) . ")", $aSystem['system_id']);
    #             $this->query($sQuery);
    #         }
    # 
    #         if (null !== $aCmtIds) {
    #             $sQuery = $this->prepare("SELECT `cmt_id` FROM {$this->_sTable} WHERE `cmt_object_id` = ?", $iObjectId);
    #             $aCmtIds = $this->getColumn ($sQuery);
    #         }
    # 
    #         $sQuery = $this->prepare("DELETE FROM {$this->_sTable} WHERE `cmt_object_id` = ?", $iObjectId);
    #         $this->query ($sQuery);
    #         $this->query ("OPTIMIZE TABLE {$this->_sTable}");
    # 
    #         if (null !== $aFilesReturn)
    #             $aFilesReturn = $aFiles;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteAll

  ## Parametros
    - iSystemId,&aFiles=null,&aCmtIds=null

  ## Retorno
    - any
  """
  def deleteAll(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function deleteAll ($iSystemId, &$aFiles = null, &$aCmtIds = null)
    #     {
    #         // get files
    #         if (null !== $aFiles)
    #             $aFiles = $this->convertImagesArray($this->getFiles($iSystemId, false));
    # 
    #         // delete files
    #         $this->deleteImages($iSystemId, false);
    # 
    #         if (null !== $aCmtIds)
    #             $aCmtIds = $this->getColumn ("SELECT `cmt_id` FROM {$this->_sTable}");
    # 
    #         // delete comments
    #         $sQuery = $this->prepare("TRUNCATE TABLE {$this->_sTable}");
    #         $this->query ($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteCmtIds

  ## Parametros
    - iSystemId,iCmtId

  ## Retorno
    - any
  """
  def deleteCmtIds(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function deleteCmtIds ($iSystemId, $iCmtId)
    #     {
    #         $sQuery = $this->prepare("DELETE FROM {$this->_sTableIds} WHERE `system_id` = ? AND `cmt_id` = ?", $iSystemId, $iCmtId);
    #         return $this->query ($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectAuthorId

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def getObjectAuthorId(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getObjectAuthorId($iId)
    #     {
    #         $sQuery = $this->prepare("SELECT `{$this->_sTriggerFieldAuthor}` FROM `{$this->_sTriggerTable}` WHERE `{$this->_sTriggerFieldId}` = ? LIMIT 1", $iId);
    #         return $this->getOne($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectTitle

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def getObjectTitle(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getObjectTitle($iId)
    #     {
    #         $sQuery = $this->prepare("SELECT `{$this->_sTriggerFieldTitle}` FROM `{$this->_sTriggerTable}` WHERE `{$this->_sTriggerFieldId}` = ? LIMIT 1", $iId);
    #         return $this->getOne($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectPrivacyView

  ## Parametros
    - iId,sField=''

  ## Retorno
    - any
  """
  def getObjectPrivacyView(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getObjectPrivacyView($iId, $sField = '')
    #     {
    #         if(empty($sField)) {
    #             $sField = 'allow_view_to';
    #             if(!$this->isFieldExists($this->_sTriggerTable, $sField))
    #                 return false;
    #         }
    # 
    #         return $this->getOne("SELECT `{$sField}` FROM `{$this->_sTriggerTable}` WHERE `{$this->_sTriggerFieldId}` = :id LIMIT 1", array(
    #             'id' => $iId
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateTriggerTable

  ## Parametros
    - iId,iCount

  ## Retorno
    - any
  """
  def updateTriggerTable(%{}) do
    # TODO: Implementacao futura
        # public function updateTriggerTable($iId, $iCount)
    #     {
    #         if (!$this->_sTriggerFieldComments)
    #             return true;
    #         $sQuery = $this->prepare("UPDATE `{$this->_sTriggerTable}` SET `{$this->_sTriggerFieldComments}` = ? WHERE `{$this->_sTriggerFieldId}` = ? LIMIT 1", $iCount, $iId);
    #         return $this->query($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUniqId

  ## Parametros
    - iSystemId,iCmtId,aData=[]

  ## Retorno
    - any
  """
  def getUniqId(%{}) do
    # TODO: Implementacao futura
        # public function getUniqId($iSystemId, $iCmtId, $aData = [])
    #     {
    #         $sQuery = $this->prepare("SELECT `id` FROM `{$this->_sTableIds}` WHERE `system_id` = ? AND `cmt_id` = ?", $iSystemId, $iCmtId);
    #         if(($iUniqId = (int)$this->getOne($sQuery)) != 0)
    #             return $iUniqId;
    # 
    #         $aDataDefault = [
    #             'system_id' => $iSystemId, 
    #             'cmt_id' => $iCmtId,
    #             'author_id' => bx_get_logged_profile_id()
    #         ];
    # 
    #         if(!$this->query("INSERT INTO `{$this->_sTableIds}` SET " . $this->arrayToSQL(array_merge($aDataDefault, $aData))))
    #             return false;
    # 
    #         return $this->lastId();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateUniqId

  ## Parametros
    - aSetClause,aWhereClause

  ## Retorno
    - any
  """
  def updateUniqId(%{}) do
    # TODO: Implementacao futura
        # public function updateUniqId($aSetClause, $aWhereClause)
    #     {
    #         if(empty($aSetClause) || empty($aWhereClause))
    #             return;
    # 
    #         return (int)$this->query("UPDATE `{$this->_sTableIds}` SET " . $this->arrayToSQL($aSetClause) . " WHERE " . $this->arrayToSQL($aWhereClause)) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP convertImagesArray

  ## Parametros
    - a

  ## Retorno
    - any
  """
  def convertImagesArray(%{}) do
    # TODO: Implementacao futura
        # protected function convertImagesArray($a)
    #     {
    #         if (!$a || !is_array($a))
    #             return array();
    # 
    #         $aFiles = array ();
    #         foreach ($a as $aFile)
    #             $aFiles[] = $aFile['image_id'];
    #         return $aFiles;
    #     }
    :ok
  end

end
