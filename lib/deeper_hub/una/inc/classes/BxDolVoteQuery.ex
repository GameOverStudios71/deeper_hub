
defmodule DeeperHub.Inc.Classes.BxDolVoteQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolVoteQuery.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - &oModule

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct(&$oModule)
    #     {
    #         parent::__construct($oModule);
    # 
    #         $aSystem = $this->_oModule->getSystemInfo();
    #         $this->_sTriggerFieldRate = $aSystem['trigger_field_rate'];
    # 
    #         $this->_iPostTimeout = (int)$aSystem['post_timeout'];
    # 
    #         $this->_sMethodGetEntry = 'getVote';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isPostTimeoutEnded

  ## Parametros
    - iObjectId,iAuthorId,sAuthorIp

  ## Retorno
    - any
  """
  def isPostTimeoutEnded(%{}) do
    # TODO: Implementacao futura
        # public function isPostTimeoutEnded($iObjectId, $iAuthorId, $sAuthorIp)
    #     {
    #         if($this->_iPostTimeout == 0)
    #             return true;
    # 
    #         $aBindings = array(
    #             'object_id' => $iObjectId,
    #             'date' => time() - $this->_iPostTimeout
    #         );
    #         $sWhereClause = " AND `object_id` = :object_id AND `date` > :date";
    # 
    #         if(!empty($iAuthorId)) {
    #             $aBindings['author_id'] = $iAuthorId;
    # 
    #             $sWhereClause .= " AND `author_id` = :author_id";
    #         }
    #         else {
    #             $aBindings['author_nip'] = bx_get_ip_hash($sAuthorIp);
    # 
    #             $sWhereClause .= " AND `author_nip` = :author_nip";
    #         }
    # 
    #         return (int)$this->getOne("SELECT `object_id` FROM `" . $this->_sTableTrack . "` WHERE 1" . $sWhereClause, $aBindings) == 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getVote

  ## Parametros
    - iObjectId

  ## Retorno
    - any
  """
  def getVote(%{}) do
    # TODO: Implementacao futura
        # public function getVote($iObjectId)
    #     {
    #         $sQuery = $this->prepare("SELECT `count` as `count`, `sum` as `sum`, ROUND(`sum` / `count`, 2) AS `rate` FROM {$this->_sTable} WHERE `object_id` = ? LIMIT 1", $iObjectId);
    # 
    #         $aResult = $this->getRow($sQuery);
    #         if(empty($aResult) || !is_array($aResult))
    #             $aResult = array('count' => 0, 'sum' => 0, 'rate' => 0);
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP putVote

  ## Parametros
    - iObjectId,iAuthorId,sAuthorIp,aData,bUndo=false

  ## Retorno
    - any
  """
  def putVote(%{}) do
    # TODO: Implementacao futura
        # public function putVote($iObjectId, $iAuthorId, $sAuthorIp, $aData, $bUndo = false)
    #     {
    #         $sQuery = $this->prepare("SELECT `object_id` FROM `{$this->_sTable}` WHERE `object_id` = ? LIMIT 1", $iObjectId);
    #         $bExists = (int)$this->getOne($sQuery) != 0;
    #         if(!$bExists && $bUndo)
    #             return false;
    # 
    #         $iValue = $aData['value'];
    # 
    #         if(!$bExists)
    #             $sQuery = $this->prepare("INSERT INTO {$this->_sTable} SET `object_id` = ?, `count` = '1', `sum` = ?", $iObjectId, $iValue);
    #         else
    #             $sQuery = $this->prepare("UPDATE `{$this->_sTable}` SET `count` = `count` " . ($bUndo ? "-" : "+") . " 1, `sum` = `sum` " . ($bUndo ? "-" : "+") . " ? WHERE `object_id` = ?", $iValue, $iObjectId);
    # 
    #         if((int)$this->query($sQuery) == 0)
    #             return false;
    # 
    #         if($bUndo)
    #             return $this->_deleteTrack($iObjectId, $iAuthorId);
    # 
    #         $iNow = time();
    #         $iAuthorNip = bx_get_ip_hash($sAuthorIp);
    #         $sQuery = $this->prepare("INSERT INTO `{$this->_sTableTrack}` SET `object_id` = ?, `author_id` = ?, `author_nip` = ?, `value` = ?, `date` = ?", $iObjectId, $iAuthorId, $iAuthorNip, $iValue, $iNow);
    #         if((int)$this->query($sQuery) > 0)
    #             return $this->lastId();
    # 
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLegend

  ## Parametros
    - iObjectId

  ## Retorno
    - any
  """
  def getLegend(%{}) do
    # TODO: Implementacao futura
        # public function getLegend($iObjectId)
    #     {
    #     	$sQuery = $this->prepare("SELECT `value` AS `value`, COUNT(`value`) AS `count` FROM `{$this->_sTableTrack}` WHERE `object_id` = ? GROUP BY `value`", $iObjectId);
    # 
    #     	return $this->getAllWithKey($sQuery, 'value');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSqlParts

  ## Parametros
    - sMainTable,sMainField

  ## Retorno
    - any
  """
  def getSqlParts(%{}) do
    # TODO: Implementacao futura
        # public function getSqlParts($sMainTable, $sMainField)
    #     {
    #     	$aResult = parent::getSqlParts($sMainTable, $sMainField);
    #         if(empty($aResult))
    #             return $aResult;
    # 
    #         $aResult['fields'] = ", `{$this->_sTable}`.`count` as `vote_count`, (`{$this->_sTable}`.`sum` / `{$this->_sTable}`.`count`) AS `vote_rate` ";
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateTriggerTableValue

  ## Parametros
    - iObjectId,iValue

  ## Retorno
    - any
  """
  def updateTriggerTableValue(%{}) do
    # TODO: Implementacao futura
        # public function updateTriggerTableValue($iObjectId, $iValue)
    #     {
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _deleteTrack

  ## Parametros
    - iObjectId,iAuthorId

  ## Retorno
    - any
  """
  def _deleteTrack(%{}) do
    # TODO: Implementacao futura
        # protected function _deleteTrack($iObjectId, $iAuthorId)
    #     {
    #         $sQuery = $this->prepare("SELECT `id` FROM `{$this->_sTableTrack}` WHERE `object_id` = ? AND `author_id` = ? LIMIT 1", $iObjectId, $iAuthorId);
    #         $iId = (int)$this->getOne($sQuery);
    # 
    #         $sQuery = $this->prepare("DELETE FROM `{$this->_sTableTrack}` WHERE `id` = ? LIMIT 1", $iId);
    #         if((int)$this->query($sQuery) > 0)
    #             return $iId;
    # 
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _updateTriggerTable

  ## Parametros
    - iObjectId,aEntry

  ## Retorno
    - any
  """
  def _updateTriggerTable(%{}) do
    # TODO: Implementacao futura
        # protected function _updateTriggerTable($iObjectId, $aEntry)
    #     {
    #     	$sQuery = $this->prepare("UPDATE `{$this->_sTriggerTable}` SET `{$this->_sTriggerFieldCount}` = ?, `{$this->_sTriggerFieldRate}` = ? WHERE `{$this->_sTriggerFieldId}` = ?", $aEntry['count'], $aEntry['rate'], $iObjectId);
    #         return (int)$this->query($sQuery) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _deleteAuthorEntriesTableMain

  ## Parametros
    - aTrack

  ## Retorno
    - any
  """
  def _deleteAuthorEntriesTableMain(%{}) do
    # TODO: Implementacao futura
        # protected function _deleteAuthorEntriesTableMain($aTrack)
    #     {
    #         return $this->query("UPDATE `{$this->_sTable}` SET `count`=`count`-1, `sum`=`sum`-:value WHERE `object_id`=:object_id", array(
    #             'object_id' => $aTrack['object_id'],
    #             'value' => $aTrack['value']
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _deleteAuthorEntriesTableTrigger

  ## Parametros
    - aTrack

  ## Retorno
    - any
  """
  def _deleteAuthorEntriesTableTrigger(%{}) do
    # TODO: Implementacao futura
        # protected function _deleteAuthorEntriesTableTrigger($aTrack)
    #     {
    #         $aVote = $this->getVote($aTrack['object_id']);
    # 
    #         return $this->_updateTriggerTable($aTrack['object_id'], $aVote);
    #     }
    :ok
  end

end
