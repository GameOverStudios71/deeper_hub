
defmodule DeeperHub.Inc.Classes.BxDolSmsTwilio do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolSmsTwilio.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aObject,oTemplate=null,sDbClassName=''

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # protected function __construct($aObject, $oTemplate = null, $sDbClassName = '')
    #     {
    #         parent::__construct($aObject, $oTemplate, $sDbClassName);
    # 
    #         $this->_sSid = getParam('sys_sms_twilio_sid');
    #         $this->_sToken = getParam('sys_sms_twilio_token');
    #         $this->_sFromNumber = getParam('sys_sms_twilio_from_number');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP send

  ## Parametros
    - sTo,sMessage,sFrom=''

  ## Retorno
    - any
  """
  def send(%{}) do
    # TODO: Implementacao futura
        # public function send($sTo, $sMessage, $sFrom = '')
    #     {
    #         try {
    #             $oClient = new Twilio\Rest\Client($this->_sSid, $this->_sToken);
    #             $oClient->messages->create($this->normalizePhone($sTo), [
    #                 'body' => $sMessage, 
    #                 'from' => $sFrom != '' ? $this->normalizePhone($sFrom) : $this->normalizePhone($this->_sFromNumber)
    #             ]);
    # 
    #             return true;
    #         }
    #         catch (Exception $oException) {
    #             $this->_writeLog($oException->getFile() . ':' . $oException->getLine() . ' ' . $oException->getMessage());
    # 
    #             return false;
    #         }
    #     }
    :ok
  end

end
