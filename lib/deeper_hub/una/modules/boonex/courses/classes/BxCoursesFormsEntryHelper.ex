
defmodule DeeperHub.Inc.Classes.BxCoursesFormsEntryHelper do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/courses/classes/BxCoursesFormsEntryHelper.php
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
    #         if($s = parent::onDataAddAfter($iAccountId, $iContentId))
    #             return $s;
    # 
    #         $oGroupProfile = BxDolProfile::getInstanceByContentAndType($iContentId, $this->_oModule->_oConfig->getName());
    #         if(!$oGroupProfile)
    #             return '';
    # 
    #         $iAdminProfileId = bx_get_logged_profile_id();
    #         $aInitialProfiles = bx_get('initial_members');
    #         if(!is_array($aInitialProfiles) || !in_array($iAdminProfileId, $aInitialProfiles))
    #             $this->makeAuthorAdmin($oGroupProfile, array($iAdminProfileId));
    # 
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onDataDeleteAfter

  ## Parametros
    - iContentId,aContentInfo,oProfile

  ## Retorno
    - any
  """
  def onDataDeleteAfter(%{}) do
    # TODO: Implementacao futura
        # public function onDataDeleteAfter($iContentId, $aContentInfo, $oProfile)
    #     {
    #         if($s = parent::onDataDeleteAfter($iContentId, $aContentInfo, $oProfile))
    #             return $s;
    # 
    #         $aDataItems = $this->_oModule->_oDb->getContentData([
    #             'sample' => 'entry_id',
    #             'entry_id' => $iContentId
    #         ]);
    # 
    #         if(!empty($aDataItems) && is_array($aDataItems))
    #             foreach($aDataItems as $aDataItem)
    #                 if(($sMethod = 'delete_entity') && bx_is_srv($aDataItem['content_type'], $sMethod))
    #                     bx_srv($aDataItem['content_type'], $sMethod, [$aDataItem['content_id']]);
    # 
    #         $this->_oModule->_oDb->deleteContentDataWithTracks($iContentId);
    # 
    #         $this->_oModule->_oDb->deleteContentNodesWithTracks($iContentId);
    # 
    #         $this->_oModule->_oDb->deleteContentStructureNode(['entry_id' => $iContentId]);
    # 
    #         return '';
    #     }
    :ok
  end

end
