
defmodule DeeperHub.Inc.Classes.BxDolPayments do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C:\\Users\\Admin\\deeper_hub\\una\\inc\classes\BxDolPayments.php
  """

  # Heranca de BxDolFactory

  # Implementa interfaces: iBxDolSingleton


  @doc """
  Funcao correspondente ao metodo PHP construct

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def construct(params) do
    # TODO: Implementacao futura
        # protected function __construct()
    #     {
    #         parent::__construct();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInstance

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getInstance(params) do
    # TODO: Implementacao futura
        # public function getInstance()
    #     {
    #         if(!isset($GLOBALS['bxDolClasses']['BxDolPayments']))
    #             $GLOBALS['bxDolClasses']['BxDolPayments'] = new BxDolPayments();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setActive

  ## Parametros
    - $sActive

  ## Retorno
    - any
  """
  def setActive(params) do
    # TODO: Implementacao futura
        # public function setActive($sActive)
    #     {
    #         $this->_sActive = $sActive;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getActive

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getActive(params) do
    # TODO: Implementacao futura
        # public function getActive()
    #     {
    #     	return $this->_sActive;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getActiveObject

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getActiveObject(params) do
    # TODO: Implementacao futura
        # public function getActiveObject()
    #     {
    #         if(!$this->isActive())
    #             return null;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isActive

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isActive(params) do
    # TODO: Implementacao futura
        # public function isActive()
    #     {
    #     	if(empty($this->_sActive))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isCreditsOnly

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isCreditsOnly(params) do
    # TODO: Implementacao futura
        # public function isCreditsOnly()
    #     {
    #     	if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'is_credits_only'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getDetailsUrl

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getDetailsUrl(params) do
    # TODO: Implementacao futura
        # public function getDetailsUrl()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_details_url', 'Details'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCurrencyInfo

  ## Parametros
    - $iVendorId = 0

  ## Retorno
    - any
  """
  def getCurrencyInfo(params) do
    # TODO: Implementacao futura
        # public function getCurrencyInfo($iVendorId = 0)
    #     {
    #     	if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_currency_info'))
    #             return [];
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCurrencyCode

  ## Parametros
    - $iVendorId = 0

  ## Retorno
    - any
  """
  def getCurrencyCode(params) do
    # TODO: Implementacao futura
        # public function getCurrencyCode($iVendorId = 0)
    #     {
    #     	if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_currency_code'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCurrencySign

  ## Parametros
    - $iVendorId = 0

  ## Retorno
    - any
  """
  def getCurrencySign(params) do
    # TODO: Implementacao futura
        # public function getCurrencySign($iVendorId = 0)
    #     {
    #     	if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_currency_sign'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP convert

  ## Parametros
    - $fAmount
    -  $sCurrencyFrom
    -  $sCurrencyTo

  ## Retorno
    - any
  """
  def convert(params) do
    # TODO: Implementacao futura
        # public function convert($fAmount, $sCurrencyFrom, $sCurrencyTo)
    #     {
    #         if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'convert'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAcceptingPayments

  ## Parametros
    - $iVendorId
    -  $sPaymentType = ''

  ## Retorno
    - any
  """
  def isAcceptingPayments(params) do
    # TODO: Implementacao futura
        # public function isAcceptingPayments($iVendorId, $sPaymentType = '')
    #     {
    #     	if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'is_accepting_payments'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isPaymentProvider

  ## Parametros
    - $iVendorId
    -  $sVendorProvider
    -  $sPaymentType = ''

  ## Retorno
    - any
  """
  def isPaymentProvider(params) do
    # TODO: Implementacao futura
        # public function isPaymentProvider($iVendorId, $sVendorProvider, $sPaymentType = '')
    #     {
    #     	return $this->isProviderOptions($iVendorId, $sVendorProvider);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPaymentProvider

  ## Parametros
    - $iVendorId
    -  $sVendorProvider
    -  $sPaymentType = ''

  ## Retorno
    - any
  """
  def getPaymentProvider(params) do
    # TODO: Implementacao futura
        # public function getPaymentProvider($iVendorId, $sVendorProvider, $sPaymentType = '')
    #     {
    #     	return $this->getProviderOptions($iVendorId, $sVendorProvider, $sPaymentType);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isProviderOptions

  ## Parametros
    - $iVendorId
    -  $sVendorProvider
    -  $sPaymentType = ''

  ## Retorno
    - any
  """
  def isProviderOptions(params) do
    # TODO: Implementacao futura
        # public function isProviderOptions($iVendorId, $sVendorProvider, $sPaymentType = '')
    #     {
    #         if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'is_provider_options'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProvider

  ## Parametros
    - $sProvider
    -  $mixedVendorId = BX_PAYMENT_EMPTY_ID

  ## Retorno
    - any
  """
  def getProvider(params) do
    # TODO: Implementacao futura
        # public function getProvider($sProvider, $mixedVendorId = BX_PAYMENT_EMPTY_ID)
    #     {
    #         if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_provider'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProviderOptions

  ## Parametros
    - $iVendorId
    -  $sVendorProvider
    -  $sPaymentType = ''

  ## Retorno
    - any
  """
  def getProviderOptions(params) do
    # TODO: Implementacao futura
        # public function getProviderOptions($iVendorId, $sVendorProvider, $sPaymentType = '')
    #     {
    #         if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_provider_options'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getModulesWithPayments

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getModulesWithPayments(params) do
    # TODO: Implementacao futura
        # public function getModulesWithPayments()
    #     {
    #         if(empty($this->_sActive) || !BxDolRequest::serviceExists($this->_sActive, 'get_modules_with_payments'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProductsNames

  ## Parametros
    - $iVendor = 0
    -  $iLimit = 1000

  ## Retorno
    - any
  """
  def getProductsNames(params) do
    # TODO: Implementacao futura
        # public function getProductsNames($iVendor = 0, $iLimit = 1000)
    #     {
    #         $aRet = array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPayments

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getPayments(params) do
    # TODO: Implementacao futura
        # public function getPayments()
    #     {
    #         $aPayments = array(
    #             '' => _t('_Select_one')
    #         );
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateDependentModules

  ## Parametros
    - $sModule = 'all'
    -  $bInstall = true

  ## Retorno
    - any
  """
  def updateDependentModules(params) do
    # TODO: Implementacao futura
        # public function updateDependentModules($sModule = 'all', $bInstall = true)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'update_dependent_modules'))
    #             return;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProvidersCart

  ## Parametros
    - $iVendorId

  ## Retorno
    - any
  """
  def getProvidersCart(params) do
    # TODO: Implementacao futura
        # public function getProvidersCart($iVendorId)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_providers_cart'))
    #     		return array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOption

  ## Parametros
    - $sOption

  ## Retorno
    - any
  """
  def getOption(params) do
    # TODO: Implementacao futura
        # public function getOption($sOption)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_option'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrdersUrl

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getOrdersUrl(params) do
    # TODO: Implementacao futura
        # public function getOrdersUrl()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_orders_url', 'Orders'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrdersCount

  ## Parametros
    - $sType

  ## Retorno
    - any
  """
  def getOrdersCount(params) do
    # TODO: Implementacao futura
        # public function getOrdersCount($sType)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_orders_count', 'Orders'))
    #             return array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getOrdersInfo

  ## Parametros
    - $aConditions

  ## Retorno
    - any
  """
  def getOrdersInfo(params) do
    # TODO: Implementacao futura
        # public function getOrdersInfo($aConditions)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_orders_info', 'Orders'))
    #             return array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPendingOrdersUrl

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getPendingOrdersUrl(params) do
    # TODO: Implementacao futura
        # public function getPendingOrdersUrl()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_pending_orders_url', 'Orders'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPendingOrdersInfo

  ## Parametros
    - $aConditions

  ## Retorno
    - any
  """
  def getPendingOrdersInfo(params) do
    # TODO: Implementacao futura
        # public function getPendingOrdersInfo($aConditions)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_pending_orders_info', 'Orders'))
    #             return array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubscriptionOrdersInfo

  ## Parametros
    - $aConditions

  ## Retorno
    - any
  """
  def getSubscriptionOrdersInfo(params) do
    # TODO: Implementacao futura
        # public function getSubscriptionOrdersInfo($aConditions)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_subscription_orders_info', 'Subscriptions'))
    #             return array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubscriptionsInfo

  ## Parametros
    - $aConditions
    -  $bCheckInProvider = false

  ## Retorno
    - any
  """
  def getSubscriptionsInfo(params) do
    # TODO: Implementacao futura
        # public function getSubscriptionsInfo($aConditions, $bCheckInProvider = false)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_subscriptions_info', 'Subscriptions'))
    #             return array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInvoicesUrl

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getInvoicesUrl(params) do
    # TODO: Implementacao futura
        # public function getInvoicesUrl()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_invoices_url', 'Commissions'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInvoicesCount

  ## Parametros
    - $sType

  ## Retorno
    - any
  """
  def getInvoicesCount(params) do
    # TODO: Implementacao futura
        # public function getInvoicesCount($sType)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'get_invoices_count', 'Commissions'))
    #             return array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartUrl

  ## Parametros
    - $iVendor = 0

  ## Retorno
    - any
  """
  def getCartUrl(params) do
    # TODO: Implementacao futura
        # public function getCartUrl($iVendor = 0)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_cart_url', 'Cart'))
    #     		return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartItemsCount

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getCartItemsCount(params) do
    # TODO: Implementacao futura
        # public function getCartItemsCount()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_cart_items_count', 'Cart'))
    #             return 0;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartItems

  ## Parametros
    - $iVendorId
    -  $iModuleId

  ## Retorno
    - any
  """
  def getCartItems(params) do
    # TODO: Implementacao futura
        # public function getCartItems($iVendorId, $iModuleId)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_cart_items', 'Cart'))
    #             return 0;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartItemDescriptor

  ## Parametros
    - $iVendorId
    -  $iModuleId
    -  $iItemId
    -  $iItemCount = false

  ## Retorno
    - any
  """
  def getCartItemDescriptor(params) do
    # TODO: Implementacao futura
        # public function getCartItemDescriptor($iVendorId, $iModuleId, $iItemId, $iItemCount = false)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_cart_item_descriptor', 'Cart'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCartJs

  ## Parametros
    - $sType = ''
    -  $iVendorId = 0

  ## Retorno
    - any
  """
  def getCartJs(params) do
    # TODO: Implementacao futura
        # public function getCartJs($sType = '', $iVendorId = 0)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_cart_js', 'Cart'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubscriptionsUrl

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getSubscriptionsUrl(params) do
    # TODO: Implementacao futura
        # public function getSubscriptionsUrl()
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_subscriptions_url', 'Subscriptions'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubscribeUrl

  ## Parametros
    - $iVendorId
    -  $sVendorProvider
    -  $mixedModuleId
    -  $iItemId
    -  $iItemCount = 1

  ## Retorno
    - any
  """
  def getSubscribeUrl(params) do
    # TODO: Implementacao futura
        # public function getSubscribeUrl($iVendorId, $sVendorProvider, $mixedModuleId, $iItemId, $iItemCount = 1)
    #     {
    #     	if(!BxDolRequest::serviceExists($this->_sActive, 'get_subscribe_url', 'Subscriptions'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP sendSubscriptionExpirationLetters

  ## Parametros
    - $iPendingId
    -  $sOrderId

  ## Retorno
    - any
  """
  def sendSubscriptionExpirationLetters(params) do
    # TODO: Implementacao futura
        # public function sendSubscriptionExpirationLetters($iPendingId, $sOrderId)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'send_subscription_expiration_letters', 'Subscriptions'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP captureAuthorizedCheckoutSingle

  ## Parametros
    - $sOrder

  ## Retorno
    - any
  """
  def captureAuthorizedCheckoutSingle(params) do
    # TODO: Implementacao futura
        # public function captureAuthorizedCheckoutSingle($sOrder)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'capture_authorized_checkout'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP captureAuthorizedCheckoutRecurring

  ## Parametros
    - $sOrder

  ## Retorno
    - any
  """
  def captureAuthorizedCheckoutRecurring(params) do
    # TODO: Implementacao futura
        # public function captureAuthorizedCheckoutRecurring($sOrder)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'capture_authorized_checkout'))
    #             return '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP cancelSubscription

  ## Parametros
    - $sOrderId

  ## Retorno
    - any
  """
  def cancelSubscription(params) do
    # TODO: Implementacao futura
        # public function cancelSubscription($sOrderId)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'cancel', 'Subscriptions'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP processOrder

  ## Parametros
    - $iSellerId
    -  $iClientId
    -  $iModuleId
    -  $aItems
    -  $sType
    -  $sOrder

  ## Retorno
    - any
  """
  def processOrder(params) do
    # TODO: Implementacao futura
        # public function processOrder($iSellerId, $iClientId, $iModuleId, $aItems, $sType, $sOrder)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'process_order', 'Orders'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP processOrderByPending

  ## Parametros
    - $iPendingId
    -  $sOrder

  ## Retorno
    - any
  """
  def processOrderByPending(params) do
    # TODO: Implementacao futura
        # public function processOrderByPending($iPendingId, $sOrder)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'process_order_by_pending', 'Orders'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP refundOrder

  ## Parametros
    - $sOrder

  ## Retorno
    - any
  """
  def refundOrder(params) do
    # TODO: Implementacao futura
        # public function refundOrder($sOrder)
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'refund_order', 'Orders'))
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP generateLicense

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def generateLicense(params) do
    # TODO: Implementacao futura
        # public function generateLicense()
    #     {
    #         if(!BxDolRequest::serviceExists($this->_sActive, 'generate_license'))
    #             return '';
    # 
    :ok
  end
end
