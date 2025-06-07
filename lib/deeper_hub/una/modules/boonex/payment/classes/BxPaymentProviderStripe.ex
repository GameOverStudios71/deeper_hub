
defmodule DeeperHub.Inc.Classes.BxPaymentProviderStripe do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/payment/classes/BxPaymentProviderStripe.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aConfig

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # 
    #     function __construct($aConfig)
    #     {
    #         parent::__construct($aConfig);
    # 
    #         $this->_aIncludeJs = array(
    #             'https://checkout.stripe.com/checkout.js',
    #             'stripe.js'
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP initializeCheckout

  ## Parametros
    - iPendingId,aCartInfo,sRedirect=''

  ## Retorno
    - any
  """
  def initializeCheckout(%{}) do
    # TODO: Implementacao futura
        # public function initializeCheckout($iPendingId, $aCartInfo, $sRedirect = '')
    #     {
    #     	$sToken = bx_process_input(bx_get('token'));
    # 
    #     	if(empty($aCartInfo['items']) || !is_array($aCartInfo['items']))
    #             return $this->_sLangsPrefix . 'err_empty_items';
    # 
    #         $aClient = $this->_oModule->getProfileInfo();
    #         $aVendor = $this->_oModule->getProfileInfo($aCartInfo['vendor_id']);
    # 
    #         $aPending = $this->_oModule->_oDb->getOrderPending(array('type' => 'id', 'id' => $iPendingId));
    #         if(!empty($aPending['order']) || !empty($aPending['error_code']) || !empty($aPending['error_msg']) || (int)$aPending['processed'] != 0)
    #             return $this->_sLangsPrefix . 'err_already_processed';
    # 
    #         switch($aPending['type']) {
    #             case BX_PAYMENT_TYPE_SINGLE:
    #                 $aCartInfo['items_title'] = '';
    #                 foreach($aCartInfo['items'] as $aItem)
    #                     $aCartInfo['items_title'] .= ' ' . $aItem['title'] . ',';
    #                 $aCartInfo['items_title'] = trim($aCartInfo['items_title'], ', ');
    # 
    #                 $mixedResult = $this->_createCharge($sToken, $iPendingId, $aClient, $aCartInfo);
    #                 if($mixedResult === false)
    #                     return $this->_sLangsPrefix . 'err_cannot_perform';
    # 
    #                 header("Location: " . $this->getReturnDataUrl($aVendor['id'], array(
    #                     'order_id' => $mixedResult['order'],
    #                     'customer_id' => $mixedResult['customer'], 
    #                     'pending_id' => $aPending['id'],
    #                     'redirect' => $sRedirect
    #                 )));
    #                 exit;
    # 
    #             case BX_PAYMENT_TYPE_RECURRING:
    #                 $mixedResult = $this->_createSubscription($sToken, $iPendingId, $aClient, $aCartInfo);
    #                 if($mixedResult === false)
    #                     return $this->_sLangsPrefix . 'err_cannot_perform';
    # 
    #                 return array(
    #                     'code' => 0,
    #                     'eval' => $this->_oModule->_oConfig->getJsObject('cart') . '.onSubscribeSubmit(oData);',
    #                     'redirect' => $this->getReturnDataUrl($aVendor['id'], array(
    #                         'order_id' => $mixedResult['order'],
    #                         'customer_id' => $mixedResult['customer'],
    #                         'pending_id' => $aPending['id'],
    #                         'redirect' => $sRedirect
    #                     ))
    #                 );
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP finalizeCheckout

  ## Parametros
    - &aData

  ## Retorno
    - any
  """
  def finalizeCheckout(%{}) do
    # TODO: Implementacao futura
        # public function finalizeCheckout(&$aData)
    #     {
    #     	$sOrderId = bx_process_input($aData['order_id']);
    #     	$sCustomerId = bx_process_input($aData['customer_id']);
    #         $iPendingId = bx_process_input($aData['pending_id'], BX_DATA_INT);
    #         if(empty($iPendingId))
    #             return array('code' => 1, 'message' => $this->_sLangsPrefix . 'err_wrong_data');
    # 
    #         $sRedirect = bx_process_input($aData['redirect']);
    # 
    #         $aPending = $this->_oModule->_oDb->getOrderPending(array('type' => 'id', 'id' => $iPendingId));
    #         if(!empty($aPending['order']) || !empty($aPending['error_code']) || !empty($aPending['error_msg']) || (int)$aPending['processed'] != 0)
    #             return array('code' => 3, 'message' => $this->_sLangsPrefix . 'err_already_processed');
    # 
    #         $aResult = array(
    #             'code' => BX_PAYMENT_RESULT_SUCCESS,
    #             'message' => '',
    #             'pending_id' => $iPendingId,
    #             'customer_id' => '',
    #             'subscription_id' => '',
    #             'client_name' => '',
    #             'client_email' => '',
    #             'paid' => false,
    #             'trial' => false,
    #             'redirect' => $sRedirect
    #         );
    # 
    #         switch($aPending['type']) {
    #             case BX_PAYMENT_TYPE_SINGLE:
    #                 $oCustomer = $this->_retrieveCustomer(BX_PAYMENT_TYPE_SINGLE, $sCustomerId);
    #                 $oCharge = $this->_retrieveCharge($sOrderId);
    #                 if($oCustomer === false || $oCharge === false)
    #                     return array('code' => 4, 'message' => $this->_sLangsPrefix . 'err_cannot_perform');
    # 
    #                 $aCustomer = $oCustomer->jsonSerialize();
    #                 $aCharge = $oCharge->jsonSerialize();
    #                 if(empty($aCustomer) || !is_array($aCustomer) || empty($aCharge) || !is_array($aCharge))
    #                     return array('code' => 4, 'message' => $this->_sLangsPrefix . 'err_cannot_perform');
    # 
    #                 $aResult = array_merge($aResult, array(
    #                     'message' => $this->_sLangsPrefix . 'strp_msg_charged',
    #                     'client_email' => $aCustomer['email'],
    #                     'paid' => (bool)$aCharge['paid']
    #                 ));
    #                 break;
    # 
    #             case BX_PAYMENT_TYPE_RECURRING:
    #                 $oCustomer = $this->_retrieveCustomer(BX_PAYMENT_TYPE_RECURRING, $sCustomerId);
    #                 $oSubscription = $this->_retrieveSubscription($sCustomerId, $sOrderId);
    #                 if($oCustomer === false || $oSubscription === false)
    #                     return array('code' => 4, 'message' => $this->_sLangsPrefix . 'err_cannot_perform');
    # 
    #                 $aCustomer = $oCustomer->jsonSerialize();
    #                 $aSubscription = $oSubscription->jsonSerialize();
    #                 if(empty($aCustomer) || !is_array($aCustomer) || empty($aSubscription) || !is_array($aSubscription))
    #                     return array('code' => 4, 'message' => $this->_sLangsPrefix . 'err_cannot_perform');
    # 
    #                 $aResult = array_merge($aResult, array(
    #                     'message' => $this->_sLangsPrefix . 'strp_msg_subscribed',
    #                     'customer_id' => $sCustomerId,
    #                     'subscription_id' => $sOrderId,
    #                     'client_email' => $aCustomer['email'],
    #                     'trial' => $aSubscription['status'] == 'trialing'
    #                 ));
    #                 break;
    #         }
    # 
    #         //--- Update pending transaction ---//
    #         $this->_oModule->_oDb->updateOrderPending($iPendingId, array(
    #             'order' => $sOrderId,
    #             'error_code' => $aResult['code'],
    #             'error_msg' => _t($aResult['message'])
    #         ));
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCheckoutParamsSingle

  ## Parametros
    - aParams,&oGrid

  ## Retorno
    - any
  """
  def getCheckoutParamsSingle(%{}) do
    # TODO: Implementacao futura
        # public function getCheckoutParamsSingle($aParams, &$oGrid)
    #     {
    #     	if(bx_get('token') !== false)
    #             $aParams['token'] = bx_process_input(bx_get('token'));
    # 
    #     	return $aParams;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getVerificationCodeCharge

  ## Parametros
    - iVendorId,iCustomerId,fAmount,sCurrency

  ## Retorno
    - any
  """
  def getVerificationCodeCharge(%{}) do
    # TODO: Implementacao futura
        # public function getVerificationCodeCharge($iVendorId, $iCustomerId, $fAmount, $sCurrency)
    #     {
    #         $sCode = $this->_getVerificationCodeCharge($iVendorId, $iCustomerId, $fAmount, $sCurrency);
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_get_code_charge 'bx_payment', 'stripe_get_code_charge' - hook to override verification code for 'charge' action
    #          * - $unit_name - equals `bx_payment`
    #          * - $action - equals `stripe_get_code_charge`
    #          * - $object_id - not used
    #          * - $sender_id - not used
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `provider` - [object] an instance of provider, @see BxBaseModPaymentProvider
    #          *      - `vendor_id` - [int] vendor (seller) profile id
    #          *      - `customer_id` - [int] customer (buyer) profile id
    #          *      - `amount` - [float] charge amount
    #          *      - `currency` - [string] charge currency code
    #          *      - `override_result` - [string] by ref, verification code, can be overridden in hook processing
    #          * @hook @ref hook-bx_payment-stripe_get_code_charge
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_get_code_charge', 0, false, [
    #             'provider' => $this,
    #             'vendor_id' => $iVendorId, 
    #             'customer_id' => $iCustomerId,
    #             'amount' => $fAmount,
    #             'currency' => $sCurrency,
    #             'override_result' => &$sCode
    #         ]);
    # 
    #         return $sCode;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkVerificationCodeCharge

  ## Parametros
    - iVendorId,iCustomerId,aResult

  ## Retorno
    - any
  """
  def checkVerificationCodeCharge(%{}) do
    # TODO: Implementacao futura
        # public function checkVerificationCodeCharge($iVendorId, $iCustomerId, $aResult)
    #     {
    #         $bCheckResult = $this->_checkVerificationCodeCharge($iVendorId, $iCustomerId, $aResult);
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_verify_charge 'bx_payment', 'stripe_verify_charge' - hook to override code verification for 'charge' action
    #          * - $unit_name - equals `bx_payment`
    #          * - $action - equals `stripe_verify_charge`
    #          * - $object_id - not used
    #          * - $sender_id - not used
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `provider` - [object] an instance of provider, @see BxBaseModPaymentProvider
    #          *      - `vendor_id` - [int] vendor (seller) profile id
    #          *      - `customer_id` - [int] customer (buyer) profile id
    #          *      - `result` - [array] results array received from payment provider
    #          *      - `override_result` - [boolean] by ref, is verification passed or not, can be overridden in hook processing
    #          * @hook @ref hook-bx_payment-stripe_verify_charge
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_verify_charge', 0, false, array(
    #             'provider' => $this,
    #             'vendor_id' => $iVendorId, 
    #             'customer_id' => $iCustomerId,
    #             'result' => $aResult,
    #             'override_result' => &$bCheckResult
    #         ));
    # 
    #         return $bCheckResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getVerificationCodeSubscription

  ## Parametros
    - iVendorId,iCustomerId,sSubscription,sCurrency

  ## Retorno
    - any
  """
  def getVerificationCodeSubscription(%{}) do
    # TODO: Implementacao futura
        # public function getVerificationCodeSubscription($iVendorId, $iCustomerId, $sSubscription, $sCurrency)
    #     {
    #         $sCode = $this->_getVerificationCodeSubscription($iVendorId, $iCustomerId, $sSubscription, $sCurrency);
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_get_code_subscription 'bx_payment', 'stripe_get_code_subscription' - hook to override verification code for 'subscribe' action
    #          * - $unit_name - equals `bx_payment`
    #          * - $action - equals `stripe_get_code_subscription`
    #          * - $object_id - not used
    #          * - $sender_id - not used
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `provider` - [object] an instance of provider, @see BxBaseModPaymentProvider
    #          *      - `vendor_id` - [int] vendor (seller) profile id
    #          *      - `customer_id` - [int] customer (buyer) profile id
    #          *      - `subscription` - [string] unique subscription id
    #          *      - `currency` - [string] charge currency code
    #          *      - `override_result` - [string] by ref, verification code, can be overridden in hook processing
    #          * @hook @ref hook-bx_payment-stripe_get_code_subscription
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_get_code_subscription', 0, false, [
    #             'provider' => $this,
    #             'vendor_id' => $iVendorId, 
    #             'customer_id' => $iCustomerId,
    #             'subscription' => $sSubscription,
    #             'currency' => $sCurrency,
    #             'override_result' => &$sCode
    #         ]);
    # 
    #         return $sCode;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkVerificationCodeSubscription

  ## Parametros
    - iVendorId,iCustomerId,aResult

  ## Retorno
    - any
  """
  def checkVerificationCodeSubscription(%{}) do
    # TODO: Implementacao futura
        # public function checkVerificationCodeSubscription($iVendorId, $iCustomerId, $aResult)
    #     {
    #         $bCheckResult = $this->_checkVerificationCodeSubscription($iVendorId, $iCustomerId, $aResult);
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_verify_subscription 'bx_payment', 'stripe_verify_subscription' - hook to override code verification for 'subscribe' action
    #          * It's equivalent to @ref hook-bx_payment-stripe_verify_charge
    #          * @hook @ref hook-bx_payment-stripe_verify_subscription
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_verify_subscription', 0, false, array(
    #             'provider' => $this,
    #             'vendor_id' => $iVendorId, 
    #             'customer_id' => $iCustomerId,
    #             'result' => $aResult,
    #             'override_result' => &$bCheckResult
    #         ));
    # 
    #         return $bCheckResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _createToken

  ## Parametros
    - aCard

  ## Retorno
    - any
  """
  def _createToken(%{}) do
    # TODO: Implementacao futura
        # protected function _createToken($aCard)
    #     {
    #         try {
    #             $oToken = Stripe\Token::create(array('card' => $aCard));
    #         }
    #         catch (Stripe\Error\Base $oException) {
    #             return $this->_processException('Create Token Error: ', $oException);
    #         }
    # 
    #         return $oToken->jsonSerialize();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _createCustomer

  ## Parametros
    - sType,sToken,aClient

  ## Retorno
    - any
  """
  def _createCustomer(%{}) do
    # TODO: Implementacao futura
        # protected function _createCustomer($sType, $sToken, $aClient)
    #     {
    #         $oCustomer = null;
    #         $aCustomer = array(
    #             'card' => $sToken,
    #             'email' => !empty($aClient['email']) ? $aClient['email'] : ''
    #         );
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_create_customer 'bx_payment', 'stripe_create_customer' - hook to override customer data redurned by payment provider
    #          * - $unit_name - equals `bx_payment`
    #          * - $action - equals `stripe_create_customer`
    #          * - $object_id - not used
    #          * - $sender_id - client (buyer) profile id
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `type` - [string] payment type: single or recurring
    #          *      - `customer_object` - [object] by ref, an instance of customer, redurned by payment provider, can be overridden in hook processing
    #          *      - `customer_params` - [array] by ref, array with customer parameters, can be overridden in hook processing
    #          * @hook @ref hook-bx_payment-stripe_create_customer
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_create_customer', 0, $aClient['id'], [
    #             'type' => $sType,
    #             'customer_object' => &$oCustomer, 
    #             'customer_params' => &$aCustomer
    #         ]);
    # 
    #         try {
    #             $this->_oCustomer = !empty($oCustomer) ? $oCustomer : \Stripe\Customer::create($aCustomer);
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('Create Customer Error: ', $oException);
    #         }
    # 
    #         return $this->_oCustomer->jsonSerialize();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _createCharge

  ## Parametros
    - sToken,iPendingId,&aClient,&aCartInfo

  ## Retorno
    - any
  """
  def _createCharge(%{}) do
    # TODO: Implementacao futura
        # protected function _createCharge($sToken, $iPendingId, &$aClient, &$aCartInfo)
    #     {
    #         if(empty($this->_oCustomer))
    #             $this->_createCustomer(BX_PAYMENT_TYPE_SINGLE, $sToken, $aClient);
    # 
    #         if(empty($this->_oCustomer))
    #             return false;
    # 
    #         $fAmount = 100 * (float)$aCartInfo['items_price'];
    # 
    #         $oCharge = null;
    #         $aCharge = array(
    #             'customer' => $this->_oCustomer->id,
    #             'amount' => $fAmount,
    #             'currency' => $aCartInfo['vendor_currency_code'],
    #             'description' => $aCartInfo['items_title'],
    #             'metadata' => array(
    #                 'vendor' => $aCartInfo['vendor_id'],
    #                 'client' => $aClient['id'],
    #                 'product' => $iPendingId,
    #                 'verification' => $this->getVerificationCodeCharge($aCartInfo['vendor_id'], $aClient['id'], $fAmount, $aCartInfo['vendor_currency_code'])
    #             )
    #         );
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_create_charge 'bx_payment', 'stripe_create_charge' - hook to override charge data redurned by payment provider
    #          * - $unit_name - equals `bx_payment`
    #          * - $action - equals `stripe_create_charge`
    #          * - $object_id - pending transaction id
    #          * - $sender_id - not used
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `charge_object` - [object] by ref, an instance of charge, redurned by payment provider, can be overridden in hook processing
    #          *      - `charge_params` - [array] by ref, array with charge parameters, can be overridden in hook processing
    #          * @hook @ref hook-bx_payment-stripe_create_charge
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_create_charge', $iPendingId, false, [
    #             'charge_object' => &$oCharge, 
    #             'charge_params' => &$aCharge
    #         ]);
    # 
    #         try {
    #             if(empty($oCharge))
    #                 $oCharge = \Stripe\Charge::create($aCharge);
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('Create Charge Error: ', $oException);
    #         }
    # 
    #         $aResult = $oCharge->jsonSerialize();
    #         if(empty($aResult) || !is_array($aResult) || empty($aResult['paid']))
    #             return false;
    # 
    #         $aMetadata = $aResult['metadata'];
    #         if(!$this->checkVerificationCodeCharge($aCartInfo['vendor_id'], $aClient['id'], $aResult))
    #             return false;
    # 
    #         return array(
    #             'pending' => $iPendingId,
    #             'amount' =>(float)$aResult['amount'] / 100,
    #             'customer' => $this->_oCustomer->id,
    #             'order' => $aResult['id']
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _createSubscription

  ## Parametros
    - sToken,iPendingId,&aClient,&aCartInfo

  ## Retorno
    - any
  """
  def _createSubscription(%{}) do
    # TODO: Implementacao futura
        # protected function _createSubscription($sToken, $iPendingId, &$aClient, &$aCartInfo)
    #     {
    #         if(empty($this->_oCustomer))
    #             $this->_createCustomer(BX_PAYMENT_TYPE_RECURRING, $sToken, $aClient);
    # 
    #         if(empty($this->_oCustomer))
    #             return false;
    # 
    #         $aItem = array_shift($aCartInfo['items']);
    #         if(empty($aItem) || !is_array($aItem))
    #             return false;
    # 
    #         $iTrial = $this->_oModule->_oConfig->getTrial(BX_PAYMENT_TYPE_RECURRING, $aItem);
    #         $bTrial = !empty($iTrial);
    # 
    #         $oSubscription = null;
    #         $aSubscription = array(
    #             'plan' => $aItem['name'],
    #             'metadata' => array(
    #                 'vendor' => $aCartInfo['vendor_id'],
    #                 'client' => $aClient['id'],
    #                 'product' => $iPendingId,
    #                 'verification' => $this->getVerificationCodeSubscription($aCartInfo['vendor_id'], $aClient['id'], $aItem['name'], $aCartInfo['vendor_currency_code'])
    #             )
    #         );
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_create_subscription 'bx_payment', 'stripe_create_subscription' - hook to override subscription data redurned by payment provider
    #          * - $unit_name - equals `bx_payment`
    #          * - $action - equals `stripe_create_subscription`
    #          * - $object_id - pending transaction id
    #          * - $sender_id - not used
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `customer` - [object] by ref, an instance of customer, can be overridden in hook processing
    #          *      - `subscription_object` - [object] by ref, an instance of subscription, redurned by payment provider, can be overridden in hook processing
    #          *      - `subscription_params` - [array] by ref, array with subscription parameters, can be overridden in hook processing
    #          * @hook @ref hook-bx_payment-stripe_create_subscription
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_create_subscription', $iPendingId, false, [
    #             'customer' => &$this->_oCustomer,
    #             'subscription_object' => &$oSubscription, 
    #             'subscription_params' => &$aSubscription
    #         ]);
    # 
    #         try {
    #             if(empty($oSubscription))
    #                 $oSubscription = \Stripe\Subscription::create(['customer' => $this->_oCustomer->id, 'items' => [['price' => $aItem['name']]], 'metadata' => $aSubscription['metadata']]);				
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('Create Subscription Error: ', $oException);
    #         }
    # 
    #         $aResult = $oSubscription->jsonSerialize();
    #         if(empty($aResult) || !is_array($aResult) || (!$bTrial && $aResult['status'] != 'active') || ($bTrial && !in_array($aResult['status'], array('active', 'trialing'))))
    #             return false;
    # 
    #         if(!$this->checkVerificationCodeSubscription($aCartInfo['vendor_id'], $aClient['id'], $aResult))
    #             return false;
    # 
    #         return array(
    #             'pending' => $iPendingId,
    #             'amount' =>(float)$aCartInfo['items_price'],
    #             'customer' => $this->_oCustomer->id, 
    #             'order' => $aResult['id'],
    #             'trial' => $bTrial
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _createCard

  ## Parametros
    - sType,sCustomerId,sToken

  ## Retorno
    - any
  """
  def _createCard(%{}) do
    # TODO: Implementacao futura
        # protected function _createCard($sType, $sCustomerId, $sToken)
    #     {
    #         try {
    #             $oCard = $this->_retrieveCustomer($sType, $sCustomerId)->sources->create(array(
    #                 'source' => $sToken
    #             ));
    #         }
    #         catch (Stripe\Error\Base $oException) {
    #             return $this->_processException('Create Card Error: ', $oException);
    #         }
    # 
    #         return $oCard->jsonSerialize();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _retrieveCard

  ## Parametros
    - sCustomerId,sCardId=''

  ## Retorno
    - any
  """
  def _retrieveCard(%{}) do
    # TODO: Implementacao futura
        # protected function _retrieveCard($sCustomerId, $sCardId = '') {
    #         try {
    #             $oCustomer = \Stripe\Customer::retrieve($sCustomerId);
    #             $oCard = $oCustomer->sources->retrieve(!empty($sCardId) ? $sCardId : $oCustomer->default_source);
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('Retrieve Card Error: ', $oException);
    #         }
    # 
    #         return $oCard;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _retrieveCoupon

  ## Parametros
    - sId

  ## Retorno
    - any
  """
  def _retrieveCoupon(%{}) do
    # TODO: Implementacao futura
        # protected function _retrieveCoupon($sId) {
    #         try {
    #             $oCoupon = \Stripe\Coupon::retrieve($sId);
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('Retrieve Coupon Error: ', $oException);
    #         }
    # 
    #         return $oCoupon;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getVerificationCodeCharge

  ## Parametros
    - iVendorId,iCustomerId,fAmount,sCurrency

  ## Retorno
    - any
  """
  def _getVerificationCodeCharge(%{}) do
    # TODO: Implementacao futura
        # protected function _getVerificationCodeCharge($iVendorId, $iCustomerId, $fAmount, $sCurrency)
    #     {
    #         return md5(implode('#-#', array(
    #             (int)$iVendorId,
    #             (int)$iCustomerId,
    #             (float)$fAmount,
    #             strtoupper($sCurrency)
    #         )));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _checkVerificationCodeCharge

  ## Parametros
    - iVendorId,iCustomerId,aResult

  ## Retorno
    - any
  """
  def _checkVerificationCodeCharge(%{}) do
    # TODO: Implementacao futura
        # protected function _checkVerificationCodeCharge($iVendorId, $iCustomerId, $aResult)
    #     {
    #         return !empty($aResult['metadata']['verification']) && $aResult['metadata']['verification'] == $this->getVerificationCodeCharge($iVendorId, $iCustomerId, $aResult['amount'], $aResult['currency']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getVerificationCodeSubscription

  ## Parametros
    - iVendorId,iCustomerId,sSubscription,sCurrency

  ## Retorno
    - any
  """
  def _getVerificationCodeSubscription(%{}) do
    # TODO: Implementacao futura
        # protected function _getVerificationCodeSubscription($iVendorId, $iCustomerId, $sSubscription, $sCurrency)
    #     {
    #         return md5(implode('#-#', array(
    #             (int)$iVendorId,
    #             (int)$iCustomerId,
    #             strtoupper($sSubscription),
    #             strtoupper($sCurrency)
    #         )));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _checkVerificationCodeSubscription

  ## Parametros
    - iVendorId,iCustomerId,aResult

  ## Retorno
    - any
  """
  def _checkVerificationCodeSubscription(%{}) do
    # TODO: Implementacao futura
        # protected function _checkVerificationCodeSubscription($iVendorId, $iCustomerId, $aResult)
    #     {
    #         return !empty($aResult['metadata']['verification']) && $aResult['metadata']['verification'] == $this->getVerificationCodeSubscription($iVendorId, $iCustomerId, $aResult['plan']['id'], $aResult['plan']['currency']);
    #     }
    :ok
  end

end
