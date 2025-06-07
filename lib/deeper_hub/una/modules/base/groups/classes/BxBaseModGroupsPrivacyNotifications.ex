
defmodule DeeperHub.Inc.Classes.BxBaseModGroupsPrivacyNotifications do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/groups/classes/BxBaseModGroupsPrivacyNotifications.php
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
        # 
    #     function __construct($aOptions, $oTemplate = false)
    #     {
    #         parent::__construct($aOptions, $oTemplate);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP check

  ## Parametros
    - iObjectId,iViewerId=0

  ## Retorno
    - any
  """
  def check(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function check($iObjectId, $iViewerId = 0)
    #     {
    #         if (!parent::check($iObjectId, $iViewerId))
    #             return false;
    # 
    #         if (!($aEvent = BxDolService::call('bx_notifications', 'get_event_by_id', array($iObjectId))))
    #             return false;
    # 
    #         return $this->checkGroupMember($aEvent['object_owner_id'], $iViewerId ? $iViewerId : bx_get_logged_profile_id());
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkGroupMember

  ## Parametros
    - iGroupProfileId,iViewerId

  ## Retorno
    - any
  """
  def checkGroupMember(%{}) do
    # TODO: Implementacao futura
        # public function checkGroupMember($iGroupProfileId, $iViewerId)
    #     {
    #         return $this->_oModule->_oDb->isAdmin($iGroupProfileId, $iViewerId);
    #     }
    :ok
  end

end
