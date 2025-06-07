
defmodule DeeperHub.Inc.Classes.BxDolStudioRolesUtils do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//studio/classes/BxDolStudioRolesUtils.php
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
        # public function __construct()
    #     {
    #         if (isset($GLOBALS['bxDolClasses'][get_class($this)]))
    #             trigger_error ('Multiple instances are not allowed for the class: ' . get_class($this), E_USER_ERROR);
    # 
    #         parent::__construct();
    # 
    #         $this->oDb = BxDolStudioRolesQuery::getInstance();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP __clone

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def __clone(%{}) do
    # TODO: Implementacao futura
        # public function __clone()
    #     {
    #         if (isset($GLOBALS['bxDolClasses'][get_class($this)]))
    #             trigger_error('Clone is not allowed for the class: ' . get_class($this), E_USER_ERROR);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInstance

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getInstance(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     static function getInstance()
    #     {
    #         if(!isset($GLOBALS['bxDolClasses'][__CLASS__]))
    #             $GLOBALS['bxDolClasses'][__CLASS__] = new BxDolStudioRolesUtils();
    # 
    #         return $GLOBALS['bxDolClasses'][__CLASS__];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getRoles

  ## Parametros
    - bActive=true

  ## Retorno
    - any
  """
  def getRoles(%{}) do
    # TODO: Implementacao futura
        # public function getRoles($bActive = true)
    #     {
    #         return $this->oDb->getRoles(array('type' => 'all' . ($bActive ? '_active' : '')));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getRole

  ## Parametros
    - iAccountId

  ## Retorno
    - any
  """
  def getRole(%{}) do
    # TODO: Implementacao futura
        # public function getRole($iAccountId)
    #     {
    #         $aMember = $this->oDb->getMembers(array('type' => 'by_account_id', 'account_id' => $iAccountId));
    #         if(empty($aMember) || !is_array($aMember))
    #             return 0;
    # 
    #         return (int)$aMember['role'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setRole

  ## Parametros
    - iAccountId,mixedRole

  ## Retorno
    - any
  """
  def setRole(%{}) do
    # TODO: Implementacao futura
        # public function setRole($iAccountId, $mixedRole)
    #     {
    #         if(is_array($mixedRole)) {
    #             if(count($mixedRole) != 1 || current($mixedRole) != 0) {
    #                 $iAccountRole = 0;
    # 
    #                 foreach($mixedRole as $iRole)
    #                     $iAccountRole = $iAccountRole | pow(2, ($iRole - 1));
    # 
    #                 $mixedRole = $iAccountRole;
    #             }
    #             else 
    #                 $mixedRole = 0;
    #         }
    # 
    #         return $this->oDb->setRole($iAccountId, $mixedRole);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isActionAllowed

  ## Parametros
    - sAction,iAccountId=0

  ## Retorno
    - any
  """
  def isActionAllowed(%{}) do
    # TODO: Implementacao futura
        # public function isActionAllowed($sAction, $iAccountId = 0)
    #     {
    #         if(empty($iAccountId))
    #             $iAccountId = getLoggedId();
    # 
    #         $aAction = $this->oDb->getActions(array('type' => 'by_name', 'name' => $sAction));
    #         if(empty($aAction) || !is_array($aAction))
    #             return true;
    # 
    #         $iRole = $this->getRole($iAccountId);
    #         return $this->oDb->isActionAllowed($iRole, (int)$aAction['id']);
    #     }
    :ok
  end

end
