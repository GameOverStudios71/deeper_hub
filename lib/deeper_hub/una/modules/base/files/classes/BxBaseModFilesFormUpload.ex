
defmodule DeeperHub.Inc.Classes.BxBaseModFilesFormUpload do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/files/classes/BxBaseModFilesFormUpload.php
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
    #         parent::__construct($aInfo, $oTemplate);
    # 
    #         $this->_sGhostTemplate = 'form_ghost_template_upload.html';
    # 
    #         if (isset($this->aInputs['profile_id']))
    #             $this->aInputs['profile_id']['value'] = bx_get('profile_id');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP processFiles

  ## Parametros
    - sFieldFile,iContentId=0,isAssociateWithContent=false

  ## Retorno
    - any
  """
  def processFiles(%{}) do
    # TODO: Implementacao futura
        # public function processFiles ($sFieldFile, $iContentId = 0, $isAssociateWithContent = false)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if (!isset($this->aInputs[$sFieldFile]))
    #             return true;
    # 
    #         $mixedFileIds = $this->getCleanValue($sFieldFile);
    #         if(!$mixedFileIds)
    #             return true;
    # 
    #         $oStorage = BxDolStorage::getObjectInstance($this->aInputs[$sFieldFile]['storage_object']);
    #         if (!$oStorage)
    #             return false;
    # 
    #         $iProfileId = $this->getContentOwnerProfileId($iContentId);
    # 
    #         $aGhostFiles = $oStorage->getGhosts ($iProfileId, $isAssociateWithContent ? 0 : $iContentId, true);
    #         if (!$aGhostFiles)
    #             return true;
    # 
    #         bx_import('BxDolPrivacy');
    # 
    #         // get values form main form to pass it to each file later
    #         $aFormValues = [];
    #         foreach ($this->aInputs as $aInput)
    #             if(!empty($aInput['db']) && is_array($aInput['db']))
    #                 $aFormValues[$aInput['name']] = $this->getCleanValue($aInput['name']);
    # 
    #         $aContentIds = [];
    #         foreach ($aGhostFiles as $aFile) {
    #             if (CHECK_ACTION_RESULT_ALLOWED !== $this->_oModule->checkAllowedAdd())
    #                 continue;
    #             if (is_array($mixedFileIds) && !in_array($aFile['id'], $mixedFileIds))
    #                 continue;
    #             $iContentId = 0;
    #             if ($isAssociateWithContent)
    #                 $iContentId = BxBaseModGeneralFormEntry::insert (array_merge(array(
    #                     $CNF['FIELD_FOR_STORING_FILE_ID'] => $aFile['id'],
    #                     $CNF['FIELD_TITLE'] => $this->getCleanValue('title-' . $aFile['id']),
    #                     $CNF['FIELD_AUTHOR'] => bx_get('profile_id') && $this->_oModule->serviceIsAllowedAddContentToContext(bx_get('profile_id')) ? bx_get('profile_id') : '',
    #                     $CNF['FIELD_STATUS_ADMIN'] => !$this->_oModule->_isModerator() && !$this->_oModule->_oConfig->isAutoApproveEnabled() ? BX_BASE_MOD_GENERAL_STATUS_PENDING : BX_BASE_MOD_TEXT_STATUS_ACTIVE
    #                 ), $aFormValues));
    #             if (!$iContentId)
    #                 continue;
    #             $aContentIds[] = $iContentId;
    #             
    #             if ($aFile['private'] || (isset($aFormValues[$CNF['FIELD_ALLOW_VIEW_TO']]) && BX_DOL_PG_ALL !== $aFormValues[$CNF['FIELD_ALLOW_VIEW_TO']]))
    #                 $oStorage->setFilePrivate ($aFile['id'], true);
    #             if (!$iContentId)
    #                 continue;
    # 
    #             $this->_associalFileWithContent($oStorage, $aFile['id'], $iProfileId, $iContentId, $sFieldFile);
    #             $this->_oModule->checkAllowedAdd(true);
    #         }
    # 
    #         return $aContentIds;
    #     }
    :ok
  end

end
