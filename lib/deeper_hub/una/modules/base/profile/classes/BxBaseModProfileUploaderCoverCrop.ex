
defmodule DeeperHub.Inc.Classes.BxBaseModProfileUploaderCoverCrop do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/profile/classes/BxBaseModProfileUploaderCoverCrop.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aObject,sStorageObject,sUniqId,oTemplate

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct ($aObject, $sStorageObject, $sUniqId, $oTemplate)
    #     {
    #         if(!empty($this->_sModule) && empty($this->_oModule))
    #             $this->_oModule = BxDolModule::getInstance($this->_sModule);
    # 
    #         parent::__construct($aObject, $sStorageObject, $sUniqId, $oTemplate ? $oTemplate : $this->_oModule->_oTemplate);
    # 
    #         $this->_sUploaderFormTemplate = 'uploader_form_crop_cover.html';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteGhostsForProfile

  ## Parametros
    - iProfileId,iContentId=false

  ## Retorno
    - any
  """
  def deleteGhostsForProfile(%{}) do
    # TODO: Implementacao futura
        # public function deleteGhostsForProfile($iProfileId, $iContentId = false)
    #     {
    #         if (!$iContentId)
    #             return parent::deleteGhostsForProfile($iProfileId, $iContentId);
    # 
    #         $CNF = $this->_oModule->_oConfig->CNF;
    #         $aContentInfo = $this->_oModule->_oDb->getContentInfoById($iContentId);
    #         
    #         $iCount = 0;
    # 
    #         $oStorage = BxDolStorage::getObjectInstance($this->_sStorageObject);
    # 
    #         $aGhosts = $oStorage->getGhosts($iProfileId, $iContentId, $iContentId ? true : false);
    #         foreach ($aGhosts as $aFile) {
    # 
    #             // for cover image delete only unassigned ghosts and currently set covers
    #             if ($aFile['id'] == $aContentInfo[$CNF['FIELD_COVER']] || $aFile['id'] != $aContentInfo[$CNF['FIELD_PICTURE']])
    #                 $iCount += $oStorage->deleteFile($aFile['id']);
    # 
    #         }
    # 
    #         return $iCount;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getGhosts

  ## Parametros
    - iProfileId,sFormat,sImagesTranscoder=false,iContentId=false

  ## Retorno
    - any
  """
  def getGhosts(%{}) do
    # TODO: Implementacao futura
        # public function getGhosts($iProfileId, $sFormat, $sImagesTranscoder = false, $iContentId = false)
    #     {
    #         $s = parent::getGhosts($iProfileId, $sFormat, $sImagesTranscoder, $iContentId);
    #         if (!$s || !$iContentId) // if we're creating new profile return all ghosts
    #             return $s;
    # 
    #         $a = array();
    #         if ($sFormat == 'array')
    #             $a = $s;
    #         else if ($sFormat == 'json')
    #             $a = json_decode($s, true);
    # 
    #         if (!$a)
    #             return $s;
    # 
    #         // filter out thumbnails
    #         $CNF = $this->_oModule->_oConfig->CNF;
    #         $aContentInfo = $this->_oModule->_oDb->getContentInfoById($iContentId);
    #         $aResult = array();
    #         foreach ($a as $aFile) {
    # 
    #             // for cover image show only unassigned ghosts and currently set covers
    #             if ($aFile['file_id'] == $aContentInfo[$CNF['FIELD_COVER']] || $aFile['file_id'] != $aContentInfo[$CNF['FIELD_PICTURE']])
    #                 $aResult[$aFile['file_id']] = $aFile;
    # 
    #         }
    # 
    #         if ('array' == $sFormat) {
    #             return $aResult;
    #         }
    #         else if ('json' == $sFormat) {
    #             return json_encode($aResult);
    #         } else { // html format is not suported for this data type
    #             return false;
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAdmin

  ## Parametros
    - iContentId=0

  ## Retorno
    - any
  """
  def isAdmin(%{}) do
    # TODO: Implementacao futura
        # protected function isAdmin ($iContentId = 0)
    #     {
    #         return $this->_oModule->_isModerator (false);
    #     }
    :ok
  end

end
