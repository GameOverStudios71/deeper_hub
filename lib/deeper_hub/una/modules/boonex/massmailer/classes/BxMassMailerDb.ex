
defmodule DeeperHub.Inc.Classes.BxMassMailerDb do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/massmailer/classes/BxMassMailerDb.php
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
    #     function __construct(&$oConfig)
    #     {
    #         parent::__construct($oConfig);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP copyCampaign

  ## Parametros
    - iCampaignId

  ## Retorno
    - any
  """
  def copyCampaign(%{}) do
    # TODO: Implementacao futura
        # public function copyCampaign($iCampaignId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #             'campaign_id' => $iCampaignId,
    #             'date_created' => time(),
    #             'copy_title' => _t('_bx_massmailer_txt_copy_title')
    #         );
    #         $this->query("INSERT INTO `" . $CNF['TABLE_CAMPAIGNS'] . "` (`" . $CNF['FIELD_AUTHOR'] . "`, `" . $CNF['FIELD_TITLE'] . "`, `" . $CNF['FIELD_BODY'] . "`, `" . $CNF['FIELD_SEGMENTS'] . "`, `" . $CNF['FIELD_ADDED'] . "`, `" . $CNF['FIELD_SUBJECT'] . "`, `" . $CNF['FIELD_FROM_NAME'] . "`, `" . $CNF['FIELD_REPLY_TO'] . "`, `" . $CNF['FIELD_PER_ACCOUNT'] . "`) SELECT `" . $CNF['FIELD_AUTHOR'] . "`, CONCAT(`" . $CNF['FIELD_TITLE'] . "`, :copy_title), `" . $CNF['FIELD_BODY'] . "`, `" . $CNF['FIELD_SEGMENTS'] . "`, :date_created, `" . $CNF['FIELD_SUBJECT'] . "`, `" . $CNF['FIELD_FROM_NAME'] . "`, `" . $CNF['FIELD_REPLY_TO'] . "`, `" . $CNF['FIELD_PER_ACCOUNT'] . "` FROM `" . $CNF['TABLE_CAMPAIGNS'] . "` WHERE `" . $CNF['FIELD_ID'] . "` = :campaign_id", $aBindings);
    #         return $this->lastId();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP sendCampaign

  ## Parametros
    - iCampaignId

  ## Retorno
    - any
  """
  def sendCampaign(%{}) do
    # TODO: Implementacao futura
        # public function sendCampaign($iCampaignId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #             'campaign_id' => $iCampaignId,
    #             'date_sent' => time()
    #         );
    #         $this->query("UPDATE `" . $CNF['TABLE_CAMPAIGNS'] . "` SET `" . $CNF['FIELD_DATE_SENT'] . "` = :date_sent WHERE `" . $CNF['FIELD_ID'] . "` = :campaign_id", $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addEmailToSentListForCampaign

  ## Parametros
    - iCampaignId,sEmailList

  ## Retorno
    - any
  """
  def addEmailToSentListForCampaign(%{}) do
    # TODO: Implementacao futura
        # public function addEmailToSentListForCampaign($iCampaignId, $sEmailList)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #             'campaign_id' => $iCampaignId,
    #             'email_list' => $sEmailList
    #         );
    #         $this->query("UPDATE `" . $CNF['TABLE_CAMPAIGNS'] . "` SET `" . $CNF['FIELD_EMAIL_LIST'] . "` = CONCAT(IFNULL(`" . $CNF['FIELD_EMAIL_LIST'] . "`, ''), ',', :email_list) WHERE `" . $CNF['FIELD_ID'] . "` = :campaign_id", $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCampaignInfoById

  ## Parametros
    - iCampaignId

  ## Retorno
    - any
  """
  def getCampaignInfoById(%{}) do
    # TODO: Implementacao futura
        # public function getCampaignInfoById ($iCampaignId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $sQuery = $this->prepare ("SELECT * FROM `" . $CNF['TABLE_CAMPAIGNS'] . "` WHERE `" . $CNF['FIELD_ID'] . "` = ?", $iCampaignId);
    #         return $this->getRow($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSegmentInfoById

  ## Parametros
    - iSegmentId

  ## Retorno
    - any
  """
  def getSegmentInfoById(%{}) do
    # TODO: Implementacao futura
        # public function getSegmentInfoById ($iSegmentId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $sQuery = $this->prepare ("SELECT * FROM `" . $CNF['TABLE_SEGMENTS'] . "` WHERE `" . $CNF['FIELD_ID'] . "` = ?", $iSegmentId);
    #         return $this->getRow($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSegments

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getSegments(%{}) do
    # TODO: Implementacao futura
        # public function getSegments()
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $sQuery = $this->prepare ("SELECT `" . $CNF['FIELD_ID'] . "`, `" . $CNF['FIELD_TITLE'] . "` FROM `" . $CNF['TABLE_SEGMENTS'] . "`");
    #         return $this->getPairs($sQuery, $CNF['FIELD_ID'], $CNF['FIELD_TITLE']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAccountsByTerms

  ## Parametros
    - sTerms=""

  ## Retorno
    - any
  """
  def getAccountsByTerms(%{}) do
    # TODO: Implementacao futura
        # public function getAccountsByTerms($sTerms = "")
    #     {
    #         $sSql = "SELECT `ta`.`email`, `tp`.`id` AS `profile_id`, `ta`.`id` as `account_id` FROM `sys_accounts` AS `ta` " . $sTerms . "  WHERE `ta`.`receive_news` <> 0 AND `ta`.`email_confirmed` = 1";
    #         return $this->getAll($sSql);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAccountsByTermsStat

  ## Parametros
    - iDateFrom,iDateTo,sTerms=""

  ## Retorno
    - any
  """
  def getAccountsByTermsStat(%{}) do
    # TODO: Implementacao futura
        # public function getAccountsByTermsStat($iDateFrom, $iDateTo, $sTerms = "")
    #     {
    #         $aBindings = array(
    #            'datefrom' => $iDateFrom,
    #            'dateto' => $iDateTo
    #        );
    #         $sSql = "SELECT DATE(FROM_UNIXTIME(`ta`.`added`)) AS `period`, YEAR(FROM_UNIXTIME(`ta`.`added`)) AS `year`, COUNT(*) AS `count` FROM `sys_accounts` AS `ta` " . $sTerms . " WHERE `ta`.`receive_news` <> 0  AND `ta`.`email_confirmed` = 1 AND `ta`.`added` >= :datefrom AND `ta`.`added` <= :dateto GROUP BY `period`, `year` ORDER BY `year`, `period` ASC";
    #         return $this->getAll($sSql, $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAccountsByTermsStatUnsubscribe

  ## Parametros
    - iDateFrom,iDateTo,sTerms=""

  ## Retorno
    - any
  """
  def getAccountsByTermsStatUnsubscribe(%{}) do
    # TODO: Implementacao futura
        # public function getAccountsByTermsStatUnsubscribe($iDateFrom, $iDateTo, $sTerms = "")
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #            'datefrom' => $iDateFrom,
    #            'dateto' => $iDateTo
    #        );
    #         $sSql = "SELECT DATE(FROM_UNIXTIME(`tu`.`unsubscribed`)) AS `period`, YEAR(FROM_UNIXTIME(`tu`.`unsubscribed`)) AS `year`, COUNT(*) AS `count` FROM `sys_accounts` AS `ta` INNER JOIN `" . $CNF['TABLE_UNSUBSCRIBE'] . "` AS `tu` ON `tu`.`account_id`=`ta`.`id` " . $sTerms . " WHERE `tu`.`unsubscribed` >= :datefrom AND `tu`.`unsubscribed` <= :dateto GROUP BY `period`, `year` ORDER BY `year`, `period` ASC";
    #         return $this->getAll($sSql, $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAccountsByTermsStatInitValue

  ## Parametros
    - iDateFrom,sTerms

  ## Retorno
    - any
  """
  def getAccountsByTermsStatInitValue(%{}) do
    # TODO: Implementacao futura
        # public function getAccountsByTermsStatInitValue($iDateFrom, $sTerms)
    #     {
    #         $aBindings = array(
    #             'datefrom' => $iDateFrom
    #         );
    #         $sQuery = "SELECT COUNT(`ta`.`id`) AS `count` FROM `sys_accounts` AS `ta` " . $sTerms . " WHERE `ta`.`added` < :datefrom ";
    #         return $this->getOne($sQuery, $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAccountsByTermsStatInitValueUnsubscribe

  ## Parametros
    - iDateFrom,sTerms

  ## Retorno
    - any
  """
  def getAccountsByTermsStatInitValueUnsubscribe(%{}) do
    # TODO: Implementacao futura
        # public function getAccountsByTermsStatInitValueUnsubscribe($iDateFrom, $sTerms)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #             'datefrom' => $iDateFrom
    #         );
    #         $sQuery = "SELECT COUNT(`tu`.`id`) AS `count` FROM `sys_accounts` AS `ta` INNER JOIN `" . $CNF['TABLE_UNSUBSCRIBE'] . "` AS `tu` ON `tu`.`account_id`=`ta`.`id` " . $sTerms . " WHERE `tu`.`unsubscribed` < :datefrom ";
    #         return $this->getOne($sQuery, $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addLetter

  ## Parametros
    - iCampaignId,sEmail

  ## Retorno
    - any
  """
  def addLetter(%{}) do
    # TODO: Implementacao futura
        # public function addLetter($iCampaignId, $sEmail)
    #     {
    #         $iTime = time();
    #         $sCode = md5($iCampaignId . $sEmail . $iTime);
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #             'campaign_id' => $iCampaignId,
    #             'email' => $sEmail,
    #             'date_sent' => $iTime,
    #             'code' => $sCode,
    #         );
    #         $this->query("INSERT INTO `" . $CNF['TABLE_LETTERS'] . "` (`" . $CNF['FIELD_CAMPAIGN_ID'] . "`, `" . $CNF['FIELD_EMAIL'] . "`, `" . $CNF['FIELD_DATE_SENT'] . "`, `" . $CNF['FIELD_HASH'] . "`) VALUES (:campaign_id, :email, :date_sent, :code)", $aBindings);
    #         return $sCode;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateDateSeenForLetter

  ## Parametros
    - sCode

  ## Retorno
    - any
  """
  def updateDateSeenForLetter(%{}) do
    # TODO: Implementacao futura
        # public function updateDateSeenForLetter($sCode)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #             'code' => $sCode,
    #             'date_seen' => time()
    #         );
    #         $this->query("UPDATE `" . $CNF['TABLE_LETTERS'] . "` SET `" . $CNF['FIELD_DATE_SEEN'] . "` = :date_seen WHERE `" . $CNF['FIELD_HASH'] . "` = :code", $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteCampaignData

  ## Parametros
    - iCampaignId

  ## Retorno
    - any
  """
  def deleteCampaignData(%{}) do
    # TODO: Implementacao futura
        # public function deleteCampaignData($iCampaignId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #             'campaign_id' => $iCampaignId
    #         );
    #         $this->query("DELETE FROM `" . $CNF['TABLE_LETTERS'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` = :campaign_id", $aBindings);
    #         $this->query("DELETE FROM `" . $CNF['TABLE_LINKS'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` = :campaign_id", $aBindings);
    #         $this->query("DELETE FROM `" . $CNF['TABLE_UNSUBSCRIBE'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` = :campaign_id", $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLettersByCampaignId

  ## Parametros
    - iCampaignId

  ## Retorno
    - any
  """
  def getLettersByCampaignId(%{}) do
    # TODO: Implementacao futura
        # public function getLettersByCampaignId ($iCampaignId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $sQuery = $this->prepare ("SELECT * FROM `" . $CNF['TABLE_LETTERS'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` = ?", $iCampaignId);
    #         return $this->getAll($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getClicksByCampaignId

  ## Parametros
    - iCampaignId

  ## Retorno
    - any
  """
  def getClicksByCampaignId(%{}) do
    # TODO: Implementacao futura
        # public function getClicksByCampaignId ($iCampaignId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $sQuery = $this->prepare ("SELECT `" . $CNF['FIELD_LINK'] . "`, `" . $CNF['FIELD_TITLE'] . "`, COUNT( `" . $CNF['FIELD_ID'] . "`) AS `click_count`, MAX( `" . $CNF['FIELD_DATE_CLICK'] . "`) AS `last_click` FROM `" . $CNF['TABLE_LINKS'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` = ? AND `" . $CNF['FIELD_DATE_CLICK'] . "` > 0 GROUP BY `" . $CNF['FIELD_LINK'] . "`, `" . $CNF['FIELD_TITLE'] . "` ORDER BY COUNT( `" . $CNF['FIELD_ID'] . "`)  DESC", $iCampaignId);
    #         return $this->getAll($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStatByCampaignId

  ## Parametros
    - iCampaignId

  ## Retorno
    - any
  """
  def getStatByCampaignId(%{}) do
    # TODO: Implementacao futura
        # public function getStatByCampaignId ($iCampaignId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #          $aBindings = array(
    #             'campaign_id' => $iCampaignId
    #         );
    #         $q = "
    #         SELECT COUNT(*) AS `count`, 'total' AS `title` FROM `" . $CNF['TABLE_LETTERS'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` = :campaign_id UNION
    #         SELECT COUNT(*), 'seen' FROM `" . $CNF['TABLE_LETTERS'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` = :campaign_id AND `" . $CNF['FIELD_DATE_SEEN'] . "` > 0 UNION
    #         SELECT COUNT(*), 'clicked' FROM `" . $CNF['TABLE_LETTERS'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` = :campaign_id AND `" . $CNF['FIELD_DATE_CLICK'] . "` > 0 UNION 
    #         SELECT COUNT(*), 'unsubscribed' FROM `" . $CNF['TABLE_UNSUBSCRIBE'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` = :campaign_id 
    #         ";
    #         return $this->getPairs($q, 'title', 'count', $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLetterByCode

  ## Parametros
    - sCode

  ## Retorno
    - any
  """
  def getLetterByCode(%{}) do
    # TODO: Implementacao futura
        # public function getLetterByCode ($sCode)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $sQuery = $this->prepare ("SELECT * FROM `" . $CNF['TABLE_LETTERS'] . "` WHERE `" . $CNF['FIELD_HASH'] . "` = ?", $sCode);
    #         return $this->getRow($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addLink

  ## Parametros
    - sLetterHash,sLink,sTitle,iCampaignId

  ## Retorno
    - any
  """
  def addLink(%{}) do
    # TODO: Implementacao futura
        # public function addLink($sLetterHash, $sLink, $sTitle, $iCampaignId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $sCode = md5($sLetterHash . $sLink . $sTitle);
    #         $aBindings = array(
    #             'letter_hash' => $sLetterHash,
    #             'hash' => $sCode,
    #             'link' => $sLink,
    #             'title' => $sTitle,
    #             'campaign_id' => $iCampaignId,
    #         );
    #         $this->query("INSERT INTO `" . $CNF['TABLE_LINKS'] . "` (`" . $CNF['FIELD_LETTER_HASH'] . "`, `" . $CNF['FIELD_HASH'] . "`, `" . $CNF['FIELD_LINK'] . "`, `" . $CNF['FIELD_TITLE'] . "`, `" . $CNF['FIELD_CAMPAIGN_ID'] . "`) VALUES (:letter_hash, :hash, :link, :title, :campaign_id)", $aBindings);
    #         return $sCode;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateDateClickForLink

  ## Parametros
    - sCode

  ## Retorno
    - any
  """
  def updateDateClickForLink(%{}) do
    # TODO: Implementacao futura
        # public function updateDateClickForLink($sCode)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #             'code' => $sCode,
    #             'date_click' => time()
    #         );
    #         $this->query("UPDATE `" . $CNF['TABLE_LINKS'] . "` SET `" . $CNF['FIELD_DATE_CLICK'] . "` = :date_click WHERE `" . $CNF['FIELD_HASH'] . "` = :code", $aBindings);
    #         $aData = $this->getRow("SELECT * FROM `" . $CNF['TABLE_LINKS'] . "` WHERE `" . $CNF['FIELD_HASH'] . "` = :code", array('code' => $sCode));
    #         if (isset($aData[$CNF['FIELD_LETTER_HASH']]) && isset($aData[$CNF['FIELD_LINK']])){
    #             $aBindings['code'] = $aData[$CNF['FIELD_LETTER_HASH']];
    #             if ($aData[$CNF['FIELD_LETTER_HASH']] != '')
    #                 $this->query("UPDATE `" . $CNF['TABLE_LETTERS'] . "` SET `" . $CNF['FIELD_DATE_CLICK'] . "` = :date_click WHERE `" . $CNF['FIELD_HASH'] . "` = :code", $aBindings);
    # 
    #             return $aData[$CNF['FIELD_LINK']];
    #         }
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateUnsubscribe

  ## Parametros
    - iAccountId,iValue,iCampaignId

  ## Retorno
    - any
  """
  def updateUnsubscribe(%{}) do
    # TODO: Implementacao futura
        # public function updateUnsubscribe($iAccountId, $iValue, $iCampaignId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         if ($iValue != 1){
    #             $aBindings = array(
    #                 'account_id' => $iAccountId,
    #                 'campaign_id' => $iCampaignId,
    #                 'date_unsubscribed' => time()
    #             );
    #             $this->query("INSERT INTO `" . $CNF['TABLE_UNSUBSCRIBE'] . "` (`" . $CNF['FIELD_DATE_UNSUBSCRIBED'] . "`, `" . $CNF['FIELD_ACCOUNT_ID'] . "`, `" . $CNF['FIELD_CAMPAIGN_ID'] . "`) VALUES (:date_unsubscribed, :account_id, :campaign_id)", $aBindings);
    #         }
    #         else{
    #             $aBindings = array(
    #                 'account_id' => $iAccountId
    #             );
    #             $this->query("DELETE FROM `" . $CNF['TABLE_UNSUBSCRIBE'] . "` WHERE `" . $CNF['FIELD_ACCOUNT_ID'] . "` = :account_id", $aBindings);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteOldCampagns

  ## Parametros
    - iDayBefore

  ## Retorno
    - any
  """
  def deleteOldCampagns(%{}) do
    # TODO: Implementacao futura
        # public function deleteOldCampagns($iDayBefore)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #             'time_from' => (time() - $iDayBefore * 86400)
    #         );
    #         $aTmp = $this->getColumn("SELECT `" . $CNF['FIELD_ID'] . "` FROM `" . $CNF['TABLE_CAMPAIGNS'] . "` WHERE `" . $CNF['FIELD_DATE_SENT'] . "` < :time_from AND `" . $CNF['FIELD_DATE_SENT'] . "` > 0", $aBindings);
    #         if (count($aTmp) > 0){
    #             $sIdList = $this->implode_escape($aTmp);
    #             $this->query("DELETE FROM `" . $CNF['TABLE_LETTERS'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` IN (" . $sIdList . ")", []);
    #             $this->query("DELETE FROM `" . $CNF['TABLE_LINKS'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` IN (" . $sIdList . ")", []);
    #             $this->query("DELETE FROM `" . $CNF['TABLE_UNSUBSCRIBE'] . "` WHERE `" . $CNF['FIELD_CAMPAIGN_ID'] . "` IN (" . $sIdList . ")", []);
    #             $this->query("DELETE FROM `" . $CNF['TABLE_CAMPAIGNS'] . "` WHERE `" . $CNF['FIELD_ID'] . "` IN (" . $sIdList . ")", []);
    #         }
    #     }
    :ok
  end

end
