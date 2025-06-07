
defmodule DeeperHub.Inc.Classes.BxBaseModProfileVote do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/profile/classes/BxBaseModProfileVote.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - sSystem,iId,iInit=1

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function __construct($sSystem, $iId, $iInit = 1)
    #     {
    #         parent::__construct($sSystem, $iId, $iInit);        
    # 
    #     	$this->_oModule = BxDolModule::getInstance($this->_sModule);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectAuthorId

  ## Parametros
    - iObjectId=0

  ## Retorno
    - any
  """
  def getObjectAuthorId(%{}) do
    # TODO: Implementacao futura
        # public function getObjectAuthorId($iObjectId = 0)
    #     {
    #         if(!BxDolService::call($this->_sModule, 'act_as_profile'))
    #             return parent::getObjectAuthorId ($iObjectId);
    # 
    #         $oProfile = BxDolProfile::getInstanceByContentAndType($iObjectId ? $iObjectId : $this->getId(), $this->_sModule);
    #         if(!$oProfile)
    #             return 0;
    # 
    #         return $oProfile->id();
    #     }
    :ok
  end

end
