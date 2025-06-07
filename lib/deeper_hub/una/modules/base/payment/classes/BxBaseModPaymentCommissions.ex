
defmodule DeeperHub.Inc.Classes.BxBaseModPaymentCommissions do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/payment/classes/BxBaseModPaymentCommissions.php
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
        # 
    # 
    #     function __construct()
    #     {
    #         parent::__construct();
    # 
    #         $this->_oModule = BxDolModule::getInstance($this->_sModule);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetInvoicesUrl

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def serviceGetInvoicesUrl(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetInvoicesUrl()
    #     {
    #     	if(!$this->_oModule->isLogged())
    #             return '';
    # 
    #     	return $this->_oModule->_oConfig->getUrl('URL_INVOICES');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetInvoicesCount

  ## Parametros
    - sType,iProfileId=0

  ## Retorno
    - any
  """
  def serviceGetInvoicesCount(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetInvoicesCount($sType, $iProfileId = 0)
    #     {
    #         if(!in_array($sType, array('unpaid', 'overdue')))
    #             return 0;
    # 
    #     	$iProfileId = !empty($iProfileId) ? $iProfileId : $this->_oModule->getProfileId();
    #         if(empty($iProfileId))
    #             return 0;
    # 
    #         return $this->_oModule->_oDb->getInvoices(array('type' => 'status', 'status' => $sType, 'committent_id' => $iProfileId, 'count' => true));
    #     }
    :ok
  end

end
