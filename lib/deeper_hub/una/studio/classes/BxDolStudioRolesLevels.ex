
defmodule DeeperHub.Inc.Classes.BxDolStudioRolesLevels do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//studio/classes/BxDolStudioRolesLevels.php
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
        # public function __construct ($aOptions, $oTemplate = false)
    #     {
    #         parent::__construct ($aOptions, $oTemplate);
    # 
    #         $this->oDb = BxDolStudioRolesQuery::getInstance();
    # 
    #         $this->aNonDeletable = array(
    #             BX_DOL_STUDIO_ROLE_MASTER, 
    #             BX_DOL_STUDIO_ROLE_OPERATOR
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _delete

  ## Parametros
    - mixedId

  ## Retorno
    - any
  """
  def _delete(%{}) do
    # TODO: Implementacao futura
        # protected function _delete($mixedId)
    #     {
    #         $iId = (int)$mixedId;
    #         $aRole = $this->oDb->getRoles(array('type' => 'by_id', 'id' => $iId));
    #         if(empty($aRole) || !is_array($aRole))
    #             return false;
    # 
    #         if(in_array($iId, $this->aNonDeletable) || $this->oDb->isRoleUsed($iId))
    #             return false;
    # 
    #         $isStopDeletion = false;
    #         bx_alert('roles', 'before_delete', $iId, 0, array('role' => $aRole, 'stop_deletion' => &$isStopDeletion));
    #         if($isStopDeletion)
    #             return false;
    # 
    #         $oLanguage = BxDolStudioLanguagesUtils::getInstance();
    #         $oLanguage->deleteLanguageString($aRole['title']);
    #         $oLanguage->deleteLanguageString($aRole['description']);
    # 
    #         if(!parent::_delete($mixedId)) 
    #             return false;
    # 
    #         bx_alert('roles', 'deleted', $iId, 0, array('role' => $aRole));
    # 
    #         return true;
    #     }
    :ok
  end

end
