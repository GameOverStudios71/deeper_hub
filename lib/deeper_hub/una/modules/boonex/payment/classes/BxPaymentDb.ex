
defmodule DeeperHub.Inc.Classes.BxPaymentDb do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/payment/classes/BxPaymentDb.php
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
  Funcao correspondente ao metodo PHP getModulesWithPayments

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getModulesWithPayments(%{}) do
    # TODO: Implementacao futura
        # public function getModulesWithPayments()
    #     {
    #     	$sQuery = $this->prepare("SELECT `name` FROM `" . $this->_sPrefix . "modules`");
    #         return $this->getColumn($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getForm

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getForm(%{}) do
    # TODO: Implementacao futura
        # public function getForm()
    #     {
    #         $sQuery = "SELECT
    #                 `tp`.`id` AS `provider_id`,
    #                 `tp`.`name` AS `provider_name`,
    #                 `tp`.`caption` AS `provider_caption`,
    #                 `tp`.`description` AS `provider_description`,
    #                 `tp`.`option_prefix` AS `provider_option_prefix`,
    #                 `tp`.`for_owner_only` AS `provider_for_owner_only`,
    #                 `tp`.`single_seller` AS `provider_single_seller`,
    #                 `tpo`.`id` AS `id`,
    #                 `tpo`.`name` AS `name`,
    #                 `tpo`.`type` AS `type`,
    #                 `tpo`.`caption` AS `caption`,
    #                 `tpo`.`description` AS `description`,
    #                 `tpo`.`extra` AS `extra`,
    #                 `tpo`.`check_type` AS `check_type`,
    #                 `tpo`.`check_params` AS `check_params`,
    #                 `tpo`.`check_error` AS `check_error`
    #             FROM `" . $this->_sPrefix . "providers` AS `tp`
    #             LEFT JOIN `" . $this->_sPrefix . "providers_options` AS `tpo` ON `tp`.`id`=`tpo`.`provider_id`
    #             WHERE `tp`.`active`='1' 
    #             ORDER BY `tp`.`order` ASC, `tpo`.`order` ASC";
    # 
    #         return $this->getAll($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOption

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getOption(%{}) do
    # TODO: Implementacao futura
        # public function getOption($aParams)
    #     {
    #         $aMethod = array('name' => 'getAll', 'params' => array(0 => 'query'));
    # 
    #         $sSelectClause = "`tpo`.*";
    #         $sJoinClause = $sWhereClause = "";
    #         if(!empty($aParams['type']))
    # 	        switch($aParams['type']) {
    #                     case 'by_pid_and_name':
    #                         $aMethod['name'] = 'getRow';
    #                         $aMethod['params'][1] = array(
    #                             'provider_id' => $aParams['provider_id'],
    #                             'name' => $aParams['name'],
    #                         );
    # 
    #                         $sWhereClause = " AND `tpo`.`provider_id`=:provider_id AND `tpo`.`name`=:name";
    #                         break;
    #                 }
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . " FROM `" . $this->_sPrefix . "providers_options` AS `tpo` " . $sJoinClause . " WHERE 1" . $sWhereClause;
    # 
    #         return call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOptions

  ## Parametros
    - iUserId=BX_PAYMENT_EMPTY_ID,iProviderId=0

  ## Retorno
    - any
  """
  def getOptions(%{}) do
    # TODO: Implementacao futura
        # public function getOptions($iUserId = BX_PAYMENT_EMPTY_ID, $iProviderId = 0)
    #     {
    #     	$aBinding = array(
    #     		'user_id' => $iUserId
    #     	);
    # 
    #         if($iUserId == BX_PAYMENT_EMPTY_ID && empty($iProviderId))
    #            return $this->getAll("SELECT `id`, `name`, `type` FROM `" . $this->_sPrefix . "providers_options`");
    # 
    #         $sWhereAddon = "";
    #         if(!empty($iProviderId)) {
    #         	$aBinding['provider_id'] = $iProviderId;
    # 
    #             $sWhereAddon = " AND `tpo`.`provider_id`=:provider_id";
    #         }
    # 
    #         $sQuery = "SELECT
    #                `tpo`.`name` AS `name`,
    #                `tuv`.`value` AS `value`
    #             FROM `" . $this->_sPrefix . "providers_options` AS `tpo`
    #             LEFT JOIN `" . $this->_sPrefix . "user_values` AS `tuv` ON `tpo`.`id`=`tuv`.`option_id`
    #             WHERE 1" . $sWhereAddon . " AND `tuv`.`user_id`=:user_id ORDER BY `tpo`.`order`";
    # 
    #         return $this->getAllWithKey($sQuery, 'name', $aBinding);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateOption

  ## Parametros
    - iUserId,iOptionId,sValue

  ## Retorno
    - any
  """
  def updateOption(%{}) do
    # TODO: Implementacao futura
        # public function updateOption($iUserId, $iOptionId, $sValue)
    #     {
    #         $sQuery = $this->prepare("REPLACE INTO `" . $this->_sPrefix . "user_values` SET `user_id`=?, `option_id`=?, `value`=?", $iUserId, $iOptionId, $sValue);
    #         return $this->query($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCurrencyExchangeRate

  ## Parametros
    - sCode

  ## Retorno
    - any
  """
  def getCurrencyExchangeRate(%{}) do
    # TODO: Implementacao futura
        # public function getCurrencyExchangeRate($sCode)
    #     {
    #         return $this->getOne("SELECT `rate` FROM `" . $this->_sPrefix . "currencies` WHERE `code`=:code LIMIT 1", [
    #             'code' => $sCode
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateCurrencyExchangeRate

  ## Parametros
    - sCode,fRate

  ## Retorno
    - any
  """
  def updateCurrencyExchangeRate(%{}) do
    # TODO: Implementacao futura
        # public function updateCurrencyExchangeRate($sCode, $fRate)
    #     {
    #         return $this->query("INSERT INTO `" . $this->_sPrefix . "currencies`(`code`, `rate`) VALUES(:code, :rate) ON DUPLICATE KEY UPDATE `rate`=:rate", [
    #             'code' => $sCode,
    #             'rate' => $fRate
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteCurrencyExchangeRate

  ## Parametros
    - sCode

  ## Retorno
    - any
  """
  def deleteCurrencyExchangeRate(%{}) do
    # TODO: Implementacao futura
        # public function deleteCurrencyExchangeRate($sCode)
    #     {
    #         return $this->query("DELETE FROM `" . $this->_sPrefix . "currencies` WHERE `code`=:code", [
    #             'code' => $sCode
    #         ]) !== false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartItems

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def getCartItems(%{}) do
    # TODO: Implementacao futura
        # public function getCartItems($iId)
    #     {
    #     	$sQuery = $this->prepare("SELECT `items` FROM `" . $this->_sPrefix . "cart` WHERE `client_id`=? LIMIT 1", $iId);
    #         return $this->getOne($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartContent

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def getCartContent(%{}) do
    # TODO: Implementacao futura
        # public function getCartContent($iId)
    #     {
    #         $aCart = $this->getRow("SELECT * FROM `" . $this->_sPrefix . "cart` WHERE `client_id`=:client_id LIMIT 1", array(
    #             'client_id' => $iId
    #         ));
    # 
    #         if(empty($aCart) || !is_array($aCart))
    #             $aCart = array('items' => '', 'customs' => '');
    # 
    #         return $aCart;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getVendorInfoProvidersSingle

  ## Parametros
    - iVendorId

  ## Retorno
    - any
  """
  def getVendorInfoProvidersSingle(%{}) do
    # TODO: Implementacao futura
        # public function getVendorInfoProvidersSingle($iVendorId)
    #     {
    #     	return $this->getVendorInfoProviders($iVendorId, array('type' => 'for_single'));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getVendorInfoProvidersRecurring

  ## Parametros
    - iVendorId

  ## Retorno
    - any
  """
  def getVendorInfoProvidersRecurring(%{}) do
    # TODO: Implementacao futura
        # public function getVendorInfoProvidersRecurring($iVendorId)
    #     {
    #     	return $this->getVendorInfoProviders($iVendorId, array('type' => 'for_recurring'));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAdminsIds

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getAdminsIds(%{}) do
    # TODO: Implementacao futura
        # public function getAdminsIds()
    #     {
    #         $sQuery = "SELECT 
    #         		`tp`.`id` AS `id`,
    #         		`tp`.`type` AS `type`  
    #         	FROM `sys_profiles` AS `tp` 
    #         	INNER JOIN `sys_accounts` AS `ta` ON `tp`.`account_id`=`ta`.`id` AND `ta`.`role`&" . BX_DOL_ROLE_ADMIN . " 
    #         	WHERE 
    #         		`tp`.`type`<>'system' AND `tp`.`status`='active' 
    #         	ORDER BY `tp`.`id` ASC";
    # 
    #         $aAdmins = $this->getAllWithKey($sQuery, 'id');
    #         foreach($aAdmins as $iId => $aAdmin)
    #             if(!BxDolService::call($aAdmin['type'], 'act_as_profile'))
    #                 unset($aAdmins[$iId]);
    # 
    #         return array_keys($aAdmins);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrderPending

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getOrderPending(%{}) do
    # TODO: Implementacao futura
        # public function getOrderPending($aParams)
    #     {
    #     	$aMethod = array('name' => 'getRow', 'params' => array(0 => 'query'));
    # 
    #     	$sWhereClause = $sLimitClause = '';
    #         switch($aParams['type']) {
    #             case 'id':
    #             	$aMethod['params'][1] = array(
    #                 	'id' => $aParams['id']
    #                 );
    # 
    #                 $sWhereClause = " AND `id`=:id";
    #                 $sLimitClause = " LIMIT 1";
    #                 break;
    # 
    #             case 'order':
    #             	$aMethod['params'][1] = array(
    #                 	'order' => $aParams['order']
    #                 );
    # 
    #             	$sWhereClause = " AND `order`=:order";
    #                 $sLimitClause = " LIMIT 1";
    #                 break;
    # 
    #             case 'mixed':
    #                 $aMethod['name'] = 'getAll';
    # 
    #                 $sWhereClause = ' AND ' . $this->arrayToSQL($aParams['conditions'], ' AND ');
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT * FROM `" . $this->_sPrefix . "transactions_pending` WHERE 1 " . $sWhereClause . $sLimitClause;
    #         return call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertOrderPending

  ## Parametros
    - iClientId,sType,sProvider,aCartInfo,aCustom=[]

  ## Retorno
    - any
  """
  def insertOrderPending(%{}) do
    # TODO: Implementacao futura
        # public function insertOrderPending($iClientId, $sType, $sProvider, $aCartInfo, $aCustom = [])
    #     {
    #         $sItems = "";
    #         foreach($aCartInfo['items'] as $aItem) {
    #             $sItems .= $this->_oConfig->descriptorA2S(array($aItem['author_id'], $aItem['module_id'], $aItem['id'], $aItem['quantity'])) . ':';
    # 
    #             if(empty($aItem['addons']) || !is_array($aItem['addons']))
    #                 continue;
    # 
    #             foreach($aItem['addons'] as $sAddon => $aAddon)
    #                 $sItems .= $this->_oConfig->descriptorA2S(array($aAddon['author_id'], $aAddon['module_id'], $aAddon['id'], $aAddon['quantity'])) . ':';
    #         }
    # 
    #         $sCurrency = $aCartInfo['vendor_currency_code'];
    #         $sCurrencyDefault = $this->_oConfig->getDefaultCurrencyCode();
    # 
    #         $aData = ['cur_def' => $sCurrencyDefault];
    #         if(strcmp($sCurrency, $sCurrencyDefault) != 0)
    #             $aData['cur_rate'] = $this->getCurrencyExchangeRate($sCurrency);
    # 
    #         $aSet = [
    #             'client_id' => $iClientId,
    #             'seller_id' => $aCartInfo['vendor_id'],
    #             'type' => $sType, 
    #             'provider' => $sProvider,
    #             'items' => trim($sItems, ':'),
    #             'customs' => !empty($aCustom) && is_array($aCustom) ? serialize($aCustom) : '',
    #             'amount' => $aCartInfo['items_price'],
    #             'currency' => $sCurrency,
    #             'data' => !empty($aData) ? serialize($aData) : ''
    #         ];
    # 
    #         return (int)$this->query("INSERT INTO `" . $this->_sPrefix . "transactions_pending` SET " . $this->arrayToSQL($aSet) . ", `date`=UNIX_TIMESTAMP()") > 0 ? $this->lastId() : 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateOrderPending

  ## Parametros
    - iId,aValues

  ## Retorno
    - any
  """
  def updateOrderPending(%{}) do
    # TODO: Implementacao futura
        # public function updateOrderPending($iId, $aValues)
    #     {
    #         $sQuery = $this->prepare("UPDATE `" . $this->_sPrefix . "transactions_pending` SET " . $this->arrayToSQL($aValues) . " WHERE `id`=?", $iId);
    #         return (int)$this->query($sQuery) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteOrderPending

  ## Parametros
    - mixedId

  ## Retorno
    - any
  """
  def deleteOrderPending(%{}) do
    # TODO: Implementacao futura
        # public function deleteOrderPending($mixedId)
    #     {
    #     	if(!is_array($mixedId))
    #     		$mixedId = array($mixedId);
    # 
    #         return (int)$this->query("DELETE FROM `" . $this->_sPrefix . "transactions_pending` WHERE `id` IN (" . $this->implode_escape($mixedId) . ")") > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrderProcessed

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getOrderProcessed(%{}) do
    # TODO: Implementacao futura
        # public function getOrderProcessed($aParams)
    #     {
    #     	$aMethod = array('name' => 'getRow', 'params' => array(0 => 'query'));
    # 
    #         $sSelectClause = "`tt`.`id`, `tt`.`license`, `ttp`.`type`, `tt`.`client_id`, `tt`.`seller_id`, `tt`.`author_id`, `tt`.`module_id`, `tt`.`item_id`, `tt`.`item_count`, `tt`.`amount`, `tt`.`date`, `ttp`.`order`, `ttp`.`error_msg`, `ttp`.`provider`";
    #         $sWhereClause = $sGroupClause = "";
    # 
    #         switch($aParams['type']) {
    #             case 'id':
    #             	$aMethod['params'][1] = array(
    #                     'id' => $aParams['id']
    #                 );
    # 
    #                 $sWhereClause = " AND `tt`.`id`=:id";
    #                 break;
    # 
    #             case 'new':
    #                 $aMethod['name'] = 'getAll';
    #                 $aMethod['params'][1] = array(
    #                     'seller_id' => $aParams['seller_id']
    #                 );
    # 
    #                 $sWhereClause = " AND `tt`.`seller_id`=:seller_id AND `tt`.`new`='1'";
    #                 break;
    # 
    #             case 'pending_id':
    #                 if(empty($aParams['with_key'])) {
    #                     $aMethod['name'] = 'getAll';
    #                     $aMethod['params'][1] = array(
    #                         'pending_id' => $aParams['pending_id']
    #                     );
    #                 }
    #                 else {
    #                     $aMethod['name'] = 'getAllWithKey';
    #                     $aMethod['params'][1] = $aParams['with_key'];
    #                     $aMethod['params'][2] = array(
    #                         'pending_id' => $aParams['pending_id']
    #                     );
    #                 }
    # 
    #                 $sWhereClause = " AND `tt`.`pending_id`=:pending_id";
    #                 break;
    # 
    #             case 'clients':
    #                 $aMethod['name'] = 'getColumn';
    #                 $aMethod['params'][1] = array(
    #                     'seller_id' => $aParams['seller_id']
    #                 );
    # 
    #                 $sSelectClause = "DISTINCT `tt`.`client_id`";
    #                 $sWhereClause = " AND `tt`.`seller_id`=:seller_id";
    #                 break;
    # 
    #             case 'authors':
    #                 $aMethod['name'] = 'getColumn';
    #                 $aMethod['params'][1] = array(
    #                     'seller_id' => $aParams['seller_id']
    #                 );
    # 
    #                 $sSelectClause = "DISTINCT `tt`.`author_id`";
    #                 $sWhereClause = " AND `tt`.`seller_id`=:seller_id";
    #                 break;
    # 
    #             case 'license':
    #                 $aMethod['name'] = 'getAll';
    #                 $aMethod['params'][1] = array(
    #                     'license' => $aParams['license']
    #                 );
    # 
    #                 $sWhereClause = " AND `tt`.`license`=:license";
    #                 break;
    #             
    #             case 'income':
    #                 $aMethod['name'] = 'getAll';
    #                 $aMethod['params'][1] = array(
    #                     'period_start' => $aParams['period_start'],
    #                     'period_end' => $aParams['period_end']
    #                 );
    # 
    #                 $sSelectClause = '`tt`.`author_id` AS `id`, SUM(`tt`.`amount`) AS `amount`';
    #                 $sWhereClause = ' AND `tt`.`date`>=:period_start AND `tt`.`date`<=:period_end';
    #                 $sGroupClause = '`tt`.`author_id`';
    #                 break;
    # 
    #             case 'mixed':
    #                 $aMethod['name'] = 'getAll';
    # 
    #                 $sWhereClause = ' AND ' . $this->arrayToSQL($aParams['conditions'], ' AND ');
    #                 break;
    # 
    #         }
    # 
    #         if(!empty($sGroupClause))
    #             $sGroupClause = ' GROUP BY ' . $sGroupClause;
    # 
    #         $aMethod['params'][0] = "SELECT
    #                 " . $sSelectClause . "
    #             FROM `" . $this->_sPrefix . "transactions` AS `tt`
    #             LEFT JOIN `" . $this->_sPrefix . "transactions_pending` AS `ttp` ON `tt`.`pending_id`=`ttp`.`id`
    #             WHERE 1" . $sWhereClause . $sGroupClause;
    # 
    #         return call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertOrderProcessed

  ## Parametros
    - aValues

  ## Retorno
    - any
  """
  def insertOrderProcessed(%{}) do
    # TODO: Implementacao futura
        # public function insertOrderProcessed($aValues)
    #     {
    #         return $this->query("INSERT INTO `" . $this->_sPrefix . "transactions` SET " . $this->arrayToSQL($aValues) . ", `date`=UNIX_TIMESTAMP()");
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateOrderProcessed

  ## Parametros
    - iId,aValues

  ## Retorno
    - any
  """
  def updateOrderProcessed(%{}) do
    # TODO: Implementacao futura
        # public function updateOrderProcessed($iId, $aValues)
    #     {        
    #         return $this->updateOrdersProcessed($aValues, array('id' => $iId));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateOrdersProcessed

  ## Parametros
    - aValues,aWhere

  ## Retorno
    - any
  """
  def updateOrdersProcessed(%{}) do
    # TODO: Implementacao futura
        # public function updateOrdersProcessed($aValues, $aWhere)
    #     {
    #         if(empty($aValues) || !is_array($aValues) || empty($aWhere) || !is_array($aWhere))
    #             return false;
    # 
    #         return (int)$this->query("UPDATE `" . $this->_sPrefix . "transactions` SET " . $this->arrayToSQL($aValues) . " WHERE " . $this->arrayToSQL($aWhere, ' AND ')) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteOrderProcessed

  ## Parametros
    - mixedId

  ## Retorno
    - any
  """
  def deleteOrderProcessed(%{}) do
    # TODO: Implementacao futura
        # public function deleteOrderProcessed($mixedId)
    #     {
    #     	if(!is_array($mixedId))
    #             $mixedId = array($mixedId);
    # 
    #         return (int)$this->query("DELETE FROM `" . $this->_sPrefix . "transactions` WHERE `id` IN (" . $this->implode_escape($mixedId) . ")") > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrderHistory

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getOrderHistory(%{}) do
    # TODO: Implementacao futura
        # public function getOrderHistory($aParams)
    #     {
    #         return $this->getOrderProcessed($aParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrderSubscription

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getOrderSubscription(%{}) do
    # TODO: Implementacao futura
        # public function getOrderSubscription($aParams)
    #     {
    #         return $this->getOrderPending($aParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubscription

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getSubscription(%{}) do
    # TODO: Implementacao futura
        # public function getSubscription($aParams)
    #     {
    #     	$aMethod = array('name' => 'getAll', 'params' => array(0 => 'query'));
    # 
    #         $sSelectClause = "`ts`.*";
    #     	$sJoinClause = $sWhereClause = $sLimitClause = '';
    #         switch($aParams['type']) {
    #             case 'pending_id':
    #                 $aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = array(
    #                     'pending_id' => $aParams['pending_id']
    #                 );
    # 
    #                 $sWhereClause = " AND `ts`.`pending_id`=:pending_id";
    #                 $sLimitClause = " LIMIT 1";
    #                 break;
    # 
    #             case 'mixed':
    #                 $sWhereClause = " AND " . $this->arrayToSQL($aParams['conditions'], ' AND ');
    #                 break;
    # 
    #             case 'mixed_ext':
    #                 $sSelectClause .= ", `ttp`.`client_id`, `ttp`.`seller_id`, `ttp`.`type`, `ttp`.`provider`, `ttp`.`order`";
    #                 $sJoinClause = "LEFT JOIN `" . $this->_sPrefix . "transactions_pending` AS `ttp` ON `ts`.`pending_id`=`ttp`.`id`";
    #                 $sWhereClause = " AND " . $this->arrayToSQL($aParams['conditions'], ' AND ');
    #                 break;
    # 
    #             case 'time_tracker':
    #                 $aMethod['params'][1] = array(
    #                     'status_active' => $aParams['status_active'],
    #                     'status_trial' => $aParams['status_trial'],
    #                     'status_unpaid' => $aParams['status_unpaid'],
    #                     'pay_attempts_max' => $aParams['pay_attempts_max'],
    #                     'pay_attempts_interval' => $aParams['pay_attempts_interval']
    #                 );
    # 
    #                 $sSelectClause .= ", `ttp`.`client_id`, `ttp`.`seller_id`, `ttp`.`type`, `ttp`.`provider`, `ttp`.`amount`, `ttp`.`order`";
    #                 $sJoinClause = "LEFT JOIN `" . $this->_sPrefix . "transactions_pending` AS `ttp` ON `ts`.`pending_id`=`ttp`.`id` INNER JOIN `" . $this->_sPrefix . "providers` AS `tp` ON `ttp`.`provider`=`tp`.`name` AND `tp`.`time_tracker`='1'";
    #                 $sWhereClause = " AND `ts`.`date_next`<>0 AND `ts`.`date_next`<=UNIX_TIMESTAMP() AND (`ts`.`status`=:status_active OR `ts`.`status`=:status_trial OR (`ts`.`status`=:status_unpaid AND `ts`.`pay_attempts`<:pay_attempts_max AND DATE_ADD(FROM_UNIXTIME(`ts`.`date_next`), INTERVAL `ts`.`pay_attempts`*:pay_attempts_interval SECOND)<=NOW()))";
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . " FROM `" . $this->_sPrefix . "subscriptions` AS `ts` " . $sJoinClause . " WHERE 1 " . $sWhereClause . $sLimitClause;
    #         return call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isSubscriptionByPending

  ## Parametros
    - iPending

  ## Retorno
    - any
  """
  def isSubscriptionByPending(%{}) do
    # TODO: Implementacao futura
        # public function isSubscriptionByPending($iPending)
    #     {
    #     	$aSubscription = $this->getSubscription(array(
    #             'type' => 'pending_id', 
    #             'pending_id' => $iPending
    #     	));
    # 
    #     	return !empty($aSubscription) && is_array($aSubscription);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertSubscription

  ## Parametros
    - aValues

  ## Retorno
    - any
  """
  def insertSubscription(%{}) do
    # TODO: Implementacao futura
        # public function insertSubscription($aValues)
    #     {
    #         if(empty($aValues) || !is_array($aValues))
    #             return false;
    # 
    #         $sSetClause = $this->arrayToSQL($aValues);
    #         if(empty($aValues['date_add']))
    #             $sSetClause .= ", `date_add`=UNIX_TIMESTAMP()";
    # 
    #         return (int)$this->query("INSERT INTO `" . $this->_sPrefix . "subscriptions` SET " . $sSetClause) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateSubscription

  ## Parametros
    - aValues,aWhere

  ## Retorno
    - any
  """
  def updateSubscription(%{}) do
    # TODO: Implementacao futura
        # public function updateSubscription($aValues, $aWhere)
    #     {
    #         if(empty($aValues) || !is_array($aValues) || empty($aWhere) || !is_array($aWhere))
    #             return false;
    # 
    #         return (int)$this->query("UPDATE `" . $this->_sPrefix . "subscriptions` SET " . $this->arrayToSQL($aValues) . " WHERE " . $this->arrayToSQL($aWhere, ' AND ')) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteSubscription

  ## Parametros
    - mixedId,sReason

  ## Retorno
    - any
  """
  def deleteSubscription(%{}) do
    # TODO: Implementacao futura
        # public function deleteSubscription($mixedId, $sReason)
    #     {
    #     	if(!is_array($mixedId))
    #             $mixedId = array($mixedId);
    # 
    #         //--- Move to deleted subscriptions table.   
    #     	$sQuery = "INSERT IGNORE INTO `" . $this->_sPrefix . "subscriptions_deleted` SELECT *, :reason AS `reason`, UNIX_TIMESTAMP() AS `deleted` FROM `" . $this->_sPrefix . "subscriptions` WHERE `id` IN (" . $this->implode_escape($mixedId) . ")";
    #         $this->query($sQuery, array(
    #             'reason' => $sReason
    #         ));
    # 
    #         return (int)$this->query("DELETE FROM `" . $this->_sPrefix . "subscriptions` WHERE `id` IN (" . $this->implode_escape($mixedId) . ")") > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onProfileDelete

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def onProfileDelete(%{}) do
    # TODO: Implementacao futura
        # public function onProfileDelete($iId)
    #     {
    #     	$sQuery = $this->prepare("DELETE FROM `" . $this->_sPrefix . "cart` WHERE `client_id`=?", $iId);
    #     	$this->query($sQuery);
    # 
    #     	$sQuery = $this->prepare("DELETE FROM `" . $this->_sPrefix . "user_values` WHERE `user_id`=?", $iId);
    #     	$this->query($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertInvoice

  ## Parametros
    - aValues

  ## Retorno
    - any
  """
  def insertInvoice(%{}) do
    # TODO: Implementacao futura
        # public function insertInvoice($aValues)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         return $this->query("INSERT INTO `" . $CNF['TABLE_INVOICES'] . "` SET " . $this->arrayToSQL($aValues));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateInvoice

  ## Parametros
    - mixedId,aValues

  ## Retorno
    - any
  """
  def updateInvoice(%{}) do
    # TODO: Implementacao futura
        # public function updateInvoice($mixedId, $aValues)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         
    #         if(!is_array($mixedId))
    #             $mixedId = array($mixedId);
    # 
    #         return (int)$this->query("UPDATE `" . $CNF['TABLE_INVOICES'] . "` SET " . $this->arrayToSQL($aValues) . " WHERE `id` IN (" . $this->implode_escape($mixedId) . ')') > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteInvoice

  ## Parametros
    - mixedId

  ## Retorno
    - any
  """
  def deleteInvoice(%{}) do
    # TODO: Implementacao futura
        # public function deleteInvoice($mixedId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #     	if(!is_array($mixedId))
    #             $mixedId = array($mixedId);
    # 
    #         return (int)$this->query("DELETE FROM `" . $CNF['TABLE_INVOICES'] . "` WHERE `id` IN (" . $this->implode_escape($mixedId) . ")") > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStrpPaymentPending

  ## Parametros
    - sSubscriptionId

  ## Retorno
    - any
  """
  def getStrpPaymentPending(%{}) do
    # TODO: Implementacao futura
        # public function getStrpPaymentPending($sSubscriptionId)
    #     {
    #         $aResult = $this->getRow("SELECT * FROM `" . $this->_sPrefix . "stripe_payments_pending` WHERE `subscription_id`=:subscription_id", [
    #             'subscription_id' => $sSubscriptionId
    #         ]);
    # 
    #         if(!empty($aResult) && is_array($aResult))
    #             $this->deleteStrpPaymentPending($sSubscriptionId);
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertStrpPaymentPending

  ## Parametros
    - sSubscriptionId,fAmount,sCurrency

  ## Retorno
    - any
  """
  def insertStrpPaymentPending(%{}) do
    # TODO: Implementacao futura
        # public function insertStrpPaymentPending($sSubscriptionId, $fAmount, $sCurrency)
    #     {
    #         return $this->query("INSERT IGNORE INTO `" . $this->_sPrefix . "stripe_payments_pending` SET " . $this->arrayToSQL([
    #             'subscription_id' => $sSubscriptionId,
    #             'amount' => $fAmount,
    #             'currency' => $sCurrency
    #         ])) !== false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteStrpPaymentPending

  ## Parametros
    - sSubscriptionId

  ## Retorno
    - any
  """
  def deleteStrpPaymentPending(%{}) do
    # TODO: Implementacao futura
        # public function deleteStrpPaymentPending($sSubscriptionId)
    #     {
    #         return $this->query("DELETE FROM `" . $this->_sPrefix . "stripe_payments_pending` WHERE `subscription_id`=:subscription_id", [
    #             'subscription_id' => $sSubscriptionId
    #         ]) !== false;
    #     }
    :ok
  end

end
