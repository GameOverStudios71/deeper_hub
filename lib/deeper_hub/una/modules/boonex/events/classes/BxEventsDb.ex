
defmodule DeeperHub.Inc.Classes.BxEventsDb do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/events/classes/BxEventsDb.php
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
  Funcao correspondente ao metodo PHP getContentInfoByIntervalId

  ## Parametros
    - iIntervalId

  ## Retorno
    - any
  """
  def getContentInfoByIntervalId(%{}) do
    # TODO: Implementacao futura
        # public function getContentInfoByIntervalId ($iIntervalId)
    #     {
    #         $iContentId = $this->getOne("SELECT `event_id` FROM `bx_events_intervals` WHERE `interval_id` = :interval", array(
    #             'interval' => $iIntervalId,
    #         ));
    #         if (!$iContentId)
    #             return 0;
    #         return $this->getContentInfoById ($iContentId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getContentInfoById

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def getContentInfoById(%{}) do
    # TODO: Implementacao futura
        # public function getContentInfoById ($iContentId)
    #     {
    #         $sQuery = $this->prepare ("SELECT `c`.*, `p`.`account_id`, `p`.`id` AS `profile_id`, `p`.`status` AS `profile_status`, MAX(`i`.`repeat_stop`) AS `repeat_stop` FROM `" . $this->_oConfig->CNF['TABLE_ENTRIES'] . "` AS `c` 
    #             INNER JOIN `sys_profiles` AS `p` ON (`p`.`content_id` = `c`.`id` AND `p`.`type` = ?) 
    #             LEFT JOIN `bx_events_intervals` as `i` ON (`c`.`id` = `i`.`event_id`)
    #             WHERE `c`.`id` = ?
    #             GROUP BY `c`.`id`", $this->_oConfig->getName(), $iContentId);
    #         return $this->getRow($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteIntervalById

  ## Parametros
    - iIntervalId

  ## Retorno
    - any
  """
  def deleteIntervalById(%{}) do
    # TODO: Implementacao futura
        # public function deleteIntervalById ($iIntervalId)
    #     {
    #         return $this->query("DELETE FROM `bx_events_intervals` WHERE `interval_id` = :interval", array(
    #             'interval' => $iIntervalId,
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getIntervals

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def getIntervals(%{}) do
    # TODO: Implementacao futura
        # public function getIntervals ($iContentId) 
    #     {
    #         return $this->getAllWithKey("SELECT * FROM `bx_events_intervals` WHERE `event_id` = :event_id", 'interval_id', array(
    #             'event_id' => $iContentId,
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getEntriesBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getEntriesBy(%{}) do
    # TODO: Implementacao futura
        # public function getEntriesBy($aParams = [])
    #     {
    #         if(isset($aParams['type']) && !in_array($aParams['type'], ['past']))
    #             return parent::getEntriesBy($aParams); 
    #             
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #     	$aMethod = ['name' => 'getAll', 'params' => [0 => 'query', 1 => []]];
    #         $sSelectClause = $sJoinClause = $sWhereClause = $sOrderClause = $sLimitClause = "";
    # 
    #         $sSelectClause = "`" . $CNF['TABLE_ENTRIES'] . "`.*";
    # 
    #         switch($aParams['type']) {
    #             case 'past':
    #                 if(!empty($aParams['date_from'])) {
    #                     $aMethod['params'][1]['date_from'] = (int)$aParams['date_from'];
    # 
    #                     $sWhereClause .= " AND `" . $CNF['TABLE_ENTRIES'] . "`.`" . $CNF['FIELD_DATE_END'] . "` >= :date_from";
    #                 }
    # 
    #                 $aMethod['params'][1]['date_to'] = !empty($aParams['date_to']) ? (int)$aParams['date_to'] : time();
    # 
    #                 $sWhereClause .= " AND `" . $CNF['TABLE_ENTRIES'] . "`.`" . $CNF['FIELD_DATE_END'] . "` < :date_to";
    #                 break;
    #         }
    # 
    #         if(!empty($sOrderClause))
    #             $sOrderClause = 'ORDER BY ' . $sOrderClause;
    # 
    #         if(!empty($sLimitClause))
    #             $sLimitClause = 'LIMIT ' . $sLimitClause;
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . " FROM `" . $CNF['TABLE_ENTRIES'] . "` " . $sJoinClause . " WHERE 1 " . $sWhereClause . " " . $sOrderClause . " " . $sLimitClause;
    #         return call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkIn

  ## Parametros
    - iProfileId,iId

  ## Retorno
    - any
  """
  def checkIn(%{}) do
    # TODO: Implementacao futura
        # public function checkIn($iProfileId, $iId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         return $this->query("INSERT INTO `" . $CNF['TABLE_CHECK_IN'] . "` SET `profile_id` = :profile_id, `event_id` = :event_id ON DUPLICATE KEY UPDATE `event_id` = :event_id", [
    #             'profile_id' => $iProfileId,
    #             'event_id' => $iId
    #         ]) !== false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isCheckedIn

  ## Parametros
    - iProfileId,iId

  ## Retorno
    - any
  """
  def isCheckedIn(%{}) do
    # TODO: Implementacao futura
        # public function isCheckedIn($iProfileId, $iId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         return (int)$this->getOne("SELECT `id` FROM `" . $CNF['TABLE_CHECK_IN'] . "` WHERE `profile_id` = :profile_id AND `event_id` = :event_id LIMIT 1", [
    #             'profile_id' => $iProfileId,
    #             'event_id' => $iId
    #         ]) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSessions

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getSessions(%{}) do
    # TODO: Implementacao futura
        # public function getSessions($aParams = [])
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #     	$aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    # 
    #         $sSelectClause = "`ts`.*";
    #         $sJoinClause = $sWhereClause = $sOrderClause = $sLimitClause = "";
    #         switch($aParams['sample']) {
    #             case 'id':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause = " AND `ts`.`id`=:id";
    #                 break;
    #             
    #              case 'event_id':
    #                 $aMethod['params'][1] = [
    #                     'event_id' => $aParams['event_id']
    #                 ];
    # 
    #                 $sWhereClause = " AND `ts`.`event_id`=:event_id";
    #                 $sOrderClause = "`ts`.`" . !empty($aParams['order_by']) ? $aParams['order_by'] : "order" . "` ASC";
    #                 break;
    #         }
    # 
    #         if(!empty($sOrderClause))
    #             $sOrderClause = 'ORDER BY ' . $sOrderClause;
    # 
    #         if(!empty($sLimitClause))
    #             $sLimitClause = 'LIMIT ' . $sLimitClause;
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . " FROM `" . $CNF['TABLE_SESSIONS'] . "` AS `ts` " . $sJoinClause . " WHERE 1" . $sWhereClause . " " . $sOrderClause . " " . $sLimitClause;
    # 
    #         return call_user_func_array([$this, $aMethod['name']], $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSessionOrderMax

  ## Parametros
    - iEventId

  ## Retorno
    - any
  """
  def getSessionOrderMax(%{}) do
    # TODO: Implementacao futura
        # public function getSessionOrderMax($iEventId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         return (int)$this->getOne("SELECT MAX(`order`) FROM `" . $CNF['TABLE_SESSIONS'] . "` WHERE `event_id`=:event_id", [
    #             'event_id' => $iEventId
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteSessions

  ## Parametros
    - aWhere

  ## Retorno
    - any
  """
  def deleteSessions(%{}) do
    # TODO: Implementacao futura
        # public function deleteSessions($aWhere)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aWhere) || !is_array($aWhere))
    #             return false;
    # 
    #         return (int)$this->query("DELETE FROM `" . $CNF['TABLE_SESSIONS'] . "` WHERE " . $this->arrayToSQL($aWhere, ' AND ')) > 0;
    #     }
    :ok
  end

end
