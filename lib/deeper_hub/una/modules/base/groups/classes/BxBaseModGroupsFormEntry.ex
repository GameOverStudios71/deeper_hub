
defmodule DeeperHub.Inc.Classes.BxBaseModGroupsFormEntry do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/groups/classes/BxBaseModGroupsFormEntry.php
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
        # public function __construct($aInfo, $oTemplate = false)
    #     {
    #         if (!isset($this->_bAllowChangeUserForAdmins))
    #             $this->_bAllowChangeUserForAdmins = true;
    #         
    #         parent::__construct($aInfo, $oTemplate);
    # 
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $this->_bDisplayInvite = isset($CNF['OBJECT_FORM_ENTRY_DISPLAY_INVITE']) && $CNF['OBJECT_FORM_ENTRY_DISPLAY_INVITE'] == $this->aParams['display'];
    # 
    #         if (isset($this->aInputs['initial_members'])) {
    #             if(!isset($this->aInputs['initial_members']['value']))
    #                 $this->aInputs['initial_members']['value'] = $this->_bDisplayInvite ? [] : [bx_get_logged_profile_id()];
    # 
    #             if($this->_bDisplayInvite)
    #                 $this->aInputs['initial_members'] = array_merge($this->aInputs['initial_members'], [
    #                     'required' => 1,
    #                     'checker' => [
    #                         'func' => 'Avail',
    #                         'params' => [],
    #                         'error' => _t('_Enter_value_here'),
    #                     ]                    
    #                 ]);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP genCustomInputInitialMembers

  ## Parametros
    - aInput

  ## Retorno
    - any
  """
  def genCustomInputInitialMembers(%{}) do
    # TODO: Implementacao futura
        # protected function genCustomInputInitialMembers ($aInput)
    #     {
    #         $aInput['ajax_get_suggestions'] = BX_DOL_URL_ROOT . "modules/?r=" . $this->_oModule->_oConfig->getUri() . "/ajax_get_initial_members";
    #         if(bx_is_api()) {
    #             $aInput['ajax_get_suggestions'] = $this->_oModule->_oConfig->getName() . "/get_initial_members&params[]=";
    # 
    #             $aInput['value_data'] = [];
    #             if(!empty($aInput['value']) && is_array($aInput['value']))
    #                 foreach($aInput['value'] as $iProfileId)
    #                     if(($oProfile = BxDolProfile::getInstance($iProfileId)) !== false) {
    #                         $aProfile = $oProfile->getUnitAPI();
    #                         $aInput['value_data'][] = $aProfile['author_data'];
    #                     }
    #         }
    # 
    #         return $this->genCustomInputUsernamesSuggestions($aInput);
    #     }
    :ok
  end

end
