
defmodule DeeperHub.Inc.Classes.BxJobsConnectionFans do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/jobs/classes/BxJobsConnectionFans.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aObject

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($aObject)
    #     {
    #         $this->_sModule = 'bx_jobs';
    # 
    #         parent::__construct($aObject);
    # 
    #         $this->_bBan = true;
    #         $this->_bQuestionnaire = true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getConnectedInitiatorsCount

  ## Parametros
    - iContent,isMutual=false

  ## Retorno
    - any
  """
  def getConnectedInitiatorsCount(%{}) do
    # TODO: Implementacao futura
        # public function getConnectedInitiatorsCount($iContent, $isMutual = false)
    #     {
    #         $iResult = parent::getConnectedInitiatorsCount($iContent, $isMutual);
    # 
    #         if(($aAdmins = $this->_oModule->_oDb->getAdmins($iContent)) && is_array($aAdmins) && ($iAdmins = count($aAdmins)) > 0)
    #             $iResult -= $iAdmins;
    # 
    #         return $iResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getConnectedInitiators

  ## Parametros
    - iContent,isMutual=false,iStart=0,iLimit=BX_CONNECTIONS_LIST_LIMIT,iOrder=BX_CONNECTIONS_ORDER_NONE

  ## Retorno
    - any
  """
  def getConnectedInitiators(%{}) do
    # TODO: Implementacao futura
        # public function getConnectedInitiators($iContent, $isMutual = false, $iStart = 0, $iLimit = BX_CONNECTIONS_LIST_LIMIT, $iOrder = BX_CONNECTIONS_ORDER_NONE)
    #     {
    #         $aResults = parent::getConnectedInitiators($iContent, $isMutual, $iStart, $iLimit, $iOrder);
    # 
    #         if(($aAdmins = $this->_oModule->_oDb->getAdmins($iContent)) && is_array($aAdmins))
    #             $aResults = array_diff($aResults, $aAdmins);
    # 
    #         return $aResults;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getConnectedContentAsCondition

  ## Parametros
    - sContentField,iInitiator,iMutual=false

  ## Retorno
    - any
  """
  def getConnectedContentAsCondition(%{}) do
    # TODO: Implementacao futura
        # public function getConnectedContentAsCondition($sContentField, $iInitiator, $iMutual = false)
    #     {
    #         $aResults = parent::getConnectedContentAsCondition($sContentField, $iInitiator, $iMutual);
    # 
    #         if(($aAdmins = $this->_oModule->_oDb->getAdmins($iInitiator)) && is_array($aAdmins))
    #             $aResults['restriction']['connections_exclude_' . $this->_sObject] = [
    #                 'value' => $aAdmins,
    #                 'field' => 'content',
    #                 'operator' => 'not in',
    #                 'table' => $this->_aObject['table'],
    #             ];
    # 
    #         return $aResults;
    #     }
    :ok
  end

end
