
defmodule DeeperHub.Inc.Classes.BxDolPayments do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolPayments.php
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
        # protected function __construct()
    #     {
    #         parent::__construct();
    # 
    #         $this->_oDb = new BxDolPaymentsQuery();
    # 
    #         $this->_aObjects = $this->_oDb->getObjects();
    #         $this->_sActive = getParam('sys_default_payment');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInstance

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getInstance(%{}) do
    # TODO: Implementacao futura
        # public function getInstance()
    #     {
    #         if(!isset($GLOBALS['bxDolClasses']['BxDolPayments']))
    #             $GLOBALS['bxDolClasses']['BxDolPayments'] = new BxDolPayments();
    # 
    #         return $GLOBALS['bxDolClasses']['BxDolPayments'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setActive

  ## Parametros
    - sActive

  ## Retorno
    - any
  """
  def setActive(%{}) do
    # TODO: Implementacao futura
        # public function setActive($sActive)
    #     {
    #         $this->_sActive = $sActive;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getActive

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getActive(%{}) do
    # TODO: Implementacao futura
        # public function getActive()
    #     {
    #     	return $this->_sActive;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getActiveObject

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getActiveObject(%{}) do
    # TODO: Implementacao futura
        # public function getActiveObject()
    #     {
    #         if(!$this->isActive())
    #             return null;
    # 
    #     	return BxDolModule::getInstance($this->_sActive);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isActive

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isActive(%{}) do
    # TODO: Implementacao futura
        # public function isActive()
    #     {
    #     	if(empty($this->_sActive))
    #             return false;
    # 
    #     	if(!BxDolModuleQuery::getInstance()->isModuleByName($this->_sActive))
    #             return false;
    # 
    #     	return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isCreditsOnly

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isCreditsOnly(%{}) do
    # TODO: Implementacao futura
        # public function isCreditsOnly()
    #     {
    #     	if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'is_credits_only'))
    #             return false;
    # 
    #         return bx_srv($this->_sActive, 'is_credits_only');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getDetailsUrl

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getDetailsUrl(%{}) do
    # TODO: Implementacao futura
        # public function getDetailsUrl()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_details_url', 'Details'))
    #             return '';
    # 
    #     	return bx_srv($this->_sActive, 'get_details_url', array(), 'Details');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCurrencyInfo

  ## Parametros
    - iVendorId=0

  ## Retorno
    - any
  """
  def getCurrencyInfo(%{}) do
    # TODO: Implementacao futura
        # public function getCurrencyInfo($iVendorId = 0)
    #     {
    #     	if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_currency_info'))
    #             return [];
    # 
    #     	$aSrvParams = [$iVendorId];
    #         return bx_srv($this->_sActive, 'get_currency_info', $aSrvParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCurrencyCode

  ## Parametros
    - iVendorId=0

  ## Retorno
    - any
  """
  def getCurrencyCode(%{}) do
    # TODO: Implementacao futura
        # public function getCurrencyCode($iVendorId = 0)
    #     {
    #     	if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_currency_code'))
    #             return '';
    # 
    #     	$aSrvParams = [$iVendorId];
    #         return bx_srv($this->_sActive, 'get_currency_code', $aSrvParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCurrencySign

  ## Parametros
    - iVendorId=0

  ## Retorno
    - any
  """
  def getCurrencySign(%{}) do
    # TODO: Implementacao futura
        # public function getCurrencySign($iVendorId = 0)
    #     {
    #     	if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_currency_sign'))
    #             return '';
    # 
    #     	$aSrvParams = [$iVendorId];
    #         return bx_srv($this->_sActive, 'get_currency_sign', $aSrvParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP convert

  ## Parametros
    - fAmount,sCurrencyFrom,sCurrencyTo

  ## Retorno
    - any
  """
  def convert(%{}) do
    # TODO: Implementacao futura
        # public function convert($fAmount, $sCurrencyFrom, $sCurrencyTo)
    #     {
    #         if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'convert'))
    #             return false;
    # 
    #     	$aSrvParams = [$fAmount, $sCurrencyFrom, $sCurrencyTo];
    #         return bx_srv($this->_sActive, 'convert', $aSrvParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAcceptingPayments

  ## Parametros
    - iVendorId,sPaymentType=''

  ## Retorno
    - any
  """
  def isAcceptingPayments(%{}) do
    # TODO: Implementacao futura
        # public function isAcceptingPayments($iVendorId, $sPaymentType = '')
    #     {
    #     	if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'is_accepting_payments'))
    #             return false;
    # 
    #     	$aSrvParams = array($iVendorId, $sPaymentType);
    #         return bx_srv($this->_sActive, 'is_accepting_payments', $aSrvParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isPaymentProvider

  ## Parametros
    - iVendorId,sVendorProvider,sPaymentType=''

  ## Retorno
    - any
  """
  def isPaymentProvider(%{}) do
    # TODO: Implementacao futura
        # public function isPaymentProvider($iVendorId, $sVendorProvider, $sPaymentType = '')
    #     {
    #     	return $this->isProviderOptions($iVendorId, $sVendorProvider);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPaymentProvider

  ## Parametros
    - iVendorId,sVendorProvider,sPaymentType=''

  ## Retorno
    - any
  """
  def getPaymentProvider(%{}) do
    # TODO: Implementacao futura
        # public function getPaymentProvider($iVendorId, $sVendorProvider, $sPaymentType = '')
    #     {
    #     	return $this->getProviderOptions($iVendorId, $sVendorProvider, $sPaymentType);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isProviderOptions

  ## Parametros
    - iVendorId,sVendorProvider,sPaymentType=''

  ## Retorno
    - any
  """
  def isProviderOptions(%{}) do
    # TODO: Implementacao futura
        # public function isProviderOptions($iVendorId, $sVendorProvider, $sPaymentType = '')
    #     {
    #         if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'is_provider_options'))
    #             return false;
    # 
    #         $aSrvParams = array($iVendorId, $sVendorProvider, $sPaymentType);
    #         return bx_srv($this->_sActive, 'is_provider_options', $aSrvParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProvider

  ## Parametros
    - sProvider,mixedVendorId=BX_PAYMENT_EMPTY_ID

  ## Retorno
    - any
  """
  def getProvider(%{}) do
    # TODO: Implementacao futura
        # public function getProvider($sProvider, $mixedVendorId = BX_PAYMENT_EMPTY_ID)
    #     {
    #         if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_provider'))
    #             return false;
    # 
    #         $aSrvParams = array($sProvider, $mixedVendorId);
    #         return bx_srv($this->_sActive, 'get_provider', $aSrvParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProviderOptions

  ## Parametros
    - iVendorId,sVendorProvider,sPaymentType=''

  ## Retorno
    - any
  """
  def getProviderOptions(%{}) do
    # TODO: Implementacao futura
        # public function getProviderOptions($iVendorId, $sVendorProvider, $sPaymentType = '')
    #     {
    #         if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_provider_options'))
    #             return false;
    # 
    #         $aSrvParams = array($iVendorId, $sVendorProvider, $sPaymentType);
    #         return bx_srv($this->_sActive, 'get_provider_options', $aSrvParams);
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
    #         if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_modules_with_payments'))
    #             return false;
    # 
    #         return bx_srv($this->_sActive, 'get_modules_with_payments', array());
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
        # public function getProductsNames($iVendor = 0, $iLimit = 1000)
    #     {
    #         $aRet = array();
    #         $aModules = $this->getModulesWithPayments();
    #         foreach ($aModules as $sModule) {
    #             if(!BxDolRequest::serviceExists($sModule, 'get_products_names'))
    #                 continue;
    #             $aKeys = bx_srv($sModule, 'get_products_names', array($iVendor, $iLimit));
    #             if (!$aKeys)
    #                 continue;
    #             $aValues = array_fill(0, count($aKeys), $sModule);
    #             $aRet = array_merge($aRet, array_combine($aKeys, $aValues));
    #         }
    # 
    #         return $aRet;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPayments

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getPayments(%{}) do
    # TODO: Implementacao futura
        # public function getPayments()
    #     {
    #         $aPayments = array(
    #             '' => _t('_Select_one')
    #         );
    #         foreach($this->_aObjects as $aObject) {
    #             if(empty($aObject) || !is_array($aObject))
    #                 continue;
    # 
    #             $aPayments[$aObject['object']] = _t($aObject['title']);
    #         }
    # 
    #         return $aPayments;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateDependentModules

  ## Parametros
    - sModule='all',bInstall=true

  ## Retorno
    - any
  """
  def updateDependentModules(%{}) do
    # TODO: Implementacao futura
        # public function updateDependentModules($sModule = 'all', $bInstall = true)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'update_dependent_modules'))
    #             return;
    # 
    #         bx_srv($this->_sActive, 'update_dependent_modules', array($sModule, $bInstall));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProvidersCart

  ## Parametros
    - iVendorId

  ## Retorno
    - any
  """
  def getProvidersCart(%{}) do
    # TODO: Implementacao futura
        # public function getProvidersCart($iVendorId)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_providers_cart'))
    #     		return array();
    # 
    #     	$aSrvParams = array($iVendorId);
    #         return bx_srv($this->_sActive, 'get_providers_cart', $aSrvParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOption

  ## Parametros
    - sOption

  ## Retorno
    - any
  """
  def getOption(%{}) do
    # TODO: Implementacao futura
        # public function getOption($sOption)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_option'))
    #             return '';
    # 
    #     	return bx_srv($this->_sActive, 'get_option', array($sOption));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrdersUrl

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getOrdersUrl(%{}) do
    # TODO: Implementacao futura
        # public function getOrdersUrl()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_orders_url', 'Orders'))
    #             return '';
    # 
    #     	return bx_srv($this->_sActive, 'get_orders_url', array(), 'Orders');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrdersCount

  ## Parametros
    - sType

  ## Retorno
    - any
  """
  def getOrdersCount(%{}) do
    # TODO: Implementacao futura
        # public function getOrdersCount($sType)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_orders_count', 'Orders'))
    #             return array();
    # 
    #         $aSrvParams = array($sType);
    #         return bx_srv($this->_sActive, 'get_orders_count', $aSrvParams, 'Orders');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrdersInfo

  ## Parametros
    - aConditions

  ## Retorno
    - any
  """
  def getOrdersInfo(%{}) do
    # TODO: Implementacao futura
        # public function getOrdersInfo($aConditions)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_orders_info', 'Orders'))
    #             return array();
    # 
    #         $aSrvParams = array($aConditions);
    #         return bx_srv($this->_sActive, 'get_orders_info', $aSrvParams, 'Orders');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPendingOrdersUrl

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getPendingOrdersUrl(%{}) do
    # TODO: Implementacao futura
        # public function getPendingOrdersUrl()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_pending_orders_url', 'Orders'))
    #             return '';
    # 
    #     	return bx_srv($this->_sActive, 'get_pending_orders_url', array(), 'Orders');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPendingOrdersInfo

  ## Parametros
    - aConditions

  ## Retorno
    - any
  """
  def getPendingOrdersInfo(%{}) do
    # TODO: Implementacao futura
        # public function getPendingOrdersInfo($aConditions)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_pending_orders_info', 'Orders'))
    #             return array();
    # 
    #         $aSrvParams = array($aConditions);
    #         return bx_srv($this->_sActive, 'get_pending_orders_info', $aSrvParams, 'Orders');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubscriptionOrdersInfo

  ## Parametros
    - aConditions

  ## Retorno
    - any
  """
  def getSubscriptionOrdersInfo(%{}) do
    # TODO: Implementacao futura
        # public function getSubscriptionOrdersInfo($aConditions)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_subscription_orders_info', 'Subscriptions'))
    #             return array();
    # 
    #         $aSrvParams = array($aConditions);
    #         return bx_srv($this->_sActive, 'get_subscription_orders_info', $aSrvParams, 'Subscriptions');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubscriptionsInfo

  ## Parametros
    - aConditions,bCheckInProvider=false

  ## Retorno
    - any
  """
  def getSubscriptionsInfo(%{}) do
    # TODO: Implementacao futura
        # public function getSubscriptionsInfo($aConditions, $bCheckInProvider = false)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_subscriptions_info', 'Subscriptions'))
    #             return array();
    # 
    #         $aSrvParams = array($aConditions, $bCheckInProvider);
    #         return bx_srv($this->_sActive, 'get_subscriptions_info', $aSrvParams, 'Subscriptions');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInvoicesUrl

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getInvoicesUrl(%{}) do
    # TODO: Implementacao futura
        # public function getInvoicesUrl()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_invoices_url', 'Commissions'))
    #             return '';
    # 
    #     	return bx_srv($this->_sActive, 'get_invoices_url', array(), 'Commissions');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInvoicesCount

  ## Parametros
    - sType

  ## Retorno
    - any
  """
  def getInvoicesCount(%{}) do
    # TODO: Implementacao futura
        # public function getInvoicesCount($sType)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_invoices_count', 'Commissions'))
    #             return array();
    # 
    #         $aSrvParams = array($sType);
    #         return bx_srv($this->_sActive, 'get_invoices_count', $aSrvParams, 'Commissions');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartUrl

  ## Parametros
    - iVendor=0

  ## Retorno
    - any
  """
  def getCartUrl(%{}) do
    # TODO: Implementacao futura
        # public function getCartUrl($iVendor = 0)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_cart_url', 'Cart'))
    #     		return '';
    # 
    #     	return bx_srv($this->_sActive, 'get_cart_url', array($iVendor), 'Cart');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartItemsCount

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getCartItemsCount(%{}) do
    # TODO: Implementacao futura
        # public function getCartItemsCount()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_cart_items_count', 'Cart'))
    #             return 0;
    # 
    #         $aSrvParams = array();
    #         return bx_srv($this->_sActive, 'get_cart_items_count', $aSrvParams, 'Cart');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartItems

  ## Parametros
    - iVendorId,iModuleId

  ## Retorno
    - any
  """
  def getCartItems(%{}) do
    # TODO: Implementacao futura
        # public function getCartItems($iVendorId, $iModuleId)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_cart_items', 'Cart'))
    #             return 0;
    # 
    #         $aSrvParams = array($iVendorId, $iModuleId);
    #         return bx_srv($this->_sActive, 'get_cart_items', $aSrvParams, 'Cart');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartItemDescriptor

  ## Parametros
    - iVendorId,iModuleId,iItemId,iItemCount=false

  ## Retorno
    - any
  """
  def getCartItemDescriptor(%{}) do
    # TODO: Implementacao futura
        # public function getCartItemDescriptor($iVendorId, $iModuleId, $iItemId, $iItemCount = false)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_cart_item_descriptor', 'Cart'))
    #             return '';
    # 
    #     	$aSrvParams = array($iVendorId, $iModuleId, $iItemId, $iItemCount);
    #         return bx_srv($this->_sActive, 'get_cart_item_descriptor', $aSrvParams, 'Cart');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartJs

  ## Parametros
    - sType='',iVendorId=0

  ## Retorno
    - any
  """
  def getCartJs(%{}) do
    # TODO: Implementacao futura
        # public function getCartJs($sType = '', $iVendorId = 0)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_cart_js', 'Cart'))
    #             return '';
    # 
    #         $aSrvParams = array($sType, $iVendorId);
    #         return bx_srv($this->_sActive, 'get_cart_js', $aSrvParams, 'Cart');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubscriptionsUrl

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getSubscriptionsUrl(%{}) do
    # TODO: Implementacao futura
        # public function getSubscriptionsUrl()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_subscriptions_url', 'Subscriptions'))
    #             return '';
    # 
    #     	return bx_srv($this->_sActive, 'get_subscriptions_url', array(), 'Subscriptions');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubscribeUrl

  ## Parametros
    - iVendorId,sVendorProvider,mixedModuleId,iItemId,iItemCount=1

  ## Retorno
    - any
  """
  def getSubscribeUrl(%{}) do
    # TODO: Implementacao futura
        # public function getSubscribeUrl($iVendorId, $sVendorProvider, $mixedModuleId, $iItemId, $iItemCount = 1)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_subscribe_url', 'Subscriptions'))
    #             return '';
    # 
    #     	return bx_srv($this->_sActive, 'get_subscribe_url', array($iVendorId, $sVendorProvider, $mixedModuleId, $iItemId, $iItemCount), 'Subscriptions');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP sendSubscriptionExpirationLetters

  ## Parametros
    - iPendingId,sOrderId

  ## Retorno
    - any
  """
  def sendSubscriptionExpirationLetters(%{}) do
    # TODO: Implementacao futura
        # public function sendSubscriptionExpirationLetters($iPendingId, $sOrderId)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'send_subscription_expiration_letters', 'Subscriptions'))
    #             return '';
    # 
    #         $aSrvParams = array($iPendingId, $sOrderId);
    #         return bx_srv($this->_sActive, 'send_subscription_expiration_letters', $aSrvParams, 'Subscriptions');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP captureAuthorizedCheckoutSingle

  ## Parametros
    - sOrder

  ## Retorno
    - any
  """
  def captureAuthorizedCheckoutSingle(%{}) do
    # TODO: Implementacao futura
        # public function captureAuthorizedCheckoutSingle($sOrder)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'capture_authorized_checkout'))
    #             return '';
    # 
    #         $aSrvParams = array(BX_PAYMENT_TYPE_SINGLE, $sOrder);
    #         return bx_srv($this->_sActive, 'capture_authorized_checkout', $aSrvParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP captureAuthorizedCheckoutRecurring

  ## Parametros
    - sOrder

  ## Retorno
    - any
  """
  def captureAuthorizedCheckoutRecurring(%{}) do
    # TODO: Implementacao futura
        # public function captureAuthorizedCheckoutRecurring($sOrder)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'capture_authorized_checkout'))
    #             return '';
    # 
    #         $aSrvParams = array(BX_PAYMENT_TYPE_RECURRING, $sOrder);
    #         return bx_srv($this->_sActive, 'capture_authorized_checkout', $aSrvParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP cancelSubscription

  ## Parametros
    - sOrderId

  ## Retorno
    - any
  """
  def cancelSubscription(%{}) do
    # TODO: Implementacao futura
        # public function cancelSubscription($sOrderId)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'cancel', 'Subscriptions'))
    #             return false;
    # 
    #         $aSrvParams = [$sOrderId];
    #         return bx_srv($this->_sActive, 'cancel', $aSrvParams, 'Subscriptions');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP processOrder

  ## Parametros
    - iSellerId,iClientId,iModuleId,aItems,sType,sOrder

  ## Retorno
    - any
  """
  def processOrder(%{}) do
    # TODO: Implementacao futura
        # public function processOrder($iSellerId, $iClientId, $iModuleId, $aItems, $sType, $sOrder)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'process_order', 'Orders'))
    #             return false;
    # 
    #         $aSrvParams = array($iSellerId, $iClientId, $iModuleId, $aItems, $sType, $sOrder);
    #         return bx_srv($this->_sActive, 'process_order', $aSrvParams, 'Orders');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP processOrderByPending

  ## Parametros
    - iPendingId,sOrder

  ## Retorno
    - any
  """
  def processOrderByPending(%{}) do
    # TODO: Implementacao futura
        # public function processOrderByPending($iPendingId, $sOrder)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'process_order_by_pending', 'Orders'))
    #             return false;
    # 
    #         $aSrvParams = array($iPendingId, $sOrder);
    #         return bx_srv($this->_sActive, 'process_order_by_pending', $aSrvParams, 'Orders');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP refundOrder

  ## Parametros
    - sOrder

  ## Retorno
    - any
  """
  def refundOrder(%{}) do
    # TODO: Implementacao futura
        # public function refundOrder($sOrder)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'refund_order', 'Orders'))
    #             return false;
    # 
    #         $aSrvParams = array($sOrder);
    #         return bx_srv($this->_sActive, 'refund_order', $aSrvParams, 'Orders');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP generateLicense

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def generateLicense(%{}) do
    # TODO: Implementacao futura
        # public function generateLicense()
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'generate_license'))
    #             return '';
    # 
    #         $aSrvParams = array();
    #         return bx_srv($this->_sActive, 'generate_license', $aSrvParams, 'Module', true);
    #     }
    :ok
  end

end
