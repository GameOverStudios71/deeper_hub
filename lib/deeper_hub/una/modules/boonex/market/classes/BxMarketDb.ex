
defmodule DeeperHub.Inc.Classes.BxMarketDb do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/market/classes/BxMarketDb.php
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
        # 
    # 
    #     function __construct(&$oConfig)
    #     {
    #         parent::__construct($oConfig);
    # 
    #         $this->_aRecurringDurations = array(
    #         	'day' => 'INTERVAL 1 DAY',
    #         	'week' => 'INTERVAL 7 DAY',
    #         	'month' => 'INTERVAL 1 MONTH',
    #         	'year' => 'INTERVAL 1 YEAR',
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProductsNames

  ## Parametros
    - iVendor=0,iLimit=1000

  ## Retorno
    - any
  """
  def getProductsNames(%{}) do
    # TODO: Implementacao futura
        # public function getProductsNames ($iVendor = 0, $iLimit = 1000)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         $sWhere = '';
    #         $aBindings = array('limit' => $iLimit);
    #         if ($iVendor) {
    #             $aBindings['author'] = $iVendor;
    #             $sWhere .= "AND `{$CNF['FIELD_AUTHOR']} = :author`";
    #         }
    # 
    #         return $this->getColumn("SELECT `{$CNF['FIELD_NAME']}` FROM `{$CNF['TABLE_ENTRIES']}` WHERE (`{$CNF['FIELD_PRICE_SINGLE']}` != '0' OR `{$CNF['FIELD_PRICE_RECURRING']}` != '0') $sWhere LIMIT :limit", $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getContentInfoBy

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getContentInfoBy(%{}) do
    # TODO: Implementacao futura
        # public function getContentInfoBy ($aParams)
    #     {
    #     	$CNF = &$this->_oConfig->CNF;
    # 
    #     	$aMethod = array('name' => 'getAll', 'params' => array(0 => 'query'));
    # 		$aOrderWay = array('up' => 'ASC', 'down' => 'DESC');
    # 
    #     	$sFieldsClause = $sJoinClause = $sWhereClause = $sGroupClause = $sOrderClause = $sLimitClause = '';
    # 
    #     	//--- Add file info.
    #     	$sFieldsClause .= " `te`.`" . $CNF['FIELD_PACKAGE'] . "` AS `file_id`, `tf`.`file_name` AS `file_name`, `tfe`.`version` AS `file_version`, ";
    #     	$sJoinClause .= " LEFT JOIN `" . $CNF['TABLE_FILES2ENTRIES'] . "` AS `tfe` ON `te`.`" . $CNF['FIELD_ID'] . "`=`tfe`.`content_id` AND `te`.`" . $CNF['FIELD_PACKAGE'] . "`=`tfe`.`file_id` LEFT JOIN `" . $CNF['TABLE_FILES'] . "` AS `tf` ON `te`.`" . $CNF['FIELD_PACKAGE'] . "`=`tf`.`id` ";
    # 
    #     	//--- Add license checking for Public listings if Client is specified.
    #     	if(in_array($aParams['type'], array('latest', 'popular', 'featured', 'category', 'tag', 'vendor', 'keyword')) && isset($aParams['client']) && (int)$aParams['client'] != 0) {
    #     	    //--- Direct license purchase for a product
    #     	    $sLicDir = $this->prepareAsString("SELECT `tl`.`added` FROM `" . $CNF['TABLE_LICENSES'] . "` AS `tl` WHERE `tl`.`product_id`=`te`.`" . $CNF['FIELD_ID'] . "` AND `tl`.`profile_id`=? AND (`tl`.`domain`=?" . (empty($aParams['key_assigned']) ? " OR `tl`.`domain`=''" : "") . ") LIMIT 1", (int)$aParams['client'], $aParams['key']);
    # 
    #     	    //--- License got with package purchase
    #     	    $oConnnection = BxDolConnection::getObjectInstance($CNF['OBJECT_CONNECTION_SUBENTRIES']);
    #             $aConnectionSql = $oConnnection->getConnectedInitiatorsAsSQLPartsMultiple('tl', 'product_id', 'te', $CNF['FIELD_ID']);
    # 
    #     	    $sLicPack = $this->prepareAsString("SELECT `tl`.`added` FROM `" . $CNF['TABLE_LICENSES'] . "` AS `tl` " . $aConnectionSql['join'] . " WHERE 1 " . $aConnectionSql['where'] . " AND `tl`.`profile_id`=? AND (`tl`.`domain`=?" . (empty($aParams['key_assigned']) ? " OR `tl`.`domain`=''" : "") . ") LIMIT 1", (int)$aParams['client'], $aParams['key']);
    # 
    #     		$sFieldsClause .= " ((" . $sLicDir . ") OR (" . $sLicPack . ")) AS `purchased_on`, ";
    #     	}
    # 
    #         //--- Include content by ids or names
    #         if(!empty($aParams['include_by']) && in_array($aParams['include_by'], array('id', 'name')) && !empty($aParams['include_values']))
    #             $sWhereClause .= " AND `te`.`" . $aParams['include_by'] . "` IN (" . $this->implode_escape($aParams['include_values']) . ") ";
    # 
    #     	//--- Exclude content by ids or names
    #         if(!empty($aParams['exclude_by']) && in_array($aParams['exclude_by'], array('id', 'name')) && !empty($aParams['exclude_values']))
    #             $sWhereClause .= " AND `te`.`" . $aParams['exclude_by'] . "` NOT IN (" . $this->implode_escape($aParams['exclude_values']) . ") ";
    # 
    #         //--- Attach custom queries described with field - value pairs.
    #         if(!empty($aParams['custom_and']) && is_array($aParams['custom_and']))
    #             $sWhereClause .= " AND (" . $this->arrayToSQL($aParams['custom_and'], ' AND ') . ") ";
    # 
    #         if(!empty($aParams['custom_or']) && is_array($aParams['custom_or']))
    #             $sWhereClause .= " AND (" . $this->arrayToSQL($aParams['custom_or'], ' OR ') . ") ";
    # 
    #         //--- Exclude inactive authors
    #         if(!empty($aParams['exclude_inactive_authors']))
    #             $sJoinClause .= " INNER JOIN `sys_profiles` AS `tp` ON `te`.`author`=`tp`.`id` AND `tp`.`status`='active'";
    #         
    #     	if(isset($aParams['start']) && !empty($aParams['per_page']))
    #             $sLimitClause = $aParams['start'] . ", " . $aParams['per_page'];
    # 
    #         switch($aParams['type']) {
    #             case 'id':
    #                     $aMethod['name'] = 'getRow';
    #                     $sFieldsClause .= "";
    #                     $sJoinClause .= "";
    #                     $sWhereClause .= $this->prepareAsString(" AND `te`.`" . $CNF['FIELD_ID'] . "`=? ", $aParams['value']);
    #                     $sOrderClause .= "";
    #                     break;
    # 
    #             case 'name':
    #                     $aMethod['name'] = 'getRow';
    #                     $sFieldsClause .= "";
    #                     $sJoinClause .= "";
    #                     $sWhereClause .= $this->prepareAsString(" AND `te`.`" . $CNF['FIELD_NAME'] . "`=? ", $aParams['value']);
    #                     $sOrderClause .= "";
    #                     break;
    # 
    #             case 'file_id':
    #                     $aMethod['name'] = 'getRow';
    #                     $sFieldsClause .= "";
    #                     $sJoinClause .= "";
    #                     $sWhereClause .= $this->prepareAsString(" AND `te`.`" . $CNF['FIELD_PACKAGE'] . "`=? ", $aParams['value']);
    #                     $sOrderClause .= "";
    #                     break;
    # 
    #             case 'latest':
    #                     $sFieldsClause .= "";
    #                     $sJoinClause .= "";
    #                     $sWhereClause .= "";
    #                     $sOrderClause = "`te`.`added` " . (isset($aParams['order_way']) ? $aOrderWay[$aParams['order_way']] : "DESC");
    #                     break;
    # 
    #             case 'featured':
    #                     $sFieldsClause .= "";
    #                     $sJoinClause .= "";
    #                     $sWhereClause .= " AND `te`.`" . $CNF['FIELD_FEATURED'] . "`<>0";
    #                     $sOrderClause = "`te`.`" . $CNF['FIELD_FEATURED'] . "` " . (isset($aParams['order_way']) ? $aOrderWay[$aParams['order_way']] : "DESC");
    #                     break;
    # 
    #             case 'popular':
    #                     $sFieldsClause .= "";
    #                     $sJoinClause .= "";
    #                     $sWhereClause .= "";
    #                     $sOrderClause = "`te`.`views` " . (isset($aParams['order_way']) ? $aOrderWay[$aParams['order_way']] : "DESC");
    #                     break;
    # 
    #             case 'selected':
    #                     $sFieldsClause .= "";
    #                     $sJoinClause .= "";
    #                     $sWhereClause .= " AND `te`.`id` IN (" . $this->implode_escape($aParams['selected']) . ") ";
    #                     $sOrderClause = "`te`.`added` " . (isset($aParams['order_way']) ? $aOrderWay[$aParams['order_way']] : "DESC");
    #                     break;
    # 
    #             case 'category':
    #                     if(!is_array($aParams['value']))
    #                             $aParams['value'] = array($aParams['value']);
    # 
    #                     $sFieldsClause .= "";
    #                     $sJoinClause .= "";
    #                     $sWhereClause .= " AND `te`.`" . $CNF['FIELD_CATEGORY'] . "` IN (" . $this->implode_escape($aParams['value']) . ")";
    #                     $sOrderClause = "`te`.`added` " . (isset($aParams['order_way']) ? $aOrderWay[$aParams['order_way']] : "DESC");
    #                     break;
    # 
    #             case 'tag':
    #                 $sFieldsClause .= "";
    # 
    #                 $aSql = BxDolMetatags::getObjectInstance($CNF['OBJECT_METATAGS'])->keywordsGetAsSQLPart('te', $CNF['FIELD_ID'], $aParams['value']);
    #                 if(!empty($aSql['where'])) {
    #                     $sWhereClause .= $aSql['where'];
    #                 
    #                     if(!empty($aSql['join']))
    #                         $sJoinClause .= $aSql['join'];
    #                 }
    # 
    #                 $sOrderClause = "`te`.`added` " . (isset($aParams['order_way']) ? $aOrderWay[$aParams['order_way']] : "DESC");
    #                 break;
    # 
    #             case 'vendor':
    #                     $sFieldsClause .= "";
    #                     $sJoinClause .= "";
    # 
    #                     $sWhereClause .= $this->prepareAsString(" AND `te`.`" . $CNF['FIELD_AUTHOR'] . "`=? ", (int)$aParams['value']); 
    #                     if(isset($aParams['paid']) && (int)$aParams['paid'] == 1)
    #                             $sWhereClause .= " AND `te`.`" . $CNF['FIELD_PRICE_SINGLE'] . "`<>'0' AND `te`.`" . $CNF['FIELD_PRICE_RECURRING'] . "`<>'0'";
    # 
    #                     $sOrderClause = "`te`.`" . (isset($aParams['order_by']) ? $aParams['order_by'] : "added") . "` " . (isset($aParams['order_way']) ? $aOrderWay[$aParams['order_way']] : "DESC");
    #                     break;
    # 
    #             case 'keyword':
    #                 if(getParam('useLikeOperator') == 'on') {
    #                     $sKeyword = $this->escape('%' . preg_replace('/\s+/', '%', $aParams['value']) . '%');
    # 
    #                     $aWhereSubclause = [];
    #                     foreach ([$CNF['FIELD_TITLE'], $CNF['FIELD_TEXT']] as $sField)
    #                         $aWhereSubclause []= "`" . $sField . "` LIKE  " . $sKeyword;
    #                         
    #                     $sWhereClause .=  ' AND (' . implode(' OR ', $aWhereSubclause) . ')';
    #                 }
    #                 else {
    #                     $sFieldsClause .= $this->prepareAsString(" MATCH(`" . $CNF['FIELD_TITLE'] . "`, `" . $CNF['FIELD_TEXT'] . "`) AGAINST (?) AS `search_condition`, ", $aParams['value']);
    #                     $sWhereClause .= $this->prepareAsString(" AND MATCH(`" . $CNF['FIELD_TITLE'] . "`, `" . $CNF['FIELD_TEXT'] . "`) AGAINST (?) ", $aParams['value']);
    #                     $sOrderClause = "`search_condition` " . (isset($aParams['order_way']) ? $aOrderWay[$aParams['order_way']] : "DESC");
    #                 }
    #                 break;
    # 
    #             case 'granted':
    #                     $sFieldsClause .= " '" . $aParams['license']['license'] . "' AS `license`, '" . $aParams['license']['profile_id'] . "' AS `purchased_by`, '' AS `purchased_for`, '" . $aParams['license']['added'] . "' AS `purchased_on`, ";
    #                     $sWhereClause .= $this->prepareAsString(" AND `te`.`" . $CNF['FIELD_AUTHOR'] . "`=? AND (`te`.`" . $CNF['FIELD_PRICE_SINGLE'] . "`<>'0' OR `te`.`" . $CNF['FIELD_PRICE_RECURRING'] . "`<>'0') ", (int)$aParams['value']);
    #                     $sOrderClause = "`te`.`added` " . (isset($aParams['order_way']) ? $aOrderWay[$aParams['order_way']] : "DESC");
    #                     break;
    # 
    #             case 'purchased':
    #                     $sFieldsClause .= " `tl`.`license` AS `license`, `tl`.`profile_id` AS `purchased_by`, `tl`.`domain` AS `purchased_for`, `tl`.`added` AS `purchased_on`, ";
    # 
    #                     if(isset($aParams['package']) && (int)$aParams['package'] == 1) {
    #                         $oConnnection = BxDolConnection::getObjectInstance($CNF['OBJECT_CONNECTION_SUBENTRIES']);
    #                         $aConnectionSql = $oConnnection->getConnectedContentAsSQLPartsMultiple('te', $CNF['FIELD_ID'], 'tl', 'product_id');
    # 
    #                         $sJoinClause .= " " . $aConnectionSql['join'] . " LEFT JOIN `" . $CNF['TABLE_LICENSES'] . "` AS `tl` ON " . trim($aConnectionSql['where'], " AND ") . " ";
    #                     }
    #                     else
    #                         $sJoinClause .= " LEFT JOIN `" . $CNF['TABLE_LICENSES'] . "` AS `tl` ON `te`.`" . $CNF['FIELD_ID'] . "`=`tl`.`product_id` ";
    # 
    #                     $sWhereClause .= $this->prepareAsString(" AND `tl`.`profile_id`=? AND (`tl`.`domain`=?" . (empty($aParams['key_assigned']) ? " OR `tl`.`domain`=''" : "") . ") ", (int)$aParams['client'], $aParams['key']);
    #                     $sGroupClause .= "`te`.`" . $CNF['FIELD_ID'] . "`";
    #                     $sOrderClause = "`tl`.`added` " . (isset($aParams['order_way']) ? $aOrderWay[$aParams['order_way']] : "DESC");
    #                     break;
    #         }
    # 
    #         $sGroupClause = $sGroupClause ? "GROUP BY " . $sGroupClause : "";
    #         $sOrderClause = $sOrderClause ? "ORDER BY " . $sOrderClause : "";
    #         $sLimitClause = $sLimitClause ? "LIMIT " . $sLimitClause : "";
    # 
    #         $aMethod['params'][0] = "SELECT " . $sFieldsClause . "`te`.*
    #         FROM `" . $CNF['TABLE_ENTRIES'] . "` AS `te`" . $sJoinClause . "
    #         WHERE 1" . $sWhereClause . " " . $sGroupClause . " " . $sOrderClause . " " . $sLimitClause;
    # 
    #         return call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getContentInfoByName

  ## Parametros
    - sContentName

  ## Retorno
    - any
  """
  def getContentInfoByName(%{}) do
    # TODO: Implementacao futura
        # public function getContentInfoByName ($sContentName)
    #     {
    #         $sQuery = $this->prepare ("SELECT * FROM `" . $this->_oConfig->CNF['TABLE_ENTRIES'] . "` WHERE `" . $this->_oConfig->CNF['FIELD_NAME'] . "` = ?", $sContentName);
    #         return $this->getRow($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateContentInfoBy

  ## Parametros
    - aSet,aWhere

  ## Retorno
    - any
  """
  def updateContentInfoBy(%{}) do
    # TODO: Implementacao futura
        # public function updateContentInfoBy ($aSet, $aWhere)
    #     {
    #         $sQuery = "UPDATE `" . $this->_oConfig->CNF['TABLE_ENTRIES'] . "` SET " . $this->arrayToSQL($aSet) . " WHERE " . (!empty($aWhere) ? $this->arrayToSQL($aWhere, ' AND ') : "1");
    #         return (int)$this->query($sQuery) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updatePhoto

  ## Parametros
    - aSet,aWhere

  ## Retorno
    - any
  """
  def updatePhoto(%{}) do
    # TODO: Implementacao futura
        # public function updatePhoto($aSet, $aWhere)
    #     {
    #     	return $this->_updateAttachment($this->_oConfig->CNF['TABLE_PHOTOS2ENTRIES'], $aSet, $aWhere);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateFile

  ## Parametros
    - aSet,aWhere

  ## Retorno
    - any
  """
  def updateFile(%{}) do
    # TODO: Implementacao futura
        # public function updateFile($aSet, $aWhere)
    #     {
    #     	return $this->_updateAttachment($this->_oConfig->CNF['TABLE_FILES2ENTRIES'], $aSet, $aWhere);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP associatePhotoWithContent

  ## Parametros
    - iContentId,iFileId,sTitle

  ## Retorno
    - any
  """
  def associatePhotoWithContent(%{}) do
    # TODO: Implementacao futura
        # public function associatePhotoWithContent($iContentId, $iFileId, $sTitle)
    #     {
    #         $sQuery = $this->prepare ("SELECT MAX(`order`) FROM `" . $this->_oConfig->CNF['TABLE_PHOTOS2ENTRIES'] . "` WHERE `content_id` = ?", $iContentId);
    #         $iOrder = 1 + (int)$this->getOne($sQuery);
    # 
    #         $sQuery = $this->prepare ("INSERT INTO `" . $this->_oConfig->CNF['TABLE_PHOTOS2ENTRIES'] . "` SET `content_id` = ?, `file_id` = ?, `title` = ?, `order` = ? ON DUPLICATE KEY UPDATE `title` = ?", $iContentId, $iFileId, $sTitle, $iOrder, $sTitle);
    #         return $this->res($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deassociatePhotoWithContent

  ## Parametros
    - iContentId,iFileId

  ## Retorno
    - any
  """
  def deassociatePhotoWithContent(%{}) do
    # TODO: Implementacao futura
        # public function deassociatePhotoWithContent($iContentId, $iFileId)
    #     {
    #     	return $this->_deassociateAttachmentWithContent($this->_oConfig->CNF['TABLE_PHOTOS2ENTRIES'], $iContentId, $iFileId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP associateFileWithContent

  ## Parametros
    - iContentId,iFileId,aParams

  ## Retorno
    - any
  """
  def associateFileWithContent(%{}) do
    # TODO: Implementacao futura
        # public function associateFileWithContent($iContentId, $iFileId, $aParams)
    #     {
    #         $sQuery = $this->prepare ("SELECT MAX(`order`) FROM `" . $this->_oConfig->CNF['TABLE_FILES2ENTRIES'] . "` WHERE `content_id` = ?", $iContentId);
    #         $iOrder = 1 + (int)$this->getOne($sQuery);
    # 
    #         $aBindings = array_merge(array(
    #         	'content_id' => $iContentId,
    #         	'file_id' => $iFileId,
    #         	'order' => $iOrder,
    #         ), $aParams);
    # 
    #         $sDiv = ", ";
    #         $sParams = "";
    #         foreach($aParams as $sKey => $mixedValue)
    #             $sParams .= "`" . $sKey . "` = :" . $sKey . $sDiv;
    # 		$sParams = trim($sParams, $sDiv);
    # 
    #         $sQuery = $this->prepare("INSERT INTO `" . $this->_oConfig->CNF['TABLE_FILES2ENTRIES'] . "` SET `content_id` = :content_id, `file_id` = :file_id, " . $sParams . ", `order` = :order ON DUPLICATE KEY UPDATE " . $sParams);
    #         return $this->res($sQuery, $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deassociateFileWithContent

  ## Parametros
    - iContentId,iFileId

  ## Retorno
    - any
  """
  def deassociateFileWithContent(%{}) do
    # TODO: Implementacao futura
        # public function deassociateFileWithContent($iContentId, $iFileId)
    #     {
    #     	return $this->_deassociateAttachmentWithContent($this->_oConfig->CNF['TABLE_FILES2ENTRIES'], $iContentId, $iFileId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertDownload

  ## Parametros
    - iFileId,iProfileId,iProfileNip

  ## Retorno
    - any
  """
  def insertDownload(%{}) do
    # TODO: Implementacao futura
        # public function insertDownload($iFileId, $iProfileId, $iProfileNip)
    #     {
    #     	$sQuery = $this->prepare("INSERT IGNORE INTO `" . $this->_oConfig->CNF['TABLE_DOWNLOADS'] . "` SET `file_id` = ?, `profile_id` = ?, `profile_nip` = ?, `date` = UNIX_TIMESTAMP()", $iFileId, $iProfileId, $iProfileNip);
    # 		return (int)$this->query($sQuery) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateLicense

  ## Parametros
    - aSet,aWhere

  ## Retorno
    - any
  """
  def updateLicense(%{}) do
    # TODO: Implementacao futura
        # public function updateLicense($aSet, $aWhere)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         return $this->query("UPDATE `" . $CNF['TABLE_LICENSES'] . "` SET " . $this->arrayToSQL($aSet) . " WHERE " . (!empty($aWhere) ? $this->arrayToSQL($aWhere, ' AND ') : "1"));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteLicense

  ## Parametros
    - aWhere

  ## Retorno
    - any
  """
  def deleteLicense(%{}) do
    # TODO: Implementacao futura
        # public function deleteLicense($aWhere)
    #     {
    #     	if(empty($aWhere))
    #             return false;
    # 
    #         $sQuery = "DELETE FROM `" . $this->_oConfig->CNF['TABLE_LICENSES'] . "` WHERE " . $this->arrayToSQL($aWhere, ' AND ');
    #         return (int)$this->query($sQuery) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP hasLicense

  ## Parametros
    - iProfileId,iProductId,sDomain=''

  ## Retorno
    - any
  """
  def hasLicense(%{}) do
    # TODO: Implementacao futura
        # public function hasLicense ($iProfileId, $iProductId, $sDomain = '')
    #     {
    #         $aParams = array(
    #     		'type' => 'has_by', 
    #     		'profile_id' => $iProfileId, 
    #     		'product_id' => $iProductId, 
    #     		'domain' => !empty($sDomain) ? $sDomain : ''
    #     	);
    #  
    #         $iLicenseId = (int)$this->getLicense($aParams);
    #     	if($iLicenseId > 0)
    #     	    return true;
    # 
    #         $aParams['package'] = 1;
    #         $iLicenseId = (int)$this->getLicense($aParams);
    #     	if($iLicenseId > 0)
    #     	    return true;
    # 
    #     	return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP hasLicenseByOrder

  ## Parametros
    - iProfileId,iProductId,sOrder=''

  ## Retorno
    - any
  """
  def hasLicenseByOrder(%{}) do
    # TODO: Implementacao futura
        # public function hasLicenseByOrder ($iProfileId, $iProductId, $sOrder = '')
    #     {
    #         $aParams = array(
    #     		'type' => 'has_by', 
    #     		'profile_id' => $iProfileId, 
    #     		'product_id' => $iProductId, 
    #     		'order' => !empty($sOrder) ? $sOrder : ''
    #     	);
    # 
    #         $iLicenseId = (int)$this->getLicense($aParams);
    #         if($iLicenseId > 0)
    #     	    return true;
    # 
    #         $aParams['package'] = 1;
    #         $iLicenseId = (int)$this->getLicense($aParams);
    #     	if($iLicenseId > 0)
    #     	    return true;
    # 
    #     	return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP registerLicense

  ## Parametros
    - iProfileId,iProductId,iCount,sOrder,sLicense,sType,sDuration='',iTrial=0

  ## Retorno
    - any
  """
  def registerLicense(%{}) do
    # TODO: Implementacao futura
        # public function registerLicense($iProfileId, $iProductId, $iCount, $sOrder, $sLicense, $sType, $sDuration = '', $iTrial = 0)
    #     {
    #     	$CNF = &$this->_oConfig->CNF;
    # 
    #         $oPayments = BxDolPayments::getInstance();
    # 
    #         $iProcessed = 0;
    #         for($i = 0; $i < $iCount; $i++) {
    #             $aQueryParams = array(
    #                 'profile_id' => $iProfileId,
    #                 'product_id' => $iProductId,
    #                 'count' => 1,
    #                 'order' => $sOrder,
    #                 'license' => $sLicense,
    #                 'type' => $sType
    #             );
    # 
    #             $sExpireParam = '';
    #             if(!empty($iTrial))
    #                 $sExpireParam = ', `expired`=UNIX_TIMESTAMP(DATE_ADD(DATE_ADD(NOW(), INTERVAL ' . (int)$iTrial . ' DAY), INTERVAL ' . (int)$this->getParam($CNF['OPTION_RECURRING_RESERVE']) . ' DAY))';
    #             else if(!empty($sDuration) && isset($this->_aRecurringDurations[$sDuration]))
    #                 $sExpireParam = ', `expired`=UNIX_TIMESTAMP(DATE_ADD(DATE_ADD(NOW(), ' . $this->_aRecurringDurations[$sDuration] . '), INTERVAL ' . (int)$this->getParam($CNF['OPTION_RECURRING_RESERVE']) . ' DAY))';
    # 
    #             if((int)$this->query("INSERT INTO `" . $CNF['TABLE_LICENSES'] . "` SET " . $this->arrayToSQL($aQueryParams) . ", `added`=UNIX_TIMESTAMP()" . $sExpireParam) == 0)
    #                 continue;
    # 
    #             $sLicense = $oPayments->generateLicense();
    #             $iProcessed += 1;
    #         }
    # 
    #         return $iCount == $iProcessed;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP prolongLicense

  ## Parametros
    - iProfileId,iProductId,iCount,sOrder,sLicense,sType,sDuration='',iTrial=0

  ## Retorno
    - any
  """
  def prolongLicense(%{}) do
    # TODO: Implementacao futura
        # public function prolongLicense($iProfileId, $iProductId, $iCount, $sOrder, $sLicense, $sType, $sDuration = '', $iTrial = 0)
    #     {
    #     	$CNF = &$this->_oConfig->CNF;
    # 
    #     	if($sType == BX_MARKET_LICENSE_TYPE_SINGLE)
    #     		return true;
    # 
    #     	if(empty($sDuration) || empty($this->_aRecurringDurations[$sDuration]))
    #     		return false;
    # 
    #     	$sQuery = $this->prepare("UPDATE 
    #     			`" . $CNF['TABLE_LICENSES'] . "` 
    #     		SET 
    #     			`expired`=UNIX_TIMESTAMP(DATE_ADD(FROM_UNIXTIME(`expired`), " . $this->_aRecurringDurations[$sDuration] . ")) 
    #     		WHERE 
    #     			`profile_id` = ? AND 
    #     			`product_id` = ? AND 
    #     			`order` = ? 
    #     		LIMIT ?", $iProfileId, $iProductId, $sOrder, (int)$iCount);
    # 
    #         return (int)$this->query($sQuery) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP unregisterLicense

  ## Parametros
    - iProfileId,iProductId,sOrder,sLicense,sType

  ## Retorno
    - any
  """
  def unregisterLicense(%{}) do
    # TODO: Implementacao futura
        # public function unregisterLicense($iProfileId, $iProductId, $sOrder, $sLicense, $sType)
    #     {
    #     	$sWhereClause = "`profile_id` = :profile_id AND `product_id` = :product_id AND `order` = :order AND `license` = :license";
    #     	$aWhereBindings = array(
    #     		'profile_id' => $iProfileId,
    #     		'product_id' => $iProductId,
    #     		'order' => $sOrder,
    #     		'license' => $sLicense
    #     	);
    #     	
    # 		//--- Move to deleted licenses table with 'refund' as reason.   
    #     	$sQuery = "INSERT IGNORE INTO `" . $this->_oConfig->CNF['TABLE_LICENSES_DELETED'] . "` SELECT *, 'refund' AS `reason`, UNIX_TIMESTAMP() AS `deleted` FROM `" . $this->_oConfig->CNF['TABLE_LICENSES'] . "` WHERE " . $sWhereClause;
    # 		$this->query($sQuery, $aWhereBindings);
    # 
    #     	$sQuery = "DELETE FROM `" . $this->_oConfig->CNF['TABLE_LICENSES'] . "` WHERE " . $sWhereClause;
    #         return $this->query($sQuery, $aWhereBindings) !== false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP unregisterLicenseById

  ## Parametros
    - iId,sReason='refund'

  ## Retorno
    - any
  """
  def unregisterLicenseById(%{}) do
    # TODO: Implementacao futura
        # public function unregisterLicenseById($iId, $sReason = 'refund')
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         //--- Move to deleted licenses table with provided reason.
    #         $this->query("INSERT IGNORE INTO `" . $CNF['TABLE_LICENSES_DELETED'] . "` SELECT *, :reason AS `reason`, UNIX_TIMESTAMP() AS `deleted` FROM `" . $CNF['TABLE_LICENSES'] . "` WHERE `id` = :id", [
    #             'id' => $iId,
    #             'reason' => $sReason
    #         ]);
    # 
    #         return $this->query("DELETE FROM `" . $CNF['TABLE_LICENSES'] . "` WHERE `id` = :id", [
    #             'id' => $iId,
    #     	]) !== false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP processExpiredLicense

  ## Parametros
    - aLicense

  ## Retorno
    - any
  """
  def processExpiredLicense(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function processExpiredLicense($aLicense)
    #     {
    #         //--- Move to deleted licenses table with 'expire' as reason.  
    #         $this->query("INSERT IGNORE INTO `" . $this->_oConfig->CNF['TABLE_LICENSES_DELETED'] . "` SET " . $this->arrayToSQL($aLicense));
    # 
    #         return $this->query("DELETE FROM `" . $this->_oConfig->CNF['TABLE_LICENSES'] . "` WHERE `id`=:id LIMIT 1", array('id' => $aLicense['id'])) !== false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP processExpiredLicenses

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def processExpiredLicenses(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function processExpiredLicenses()
    #     {
    #         $sWhereClause = "`type` = :type AND `added` < UNIX_TIMESTAMP() AND `expired` <> 0 AND `expired` < UNIX_TIMESTAMP()";
    #         $aWhereBindings = array(
    #             'type' => BX_MARKET_LICENSE_TYPE_RECURRING
    #         );
    # 
    #         //--- Move to deleted licenses table with 'expire' as reason.  
    #         $sQuery = "INSERT IGNORE INTO `" . $this->_oConfig->CNF['TABLE_LICENSES_DELETED'] . "` SELECT *, 'expire' AS `reason`, UNIX_TIMESTAMP() AS `deleted` FROM `" . $this->_oConfig->CNF['TABLE_LICENSES'] . "` WHERE " . $sWhereClause;
    #         $this->query($sQuery, $aWhereBindings);
    # 
    #         $sQuery = "DELETE FROM `" . $this->_oConfig->CNF['TABLE_LICENSES'] . "` WHERE " . $sWhereClause;
    #         return $this->query($sQuery, $aWhereBindings) !== false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _deassociateAttachmentWithContent

  ## Parametros
    - sTable,iContentId,iFileId

  ## Retorno
    - any
  """
  def _deassociateAttachmentWithContent(%{}) do
    # TODO: Implementacao futura
        # protected function _deassociateAttachmentWithContent($sTable, $iContentId, $iFileId)
    #     {
    #         $sWhere = '';
    #         $aBindings = array();
    #         if ($iContentId) {
    #             $sWhere .= " AND `content_id` = :content_id ";
    #             $aBindings['content_id'] = $iContentId;
    #         }
    # 
    #         if ($iFileId) {
    #             $sWhere .= " AND `file_id` = :file_id ";
    #             $aBindings['file_id'] = $iFileId;
    #         }
    # 
    #         $sQuery = "DELETE FROM `" . $sTable . "` WHERE 1 " . $sWhere;
    #         return $this->query($sQuery, $aBindings) !== false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _updateAttachment

  ## Parametros
    - sTable,aSet,aWhere

  ## Retorno
    - any
  """
  def _updateAttachment(%{}) do
    # TODO: Implementacao futura
        # protected function _updateAttachment($sTable, $aSet, $aWhere)
    #     {
    #         $sQuery = "UPDATE `" . $sTable . "` SET " . $this->arrayToSQL($aSet) . " WHERE " . (!empty($aWhere) ? $this->arrayToSQL($aWhere, ' AND ') : "1");
    #         return (int)$this->query($sQuery) > 0;
    #     }
    :ok
  end

end
