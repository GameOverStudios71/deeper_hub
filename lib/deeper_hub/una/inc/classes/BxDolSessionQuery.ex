
defmodule DeeperHub.Inc.Classes.BxDolSessionQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolSessionQuery.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct()
    #     {
    #         parent::__construct();
    # 
    #         $this->sTable = 'sys_sessions';
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
    #     function getTableName()
    #     {
    #         return $this->sTable;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP exists

  ## Parametros
    - sId

  ## Retorno
    - any
  """
  def exists(%{}) do
    # TODO: Implementacao futura
        # 
    #     function exists($sId)
    #     {
    #         $aSession = $this->getRow("SELECT `id`, `user_id`, `data` FROM `" . $this->sTable . "` WHERE `id`=:id LIMIT 1", [
    #             'id' => (string)$sId
    #         ]);
    # 
    #         return !empty($aSession) ? $aSession : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP save

  ## Parametros
    - sId,aSet

  ## Retorno
    - any
  """
  def save(%{}) do
    # TODO: Implementacao futura
        # 
    #     function save($sId, $aSet)
    #     {
    #         $aSet['date'] = time();
    #         $aUpdate = $aSet;
    #         $aSet['id'] = $sId;
    #         $aBind = $aSet;
    #         unset($aBind['date']);
    # 
    #         if ($this->getOne("SELECT `date` FROM `" . $this->sTable . "` WHERE `id` = :id AND `data` = :data AND `user_id` = :user_id AND `date` > UNIX_TIMESTAMP() - " . BX_DOL_SESSION_SKIP_UPDATE, $aBind))
    #             return true;
    # 
    #         $this->updateLastActivity($sId);
    # 
    #         return (int)$this->query("INSERT INTO `" . $this->sTable . "` SET " . $this->arrayToSQL($aSet) . " ON DUPLICATE KEY UPDATE " . $this->arrayToSQL($aUpdate)) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP delete

  ## Parametros
    - sId

  ## Retorno
    - any
  """
  def delete(%{}) do
    # TODO: Implementacao futura
        # 
    #     function delete($sId)
    #     {
    #         $aRow = $this->getRow("SELECT `user_id`, `date` FROM `" . $this->sTable . "` WHERE `id`=:id LIMIT 1", ['id' => $sId]);
    #         if(!empty($aRow) && is_array($aRow))
    #             $this->updateLastActivityAccount($aRow['user_id'], $aRow['date']);
    # 
    #         $sSql = $this->prepare("DELETE FROM `" . $this->sTable . "` WHERE `id`=? LIMIT 1", $sId);
    #         return (int)$this->query($sSql) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteExpired

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def deleteExpired(%{}) do
    # TODO: Implementacao futura
        # 
    #     function deleteExpired()
    #     {
    #         $iTime = time() - BX_DOL_SESSION_LIFETIME;
    #         $sSql = $this->prepare("SELECT `user_id`, `date` FROM `" . $this->sTable . "` WHERE `date` < ? AND `user_id` != 0 ORDER BY `date` DESC LIMIT 50000", $iTime);
    #         $aRows = $this->getAll($sSql);
    # 
    #         foreach ($aRows as $aRow) {
    #             $this->updateLastActivityAccount($aRow['user_id'], $aRow['date']);
    #         }
    # 
    #         $sSql = $this->prepare("DELETE FROM `" . $this->sTable . "` WHERE `date` < ?", $iTime);
    #         $iRet = (int)$this->query($sSql);
    #         if ($iRet)
    #             $this->query("OPTIMIZE TABLE `" . $this->sTable . "`");
    #         return $iRet;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteByAccountId

  ## Parametros
    - iAccountId

  ## Retorno
    - any
  """
  def deleteByAccountId(%{}) do
    # TODO: Implementacao futura
        # 
    #     
    #     function deleteByAccountId($iAccountId)
    #     {
    #         $iDate = $this->getOne("SELECT `date` FROM `" . $this->sTable . "` WHERE `user_id` = :id ORDER BY `date` DESC", ['id' => $iAccountId]);
    #         if ($iDate)
    #             $this->updateLastActivityAccount($iAccountId, $iDate);
    #         
    #         return (int)$this->query("DELETE FROM `" . $this->sTable . "` WHERE `user_id` = :id", ['id' => $iAccountId]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateLastActivity

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def updateLastActivity(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function updateLastActivity($iId)
    #     {
    #         if (defined('BX_DOL_SESSION_UPDATE_ACTIVE') && ($aRow = $this->getRow("SELECT `date`, `user_id` FROM `" . $this->sTable . "` WHERE `id` = :id AND `date` < UNIX_TIMESTAMP() - " . BX_DOL_SESSION_UPDATE_ACTIVE, ['id' => $iId]))) {
    #             $this->updateLastActivityAccount($aRow['user_id'], $aRow['date']);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateLastActivityAccount

  ## Parametros
    - iAccountId,iDate

  ## Retorno
    - any
  """
  def updateLastActivityAccount(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function updateLastActivityAccount($iAccountId, $iDate)
    #     {
    #         if ($iDate > 0) {
    #             $a = BxDolAccountQuery::getInstance()->getInfoById($iAccountId);
    #             if ($a && $iDate > $a['active'])
    #                 BxDolAccountQuery::getInstance()->_updateField($iAccountId, 'active', $iDate);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLastActivityAccount

  ## Parametros
    - iUserId

  ## Retorno
    - any
  """
  def getLastActivityAccount(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getLastActivityAccount($iUserId)
    #     {
    #         $sSql = $this->prepare("SELECT `date` FROM `" . $this->sTable . "` WHERE `user_id`=? ORDER BY `date` DESC LIMIT 1", $iUserId);
    #         return $this->getOne($sSql);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOldSession

  ## Parametros
    - iUserId

  ## Retorno
    - any
  """
  def getOldSession(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getOldSession($iUserId) {
    #         $sSql = $this->prepare("SELECT `id` FROM `" . $this->sTable . "` WHERE `user_id`=? LIMIT 1", $iUserId);
    #         $sSession = $this->getOne($sSql);
    #         return !empty($sSession) ? $sSession : false;
    #     }
    :ok
  end

end
