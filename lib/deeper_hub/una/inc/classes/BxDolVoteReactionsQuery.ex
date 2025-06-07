
defmodule DeeperHub.Inc.Classes.BxDolVoteReactionsQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolVoteReactionsQuery.php
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
    #         $aReactions = $this->_oModule->getReactions();
    #         $aReactionsGot = $this->getAllWithKey('SELECT * FROM ' . $this->_sTable . ' WHERE `object_id` = :object_id', 'reaction', array('object_id' => $iObjectId));
    # 
    #         $aResult = array();
    #         foreach($aReactions as $sName) {
    #             $iCount = $iSum = 0;
    #             if(!empty($aReactionsGot[$sName])) {
    #                 $iCount = (int)$aReactionsGot[$sName]['count'];
    #                 $iSum = (int)$aReactionsGot[$sName]['sum'];
    #             }
    # 
    #             $aResult['count_' . $sName] = $iCount;
    #             $aResult['sum_' . $sName] = $iSum;
    #             $aResult['rate_' . $sName] = $iCount != 0 ? $iSum / $iCount : 0;
    #         }
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
    #         $sReaction = $aData['reaction'];
    #         $aReaction = $this->_oModule->getReaction($sReaction);
    #         if($aReaction === false)
    #             return false;
    # 
    #         $iValue = (int)$aData['value'];
    #         $fValueFinal = $iValue * (float)$aReaction['weight'];
    # 
    #         $sQuery = "SELECT `object_id` FROM `{$this->_sTable}` WHERE `object_id` = :object_id AND `reaction` = :reaction LIMIT 1";
    #         $bExists = (int)$this->getOne($sQuery, array('object_id' => $iObjectId, 'reaction' => $sReaction)) != 0;
    #         if(!$bExists && $bUndo)
    #             return false;      
    # 
    #         if(!$bExists)
    #             $sQuery = $this->prepare("INSERT INTO {$this->_sTable} SET `object_id` = ?, `reaction` = ?, `count` = '1', `sum` = ?", $iObjectId, $sReaction, $fValueFinal);
    #         else
    #             $sQuery = $this->prepare("UPDATE `{$this->_sTable}` SET `count` = `count` " . ($bUndo ? "-" : "+") . " 1, `sum` = `sum` " . ($bUndo ? "-" : "+") . " ? WHERE `object_id` = ? AND `reaction` = ?", $fValueFinal, $iObjectId, $sReaction);
    # 
    #         if((int)$this->query($sQuery) == 0)
    #             return false;
    # 
    #         if($bUndo)
    #             return $this->_deleteTrack($iObjectId, $iAuthorId);
    # 
    #         $iNow = time();
    #         $iAuthorNip = bx_get_ip_hash($sAuthorIp);
    #         $sQuery = $this->prepare("INSERT INTO `{$this->_sTableTrack}` SET `object_id` = ?, `author_id` = ?, `author_nip` = ?, `reaction` = ?, `value` = ?, `date` = ?", $iObjectId, $iAuthorId, $iAuthorNip, $sReaction, $iValue, $iNow);
    #         if((int)$this->query($sQuery) > 0)
    #             return $this->lastId();
    # 
    #         return false;
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
    #         if(empty($this->_sTable) || empty($sMainTable) || empty($sMainField))
    #             return array();
    # 
    #         $sFields = $sJoin = '';
    #         $aReactions = $this->_oModule->getReactions();
    #         foreach($aReactions as $iIndex => $sName) {
    #             $sFields .= ", `t{$iIndex}`.`count` as `vote_count_{$sName}`, (`t{$iIndex}`.`sum` / `t{$iIndex}`.`count`) AS `vote_rate_{$sName}` ";
    #             $sJoin .= " LEFT JOIN `{$this->_sTable}` AS `t{$iIndex}` ON (`t{$iIndex}`.`object_id` = `{$sMainTable}`.`{$sMainField}` AND `t{$iIndex}`.`reaction` = '{$sName}') ";
    #         }
    # 
    #         return array (
    #             'fields' => $sFields,
    #             'join' => $sJoin,
    #         );
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
    #         $iCounted = $iTotalCount = $fTotalRate = 0;
    #         $aReactions = $this->_oModule->getReactions();
    #         foreach($aReactions as $sName) {
    #             $iCount = (int)$aEntry['count_' . $sName];
    #             if($iCount == 0)
    #                 continue;
    # 
    #             $iTotalCount += $iCount;
    #             $fTotalRate += (float)$aEntry['rate_' . $sName];
    #             $iCounted += 1;
    #         }
    # 
    #         return (int)$this->query("UPDATE `{$this->_sTriggerTable}` SET `{$this->_sTriggerFieldCount}`=:count, `{$this->_sTriggerFieldRate}`=:rate  WHERE `{$this->_sTriggerFieldId}`=:id", array(
    #             'count' => $iTotalCount, 
    #             'rate' => $iCounted != 0 ? $fTotalRate / $iCounted : 0, 
    #             'id' => $iObjectId
    #         )) > 0;
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
    #         $aReaction = $this->_oModule->getReaction($aTrack['reaction']);
    #         return $this->query("UPDATE `{$this->_sTable}` SET `count`=`count`-1, `sum`=`sum`-:value WHERE `object_id`=:object_id AND `reaction`=:reaction", array(
    #             'value' => (int)$aTrack['value'] * (float)$aReaction['weight'],
    #             'object_id' => $aTrack['object_id'],
    #             'reaction' => $aTrack['reaction']
    #         ));
    #     }
    :ok
  end

end
