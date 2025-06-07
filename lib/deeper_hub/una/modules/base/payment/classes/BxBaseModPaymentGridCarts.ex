
defmodule DeeperHub.Inc.Classes.BxBaseModPaymentGridCarts do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/payment/classes/BxBaseModPaymentGridCarts.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aOptions,oTemplate=false

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct ($aOptions, $oTemplate = false)
    #     {
    #         parent::__construct ($aOptions, $oTemplate);
    # 
    #         $this->_oModule = BxDolModule::getInstance($this->MODULE);
    #         $this->_oCart = $this->_oModule->getObjectCart();
    # 
    #         $this->_iSingleSeller = 0;
    #         if($this->_bSingleSeller)
    #             $this->_iSingleSeller = $this->_oModule->_oConfig->getSiteAdmin();
    # 
    #         $this->_sCurrencySign = $this->_oModule->_oConfig->getDefaultCurrencySign();
    # 
    #         $this->_sDefaultSortingOrder = 'DESC';
    # 
    #         $iClientId = bx_get('client_id');
    #         if($iClientId !== false)
    #             $this->_aQueryAppend['client_id'] = (int)$iClientId;
    # 
    #         $iSellerId = bx_get('seller_id');
    #         if($iSellerId !== false) {
    #             $iSellerId = (int)$iSellerId;
    #             $this->_aQueryAppend['seller_id'] = $iSellerId;
    # 
    #             if(!$this->_bSingleSeller)
    #                 $this->_sCurrencySign = $this->_oModule->getVendorCurrencySign($iSellerId);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addQueryParam

  ## Parametros
    - sKey,sValue

  ## Retorno
    - any
  """
  def addQueryParam(%{}) do
    # TODO: Implementacao futura
        # public function addQueryParam($sKey, $sValue)
    #     {
    #     	if(empty($sKey) || !isset($sValue))
    #             return;
    # 
    #         $this->_aQueryAppend[$sKey] = $sValue;
    #     }
    :ok
  end

end
