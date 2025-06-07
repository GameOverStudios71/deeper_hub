
defmodule DeeperHub.Inc.Classes.BxBaseModPaymentInstaller do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/payment/classes/BxBaseModPaymentInstaller.php
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
    #     function __construct($aConfig)
    #     {
    #         parent::__construct($aConfig);
    # 
    #         $this->_sParamDefaultPayment = 'sys_default_payment';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP enable

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def enable(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    # 	function enable($aParams)
    #     {
    #         $aResult = parent::enable($aParams);
    # 
    #         if($aResult['result'] && getParam($this->_sParamDefaultPayment) == '')
    #         	setParam($this->_sParamDefaultPayment, $this->_aConfig['name']);
    # 
    #         if($aResult['result'])
    #             BxDolService::call($this->_aConfig['name'], 'update_dependent_modules');
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP disable

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def disable(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    # 	function disable($aParams)
    #     {
    #         $aResult = parent::disable($aParams);
    # 
    #         if($aResult['result'] && getParam($this->_sParamDefaultPayment) == $this->_aConfig['name'])
    #         	setParam($this->_sParamDefaultPayment, '');
    # 
    #         return $aResult;
    #     }
    :ok
  end

end
