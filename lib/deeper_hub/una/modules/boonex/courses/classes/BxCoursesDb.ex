
defmodule DeeperHub.Inc.Classes.BxCoursesDb do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/courses/classes/BxCoursesDb.php
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
  Funcao correspondente ao metodo PHP getContentNodes

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getContentNodes(%{}) do
    # TODO: Implementacao futura
        # public function getContentNodes($aParams)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    # 
    #         $sSelectClause = "`tcn`.*";
    #         $sJoinClause = $sWhereClause = $sOrderClause = $sLimitClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause = "AND `tcn`.`id`=:id";
    #                 break;
    # 
    #             case 'id_full':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sSelectClause .= ", `tcs`.`parent_id`, `tcs`.`level`, `tcs`.`order`, `tcs`.`cn_l2`, `tcs`.`cn_l3`";
    #                 $sJoinClause = "LEFT JOIN `" . $CNF['TABLE_CNT_STRUCTURE'] . "` AS `tcs` ON `tcn`.`id`=`tcs`.`node_id`";
    #                 $sWhereClause = "AND `tcn`.`id`=:id";
    #                 break;
    #         }
    # 
    #         if(!empty($sOrderClause))
    #             $sOrderClause = "ORDER BY " . $sOrderClause;
    #         
    #         if(!empty($sLimitClause))
    #             $sLimitClause = "LIMIT " . $sLimitClause;
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . " FROM `" . $CNF['TABLE_CNT_NODES'] . "` AS `tcn` " . $sJoinClause . " WHERE 1 " . $sWhereClause . " " . $sOrderClause . " " . $sLimitClause;
    #         return call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateContentNodes

  ## Parametros
    - aParamsSet,aParamsWhere

  ## Retorno
    - any
  """
  def updateContentNodes(%{}) do
    # TODO: Implementacao futura
        # public function updateContentNodes($aParamsSet, $aParamsWhere)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsSet) || empty($aParamsWhere))
    #             return false;
    # 
    #         return $this->query("UPDATE `" . $CNF['TABLE_CNT_NODES'] . "` SET " . $this->arrayToSQL($aParamsSet) . " WHERE " . $this->arrayToSQL($aParamsWhere, " AND "));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteContentNodes

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteContentNodes(%{}) do
    # TODO: Implementacao futura
        # public function deleteContentNodes($aParamsWhere)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return $this->query("DELETE FROM `" . $CNF['TABLE_CNT_NODES'] . "` WHERE " . $this->arrayToSQL($aParamsWhere, " AND "));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteContentNodesWithTracks

  ## Parametros
    - iEntryId

  ## Retorno
    - any
  """
  def deleteContentNodesWithTracks(%{}) do
    # TODO: Implementacao futura
        # public function deleteContentNodesWithTracks($iEntryId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         return $this->query("DELETE FROM `tcn`, `tcnu` USING `" . $CNF['TABLE_CNT_NODES'] . "` AS `tcn` LEFT JOIN `" . $CNF['TABLE_CNT_NODES2USERS'] . "` AS `tcnu` ON `tcn`.`id`=`tcnu`.`node_id` WHERE `tcn`.`entry_id`=:entry_id", [
    #             'entry_id' => $iEntryId
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertContentNodes2Users

  ## Parametros
    - aParamsSet

  ## Retorno
    - any
  """
  def insertContentNodes2Users(%{}) do
    # TODO: Implementacao futura
        # public function insertContentNodes2Users($aParamsSet)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsSet))
    #             return false;
    # 
    #         return (int)$this->query("INSERT INTO `" . $CNF['TABLE_CNT_NODES2USERS'] . "` SET " . $this->arrayToSQL($aParamsSet) . " ON DUPLICATE KEY UPDATE `date`=UNIX_TIMESTAMP()") > 0 ? (int)$this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteContentNodes2Users

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteContentNodes2Users(%{}) do
    # TODO: Implementacao futura
        # public function deleteContentNodes2Users($aParamsWhere)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return $this->query("DELETE FROM `" . $CNF['TABLE_CNT_NODES2USERS'] . "` WHERE " . $this->arrayToSQL($aParamsWhere, " AND "));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getContentStructure

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getContentStructure(%{}) do
    # TODO: Implementacao futura
        # public function getContentStructure($aParams)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    # 
    #         $sSelectClause = "`tcs`.*";
    #         $sJoinClause = $sWhereClause = $sGroupClause = $sOrderClause = $sLimitClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause = "AND `tcs`.`id`=:id";
    #                 break;
    # 
    #             case 'node_id':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = [
    #                     'node_id' => $aParams['node_id']
    #                 ];
    # 
    #                 $sWhereClause = "AND `tcs`.`node_id`=:node_id";
    #                 break;
    #             
    #             case 'entry_id':
    #                 $aMethod['params'][1] = [
    #                     'entry_id' => $aParams['entry_id']
    #                 ];
    # 
    #                 $sWhereClause = "AND `tcs`.`entry_id`=:entry_id";
    # 
    #                 if(isset($aParams['level'])) {
    #                     $aMethod['params'][1]['level'] = $aParams['level'];
    #                         
    #                     $sWhereClause .= " AND `tcs`.`level`=:level";
    #                 }
    #                 break;
    # 
    #             case 'entry_id_full':
    #                 $aMethod['params'][1] = [
    #                     'entry_id' => $aParams['entry_id']
    #                 ];
    # 
    #                 $sSelectClause .= ", `tcn`.`title`, `tcn`.`counters`";
    #                 $sJoinClause = "LEFT JOIN `" . $CNF['TABLE_CNT_NODES'] . "` AS `tcn` ON `tcs`.`node_id`=`tcn`.`id`";
    #                 $sWhereClause = "AND `tcs`.`entry_id`=:entry_id";
    # 
    #                 if(isset($aParams['parent_id'])) {
    #                     $aMethod['params'][1]['parent_id'] = $aParams['parent_id'];
    #                         
    #                     $sWhereClause .= " AND `tcs`.`parent_id`=:parent_id";
    #                 }
    # 
    #                 if(isset($aParams['level'])) {
    #                     $aMethod['params'][1]['level'] = $aParams['level'];
    #                         
    #                     $sWhereClause .= " AND `tcs`.`level`=:level";
    #                 }
    # 
    #                 if(isset($aParams['status'])) {
    #                     $aMethod['params'][1]['status'] = $aParams['status'];
    #                         
    #                     $sWhereClause .= " AND `tcn`.`status`=:status";
    #                 }
    # 
    #                 if(isset($aParams['start'], $aParams['per_page']) && (int)$aParams['per_page'] != 0)
    #                     $sLimitClause = $aParams['start'] . ', ' . $aParams['per_page'];
    #                 
    #                 $sOrderClause = "`tcs`.`order` ASC";
    #                 break;
    #                 
    #             case 'entry_id_counters':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = [
    #                     'entry_id' => $aParams['entry_id']
    #                 ];
    # 
    #                 $sSelectClause = "COUNT(`tcs`.`id`) AS `cn_l1`, SUM(`tcs`.`cn_l2`) AS `cn_l2`, SUM(`tcs`.`cn_l3`) AS `cn_l3`";
    #                 $sWhereClause = "AND `tcs`.`entry_id`=:entry_id AND `tcs`.`level`='1'";
    #                 $sGroupClause = "`tcs`.`entry_id`";
    #                 break;
    #                 
    #             case 'parent_id':
    #                 $aMethod['params'][1] = [
    #                     'parent_id' => $aParams['parent_id']
    #                 ];
    # 
    #                 $sWhereClause = "AND `tcs`.`parent_id`=:parent_id";
    #                 break;
    # 
    #             case 'user_passed':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = [
    #                     'profile_id' => $aParams['profile_id'],
    #                     'node_id' => $aParams['node_id']
    #                 ];
    # 
    #                 $sSelectClause = "`tcnu`.*";
    #                 $sJoinClause = "INNER JOIN `" . $CNF['TABLE_CNT_NODES2USERS'] . "` AS `tcnu` ON `tcs`.`node_id`=`tcnu`.`node_id` AND `tcnu`.`node_id`=:node_id AND `tcnu`.`profile_id`=:profile_id";
    #                 break;
    # 
    #             case 'user_track':
    #                 $aMethod['params'][1] = [
    #                     'profile_id' => $aParams['profile_id'],
    #                     'entry_id' => $aParams['entry_id'],
    #                     'node_id' => $aParams['node_id']
    #                 ];
    # 
    #                 $sJoinClause = "INNER JOIN `" . $CNF['TABLE_CNT_NODES2USERS'] . "` AS `tcnu` ON `tcs`.`node_id`=`tcnu`.`node_id` AND `tcnu`.`profile_id`=:profile_id";
    #                 $sWhereClause = "AND `tcs`.`entry_id`=:entry_id AND `tcs`.`parent_id`=:node_id";
    #                 break;
    #         }
    # 
    #         if(!empty($sGroupClause))
    #             $sGroupClause = "GROUP BY " . $sGroupClause;
    # 
    #         if(!empty($sOrderClause))
    #             $sOrderClause = "ORDER BY " . $sOrderClause;
    #         
    #         if(!empty($sLimitClause))
    #             $sLimitClause = "LIMIT " . $sLimitClause;
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . " FROM `" . $CNF['TABLE_CNT_STRUCTURE'] . "` AS `tcs` " . $sJoinClause . " WHERE 1 " . $sWhereClause . " " . $sGroupClause . " " . $sOrderClause . " " . $sLimitClause;
    #         return call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getContentStructureOrderMax

  ## Parametros
    - iEntryId,iParentId

  ## Retorno
    - any
  """
  def getContentStructureOrderMax(%{}) do
    # TODO: Implementacao futura
        # public function getContentStructureOrderMax($iEntryId, $iParentId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         return (int)$this->getOne("SELECT IFNULL(MAX(`order`), 0) FROM `" . $CNF['TABLE_CNT_STRUCTURE'] . "` WHERE `entry_id`=:entry_id AND `parent_id`=:parent_id", [
    #             'entry_id' => $iEntryId,
    #             'parent_id' => $iParentId
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertContentStructureNode

  ## Parametros
    - aParamsSet

  ## Retorno
    - any
  """
  def insertContentStructureNode(%{}) do
    # TODO: Implementacao futura
        # public function insertContentStructureNode($aParamsSet)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsSet))
    #             return false;
    # 
    #         return (int)$this->query("INSERT INTO `" . $CNF['TABLE_CNT_STRUCTURE'] . "` SET " . $this->arrayToSQL($aParamsSet)) > 0 ? (int)$this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateContentStructureNode

  ## Parametros
    - aParamsSet,aParamsWhere

  ## Retorno
    - any
  """
  def updateContentStructureNode(%{}) do
    # TODO: Implementacao futura
        # public function updateContentStructureNode($aParamsSet, $aParamsWhere)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsSet) || empty($aParamsWhere))
    #             return false;
    # 
    #         return $this->query("UPDATE `" . $CNF['TABLE_CNT_STRUCTURE'] . "` SET " . $this->arrayToSQL($aParamsSet) . " WHERE " . $this->arrayToSQL($aParamsWhere, " AND "));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateContentStructureCounters

  ## Parametros
    - iParentId,iLevel,iAdd

  ## Retorno
    - any
  """
  def updateContentStructureCounters(%{}) do
    # TODO: Implementacao futura
        # public function updateContentStructureCounters($iParentId, $iLevel, $iAdd)
    #     {
    #         $aParent = $this->getContentStructure(['sample' => 'node_id', 'node_id' => $iParentId]);
    #         if(empty($aParent) || !is_array($aParent))
    #             return;
    # 
    #         $sKeyLevel = 'cn_l' . $iLevel;
    #         $this->updateContentStructureNode([$sKeyLevel => $aParent[$sKeyLevel] + $iAdd], ['id' => $aParent['id']]);
    #         
    #         if(!empty($aParent['parent_id']))
    #             $this->updateContentStructureCounters($aParent['parent_id'], $iLevel, $iAdd);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteContentStructureNode

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteContentStructureNode(%{}) do
    # TODO: Implementacao futura
        # public function deleteContentStructureNode($aParamsWhere)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return $this->query("DELETE FROM `" . $CNF['TABLE_CNT_STRUCTURE'] . "` WHERE " . $this->arrayToSQL($aParamsWhere, " AND "));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getContentData

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getContentData(%{}) do
    # TODO: Implementacao futura
        # public function getContentData($aParams)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    # 
    #         $sSelectClause = "`tcd`.*";
    #         $sJoinClause = $sWhereClause = $sOrderClause = $sLimitClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause = "AND `tcd`.`id`=:id";
    #                 break;
    #             
    #             case 'content':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = [
    #                     'content_type' => $aParams['content_type'],
    #                     'content_id' => $aParams['content_id']
    #                 ];
    # 
    #                 $sWhereClause = "AND `tcd`.`content_type`=:content_type AND `tcd`.`content_id`=:content_id";
    #                 break;
    # 
    #             case 'entry_id':
    #                 $aMethod['params'][1] = [
    #                     'entry_id' => $aParams['entry_id']
    #                 ];
    # 
    #                 $sWhereClause = "AND `tcd`.`entry_id`=:entry_id";
    #                 break;
    # 
    #             case 'node_id':
    #                 $aMethod['params'][1] = [
    #                     'node_id' => $aParams['node_id']
    #                 ];
    # 
    #                 $sWhereClause = "AND `tcd`.`node_id`=:node_id";
    #                 $sOrderClause = "`tcd`.`order` ASC";
    #                 break;
    # 
    #             case 'entry_node_ids':
    #                 $aMethod['params'][1] = [
    #                     'entry_id' => $aParams['entry_id'],
    #                     'node_id' => $aParams['node_id']
    #                 ];
    # 
    #                 $sWhereClause = "AND `tcd`.`entry_id`=:entry_id AND `tcd`.`node_id`=:node_id";
    # 
    #                 if(isset($aParams['usage'])) {
    #                     $aMethod['params'][1]['usage'] = $aParams['usage'];
    # 
    #                     $sWhereClause .= " AND `tcd`.`usage`=:usage";
    #                 }
    # 
    #                 $sOrderClause = "`tcd`.`order` ASC";
    #                 break;
    #                 
    #             case 'siblings':
    #                 $aMethod['name'] = 'getAllWithKey';
    #                 $aMethod['params'][1] = 'order';
    #                 $aMethod['params'][2] = [
    #                     'entry_id' => $aParams['entry_id'],
    #                     'node_id' => $aParams['node_id'],
    #                     'usage' => $aParams['usage'],
    #                     'order' => $aParams['order']
    #                 ];
    #                 $sWhereClause = "AND `tcd`.`entry_id`=:entry_id AND `tcd`.`node_id`=:node_id AND `tcd`.`usage`=:usage AND (`tcd`.`order`=(:order - 1) OR `tcd`.`order`=(:order + 1))";
    #                 $sOrderClause = "`tcd`.`order` ASC";
    #                 break;
    # 
    #             case 'user_passed':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = [
    #                     'profile_id' => $aParams['profile_id'],
    #                     'data_id' => $aParams['data_id']
    #                 ];
    # 
    #                 $sSelectClause = "`tcdu`.*";
    #                 $sJoinClause = "INNER JOIN `" . $CNF['TABLE_CNT_DATA2USERS'] . "` AS `tcdu` ON `tcd`.`id`=`tcdu`.`data_id` AND `tcdu`.`data_id`=:data_id AND `tcdu`.`profile_id`=:profile_id";
    #                 break;
    # 
    #             case 'user_track':
    #                 $aMethod['params'][1] = [
    #                     'profile_id' => $aParams['profile_id'],
    #                     'entry_id' => $aParams['entry_id'],
    #                     'node_id' => $aParams['node_id']
    #                 ];
    # 
    #                 $sJoinClause = "INNER JOIN `" . $CNF['TABLE_CNT_DATA2USERS'] . "` AS `tcdu` ON `tcd`.`id`=`tcdu`.`data_id` AND `tcdu`.`profile_id`=:profile_id";
    #                 $sWhereClause = "AND `tcd`.`entry_id`=:entry_id AND `tcd`.`node_id`=:node_id AND `tcd`.`usage`='" . BX_COURSES_CND_USAGE_ST . "'";
    #                 break;
    #         }
    # 
    #         if(!empty($sOrderClause))
    #             $sOrderClause = "ORDER BY " . $sOrderClause;
    #         
    #         if(!empty($sLimitClause))
    #             $sLimitClause = "LIMIT " . $sLimitClause;
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . " FROM `" . $CNF['TABLE_CNT_DATA'] . "` AS `tcd` " . $sJoinClause . " WHERE 1 " . $sWhereClause . " " . $sOrderClause . " " . $sLimitClause;
    #         return call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getContentDataOrderMax

  ## Parametros
    - iEntryId,iNodeId

  ## Retorno
    - any
  """
  def getContentDataOrderMax(%{}) do
    # TODO: Implementacao futura
        # public function getContentDataOrderMax($iEntryId, $iNodeId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         return (int)$this->getOne("SELECT IFNULL(MAX(`order`), 0) FROM `" . $CNF['TABLE_CNT_DATA'] . "` WHERE `entry_id`=:entry_id AND `node_id`=:node_id", [
    #             'entry_id' => $iEntryId,
    #             'node_id' => $iNodeId
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertContentData

  ## Parametros
    - aParamsSet

  ## Retorno
    - any
  """
  def insertContentData(%{}) do
    # TODO: Implementacao futura
        # public function insertContentData($aParamsSet)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsSet))
    #             return false;
    # 
    #         return (int)$this->query("INSERT INTO `" . $CNF['TABLE_CNT_DATA'] . "` SET " . $this->arrayToSQL($aParamsSet)) > 0 ? (int)$this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteContentData

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteContentData(%{}) do
    # TODO: Implementacao futura
        # public function deleteContentData($aParamsWhere)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return $this->query("DELETE FROM `" . $CNF['TABLE_CNT_DATA'] . "` WHERE " . $this->arrayToSQL($aParamsWhere, " AND "));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteContentDataWithTracks

  ## Parametros
    - iEntryId

  ## Retorno
    - any
  """
  def deleteContentDataWithTracks(%{}) do
    # TODO: Implementacao futura
        # public function deleteContentDataWithTracks($iEntryId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         return $this->query("DELETE FROM `tcd`, `tcdu` USING `" . $CNF['TABLE_CNT_DATA'] . "` AS `tcd` LEFT JOIN `" . $CNF['TABLE_CNT_DATA2USERS'] . "` AS `tcdu` ON `tcd`.`id`=`tcdu`.`data_id` WHERE `tcd`.`entry_id`=:entry_id", [
    #             'entry_id' => $iEntryId
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertContentData2Users

  ## Parametros
    - aParamsSet

  ## Retorno
    - any
  """
  def insertContentData2Users(%{}) do
    # TODO: Implementacao futura
        # public function insertContentData2Users($aParamsSet)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsSet))
    #             return false;
    # 
    #         return (int)$this->query("INSERT INTO `" . $CNF['TABLE_CNT_DATA2USERS'] . "` SET " . $this->arrayToSQL($aParamsSet) . " ON DUPLICATE KEY UPDATE `date`=UNIX_TIMESTAMP()") > 0 ? (int)$this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteContentData2Users

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteContentData2Users(%{}) do
    # TODO: Implementacao futura
        # public function deleteContentData2Users($aParamsWhere)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return $this->query("DELETE FROM `" . $CNF['TABLE_CNT_DATA2USERS'] . "` WHERE " . $this->arrayToSQL($aParamsWhere, " AND "));
    #     }
    :ok
  end

end
