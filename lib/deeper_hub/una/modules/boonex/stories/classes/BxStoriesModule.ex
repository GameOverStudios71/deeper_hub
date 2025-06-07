
defmodule DeeperHub.Inc.Classes.BxStoriesModule do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/stories/classes/BxStoriesModule.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - &aModule

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function __construct(&$aModule)
    #     {
    #         parent::__construct($aModule);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionEmbed

  ## Parametros
    - iContentId,sUnitTemplate='',sAddCode=''

  ## Retorno
    - any
  """
  def actionEmbed(%{}) do
    # TODO: Implementacao futura
        # public function actionEmbed($iContentId, $sUnitTemplate = '', $sAddCode = '')
    #     {
    #         return $this->_oTemplate->getJsCode('main') . parent::actionEmbed($iContentId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionPlay

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def actionPlay(%{}) do
    # TODO: Implementacao futura
        # public function actionPlay($iContentId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         $sJsObject = $this->_oConfig->getJsObject('main');
    # 
    #         $aContentInfo = $this->_oDb->getContentInfoById($iContentId);
    #         if(($sMsg = $this->checkAllowedEdit($aContentInfo)) !== CHECK_ACTION_RESULT_ALLOWED)
    #             return echoJson(['msg' => $sMsg]);
    # 
    #         return echoJson(['popup' => [
    #             'html' => $this->_oTemplate->entryPlay($aContentInfo), 
    #             'options' => [
    #                 'closeOnOuterClick' => true,
    #                 'removeOnClose' => true,
    #                 'onShow' => $sJsObject . '.playInit()',
    #                 'onHide' => $sJsObject . '.playDestroy()'
    #             ]
    #         ]]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionEmbedMedia

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def actionEmbedMedia(%{}) do
    # TODO: Implementacao futura
        # public function actionEmbedMedia($iContentId)
    #     {
    #         $oTemplate = BxDolTemplate::getInstance();
    #         
    #         $aContentInfo = $this->_oDb->getMediaInfoById($iContentId);
    #         if(empty($aContentInfo))
    #             $oTemplate->getEmbed(false);
    # 
    #         if(empty($sUnitTemplate))
    #             $sUnitTemplate = 'unit_media_gallery.html';
    # 
    #         $oTemplate->getEmbed($this->_oTemplate->unit($aContentInfo, true, $sUnitTemplate));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionEditMedia

  ## Parametros
    - iMediaId

  ## Retorno
    - any
  """
  def actionEditMedia(%{}) do
    # TODO: Implementacao futura
        # public function actionEditMedia($iMediaId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         $iMediaId = (int)$iMediaId;
    #         $aMediaInfo = $this->_oDb->getMediaInfoById($iMediaId);
    #         $aContentInfo = $this->_oDb->getContentInfoById($aMediaInfo['content_id']);
    #         if(($sMsg = $this->checkAllowedEdit($aContentInfo)) !== CHECK_ACTION_RESULT_ALLOWED)
    #             return echoJson(['msg' => $sMsg]);
    # 
    #         $oForm = BxDolForm::getObjectInstance($CNF['OBJECT_FORM_MEDIA'], $CNF['OBJECT_FORM_MEDIA_DISPLAY_EDIT']);
    #         $oForm->initForm('edit', $iMediaId);
    #         $oForm->initChecker();
    # 
    #         if($oForm->isSubmittedAndValid()) {
    #             if($oForm->update($iMediaId) !== false) {
    #                 $aMediaInfo = $this->_oDb->getMediaInfoById($iMediaId);
    #                 $aRes = array('reload' => 1);
    #             }
    #             else
    #                 $aRes = array('msg' => _t('_bx_stories_txt_err_cannot_perform_action'));
    # 
    #             return echoJson($aRes);
    #         }
    # 
    #         $sContent = BxTemplStudioFunctions::getInstance()->transBox('bx-stories-edit-media-popup', $this->_oTemplate->parseHtmlByName('media_edit.html', array(
    #             'form_id' => $oForm->aFormAttrs['id'],
    #             'form' => $oForm->getCode(true)
    #         )));
    # 
    #         echoJson(array('popup' => array('html' => $sContent, 'options' => array('closeOnOuterClick' => false))));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionDeleteMedia

  ## Parametros
    - iMediaId

  ## Retorno
    - any
  """
  def actionDeleteMedia(%{}) do
    # TODO: Implementacao futura
        # public function actionDeleteMedia($iMediaId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         $sUploader = reset($CNF['OBJECT_UPLOADERS']);
    #         $aMediaInfo = $this->_oDb->getMediaInfoById($iMediaId);
    #         if(!$sUploader || empty($aMediaInfo) || !is_array($aMediaInfo))
    #             return echoJson([]);
    # 
    #         $oUploader = BxDolUploader::getObjectInstance($sUploader, $CNF['OBJECT_STORAGE'], '');
    #         if($oUploader === false) 
    #             return echoJson(['msg' => _t('_sys_txt_error_occured')]);
    # 
    #         $oUploader->deleteGhost($aMediaInfo['file_id'], bx_get_logged_profile_id());
    # 
    #         return echoJson(['redirect' => bx_absolute_url(BxDolPermalinks::getInstance()->permalink('page.php?i=' . $CNF['URI_VIEW_ENTRY'] . '&id=' . $aMediaInfo['content_id']))]);            
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetSiblingMedia

  ## Parametros
    - iMediaId,mixedContext

  ## Retorno
    - any
  """
  def actionGetSiblingMedia(%{}) do
    # TODO: Implementacao futura
        # public function actionGetSiblingMedia($iMediaId, $mixedContext)
    #     {
    #         $aSiblings = false;
    #         $sErrorMsg = false;
    #         if (!($aMediaInfo = $this->_oDb->getMediaInfoById((int)$iMediaId))) 
    #             $sErrorMsg = _t('_sys_txt_error_occured');
    # 
    #         if (empty($sErrorMsg) && !($aContentInfo = $this->_oDb->getContentInfoById($aMediaInfo['content_id'])))
    #             $sErrorMsg = _t('_sys_txt_error_occured');
    # 
    #         if (empty($sErrorMsg) && (CHECK_ACTION_RESULT_ALLOWED !== ($sMsg = $this->checkAllowedView($aContentInfo))))
    #             $sErrorMsg = $sMsg;
    # 
    #         if (empty($sErrorMsg)) {
    #             $aSiblings = array (
    #                 'next' => $this->_oTemplate->getNextPrevMedia($aMediaInfo, true, $mixedContext),
    #                 'prev' => $this->_oTemplate->getNextPrevMedia($aMediaInfo, false, $mixedContext),
    #             );
    #         }
    #     
    #         $a = $sErrorMsg ? array('error' => $sErrorMsg) : array('next' => $aSiblings['next'], 'prev' => $aSiblings['prev']);
    # 
    #         $s = json_encode($a);
    # 
    #         header('Content-type: text/html; charset=utf-8');
    #         echo $s;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetSafeServices

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def serviceGetSafeServices(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetSafeServices()
    #     {
    #         return array_merge(parent::serviceGetSafeServices(), [
    #             'EntityAddFiles' => '',
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceMediaAllActions

  ## Parametros
    - mixedContent=false,aParams=[]

  ## Retorno
    - any
  """
  def serviceMediaAllActions(%{}) do
    # TODO: Implementacao futura
        # public function serviceMediaAllActions ($mixedContent = false, $aParams = [])
    #     {
    #         $iMediaId = 0;
    #         $aMediaInfo = [];
    # 
    #         $bContent = !empty($mixedContent);
    #         if($bContent && is_array($mixedContent))
    #             list($iMediaId, $aMediaInfo) = $mixedContent;
    #         else {
    #             if($bContent)
    #                 $iMediaId = (int)$mixedContent;
    #             else
    #                 $iMediaId = bx_process_input(bx_get('id'), BX_DATA_INT);
    # 
    #             if(!$iMediaId)
    #                 return false;
    # 
    #             $aMediaInfo = $this->_oDb->getMediaInfoById($iMediaId);
    #         }
    # 
    #         if(!$iMediaId || !$aMediaInfo)
    #             return false;
    # 
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         return parent::serviceEntityAllActions ([$iMediaId, $aMediaInfo], array_merge([
    #             'object_menu' => $CNF['OBJECT_MENU_ACTIONS_VIEW_MEDIA'],
    #             'object_transcoder' => $CNF['OBJECT_IMAGES_TRANSCODER_BIG'],
    #             'entry_url' => bx_absolute_url(BxDolPermalinks::getInstance()->permalink('page.php?i=' . $CNF['URI_VIEW_ENTRY'] . '&id=' . $aMediaInfo[$CNF['FIELD_MEDIA_CONTENT_ID']])),
    #             'entry_title' => $aMediaInfo['title'],
    #             'entry_thumb' => $aMediaInfo['file_id']
    #         ], $aParams));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceEntityAddFiles

  ## Parametros
    - iContentId=0

  ## Retorno
    - any
  """
  def serviceEntityAddFiles(%{}) do
    # TODO: Implementacao futura
        # public function serviceEntityAddFiles ($iContentId = 0)
    #     {
    #         return $this->_serviceEntityForm ('editDataForm', $iContentId, 'bx_stories_entry_add_media');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceDeleteFileAssociations

  ## Parametros
    - iFileId

  ## Retorno
    - any
  """
  def serviceDeleteFileAssociations(%{}) do
    # TODO: Implementacao futura
        # public function serviceDeleteFileAssociations($iFileId)
    #     {        
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if (!($aMediaInfo = $this->_oDb->getMediaInfoSimpleByFileId($iFileId))) // file is already deleted
    #             return true; 
    #     
    #         if (!$this->_oDb->deassociateFileWithContent(0, $iFileId))
    #             return false;
    # 
    #         $aContentInfo = $this->_oDb->getContentInfoById($aMediaInfo['content_id']);
    #         $iSender = isLogged() ? bx_get_logged_profile_id() : $aMediaInfo['author'];
    #         $iAuthor = isset($aContentInfo[$CNF['FIELD_AUTHOR']]) ? $aContentInfo[$CNF['FIELD_AUTHOR']] : $aMediaInfo['author'];
    #         
    #         /**
    #          * @hooks
    #          * @hookdef hook-bx_stories-media_deleted 'bx_stories', 'media_deleted' - hook on new media deleted from story
    #          * - $unit_name - equals `bx_stories`
    #          * - $action - equals `media_deleted` 
    #          * - $object_id - story_id
    #          * - $sender_id - author's profile_id
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `object_author_id` - [int] confirmation type can be none/phone/email/email_and_phone/email_or_phone
    #          *      - `subobject_id` - [int] id for added media
    #          *      - `media_id` - [int] id for added media
    #          *      - `media_info` - [array] media info
    #          * @hook @ref hook-bx_stories-media_deleted
    #          */
    #         bx_alert($this->getName(), 'media_deleted', $aMediaInfo['content_id'], $iSender, array(
    #             'object_author_id' => $iAuthor,
    # 
    #             'subobject_id' => $aMediaInfo['id'],
    # 
    #             'media_id' => $aMediaInfo['id'], 
    #             'media_info' => $aMediaInfo,
    #         ));
    # 
    #         bx_alert($this->getName() . '_media', 'deleted', $aMediaInfo['id'], $iSender, array(
    #             'object_id' => $aMediaInfo['content_id'],
    #             'object_author_id' => $iAuthor,
    # 
    #             'media_info' => $aMediaInfo,
    #         ));        
    # 
    #         if (!empty($CNF['OBJECT_VIEWS_MEDIA'])) {
    #             $o = BxDolView::getObjectInstance($CNF['OBJECT_VIEWS_MEDIA'], $aMediaInfo['id']);
    #             if ($o) $o->onObjectDelete();
    #         }
    # 
    #         if (!empty($CNF['OBJECT_VOTES_MEDIA'])) {
    #             $o = BxDolVote::getObjectInstance($CNF['OBJECT_VOTES_MEDIA'], $aMediaInfo['id']);
    #             if ($o) $o->onObjectDelete();
    #         }
    # 
    #         if (!empty($CNF['OBJECT_SCORES_MEDIA'])) {
    #             $o = BxDolScore::getObjectInstance($CNF['OBJECT_SCORES_MEDIA'], $aMediaInfo['id']);
    #             if ($o) $o->onObjectDelete();
    #         }
    # 
    #         if (!empty($CNF['OBJECT_COMMENTS_MEDIA'])) {
    #             $o = BxDolCmts::getObjectInstance($CNF['OBJECT_COMMENTS_MEDIA'], $aMediaInfo['id']);
    #             if ($o) $o->onObjectDelete();
    #         }
    # 
    #         BxDolPage::deleteSeoLink ($this->getName(), 'bx_stories_media', $aMediaInfo['id']);
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkAllowedSetThumb

  ## Parametros
    - iContentId=0

  ## Retorno
    - any
  """
  def checkAllowedSetThumb(%{}) do
    # TODO: Implementacao futura
        # public function checkAllowedSetThumb ($iContentId = 0)
    #     {
    #         return CHECK_ACTION_RESULT_NOT_ALLOWED;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetTimelineData

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def serviceGetTimelineData(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetTimelineData()
    #     {
    #     	return [];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getMediaDuration

  ## Parametros
    - aMediaInfo

  ## Retorno
    - any
  """
  def getMediaDuration(%{}) do
    # TODO: Implementacao futura
        # public function getMediaDuration($aMediaInfo) 
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if(empty($aMediaInfo) || !is_array($aMediaInfo))
    #             return 0;
    # 
    #         $sField = 'duration';
    #         if(!empty($aMediaInfo[$sField]))
    #             return (int)$aMediaInfo[$sField];
    # 
    #         $iMedia = $aMediaInfo['id'];
    #         $sMedia = BxDolTranscoderImage::getObjectInstance($CNF['OBJECT_VIDEOS_TRANSCODERS']['mp4'])->getFileUrl($iMedia);
    #         if(empty($sMedia))
    #             return 0;
    # 
    #         $iDuration = (int)BxDolTranscoderVideo::getDuration($sMedia);
    #         if(!empty($iDuration))
    #             $this->_oDb->updateMedia(array($sField => $iDuration), array('id' => $iMedia));
    # 
    #         return $iDuration;
    #     }
    :ok
  end

end
