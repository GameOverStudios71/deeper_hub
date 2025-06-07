
defmodule DeeperHub.Inc.Classes.BxPhotosFormsEntryHelper do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/photos/classes/BxPhotosFormsEntryHelper.php
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
    #         $this->_sDisplayForFormAdd ='bx_photos_entry_upload';
    #         $this->_sObjectNameForFormAdd ='bx_photos_upload';
    # 
    #         parent::__construct($oModule);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onDataEditAfter

  ## Parametros
    - iContentId,aContentInfo,aTrackTextFieldsChanges,oProfile,oForm

  ## Retorno
    - any
  """
  def onDataEditAfter(%{}) do
    # TODO: Implementacao futura
        # public function onDataEditAfter ($iContentId, $aContentInfo, $aTrackTextFieldsChanges, $oProfile, $oForm)
    #     {
    #         $this->updateExif($iContentId, $aContentInfo);
    #         return parent::onDataEditAfter($iContentId, $aContentInfo, $aTrackTextFieldsChanges, $oProfile, $oForm);
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
        # public function onDataAddAfter ($iAccountId, $iContentId)
    #     {
    #         $aContentInfo = $this->_oModule->_oDb->getContentInfoById($iContentId);
    #         if ($aContentInfo){
    #              $this->updateExif($iContentId, $aContentInfo);
    #         }
    #        
    #         return parent::onDataAddAfter($iAccountId, $iContentId);
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
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    #         if (!empty($CNF['OBJECT_METATAGS_MEDIA_CAMERA'])) {
    #             $oMetatags = BxDolMetatags::getObjectInstance($CNF['OBJECT_METATAGS_MEDIA_CAMERA']);
    #             $oMetatags->onDeleteContent($aContentInfo['id']);
    #         }
    #         return parent::onDataDeleteAfter ($iContentId, $aContentInfo, $oProfile);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateExif

  ## Parametros
    - iContentId,aContentInfo

  ## Retorno
    - any
  """
  def updateExif(%{}) do
    # TODO: Implementacao futura
        # 
    #             
    #     function updateExif($iContentId, $aContentInfo)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    #         $oStorage = BxDolStorage::getObjectInstance($CNF['OBJECT_STORAGE']);
    #         $oTranscoder = BxDolTranscoderImage::getObjectInstance($CNF['OBJECT_IMAGES_TRANSCODER_PREVIEW']);
    #         
    #         if (!$oStorage || !$oTranscoder)
    #             return false;
    #         $aInfo = bx_get_image_exif_and_size($oStorage, $oTranscoder, $aContentInfo[$CNF['FIELD_THUMB']]);
    #         $this->_oModule->_oDb->updateEntries(array($CNF['FIELD_EXIF'] => $aInfo['exif']), array($CNF['FIELD_ID'] => $iContentId));
    #         
    #         $aExif = unserialize($aInfo['exif']);
    #         if ($aContentInfo && isset($aExif['Make']) && !empty($CNF['OBJECT_METATAGS_MEDIA_CAMERA'])) {
    # 		    $oMetatags = BxDolMetatags::getObjectInstance($CNF['OBJECT_METATAGS_MEDIA_CAMERA']);
    #             if ($oMetatags->keywordsIsEnabled()){
    # 		        $oMetatags->keywordsAddOne($aContentInfo['id'], $oMetatags->keywordsCameraModel($aExif));
    # 			}
    #         }
    #     }
    :ok
  end

end
