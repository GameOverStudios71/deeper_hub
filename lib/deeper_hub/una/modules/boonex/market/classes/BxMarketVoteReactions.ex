
defmodule DeeperHub.Inc.Classes.BxMarketVoteReactions do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/market/classes/BxMarketVoteReactions.php
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
    #     	$this->_sModule = 'bx_market';
    #     	$this->_oModule = BxDolModule::getInstance($this->_sModule);
    # 
    #         parent::__construct($sSystem, $iId, $iInit);        
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowedVote

  ## Parametros
    - isPerformAction=false

  ## Retorno
    - any
  """
  def isAllowedVote(%{}) do
    # TODO: Implementacao futura
        # public function isAllowedVote($isPerformAction = false)
    #     {
    #     	$CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #     	if($this->getObjectAuthorId() == $this->_getAuthorId())
    #             return false;
    # 
    #     	$oPrivacy = BxDolPrivacy::getObjectInstance($CNF['OBJECT_PRIVACY_VOTE']);
    #         if($oPrivacy && !$oPrivacy->check($this->_iId))
    #             return false;
    # 
    #     	return parent::isAllowedVote($isPerformAction);
    #     }
    :ok
  end

end
