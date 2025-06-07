
defmodule DeeperHub.Inc.Classes.BxAlbumsFormEntry do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/albums/classes/BxAlbumsFormEntry.php
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
    #         $this->MODULE = 'bx_albums';
    #         parent::__construct($aInfo, $oTemplate);
    # 
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if (isset($CNF['FIELD_PHOTO']) && isset($this->aInputs[$CNF['FIELD_PHOTO']]))
    #             $this->aInputs[$CNF['FIELD_PHOTO']]['init_reordering'] = true;
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
    #         if($isAssociateWithContent)
    #             return parent::processFiles ($sFieldFile, $iContentId, $isAssociateWithContent);
    # 
    #         $aMediasOld = $this->_oModule->_oDb->getMediaListByContentId($iContentId);                
    # 
    #         if(!parent::processFiles ($sFieldFile, $iContentId, $isAssociateWithContent)) 
    #             return false;
    # 
    #         $aMediasNew = $this->_oModule->_oDb->getMediaListByContentId($iContentId);
    # 
    #         $aIdsOld = array_column($aMediasOld, 'id');
    #         $aIdsNew = array_column($aMediasNew, 'id');
    #         $aIdsAdded = array_diff($aIdsNew, $aIdsOld);
    # 
    #         if(!empty($aIdsAdded)) {
    #             $aContentInfo = $this->_oModule->_oDb->getContentInfoById($iContentId);
    #             $iProfileId = $this->getContentOwnerProfileId($iContentId);
    # 
    #              /**
    #              * @hooks
    #              * @hookdef hook-bx_albums-medias_added 'bx_albums', 'medias_added' - hook on new medias added in album
    #              * - $unit_name - equals `bx_albums`
    #              * - $action - equals `medias_added` 
    #              * - $object_id - album_id
    #              * - $sender_id - author's profile_id
    #              * - $extra_params - array of additional params with the following array keys:
    #              *      - `object_author_id` - [int] confirmation type can be none/phone/email/email_and_phone/email_or_phone
    #              *      - `subobjects_ids` - [array] array of ids for added media's
    #              *      - `medias_added` - [array] array of ids for added media's
    #              *      - `privacy_view` - [string] privacy view value for current album
    #              *      - `cf` - [int] content filter id
    #              * @hook @ref hook-bx_albums-medias_added
    #              */
    #             bx_alert($this->_oModule->getName(), 'medias_added', $iContentId, $iProfileId, [
    #                 'object_author_id' => $iProfileId,
    # 
    #                 'subobjects_ids' => $aIdsAdded,
    #                 'medias_added' => $aIdsAdded,
    # 
    #                 'privacy_view' => $aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']],
    #                 'cf' => $aContentInfo[$CNF['FIELD_CF']]
    #             ]);
    #         }
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _associalFileWithContent

  ## Parametros
    - oStorage,iFileId,iProfileId,iContentId,sPictureField=''

  ## Retorno
    - any
  """
  def _associalFileWithContent(%{}) do
    # TODO: Implementacao futura
        # protected function _associalFileWithContent($oStorage, $iFileId, $iProfileId, $iContentId, $sPictureField = '')
    #     {
    #         parent::_associalFileWithContent($oStorage, $iFileId, $iProfileId, $iContentId, $sPictureField);
    # 
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $oTranscoder = BxDolTranscoderImage::getObjectInstance($CNF['OBJECT_IMAGES_TRANSCODER_BIG']);
    #         
    # 		$aInfo = bx_get_image_exif_and_size($oStorage, $oTranscoder, $iFileId);
    #         $aExif = unserialize($aInfo['exif']);
    #         if (false === $this->_oModule->_oDb->associateFileWithContent ($iContentId, $iFileId, $iProfileId, $this->getCleanValue('title-' . $iFileId), $aInfo['size'], $aInfo['exif']))
    #             return;
    # 
    #         $aMediaInfo = $this->_oModule->_oDb->getMediaInfoSimpleByFileId($iFileId);
    #         $aContentInfo = $this->_oModule->_oDb->getContentInfoById($iContentId);
    # 
    #         if ($aMediaInfo && !empty($CNF['OBJECT_METATAGS_MEDIA'])) {            
    #             $oMetatags = BxDolMetatags::getObjectInstance($CNF['OBJECT_METATAGS_MEDIA']);
    #             if ($oMetatags->keywordsIsEnabled())
    #                 $oMetatags->keywordsAdd($aMediaInfo['id'], $aMediaInfo['title']);
    #         }
    # 		if ($aMediaInfo && isset($aExif['Make']) && !empty($CNF['OBJECT_METATAGS_MEDIA_CAMERA'])) {
    # 		    $oMetatags = BxDolMetatags::getObjectInstance($CNF['OBJECT_METATAGS_MEDIA_CAMERA']);
    #             if ($oMetatags->keywordsIsEnabled()){
    # 		        $oMetatags->keywordsAddOne($aMediaInfo['id'], $oMetatags->keywordsCameraModel($aExif));
    # 			}
    #         }
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_albums-media_added 'bx_albums', 'media_added' - hook on new media added in album
    #          * - $unit_name - equals `bx_albums`
    #          * - $action - equals `media_added` 
    #          * - $object_id - album_id
    #          * - $sender_id - author's profile_id
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `object_author_id` - [int] confirmation type can be none/phone/email/email_and_phone/email_or_phone
    #          *      - `subobject_id` - [int] id for added media
    #          *      - `media_id` - [int] id for added media
    #          *      - `media_info` - [array] media info
    #          * @hook @ref hook-bx_albums-media_added
    #          */
    #         bx_alert($this->_oModule->getName(), 'media_added', $iContentId, $iProfileId, array(
    #             'object_author_id' => $aContentInfo[$CNF['FIELD_AUTHOR']],
    # 
    #             'subobject_id' => $aMediaInfo['id'],
    # 
    #             'media_id' => $aMediaInfo['id'], 
    #             'media_info' => $aMediaInfo,
    #         ));
    # 
    #         bx_alert($this->_oModule->getName() . '_media', 'added', $aMediaInfo['id'], $iProfileId, array(
    #             'object_id' => $iContentId, 
    #             'object_author_id' => $aContentInfo[$CNF['FIELD_AUTHOR']], 
    # 
    #             'media_info' => $aMediaInfo
    #         ));
    #     }
    :ok
  end

end
