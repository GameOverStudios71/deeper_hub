
defmodule DeeperHub.Inc.Classes.BxDolUploader do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolUploader.php
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
        # protected function __construct($aObject, $sStorageObject, $sUniqId, $oTemplate)
    #     {
    #         parent::__construct();
    #         $this->_oTemplate = $oTemplate ? $oTemplate : BxDolTemplate::getInstance();
    # 
    #         $this->_aObject = $aObject;
    #         $this->_sStorageObject = $sStorageObject;
    # 
    #         $this->_sUniqId = $sUniqId;
    # 
    #         $this->_sUploaderJsInstance = 'glUploader_' . $sUniqId . '_' . $this->_aObject['object'];
    #         $this->_sUploadInProgressContainerId = 'bx-form-input-files-' . $sUniqId . '-upload-in-progress-' . $this->_aObject['object'];
    #         $this->_sPopupContainerId = 'bx-form-input-files-' . $sUniqId . '-popup-wrapper-' . $this->_aObject['object'];
    # 
    #         $this->_sResultContainerId = 'bx-form-input-files-' . $sUniqId . '-upload-result';
    #         $this->_sErrorsContainerId = 'bx-form-input-files-' . $sUniqId . '-errors';
    #         $this->_sFormContainerId = 'bx-form-input-files-' . $sUniqId . '-form-cont';
    # 
    #         $this->_aJs = ['BxDolUploader.js'];
    #         $this->_aCss = ['uploaders.css'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectInstance

  ## Parametros
    - sObject,sStorageObject,sResultContainerId,oTemplate=false

  ## Retorno
    - any
  """
  def getObjectInstance(%{}) do
    # TODO: Implementacao futura
        # public function getObjectInstance($sObject, $sStorageObject, $sResultContainerId, $oTemplate = false)
    #     {
    #         $aObject = BxDolUploaderQuery::getUploaderObject($sObject);
    #         if (!$aObject || !is_array($aObject) || !$aObject['active'])
    #             return false;
    # 
    #         $sClass = $aObject['override_class_name'];
    #         if (!empty($aObject['override_class_file']))
    #             require_once(BX_DIRECTORY_PATH_ROOT . $aObject['override_class_file']);
    # 
    #         $o = new $sClass($aObject, $sStorageObject, $sResultContainerId, $oTemplate);
    # 
    #         if (!$o->isInstalled() || !$o->isAvailable())
    #             return false;
    # 
    #         return $o;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAvailable

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isAvailable(%{}) do
    # TODO: Implementacao futura
        # public function isAvailable()
    #     {
    #         return $this->_aObject['active'] ? true : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isInstalled

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isInstalled(%{}) do
    # TODO: Implementacao futura
        # public function isInstalled()
    #     {
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getNameJsInstanceUploader

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getNameJsInstanceUploader(%{}) do
    # TODO: Implementacao futura
        # public function getNameJsInstanceUploader()
    #     {
    #         return $this->_sUploaderJsInstance;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getIdContainerResult

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getIdContainerResult(%{}) do
    # TODO: Implementacao futura
        # public function getIdContainerResult()
    #     {
    #         return $this->_sResultContainerId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getIdContainerUploadInProgress

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getIdContainerUploadInProgress(%{}) do
    # TODO: Implementacao futura
        # public function getIdContainerUploadInProgress()
    #     {
    #         return $this->_sUploadInProgressContainerId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getIdContainerPopup

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getIdContainerPopup(%{}) do
    # TODO: Implementacao futura
        # public function getIdContainerPopup()
    #     {
    #         return $this->_sPopupContainerId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getIdContainerErrors

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getIdContainerErrors(%{}) do
    # TODO: Implementacao futura
        # public function getIdContainerErrors()
    #     {
    #         return $this->_sErrorsContainerId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP handleUploads

  ## Parametros
    - iProfileId,mixedFiles,isMultiple=true,iContentId=false,bPrivate=true

  ## Retorno
    - any
  """
  def handleUploads(%{}) do
    # TODO: Implementacao futura
        # public function handleUploads ($iProfileId, $mixedFiles, $isMultiple = true, $iContentId = false, $bPrivate = true)
    #     {
    #         $oStorage = BxDolStorage::getObjectInstance($this->_sStorageObject);
    # 
    #         if (false == ($aMultipleFiles = $oStorage->convertMultipleFilesArray($mixedFiles)))
    #             $aMultipleFiles = array($mixedFiles);
    # 
    #         if (!$isMultiple)
    #             $this->deleteGhostsForProfile($iProfileId, $iContentId);
    # 
    #         
    #         if (bx_is_api() && $_FILES['file']) {
    #             $iId = $oStorage->storeFileFromForm($_FILES['file'], $bPrivate, $iProfileId, $iContentId);
    #             $aResponse = array ('success' => 1, 'id' => $iId);
    #             return $aResponse;
    #         } 
    #         
    #         foreach ($aMultipleFiles as $aFile) {
    # 
    #             $iId = $oStorage->storeFileFromForm($aFile, $bPrivate, $iProfileId, $iContentId);
    #             if (!$iId)
    #                 $this->appendUploadErrorMessage(_t('_sys_uploader_err_msg', $aFile['name'], $oStorage->getErrorString()));
    # 
    #             if (!$isMultiple)
    #                 break;
    #         }
    # 
    #         echo '<script>window.parent.' . $this->getNameJsInstanceUploader() . '.onUploadCompleted(\'' . bx_js_string($this->getUploadErrorMessages(), BX_ESCAPE_STR_APOS) . '\');</script>';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUploadErrorMessages

  ## Parametros
    - sFormat='HTML'

  ## Retorno
    - any
  """
  def getUploadErrorMessages(%{}) do
    # TODO: Implementacao futura
        # public function getUploadErrorMessages ($sFormat = 'HTML')
    #     {
    #         if (!$this->_sUploadErrorMessages)
    #             return '';
    # 
    #         if ('HTML' == $sFormat)
    #             return nl2br($this->_sUploadErrorMessages);
    #         else
    #             return $this->_sUploadErrorMessages;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUploaderJsParams

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getUploaderJsParams(%{}) do
    # TODO: Implementacao futura
        # public function getUploaderJsParams()
    #     {
    #         return [];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addCssJs

  ## Parametros
    - bDynamic=false

  ## Retorno
    - any
  """
  def addCssJs(%{}) do
    # TODO: Implementacao futura
        # public function addCssJs($bDynamic = false)
    #     {
    #         $s = '';
    #         $s .= $this->_oTemplate->addCss($this->_aCss, $bDynamic);
    #         $s .= $this->_oTemplate->addJsTranslation([
    #             '_sys_uploader_confirm_leaving_page',
    #             '_sys_uploader_confirm_close_popup',
    #             '_sys_uploader_upload_canceled',
    #             '_sys_uploader_image_reposition_info',
    #         ], $bDynamic);
    #         return $bDynamic ? $s : '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addJs

  ## Parametros
    - mixedFile

  ## Retorno
    - any
  """
  def addJs(%{}) do
    # TODO: Implementacao futura
        # public function addJs($mixedFile)
    #     {
    #         if(!is_array($mixedFile))
    #             $mixedFile = [$mixedFile];
    # 
    #         foreach($mixedFile as $sFile)
    #             if(!in_array($sFile, $this->_aJs))
    #                 $this->_aJs[] = $sFile;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addCss

  ## Parametros
    - mixedFile

  ## Retorno
    - any
  """
  def addCss(%{}) do
    # TODO: Implementacao futura
        # public function addCss($mixedFile)
    #     {
    #         if(!is_array($mixedFile))
    #             $mixedFile = [$mixedFile];
    # 
    #         foreach($mixedFile as $sFile)
    #             if(!in_array($sFile, $this->_aCss))
    #                 $this->_aCss[] = $sFile;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUploaderButtonTitle

  ## Parametros
    - mixed=false

  ## Retorno
    - any
  """
  def getUploaderButtonTitle(%{}) do
    # TODO: Implementacao futura
        # public function getUploaderButtonTitle($mixed = false)
    #     {
    #         // it is overrided in child classes
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUploaderForm

  ## Parametros
    - isMultiple=true,iContentId=false,isPrivate=true

  ## Retorno
    - any
  """
  def getUploaderForm(%{}) do
    # TODO: Implementacao futura
        # public function getUploaderForm($isMultiple = true, $iContentId = false, $isPrivate = true)
    #     {
    #         // it is overrided in child classes
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
    #         $oStorage = BxDolStorage::getObjectInstance($this->_sStorageObject);
    # 
    #         $oImagesTranscoder = false;
    #         if ($sImagesTranscoder)
    #             $oImagesTranscoder = BxDolTranscoderImage::getObjectInstance($sImagesTranscoder);
    # 
    #         $a = array();
    #         $aGhosts = $oStorage->getGhosts($this->isAdmin($iContentId) && $iContentId ? false : $iProfileId, $iContentId);
    #         foreach ($aGhosts as $aFile) {
    #             $sFileIcon = '';
    # 
    #             if ($this->isUseTranscoderForPreview($oImagesTranscoder, $aFile))
    #                 $sFileIcon = $oImagesTranscoder->getFileUrl($aFile['id']);
    # 
    #             if (!$sFileIcon)
    #                 $sFileIcon = $this->_oTemplate->getIconUrl($oStorage->getIconNameByFileName($aFile['file_name']));
    # 
    #             $aVars = array (
    #             	'storage_object' => $this->_sStorageObject,
    #                 'file_id' => $aFile['id'],
    #                 'file_type' => $aFile['mime_type'],
    #                 'file_name' => $aFile['file_name'],
    #                 'file_title' => $oStorage->getFileTitle($aFile['file_name']),
    #                 'file_icon' => $sFileIcon,
    #                 'file_url' => $oStorage->getFileUrlById($aFile['id']),
    #                 'file_remote_id' => $aFile['remote_id'],
    #                 'js_instance_name' => $this->_sUploaderJsInstance,
    #             );
    # 
    #             $a[$aFile['id']] = array_merge($aVars, $this->getGhostTemplateVars($aFile, $iProfileId, $iContentId, $oStorage, $oImagesTranscoder));
    #         }
    # 
    #         if ('array' == $sFormat) {
    #             return $a;
    #         }
    #         else if ('json' == $sFormat) {
    #             return json_encode($a);
    #         } else { // html format is not suported for this data type
    #             return false;
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getGhostsWithOrder

  ## Parametros
    - iProfileId,sFormat,sImagesTranscoder=false,iContentId=false,isLatestOnly=false

  ## Retorno
    - any
  """
  def getGhostsWithOrder(%{}) do
    # TODO: Implementacao futura
        # public function getGhostsWithOrder($iProfileId, $sFormat, $sImagesTranscoder = false, $iContentId = false, $isLatestOnly = false)
    #     {
    #         $a = $this->getGhosts($iProfileId, 'array', $sImagesTranscoder, $iContentId);
    #         if($isLatestOnly)
    #             $a = array_slice($a, 0, 1, true);
    # 
    #         if(!empty($a) && is_array($a))
    #             $a = ['g' => $a, 'o' => array_keys($a)];
    # 
    #         if ('json' == $sFormat) {
    #             return json_encode($a);
    #         } else { // html format is not suported for this data type
    #             return $a;
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP reorderGhosts

  ## Parametros
    - iProfileId,sFormat,aGhosts,iContentId=false

  ## Retorno
    - any
  """
  def reorderGhosts(%{}) do
    # TODO: Implementacao futura
        # public function reorderGhosts($iProfileId, $sFormat, $aGhosts, $iContentId = false)
    #     {
    #         $bResult = true;
    #         if(($oStorage = BxDolStorage::getObjectInstance($this->_sStorageObject)) !== false)
    #             $bResult = $oStorage->reorderGhosts($this->isAdmin($iContentId) && $iContentId ? false : $iProfileId, $iContentId, $aGhosts);
    # 
    #         if($sFormat == 'json')
    #             return json_encode($bResult ? [] : ['msg' => _t('_error occured')]);
    #         else
    #             return $bResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteGhost

  ## Parametros
    - iFileId,iProfileId

  ## Retorno
    - any
  """
  def deleteGhost(%{}) do
    # TODO: Implementacao futura
        # public function deleteGhost($iFileId, $iProfileId)
    #     {
    #         $oStorage = BxDolStorage::getObjectInstance($this->_sStorageObject);
    # 
    #         $aFile = $oStorage->getGhost ($iFileId);
    #         if (!$aFile)
    #             $aFile = $oStorage->getFile ($iFileId);
    #         if (!$aFile)
    #             return _t('_error occured');
    # 
    #         $oProfile = BxDolProfile::getInstance($iProfileId);
    #         $oAccount = $oProfile ? $oProfile->getAccountObject() : null;
    #         $aProfiles = $oAccount ? $oAccount->getProfiles(false) : array();
    #         if (!isset($aProfiles[$aFile['profile_id']]) && !$this->isAdmin($aFile['content_id']))
    #             return _t('_sys_txt_access_denied');
    # 
    #         if (!$oStorage->deleteFile($iFileId))
    #             return $oStorage->getErrorString();
    # 
    #         return 'ok';
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
    #         $iCount = 0;
    # 
    #         $oStorage = BxDolStorage::getObjectInstance($this->_sStorageObject);
    # 
    #         $aGhosts = $oStorage->getGhosts($iProfileId, $iContentId, $iContentId ? true : false);
    #         foreach ($aGhosts as $aFile)
    #             $iCount += $oStorage->deleteFile($aFile['id']);
    # 
    #         return $iCount;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP cleanUploadErrorMessages

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def cleanUploadErrorMessages(%{}) do
    # TODO: Implementacao futura
        # protected function cleanUploadErrorMessages ()
    #     {
    #         $this->_sUploadErrorMessages = '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP appendUploadErrorMessage

  ## Parametros
    - s

  ## Retorno
    - any
  """
  def appendUploadErrorMessage(%{}) do
    # TODO: Implementacao futura
        # public function appendUploadErrorMessage ($s)
    #     {
    #         $this->_sUploadErrorMessages .= ($this->_sUploadErrorMessages ? "\n" : '') . $s;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getRestrictionsText

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getRestrictionsText(%{}) do
    # TODO: Implementacao futura
        # protected function getRestrictionsText ()
    #     {
    #         $sTextRestrictions = '';
    #         $oStorage = BxDolStorage::getObjectInstance($this->_sStorageObject);
    #         if (!$oStorage)
    #             return '';
    # 
    #         $a = $oStorage->getRestrictionsTextArray(bx_get_logged_profile_id());
    #         foreach ($a as $s)
    #             $sTextRestrictions .= '<div class="bx-uploader-msg-info bx-def-font-grayed">' . $s . '</div>';
    # 
    #         return $sTextRestrictions;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getMaxUploadFileSize

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getMaxUploadFileSize(%{}) do
    # TODO: Implementacao futura
        # protected function getMaxUploadFileSize ()
    #     {
    #         $oStorage = BxDolStorage::getObjectInstance($this->_sStorageObject);
    #         if (!$oStorage)
    #             return 0;
    #         return $oStorage->getMaxUploadFileSize(bx_get_logged_profile_id());
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAcceptedFilesExtensions

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getAcceptedFilesExtensions(%{}) do
    # TODO: Implementacao futura
        # protected function getAcceptedFilesExtensions ()
    #     {
    #         $oStorage = BxDolStorage::getObjectInstance($this->_sStorageObject);
    #         if (!$oStorage)
    #             return null;
    #         return $oStorage->getAllowedExtensions();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getGhostTemplateVars

  ## Parametros
    - aFile,iProfileId,iContentId,oStorage,oImagesTranscoder

  ## Retorno
    - any
  """
  def getGhostTemplateVars(%{}) do
    # TODO: Implementacao futura
        # protected function getGhostTemplateVars($aFile, $iProfileId, $iContentId, $oStorage, $oImagesTranscoder)
    #     {
    #         return array();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isUseTranscoderForPreview

  ## Parametros
    - oImagesTranscoder,aFile

  ## Retorno
    - any
  """
  def isUseTranscoderForPreview(%{}) do
    # TODO: Implementacao futura
        # protected function isUseTranscoderForPreview($oImagesTranscoder, $aFile)
    #     {
    #         if (!$oImagesTranscoder)
    #             return false;
    # 
    #         return $oImagesTranscoder->isMimeTypeSupported($aFile['mime_type']);
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
    #         return isAdmin();
    #     }
    :ok
  end

end
