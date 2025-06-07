
defmodule DeeperHub.Inc.Classes.BxPaymentFormCommissions do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/payment/classes/BxPaymentFormCommissions.php
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
    #         if(isset($this->aInputs['acl_id'])) {
    #             $this->aInputs['acl_id']['values'] = array(
    #                 array('key' => '0', 'value' => _t('_Select_one'))
    #             );
    # 
    #             $aLevels = BxDolAcl::getInstance()->getMemberships(false, true, false, true);
    #             foreach($aLevels as $iLevelId => $sLevelTitle)
    #                $this->aInputs['acl_id']['values'][] = array('key' => $iLevelId, 'value' => _t($sLevelTitle));
    #         }
    #     }
    :ok
  end

end
