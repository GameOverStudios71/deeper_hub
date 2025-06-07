
defmodule DeeperHub.Inc.Classes.BxPaymentFormInvoices do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/payment/classes/BxPaymentFormInvoices.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aInfo,oTemplate=false

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function __construct($aInfo, $oTemplate = false)
    #     {
    #         parent::__construct($aInfo, $oTemplate);
    # 
    #         $this->_sModule = 'bx_payment';
    #         $this->_oModule = BxDolModule::getInstance($this->_sModule);
    # 
    #         if(isset($this->aInputs['status'])) {
    #             $aStatuses = array(BX_PAYMENT_INV_STATUS_UNPAID, BX_PAYMENT_INV_STATUS_PAID, BX_PAYMENT_INV_STATUS_OVERDUE);
    # 
    #             $this->aInputs['status']['values'] = array();
    #             foreach($aStatuses as $sStatus)
    #                 $this->aInputs['status']['values'][] = array('key' => $sStatus, 'value' => _t('_bx_payment_txt_status_' . $sStatus));
    #         }
    #     }
    :ok
  end

end
