
defmodule DeeperHub.Inc.Classes.BxOrgsFormsEntryHelper do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/organizations/classes/BxOrgsFormsEntryHelper.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - oModule

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($oModule)
    #     {
    #         parent::__construct($oModule);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onDataAddAfter

  ## Parametros
    - iAccountId,iContentId

  ## Retorno
    - any
  """
  def onDataAddAfter(%{}) do
    # TODO: Implementacao futura
        # public function onDataAddAfter($iAccountId, $iContentId)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if($s = parent::onDataAddAfter($iAccountId, $iContentId))
    #             return $s;
    # 
    #         $aInvitedMembers = bx_get('initial_members');
    #         if(empty($aInvitedMembers) || !is_array($aInvitedMembers))
    #             return '';
    # 
    #         $sGroupModule = $this->_oModule->_oConfig->getName();
    #         $oGroupProfile = BxDolProfile::getInstanceByContentAndType($iContentId, $sGroupModule);
    #         if(!$oGroupProfile)
    #             return '';
    #         
    #         $aGroupContentInfo = bx_srv($sGroupModule, 'get_info', array($iContentId, false));
    #         if(empty($aGroupContentInfo) || !is_array($aGroupContentInfo) || !in_array($aGroupContentInfo[$CNF['FIELD_AUTHOR']], $aInvitedMembers))
    #             return '';
    # 
    #         $oGroupAuthor = BxDolProfile::getInstance($aGroupContentInfo[$CNF['FIELD_AUTHOR']]);
    #         if(!$oGroupAuthor)
    #             return '';
    # 
    #         $sGroupAuthorModule = $oGroupAuthor->getModule();
    #         if(!BxDolRequest::serviceExists($sGroupAuthorModule, 'act_as_profile') || !bx_srv($sGroupAuthorModule, 'act_as_profile'))
    #             return '';
    # 
    #         $this->makeAdmin($oGroupAuthor->id(), $oGroupProfile, $aInvitedMembers);
    # 
    #         return '';
    #     }
    :ok
  end

end
