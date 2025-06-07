
defmodule DeeperHub.Inc.Classes.BxDolInstallerUtils do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolInstallerUtils.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct()
    #     {
    #         parent::__construct();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowUrlInclude

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isAllowUrlInclude(%{}) do
    # TODO: Implementacao futura
        # public function isAllowUrlInclude()
    #     {
    #         if (version_compare(phpversion(), "5.2", ">") == 1 && version_compare(phpversion(), "8.0", "<") == 1) {
    #             $sAllowUrlInclude = ini_get('allow_url_include');
    #             return !($sAllowUrlInclude == 0);
    #         };
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getModuleConfig

  ## Parametros
    - mixed

  ## Retorno
    - any
  """
  def getModuleConfig(%{}) do
    # TODO: Implementacao futura
        # public function getModuleConfig($mixed)
    #     {
    #     	$sConfig = '';
    #     	if(is_array($mixed) && !empty($mixed['path']))
    #             $sConfig = BX_DIRECTORY_PATH_MODULES . $mixed['path'] . 'install/config.php';
    #         else if(is_string($mixed))
    #             $sConfig = $mixed;
    #         else 
    #             return array();
    # 
    #     	if(!file_exists($sConfig))
    #             return array();
    # 
    #         ob_start();
    #         include($sConfig);
    #         ob_end_clean();
    # 
    #         return isset($aConfig) ? $aConfig : array();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isModuleInstalled

  ## Parametros
    - sUri

  ## Retorno
    - any
  """
  def isModuleInstalled(%{}) do
    # TODO: Implementacao futura
        # public function isModuleInstalled($sUri)
    #     {
    #         return BxDolModuleQuery::getInstance()->isModule($sUri);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setModulePendingUninstall

  ## Parametros
    - sUri,bPendingUninstall=true

  ## Retorno
    - any
  """
  def setModulePendingUninstall(%{}) do
    # TODO: Implementacao futura
        # public function setModulePendingUninstall($sUri, $bPendingUninstall = true)
    #     {
    #         return BxDolModuleQuery::getInstance()->setModulePendingUninstall($sUri, $bPendingUninstall);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isModulePendingUninstall

  ## Parametros
    - sUri

  ## Retorno
    - any
  """
  def isModulePendingUninstall(%{}) do
    # TODO: Implementacao futura
        # public function isModulePendingUninstall($sUri)
    #     {
    #         $a = BxDolModuleQuery::getInstance()->getModuleByUri($sUri);
    #         return $a['pending_uninstall'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP checkModulesPendingUninstall

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def checkModulesPendingUninstall(%{}) do
    # TODO: Implementacao futura
        # public function checkModulesPendingUninstall()
    #     {
    #         $a = BxDolModuleQuery::getInstance()->getModules();
    #         foreach ($a as $aModule) {
    # 
    #             // after we make sure that all pending for deletion files are deleted
    #             if (!$aModule['pending_uninstall'] || BxDolStorage::isQueuedFilesForDeletion($aModule['name']))
    #                 continue;
    # 
    #             // remove pending uninstall flag
    #             self::setModulePendingUninstall($aModule['uri'], false);
    # 
    #             // perform uninstallation
    #             $aResult = BxDolStudioInstallerUtils::getInstance()->perform($aModule['path'], 'uninstall');
    # 
    #             // send email nofitication
    #             $aTemplateKeys = array(
    #                 'Module' => $aModule['title'],
    #                 'Result' => _t('_Success'),
    #                 'Message' => '',
    #             );
    # 
    #             if ($aResult['code'] > 0) {
    #                 $aTemplateKeys['Result'] = _t('_Failed');
    #                 $aTemplateKeys['Message'] = $aResult['message'];
    #             }
    # 
    #             $aMessage = BxDolEmailTemplates::getInstance()->parseTemplate('t_DelayedModuleUninstall', $aTemplateKeys);
    #             sendMail (getParam('site_email'), $aMessage['Subject'], $aMessage['Body'], 0, array(), BX_EMAIL_SYSTEM);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSubtypes

  ## Parametros
    - sModule

  ## Retorno
    - any
  """
  def getSubtypes(%{}) do
    # TODO: Implementacao futura
        # public function getSubtypes($sModule)
    #     {
    #         $iResult = 0;
    #         $oModule = BxDolModule::getInstance($sModule);
    #         if(!$oModule)
    #             return $iResult;
    # 
    #         $sMethod = 'getSubtypes';
    #         if(method_exists($oModule, $sMethod))
    #             return $oModule->$sMethod();
    # 
    #         $sSrvMethod = 'act_as_profile';
    #         if($oModule instanceof iBxDolProfileService && bx_is_srv_ii($sModule, $sSrvMethod)) {
    #             $iResult |= pow(2, BX_DOL_MODULE_SUBTYPE_CONTEXT);
    # 
    #             if(bx_srv_ii($sModule, $sSrvMethod))
    #                 $iResult |= pow(2, BX_DOL_MODULE_SUBTYPE_PROFILE);
    # 
    #             return $iResult;
    #         }
    # 
    #         $sSrvMethod = 'is_allowed_post_in_context';
    #         if($oModule instanceof iBxDolContentInfoService && !($oModule instanceof iBxDolProfileService) && bx_is_srv_ii($sModule, $sSrvMethod) && bx_srv_ii($sModule, $sSrvMethod)) {
    #             $iResult |= pow(2, BX_DOL_MODULE_SUBTYPE_TEXT);
    # 
    #             if($oModule instanceof BxBaseModFilesModule)
    #                 $iResult |= pow(2, BX_DOL_MODULE_SUBTYPE_FILE);
    # 
    #             return $iResult;
    #         }
    # 
    #         if($oModule instanceof BxBaseModPaymentModule) {
    #             $iResult |= pow(2, BX_DOL_MODULE_SUBTYPE_PAYMENT);
    # 
    #             return $iResult;
    #         }
    # 
    #         if($oModule instanceof BxBaseModNotificationsModule) {
    #             $iResult |= pow(2, BX_DOL_MODULE_SUBTYPE_NOTIFICATION);
    # 
    #             return $iResult;
    #         }
    # 
    #         if($oModule instanceof BxBaseModConnectModule) {
    #             $iResult |= pow(2, BX_DOL_MODULE_SUBTYPE_CONNECT);
    # 
    #             return $iResult;
    #         }
    # 
    #         return $iResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP hashFiles

  ## Parametros
    - sPath,&aFiles

  ## Retorno
    - any
  """
  def hashFiles(%{}) do
    # TODO: Implementacao futura
        # public function hashFiles($sPath, &$aFiles)
    #     {
    #         $aExcludes = array('.', '..', 'error_log', 'php.ini', '.DS_Store', 'Thumbs.db');
    #         if (file_exists($sPath) && is_dir($sPath) && ($rSource = opendir($sPath))) {
    #             while (($sFile = readdir($rSource)) !== false) {
    #                 if ('.' == $sFile[0] || in_array($sFile, $aExcludes))
    #                     continue;
    #                 
    #                 if (in_array($this->filePathWithoutBase($sPath . $sFile), $this->_aNonHashableFiles))
    #                     continue;                
    # 
    #                 if (is_dir($sPath . $sFile))
    #                     $this->hashFiles($sPath . $sFile . '/', $aFiles);
    #                 else
    #                     $aFiles[] = $this->hashInfo($sPath . $sFile);
    #             }
    #             closedir($rSource);
    #         } elseif (file_exists($sPath) && is_file($sPath)) {
    #             $aFiles[] = $this->hashInfo($sPath);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP hashCheck

  ## Parametros
    - aFiles,iModuleId

  ## Retorno
    - any
  """
  def hashCheck(%{}) do
    # TODO: Implementacao futura
        # public function hashCheck($aFiles, $iModuleId)
    #     {
    #         $oDb = bx_instance('BxDolStudioInstallerQuery');
    # 
    #         $aFilesOrig = $oDb->getModuleTrackFiles($iModuleId);
    #         $aFailesChanged = array();
    #         foreach ($aFiles as $aFile)
    #             if(!isset($aFilesOrig[$aFile['file']]) || $aFilesOrig[$aFile['file']]['hash'] != $aFile['hash'])
    #                 $aFailesChanged[] = $aFile['file'];
    # 
    # 		$fChangedPercent = 0;
    #         if(count($aFilesOrig) != 0)
    #             $fChangedPercent = count($aFailesChanged) / count($aFilesOrig);
    # 
    #         return array($aFailesChanged, $fChangedPercent);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP hashInfo

  ## Parametros
    - sPath

  ## Retorno
    - any
  """
  def hashInfo(%{}) do
    # TODO: Implementacao futura
        # protected function hashInfo($sPath)
    #     {
    #         return array(
    #             'file' => $this->filePathWithoutBase($sPath),
    #             'hash' => md5_file($sPath)
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP filePathWithoutBase

  ## Parametros
    - sPath

  ## Retorno
    - any
  """
  def filePathWithoutBase(%{}) do
    # TODO: Implementacao futura
        # protected function filePathWithoutBase($sPath)
    #     {
    #         return bx_ltrim_str($sPath, BX_DIRECTORY_PATH_ROOT);
    #     }
    :ok
  end

end
