
defmodule DeeperHub.Inc.Classes.BxVideosTemplate do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/videos/classes/BxVideosTemplate.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - &oConfig,&oDb

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct(&$oConfig, &$oDb)
    #     {
    #         $this->MODULE = 'bx_videos';
    #         parent::__construct($oConfig, $oDb);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP entryText

  ## Parametros
    - aData,sTemplateName='entry-text.html'

  ## Retorno
    - any
  """
  def entryText(%{}) do
    # TODO: Implementacao futura
        # public function entryText ($aData, $sTemplateName = 'entry-text.html')
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         $aVars = $this->getTmplVarsText($aData);
    #         if($this->_bIsApi) {
    #             $aImage = bx_api_get_image($CNF['OBJECT_STORAGE'], (int)$aData[$CNF['FIELD_THUMB']]);
    #             if(!$aImage)
    #                 $aImage = bx_api_get_image([$CNF['OBJECT_STORAGE_VIDEOS'], $CNF['OBJECT_VIDEOS_TRANSCODERS']['poster']], (int)$aData[$CNF['FIELD_VIDEO']]);
    # 
    #             return array_merge($aVars, [
    #                 'image' => $aImage,
    #                 'video' => $this->_oModule->getVideoData($aData)
    #             ]);
    #         }
    # 
    #         $mixedResult = $this->parseHtmlByName($sTemplateName, $aVars);
    # 
    #         $sVideoPlayer = $this->entryVideo($aData);
    #         if($sVideoPlayer === false)
    #             return $mixedResult;
    # 
    #         return $this->parseHtmlByContent($mixedResult, array(
    #             'entry_video' => $sVideoPlayer, 
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP entryVideo

  ## Parametros
    - aContentInfo,mixedContext=false,aAttrs=false,sStyles=false

  ## Retorno
    - any
  """
  def entryVideo(%{}) do
    # TODO: Implementacao futura
        # public function entryVideo ($aContentInfo, $mixedContext = false, $aAttrs = false, $sStyles = false)
    #     {
    #         $aTmplVars = [
    #             'video_title' => bx_process_output($aContentInfo['title']),
    #             'video_title_attr' => bx_html_attribute($aContentInfo['title']),
    #             'video_poster_url' => '',
    #             'video' => ''
    #         ];
    # 
    #         if($aContentInfo['video_source'] == 'embed' && !empty($aContentInfo['video_embed_data'])) {
    #             if(!is_array($aContentInfo['video_embed_data'])) 
    #                 $aContentInfo['video_embed_data'] = unserialize($aContentInfo['video_embed_data']);
    # 
    #             if(isset($aContentInfo['video_embed_data']['embed']) && !empty($aContentInfo['video_embed_data']['embed']))
    #                 return $this->getResponsiveEmbed($aContentInfo['video_embed_data']['embed']);
    #         }
    # 
    #         if(($mixedVideo = $this->getVideo($aContentInfo, $aAttrs, $sStyles)) !== false)
    #             $aTmplVars = array_merge($aTmplVars, [
    #                 'video_poster_url' => $mixedVideo['poster_url'],
    #                 'video' => $mixedVideo['player']
    #             ]);
    # 
    #         return $this->parseHtmlByName('entry-video.html', $aTmplVars);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP entryRating

  ## Parametros
    - aData

  ## Retorno
    - any
  """
  def entryRating(%{}) do
    # TODO: Implementacao futura
        # public function entryRating($aData)
    #     {
    #         $CNF = &$this->getModule()->_oConfig->CNF;
    # 
    #     	$sVotes = '';
    #         $oVotes = BxDolVote::getObjectInstance($CNF['OBJECT_VOTES_STARS'], $aData['id']);
    #         if($oVotes) {
    # 			$sVotes = $oVotes->getElementBlock(array('show_counter' => true, 'show_legend' => true));
    # 			if(!empty($sVotes))
    # 				$sVotes = $this->parseHtmlByName('entry-rating.html', array(
    # 		    		'content' => $sVotes,
    # 		    	));
    #         }
    # 
    #     	return $sVotes; 
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getVideo

  ## Parametros
    - aContentInfo,aAttrs=false,sStyles=false

  ## Retorno
    - any
  """
  def getVideo(%{}) do
    # TODO: Implementacao futura
        # public function getVideo($aContentInfo, $aAttrs = false, $sStyles = false)
    #     {
    #         $CNF = &$this->getModule()->_oConfig->CNF;
    # 
    #         if ($aContentInfo['video_source'] == 'embed' && !empty($aContentInfo['video_embed_data'])) {
    #             if (!is_array($aContentInfo['video_embed_data'])) $aContentInfo['video_embed_data'] = unserialize($aContentInfo['video_embed_data']);
    #             if (isset($aContentInfo['video_embed_data']['thumb']) && !empty($aContentInfo['video_embed_data']['thumb']) && isset($aContentInfo['video_embed_data']['embed']) && !empty($aContentInfo['video_embed_data']['embed'])) {
    #                 return [
    #                     'poster_url' => $aContentInfo['video_embed_data']['thumb'],
    #                     'player' => $this->getResponsiveEmbed($aContentInfo['video_embed_data']['embed']),
    #                 ];
    #             }
    #         }
    # 
    #         $oStorage = BxDolStorage::getObjectInstance($CNF['OBJECT_STORAGE_VIDEOS']);
    # 
    #         $aTranscodersVideo = false;
    #         if($CNF['OBJECT_VIDEOS_TRANSCODERS'])
    #             $aTranscodersVideo = array (
    #                 'poster' => BxDolTranscoder::getObjectInstance($CNF['OBJECT_VIDEOS_TRANSCODERS']['poster']),
    #                 'gallery' => BxDolTranscoder::getObjectInstance($CNF['OBJECT_VIDEOS_TRANSCODERS']['poster_gallery']),
    #                 'mp4' => BxDolTranscoder::getObjectInstance($CNF['OBJECT_VIDEOS_TRANSCODERS']['mp4']),
    #                 'mp4_hd' => BxDolTranscoder::getObjectInstance($CNF['OBJECT_VIDEOS_TRANSCODERS']['mp4_hd']),
    #             );
    # 
    #         $iFile = (int)$aContentInfo[$CNF['FIELD_VIDEO']];
    #         $aFile = $oStorage->getFile($iFile);
    #         if(empty($aFile) || !is_array($aFile) || strncmp('video/', $aFile['mime_type'], 6) !== 0)
    #             return false;
    # 
    #         $aTranscodersVideo['gallery']->getFileUrl($iFile); // it's needed to transcode gallery image if it's not available yet
    # 
    #         $this->_checkDuration($aContentInfo);
    # 
    #         $sPosterSrc = !empty($CNF['FIELD_POSTER']) ? $CNF['FIELD_POSTER'] : $CNF['FIELD_THUMB'];
    #         if(!empty($sPosterSrc) && !empty($aContentInfo[$sPosterSrc]))
    #             $sPoster = BxDolTranscoder::getObjectInstance($CNF['OBJECT_IMAGES_TRANSCODER_POSTER'])->getFileUrl($aContentInfo[$sPosterSrc]);
    #         else 
    #             $sPoster = $aTranscodersVideo['poster']->getFileUrl($iFile);
    # 
    #         $sVideoUrl = $oStorage->getFileUrlById($iFile);
    #         $aVideoFile = $oStorage->getFile($iFile);
    # 
    #         $sVideoUrlHd = '';
    #         if (!empty($aVideoFile['dimensions']) && $aTranscodersVideo['mp4_hd']->isProcessHD($aVideoFile['dimensions']))
    #             $sVideoUrlHd = $aTranscodersVideo['mp4_hd']->getFileUrl($iFile);
    # 
    #         return array(
    #             'poster_url' => $aTranscodersVideo['poster']->getFileUrl($iFile),
    #             'player' => BxTemplFunctions::getInstance()->videoPlayer(
    #                 $sPoster, 
    #                 $aTranscodersVideo['mp4']->getFileUrl($iFile), 
    #                 $sVideoUrlHd, $aAttrs, $sStyles ? $sStyles : ''
    #             )
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUnitImages

  ## Parametros
    - aData

  ## Retorno
    - any
  """
  def getUnitImages(%{}) do
    # TODO: Implementacao futura
        # public function getUnitImages ($aData)
    #     {
    #         $CNF = &$this->getModule()->_oConfig->CNF;
    # 
    #         $iImageId = 0;
    #         $sImageThumb = $sImageGallery = '';
    # 
    #         $iImageId = (int)$aData[$CNF['FIELD_THUMB']];
    #         $sImageThumb = $this->_getUnitImage($CNF['FIELD_THUMB'], $CNF['OBJECT_IMAGES_TRANSCODER_GALLERY'], $aData);
    #         if(empty($sImageThumb)) {
    #             $iImageId = (int)$aData[$CNF['FIELD_VIDEO']];
    #             $sImageThumb = $this->_getUnitImage($CNF['FIELD_VIDEO'], $CNF['OBJECT_VIDEOS_TRANSCODERS']['poster_gallery'], $aData);
    #         }
    # 
    #         if(!empty($sImageThumb))
    #             $sImageGallery = $sImageThumb;
    # 
    #         $sImageCover = $this->_getUnitImage($CNF['FIELD_THUMB'], $CNF['OBJECT_IMAGES_TRANSCODER_COVER'], $aData);
    #         if(!empty($sImageCover))
    #             return array($aData[$CNF['FIELD_THUMB']], $sImageThumb, $sImageGallery, $sImageCover);
    # 
    #         $sImageCover = $this->_getUnitImage($CNF['FIELD_VIDEO'], $CNF['OBJECT_VIDEOS_TRANSCODERS']['poster'], $aData);
    #         if(!empty($sImageCover))
    #             return array($aData[$CNF['FIELD_VIDEO']], $sImageThumb, $sImageGallery, $sImageCover);
    # 
    #         return array($iImageId, $sImageThumb, $sImageGallery, '');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUnitThumbAndGallery

  ## Parametros
    - aData

  ## Retorno
    - any
  """
  def getUnitThumbAndGallery(%{}) do
    # TODO: Implementacao futura
        # protected function getUnitThumbAndGallery ($aData)
    #     {
    #         $CNF = &$this->getModule()->_oConfig->CNF;
    # 
    #         $sImage = $this->_getUnitImage($CNF['FIELD_THUMB'], $CNF['OBJECT_IMAGES_TRANSCODER_GALLERY'], $aData);
    #         if(!empty($sImage))
    #             return array($sImage, $sImage);
    # 
    #         $sImage = $this->_getUnitImage($CNF['FIELD_VIDEO'], $CNF['OBJECT_VIDEOS_TRANSCODERS']['poster_gallery'], $aData);
    #         if(!empty($sImage))
    #             return array($sImage, $sImage);
    # 
    #         return array('', '');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getUnitImage

  ## Parametros
    - sField,sTranscoder,&aData

  ## Retorno
    - any
  """
  def _getUnitImage(%{}) do
    # TODO: Implementacao futura
        # protected function _getUnitImage ($sField, $sTranscoder, &$aData)
    #     {
    #         $CNF = &$this->getModule()->_oConfig->CNF;
    # 
    #         $sImage = '';
    # 
    #         if (empty($sField) || empty($aData[$sField])) {
    #             if ($aData['video_source'] == 'embed' && !empty($aData['video_embed_data'])) {
    #                 if (!is_array($aData['video_embed_data'])) $aData['video_embed_data'] = unserialize($aData['video_embed_data']);
    #                 if (isset($aData['video_embed_data']['thumb']) && !empty($aData['video_embed_data']['thumb']))
    #                     return $aData['video_embed_data']['thumb'];
    #             } else {
    #                 return $sImage;
    #             }
    #         }
    # 
    #         $oImagesTranscoder = BxDolTranscoderImage::getObjectInstance($sTranscoder);
    #         if($oImagesTranscoder)
    #             $sImage = $oImagesTranscoder->getFileUrl($aData[$sField]);
    # 
    #         return $sImage;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _checkDuration

  ## Parametros
    - &aContentInfo

  ## Retorno
    - any
  """
  def _checkDuration(%{}) do
    # TODO: Implementacao futura
        # protected function _checkDuration(&$aContentInfo) 
    #     {
    #         $CNF = &$this->getModule()->_oConfig->CNF;
    # 
    #         $iVideo = (int)$aContentInfo[$CNF['FIELD_VIDEO']];
    #         if(empty($iVideo) || !empty($aContentInfo[$CNF['FIELD_DURATION']]))
    #             return;
    # 
    #         $sFile = BxDolTranscoderImage::getObjectInstance($CNF['OBJECT_VIDEOS_TRANSCODERS']['mp4'])->getFileUrl($iVideo);
    #         if(empty($sFile))
    #             return;
    # 
    #         $iDuration = BxDolTranscoderVideo::getDuration($sFile);
    #         if(empty($iDuration))
    #             return;
    # 
    #         $this->_oDb->updateEntries(array($CNF['FIELD_DURATION'] => $iDuration), array($CNF['FIELD_ID'] => $aContentInfo[$CNF['FIELD_ID']]));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getResponsiveEmbed

  ## Parametros
    - sEmbedCode,bDynamic=false

  ## Retorno
    - any
  """
  def getResponsiveEmbed(%{}) do
    # TODO: Implementacao futura
        # public function getResponsiveEmbed($sEmbedCode, $bDynamic = false) {
    #         $sCss = $this->addCss('embeds.css', $bDynamic);
    # 
    #         return $this->parseHtmlByName('entry-video-embed.html', [
    #             'video' => $sEmbedCode,
    #         ]).($bDynamic ? $sCss : '');
    #     }
    :ok
  end

end
