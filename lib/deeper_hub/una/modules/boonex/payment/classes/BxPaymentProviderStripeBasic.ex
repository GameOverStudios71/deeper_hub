
defmodule DeeperHub.Inc.Classes.BxPaymentProviderStripeBasic do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/payment/classes/BxPaymentProviderStripeBasic.php
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
    # 
    # 
    #     function __construct($aConfig)
    #     {
    #     	$this->MODULE = 'bx_payment';
    # 
    #         parent::__construct($aConfig);
    # 
    #         $this->_aSbsStatuses = array(
    #             'incomplete' => BX_PAYMENT_SBS_STATUS_UNPAID, 
    #             'incomplete_expired' => BX_PAYMENT_SBS_STATUS_UNPAID, 
    #             'trialing' => BX_PAYMENT_SBS_STATUS_TRIAL, 
    #             'active' => BX_PAYMENT_SBS_STATUS_ACTIVE, 
    #             'past_due' => BX_PAYMENT_SBS_STATUS_UNPAID,
    #             'unpaid' => BX_PAYMENT_SBS_STATUS_UNPAID,
    #             'canceled' => BX_PAYMENT_SBS_STATUS_CANCELED,
    #         );
    # 
    #         $this->_sFormDetails = 'bx_payment_form_strp_details';
    #         $this->_sFormDisplayDetailsEdit = 'bx_payment_form_strp_details_edit';
    # 
    #         $this->_sFormCard = 'bx_payment_form_strp_card';
    #         $this->_sFormDisplayCardAdd = 'bx_payment_form_strp_card_add';
    # 
    #         $this->_bProrate = false;
    # 
    #         $this->_aIncludeJs = array(
    #             'main.js',
    #         );
    # 
    #         $this->_aIncludeCss = array(
    #             'stripe.css'
    #         );
    # 
    #         $this->_oCustomer = null;
    # 
    #         \Stripe\Stripe::setApiKey($this->_getSecretKey());
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP initOptions

  ## Parametros
    - aOptions

  ## Retorno
    - any
  """
  def initOptions(%{}) do
    # TODO: Implementacao futura
        # public function initOptions($aOptions)
    #     {
    #     	parent::initOptions($aOptions);
    # 
    #     	$this->_iMode = (int)$this->getOption('mode');
    #     	$this->_bCheckAmount = $this->getOption('check_amount') == 'on';
    #     	$this->_bUseSsl = $this->getOption('ssl') == 'on';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addJsCss

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def addJsCss(%{}) do
    # TODO: Implementacao futura
        # public function addJsCss()
    #     {
    #     	if(!$this->isActive())
    #     		return;
    # 
    #         $this->_oModule->_oTemplate->addJs($this->_aIncludeJs);
    #         $this->_oModule->_oTemplate->addCss($this->_aIncludeCss);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP notify

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def notify(%{}) do
    # TODO: Implementacao futura
        # public function notify()
    #     {
    #         $iResult = $this->_processEvent();
    #         http_response_code($iResult);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getDetailsRecurring

  ## Parametros
    - iPendingId,sCustomerId,sSubscriptionId

  ## Retorno
    - any
  """
  def getDetailsRecurring(%{}) do
    # TODO: Implementacao futura
        # public function getDetailsRecurring($iPendingId, $sCustomerId, $sSubscriptionId)
    #     {
    #         $oSubscription = $this->_retrieveSubscription($sCustomerId, $sSubscriptionId);
    #         if($oSubscription === false)
    #             return '';
    # 
    #         $aSubscription = $oSubscription->jsonSerialize();
    #         if(empty($aSubscription) || !is_array($aSubscription))
    #             return '';
    # 
    #         $sName = '';
    #         if(!empty($aSubscription['plan']['name']))
    #             $sName = $aSubscription['plan']['name'];
    #         else if(!empty($aSubscription['plan']['product'])){
    #             $oProduct = $this->_retrieveProduct($aSubscription['plan']['product']);
    #             if($oProduct !== false) 
    #                 $sName = $oProduct->name;
    #         }
    # 
    #         $sNone = _t('_bx_payment_txt_none');
    #         return $this->_oModule->_oTemplate->parseHtmlByName('strp_details_recurring.html', array(
    #             'plan' => $sName,
    #             'cost' => _t('_bx_payment_strp_txt_cost_mask', (int)$aSubscription['plan']['amount'] / 100, $aSubscription['plan']['currency'], $aSubscription['plan']['interval']),
    #             'status' => $aSubscription['status'],
    #             'created' => bx_time_js($aSubscription['created'], BX_FORMAT_DATE_TIME, true),
    #             'started' => !empty($aSubscription['start']) ? bx_time_js($aSubscription['start'], BX_FORMAT_DATE_TIME, true) : $sNone,
    #             'trial_start' => !empty($aSubscription['trial_start']) ? bx_time_js($aSubscription['trial_start'], BX_FORMAT_DATE_TIME, true) : $sNone,
    #             'trial_end' => !empty($aSubscription['trial_end']) ? bx_time_js($aSubscription['trial_end'], BX_FORMAT_DATE_TIME, true) : $sNone,
    #             'cperiod_start' => !empty($aSubscription['current_period_start']) ? bx_time_js($aSubscription['current_period_start'], BX_FORMAT_DATE_TIME, true) : $sNone,
    #             'cperiod_end' => !empty($aSubscription['current_period_end']) ? bx_time_js($aSubscription['current_period_end'], BX_FORMAT_DATE_TIME, true) : $sNone,
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP changeDetailsRecurring

  ## Parametros
    - iPendingId,sCustomerId,sSubscriptionId

  ## Retorno
    - any
  """
  def changeDetailsRecurring(%{}) do
    # TODO: Implementacao futura
        # public function changeDetailsRecurring($iPendingId, $sCustomerId, $sSubscriptionId)
    #     {
    #         $oForm = BxDolForm::getObjectInstance($this->_sFormDetails, $this->_sFormDisplayDetailsEdit, $this->_oModule->_oTemplate);
    #         $oForm->aFormAttrs['id'] = $this->_oModule->_oConfig->getHtmlIds('subscription', 'form_subscription_change_details');
    #         $oForm->aFormAttrs['action'] = BX_DOL_URL_ROOT . $this->_oModule->_oConfig->getBaseUri() . 'subscription_change_details/' . $iPendingId;
    # 
    #         $oForm->aInputs['item_id']['values'] = $this->_getDataChangeDetailsRecurring($iPendingId);
    # 
    #         $oForm->initChecker();
    #         if($oForm->isSubmittedAndValid()) {
    #             $aResultError = array('code' => 1, 'message' => _t('_bx_payment_strp_err_details_changed'));
    # 
    #             $aPending = $this->_oModule->_oDb->getOrderPending(array('type' => 'id', 'id' => $iPendingId));
    #             list($iVendorId, $iModuleId, $iItemId, $iItemCount) = $this->_oModule->_oConfig->descriptorS2A($aPending['items']);
    # 
    #             $aItem = $this->_oModule->callGetCartItem($iModuleId, array($oForm->getCleanValue('item_id'), $aPending['client_id']));
    #     		if(empty($aItem) || !is_array($aItem))
    #     			return $aResultError;
    # 
    #             $oSubscription = $this->_retrieveSubscription($sCustomerId, $sSubscriptionId);
    #             if($oSubscription === false)
    #                 return $aResultError;
    # 
    #             $oSubscription->plan = $aItem['name'];
    #             $oSubscription->prorate = $this->_bProrate;
    #             $oSubscription = $oSubscription->save();
    #             if(strcmp($oSubscription->plan->id, $aItem['name']) !== 0)
    #                 return $aResultError;
    # 
    #             $sItems = $this->_oModule->_oConfig->descriptorA2S(array($iVendorId, $iModuleId, $aItem['id'], $iItemCount));
    #             if(!$this->_oModule->_oDb->updateOrderPending($iPendingId, array('items' => $sItems)))
    #                 return $aResultError;
    # 
    #             $this->_oModule->callReregisterSubscriptionItem($iModuleId, array($aPending['client_id'], $aPending['seller_id'], $iItemId, $aItem['id'], $aPending['order']));
    # 
    #             return array('code' => 0, 'message' => _t('_bx_payment_strp_msg_details_changed'));
    #         }
    # 
    #         return $this->_oModule->_oTemplate->parseHtmlByName('strp_details_change_recuring.html', array(
    #             'object' => $this->_oModule->_oConfig->getJsObject('subscription'),
    #             'form' => $oForm->getCode(),
    #             'form_id' => $oForm->aFormAttrs['id'],
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getBillingRecurring

  ## Parametros
    - iPendingId,sCustomerId,sSubscriptionId

  ## Retorno
    - any
  """
  def getBillingRecurring(%{}) do
    # TODO: Implementacao futura
        # public function getBillingRecurring($iPendingId, $sCustomerId, $sSubscriptionId)
    #     {
    #         $aCard = ['brand' => '', 'country' => '', 'funding' => '', 'last4' => '', 'exp_month' => '', 'exp_year' => '', 'cvc_check' => ''];
    # 
    #         $oCard = $this->_retrieveCard($sCustomerId);
    #         if($oCard === false && ($oSubscription = $this->_retrieveSubscription($sCustomerId, $sSubscriptionId)) !== false) {
    #             $sPaymentMethodId = $oSubscription->default_payment_method;
    #             if(!empty($sPaymentMethodId) && ($oPaymentMethod = $this->_retrievePaymentMethod($sPaymentMethodId)) !== false)
    #                 $oCard = $oPaymentMethod->card;
    #         }
    # 
    #         if(!empty($oCard))
    #             $aCard = $oCard->jsonSerialize();
    # 
    #         return $this->_oModule->_oTemplate->parseHtmlByName('strp_billing_recurring.html', array(
    #             'brand' => $aCard['brand'],
    #             'origin' => $aCard['country'],
    #             'type' => $aCard['funding'],
    #             'number' => _t('_bx_payment_strp_txt_card_number_mask', $aCard['last4']),
    #             'expires' => _t('_bx_payment_strp_txt_card_expires_mask', $aCard['exp_month'], $aCard['exp_year']),
    #             'cvc' => _t(!empty($aCard['cvc_check']) && strcmp($aCard['cvc_check'], 'pass') === 0 ? '_bx_payment_strp_txt_card_cvc_passed' : '_bx_payment_txt_none'),
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP changeBillingRecurring

  ## Parametros
    - iPendingId,sCustomerId,sSubscriptionId

  ## Retorno
    - any
  """
  def changeBillingRecurring(%{}) do
    # TODO: Implementacao futura
        # public function changeBillingRecurring($iPendingId, $sCustomerId, $sSubscriptionId)
    #     {
    #         $oForm = BxDolForm::getObjectInstance($this->_sFormCard, $this->_sFormDisplayCardAdd, $this->_oModule->_oTemplate);
    #         $oForm->aFormAttrs['id'] = $this->_oModule->_oConfig->getHtmlIds('subscription', 'form_subscription_change_billing');
    #         $oForm->aFormAttrs['action'] = BX_DOL_URL_ROOT . $this->_oModule->_oConfig->getBaseUri() . 'subscription_change_billing/' . $iPendingId;
    # 
    #         $oForm->initChecker();
    #         if($oForm->isSubmittedAndValid()) {
    #             $aResultError = array('code' => 1, 'message' => _t('_bx_payment_strp_err_billing_changed'));
    # 
    #             $aMatch = array();
    #             if(!preg_match('/^([0-9]{2})\D([0-9]{4})$/i', $oForm->getCleanValue('card_expire'), $aMatch))
    #                 return $aResultError;
    # 
    #             list($iMonth, $iYear) = array_slice($aMatch, 1);
    # 
    #         	$aToken = $this->_createToken(array(
    #                 'number' => $oForm->getCleanValue('card_number'),
    #                 'exp_month' => $iMonth,
    #                 'exp_year' => $iYear,
    #                 'cvc' => $oForm->getCleanValue('card_cvv')
    #             ));
    #             if(empty($aToken) || !is_array($aToken))
    #                 return $aResultError;
    # 
    #             $aCard = $this->_createCard(BX_PAYMENT_TYPE_RECURRING, $sCustomerId, $aToken['id']);
    #             if(empty($aCard) || !is_array($aCard))
    #                 return $aResultError;
    # 
    #             $oCustomer = $this->_retrieveCustomer(BX_PAYMENT_TYPE_RECURRING, $sCustomerId);
    #             if($oCustomer === false)
    #                 return $aResultError;
    # 
    #             $oCustomer->default_source = $aCard['id'];
    #             $oCustomer->save();
    # 
    #             return array('code' => 0, 'message' => _t('_bx_payment_strp_msg_billing_changed'));
    #         }
    # 
    #         return $this->_oModule->_oTemplate->parseHtmlByName('strp_billing_change_recuring.html', array(
    #             'object' => $this->_oModule->_oConfig->getJsObject('subscription'),
    #             'form' => $oForm->getCode(),
    #             'form_id' => $oForm->aFormAttrs['id'],
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP cancelRecurring

  ## Parametros
    - iPendingId,sCustomerId,sSubscriptionId

  ## Retorno
    - any
  """
  def cancelRecurring(%{}) do
    # TODO: Implementacao futura
        # public function cancelRecurring($iPendingId, $sCustomerId, $sSubscriptionId)
    #     {
    #         $oSubscription = $this->_cancelSubscription($sCustomerId, $sSubscriptionId);
    #         if($oSubscription === false)
    #             return false;
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubscription

  ## Parametros
    - iPendingId,sCustomerId,sSubscriptionId

  ## Retorno
    - any
  """
  def getSubscription(%{}) do
    # TODO: Implementacao futura
        # public function getSubscription($iPendingId, $sCustomerId, $sSubscriptionId)
    #     {
    #         $oSubscription = $this->_retrieveSubscription($sCustomerId, $sSubscriptionId);
    #         if($oSubscription === false)
    #             return array();
    # 
    #         $aSubscription = $oSubscription->jsonSerialize();
    #         if(empty($aSubscription) || !is_array($aSubscription))
    #             return array();
    # 
    #         $sStatus = isset($this->_aSbsStatuses[$aSubscription['status']]) ? $this->_aSbsStatuses[$aSubscription['status']] : BX_PAYMENT_SBS_STATUS_UNKNOWN;
    # 
    #         return array(
    #             'status' => $sStatus,
    #             'created' => $aSubscription['created'],
    #             'started' => !empty($aSubscription['start']) ? $aSubscription['start'] : 0,
    #             'trial_start' => !empty($aSubscription['trial_start']) ? $aSubscription['trial_start'] : 0,
    #             'trial_end' => !empty($aSubscription['trial_end']) ? $aSubscription['trial_end'] : 0,
    #             'cperiod_start' => !empty($aSubscription['current_period_start']) ? $aSubscription['current_period_start'] : 0,
    #             'cperiod_end' => !empty($aSubscription['current_period_end']) ? $aSubscription['current_period_end'] : 0,
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getPublicKey

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getPublicKey(%{}) do
    # TODO: Implementacao futura
        # protected function _getPublicKey()
    #     {
    #         return $this->_iMode == STRP_MODE_LIVE ? $this->getOption('live_pub_key') : $this->getOption('test_pub_key');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getSecretKey

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getSecretKey(%{}) do
    # TODO: Implementacao futura
        # protected function _getSecretKey()
    #     {
    #         return $this->_iMode == STRP_MODE_LIVE ? $this->getOption('live_sec_key') : $this->getOption('test_sec_key');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _retrieveCustomer

  ## Parametros
    - sType,sId

  ## Retorno
    - any
  """
  def _retrieveCustomer(%{}) do
    # TODO: Implementacao futura
        # protected function _retrieveCustomer($sType, $sId)
    #     {
    #         $oCustomer = null;
    #         
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_retrieve_customer 'bx_payment', 'stripe_retrieve_customer' - hook to override customer data retrieved from payment provider
    #          * - $unit_name - equals `bx_payment`
    #          * - $action - equals `stripe_retrieve_customer`
    #          * - $object_id - not used
    #          * - $sender_id - not used
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `type` - [string] payment type: single or recurring
    #          *      - `customer_id` - [string] by ref, unique customer id, can be overridden in hook processing
    #          *      - `customer_object` - [object] by ref, an instance of customer, redurned by payment provider, can be overridden in hook processing
    #          * @hook @ref hook-bx_payment-stripe_retrieve_customer
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_retrieve_customer', 0, false, [
    #             'type' => $sType,
    #             'customer_id' => &$sId,
    #             'customer_object' => &$oCustomer
    #         ]);
    # 
    #         try {
    #             if(empty($oCustomer))
    #                 $oCustomer = \Stripe\Customer::retrieve($sId);
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('Retrieve Customer Error: ', $oException);
    #         }
    # 
    #         return $oCustomer;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _retrieveCharge

  ## Parametros
    - sId

  ## Retorno
    - any
  """
  def _retrieveCharge(%{}) do
    # TODO: Implementacao futura
        # protected function _retrieveCharge($sId)
    #     {
    #         $oCharge = null;
    #         
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_retrieve_charge 'bx_payment', 'stripe_retrieve_charge' - hook to override charge data retrieved from payment provider
    #          * - $unit_name - equals `bx_payment`
    #          * - $action - equals `stripe_retrieve_charge`
    #          * - $object_id - not used
    #          * - $sender_id - not used
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `type` - [string] payment type: single or recurring
    #          *      - `charge_id` - [string] by ref, unique charge id, can be overridden in hook processing
    #          *      - `charge_object` - [object] by ref, an instance of charge, redurned by payment provider, can be overridden in hook processing
    #          * @hook @ref hook-bx_payment-stripe_retrieve_charge
    #          */
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_v3_retrieve_charge 'bx_payment', 'stripe_v3_retrieve_charge' - hook to override charge data retrieved from payment provider
    #          * It's equivalent to @ref hook-bx_payment-stripe_retrieve_charge
    #          * @hook @ref hook-bx_payment-stripe_v3_retrieve_charge
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_retrieve_charge', 0, false, [
    #             'charge_id' => &$sId,
    #             'charge_object' => &$oCharge
    #         ]);
    # 
    #         try {
    #             if(empty($oCharge))
    #                 $oCharge = \Stripe\Charge::retrieve($sId);
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('Retrieve Charge Error: ', $oException);
    #         }
    # 
    #         return $oCharge;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _retrieveSubscription

  ## Parametros
    - sCustomerId,sSubscriptionId

  ## Retorno
    - any
  """
  def _retrieveSubscription(%{}) do
    # TODO: Implementacao futura
        # protected function _retrieveSubscription($sCustomerId, $sSubscriptionId)
    #     {
    #         try {
    #             $oCustomer = $this->_retrieveCustomer(BX_PAYMENT_TYPE_RECURRING, $sCustomerId);
    #             $oSubscription = \Stripe\Subscription::retrieve($sSubscriptionId);
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('Retrieve Subscription Error: ', $oException);
    #         }
    # 
    #         return $oSubscription;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _cancelSubscription

  ## Parametros
    - sCustomerId,sSubscriptionId

  ## Retorno
    - any
  """
  def _cancelSubscription(%{}) do
    # TODO: Implementacao futura
        # protected function _cancelSubscription($sCustomerId, $sSubscriptionId)
    #     {
    #         try {
    #             $oSubscription = $this->_retrieveSubscription($sCustomerId, $sSubscriptionId);
    #             $oSubscription = $oSubscription->cancel();
    #         }
    #         catch (Exception $oException) {
    #                 return $this->_processException('Cancel Subscription Error: ', $oException);
    #         }
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_cancel_subscription 'bx_payment', 'stripe_cancel_subscription' - hook after a subscription was canceled
    #          * - $unit_name - equals `bx_payment`
    #          * - $action - equals `stripe_cancel_subscription`
    #          * - $object_id - not used
    #          * - $sender_id - not used
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `subscription_id` - [string] unique subscription id
    #          *      - `subscription_object` - [object] an instance of subscription, redurned by payment provider
    #          * @hook @ref hook-bx_payment-stripe_cancel_subscription
    #          */
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_v3_cancel_subscription 'bx_payment', 'stripe_v3_cancel_subscription' - hook after a subscription was canceled
    #          * It's equivalent to @ref hook-bx_payment-stripe_cancel_subscription
    #          * @hook @ref hook-bx_payment-stripe_v3_cancel_subscription
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_cancel_subscription', 0, false, [
    #             'subscription_id' => $sSubscriptionId,
    #             'subscription_object' => &$oSubscription
    #         ]);
    # 
    #         return $oSubscription;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _retrievePaymentMethod

  ## Parametros
    - sPaymentMethodId

  ## Retorno
    - any
  """
  def _retrievePaymentMethod(%{}) do
    # TODO: Implementacao futura
        # protected function _retrievePaymentMethod($sPaymentMethodId)
    #     {
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _retrieveProduct

  ## Parametros
    - sId

  ## Retorno
    - any
  """
  def _retrieveProduct(%{}) do
    # TODO: Implementacao futura
        # protected function _retrieveProduct($sId)
    #     {
    #         $oProduct = null;
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_retrieve_product 'bx_payment', 'stripe_retrieve_product' - hook to override product data retrieved from payment provider
    #          * - $unit_name - equals `bx_payment`
    #          * - $action - equals `stripe_retrieve_product`
    #          * - $object_id - not used
    #          * - $sender_id - not used
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `product_id` - [string] by ref, unique product id, can be overridden in hook processing
    #          *      - `product_object` - [object] by ref, an instance of product, redurned by payment provider, can be overridden in hook processing
    #          * @hook @ref hook-bx_payment-stripe_retrieve_product
    #          */
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_payment-stripe_v3_retrieve_product 'bx_payment', 'stripe_v3_retrieve_product' - hook to override product data retrieved from payment provider
    #          * It's equivalent to @ref hook-bx_payment-stripe_retrieve_product
    #          * @hook @ref hook-bx_payment-stripe_v3_retrieve_product
    #          */
    #         bx_alert($this->_oModule->_oConfig->getName(), $this->_sName . '_retrieve_product', 0, false, [
    #             'product_id' => &$sId,
    #             'product_object' => &$oProduct
    #         ]);
    # 
    #         if(!empty($oProduct))
    #             return $oProduct;
    # 
    #         try {
    #             $oProduct = \Stripe\Product::retrieve($sId);
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('Retrieve Product Error: ', $oException);
    #         }
    # 
    #         return $oProduct;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _listPlans

  ## Parametros
    - iLimit=100

  ## Retorno
    - any
  """
  def _listPlans(%{}) do
    # TODO: Implementacao futura
        # protected function _listPlans($iLimit = 100)
    #     {
    #         if($iLimit <= 0)
    #             $iLimit = 1;
    #         if($iLimit > 100)
    #             $iLimit = 100;
    # 
    #         try {
    #             $oPlans = \Stripe\Plan::all(array('limit' => $iLimit));
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('List Plans Error: ', $oException);
    #         }
    # 
    #         return $oPlans;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _retrieveEvent

  ## Parametros
    - sId

  ## Retorno
    - any
  """
  def _retrieveEvent(%{}) do
    # TODO: Implementacao futura
        # protected function _retrieveEvent($sId) {
    #         try {
    #             $oEvent = \Stripe\Event::retrieve($sId);
    #         }
    #         catch (Exception $oException) {
    #             return $this->_processException('Retrieve Event Error: ', $oException);
    #         }
    # 
    #         return $oEvent;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _processEvent

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _processEvent(%{}) do
    # TODO: Implementacao futura
        # protected function _processEvent()
    #     {
    #         $sInput = @file_get_contents("php://input");
    #         $aEvent = json_decode($sInput, true);
    #         if(empty($aEvent) || !is_array($aEvent)) 
    #             return 404;
    # 
    #         $sType = $aEvent['type'];
    #         if(!in_array($sType, array('invoice.payment_succeeded', 'charge.refunded', 'customer.subscription.deleted')))
    #             return 200;
    # 
    #         $this->log('Webhooks: ' . (!empty($sType) ? $sType : ''));
    #         $this->log($aEvent);
    # 
    #         $sMethod = '_processEvent' . bx_gen_method_name($sType, array('.', '_', '-'));
    #     	if(!method_exists($this, $sMethod))
    #             return 200;
    # 
    #     	return $this->$sMethod($aEvent) ? 200 : 403;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _processEventInvoicePaymentSucceeded

  ## Parametros
    - &aEvent

  ## Retorno
    - any
  """
  def _processEventInvoicePaymentSucceeded(%{}) do
    # TODO: Implementacao futura
        # protected function _processEventInvoicePaymentSucceeded(&$aEvent)
    #     {
    #         $mixedResult = $this->_getDataInvoicePaymentSucceeded($aEvent);
    #         if($mixedResult === false)
    #             return false;
    # 
    #         list($mixedPending, $aPaid) = $mixedResult;
    #         if(empty($mixedPending) || empty($aPaid))
    #             return false;
    # 
    #         $fChargeAmount = (float)$aPaid['amount'] / 100;
    #         $sChargeCurrency = strtoupper($aPaid['currency']);
    # 
    #         if(is_string($mixedPending))
    #             return $this->_oModule->_oDb->insertStrpPaymentPending($mixedPending, $fChargeAmount, $sChargeCurrency);
    # 
    #         if($this->_bCheckAmount && ((float)$mixedPending['amount'] != $fChargeAmount || strcasecmp($this->_oModule->_oConfig->getDefaultCurrencyCode(), $sChargeCurrency) !== 0))
    #             return false;
    # 
    #         if($mixedPending['type'] == BX_PAYMENT_TYPE_RECURRING)
    #             $this->_oModule->getObjectSubscriptions()->prolong($mixedPending);
    # 
    #         return $this->_oModule->registerPayment($mixedPending);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _processEventChargeRefunded

  ## Parametros
    - &aEvent

  ## Retorno
    - any
  """
  def _processEventChargeRefunded(%{}) do
    # TODO: Implementacao futura
        # protected function _processEventChargeRefunded(&$aEvent)
    #     {
    #         $mixedResult = $this->_getData($aEvent);
    #         if($mixedResult === false)
    #             return false;
    # 
    #         list($aPending) = $mixedResult;
    #         if(empty($aPending) || !is_array($aPending))
    #             return false;
    # 
    #         return $this->_oModule->refundPayment($aPending);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _processEventCustomerSubscriptionDeleted

  ## Parametros
    - &aEvent

  ## Retorno
    - any
  """
  def _processEventCustomerSubscriptionDeleted(%{}) do
    # TODO: Implementacao futura
        # protected function _processEventCustomerSubscriptionDeleted(&$aEvent)
    #     {
    #         $mixedResult = $this->_getData($aEvent);
    #         if($mixedResult === false)
    #             return false;
    # 
    #         list($aPending) = $mixedResult;
    #         if(empty($aPending) || !is_array($aPending))
    #             return true;
    # 
    #         return $this->_oModule->getObjectSubscriptions()->cancelLocal($aPending);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _processException

  ## Parametros
    - sMessage,&oException

  ## Retorno
    - any
  """
  def _processException(%{}) do
    # TODO: Implementacao futura
        # protected function _processException($sMessage, &$oException)
    #     {
    #         $aError = $oException->getJsonBody();
    # 
    #         $sMessage = $aError['error']['message'];
    #         if(empty($sMessage))
    #             $sMessage = $oException->getMessage();
    # 
    #         $this->log($sMessage . $aError['error']['message']);
    #         $this->log($aError);
    # 
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getData

  ## Parametros
    - &aEvent,bRetrieve=true

  ## Retorno
    - any
  """
  def _getData(%{}) do
    # TODO: Implementacao futura
        # protected function _getData(&$aEvent, $bRetrieve = true)
    #     {
    #         if($bRetrieve)
    #             $oEvent = $this->_retrieveEvent($aEvent['id']);
    #         else 
    #             $oEvent = \Stripe\Util\Util::convertToStripeObject($aEvent, array());
    # 
    #         if(empty($oEvent))
    #             return false;
    # 
    #         $aPending = $this->_oModule->_oDb->getOrderPending(array('type' => 'order', 'order' => $oEvent->data->object->subscription));
    #         $oCharge = $this->_retrieveCharge($oEvent->data->object->charge);
    # 
    #         return array($aPending, $oCharge);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getDataInvoicePaymentSucceeded

  ## Parametros
    - &aEvent,bRetrieve=true

  ## Retorno
    - any
  """
  def _getDataInvoicePaymentSucceeded(%{}) do
    # TODO: Implementacao futura
        # protected function _getDataInvoicePaymentSucceeded(&$aEvent, $bRetrieve = true)
    #     {
    #         if($bRetrieve)
    #             $oEvent = $this->_retrieveEvent($aEvent['id']);
    #         else 
    #             $oEvent = \Stripe\Util\Util::convertToStripeObject($aEvent, array());
    # 
    #         if(empty($oEvent))
    #             return false;
    # 
    #         /**
    #          * Note. $oEvent->data->object->subscription and $oEvent->data->object->charge 
    #          * are checked for backward compatibility.
    #          */
    #         $sSubscriptionId = '';
    #         if(!empty($oEvent->data->object->subscription))
    #             $sSubscriptionId = $oEvent->data->object->subscription;
    #         else if(!empty($oEvent->data->object->parent) && $oEvent->data->object->parent->type == 'subscription_details')
    #             $sSubscriptionId = $oEvent->data->object->parent->subscription_details->subscription;
    #         if(!$sSubscriptionId)
    #             return false;
    # 
    #         $aPending = $this->_oModule->_oDb->getOrderPending(['type' => 'order', 'order' => $sSubscriptionId]);
    # 
    #         $aPaid = [];
    #         if(!empty($oEvent->data->object->charge)) {
    #             $oCharge = $this->_retrieveCharge($oEvent->data->object->charge);
    #             if($oCharge)
    #                 $aPaid = [
    #                     'amount' => $oCharge->amount,
    #                     'currency' => $oCharge->currency
    #                 ];
    #         }
    #         else if(!empty($oEvent->data->object->amount_paid) && !empty($oEvent->data->object->currency))
    #             $aPaid = [
    #                 'amount' => $oEvent->data->object->amount_paid,
    #                 'currency' => $oEvent->data->object->currency
    #             ];            
    # 
    #         return [!empty($aPending) && is_array($aPending) ? $aPending : $sSubscriptionId, $aPaid];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getDataChangeDetailsRecurring

  ## Parametros
    - iPendingId

  ## Retorno
    - any
  """
  def _getDataChangeDetailsRecurring(%{}) do
    # TODO: Implementacao futura
        # protected function _getDataChangeDetailsRecurring($iPendingId)
    #     {
    #         $aResult = array();
    # 
    #         $aPending = $this->_oModule->_oDb->getOrderPending(array('type' => 'id', 'id' => $iPendingId));
    #         list($iVendorId, $iModuleId, $iItemId) = $this->_oModule->_oConfig->descriptorS2A($aPending['items']);
    #         if(empty($iModuleId) || empty($iVendorId) || (int)$iVendorId != (int)$aPending['seller_id'])
    #             return $aResult;
    # 
    #         $aItems = $this->_oModule->callGetCartItems((int)$iModuleId, array($iVendorId));
    #         if(empty($aItems) || !is_array($aItems))
    #             return $aResult;
    # 
    #         $oPlans = $this->_listPlans();
    #         if($oPlans === false)
    #             return $aResult;
    # 
    #         $aPlans = $oPlans->jsonSerialize();
    #         if(empty($aPlans) || !is_array($aPlans) || empty($aPlans['data']) || !is_array($aPlans['data']))
    #             return $aResult;
    # 
    #         $aPlans = $aPlans['data'];
    # 
    #         $aPlanNames = array();
    #         foreach($aPlans as $aPlan)
    #             $aPlanNames[] = $aPlan['id'];
    #         if(empty($aPlanNames) || !is_array($aPlanNames))
    #             return $aResult;
    # 
    #         foreach($aItems as $aItem) {
    #             $fPrice = $this->_oModule->_oConfig->getPrice(BX_PAYMENT_TYPE_RECURRING, $aItem);
    #             if($fPrice == 0 || (int)$aItem['id'] == (int)$iItemId || !in_array($aItem['name'], $aPlanNames))
    #                 continue;
    # 
    #             $aResult[] = array('key' => $aItem['id'], 'value' => $aItem['title']);
    #         }
    # 
    #         return $aResult;
    #     }
    :ok
  end

end
