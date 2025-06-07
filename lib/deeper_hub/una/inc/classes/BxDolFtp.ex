
defmodule DeeperHub.Inc.Classes.BxDolFtp do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolFtp.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - sHost,sLogin,sPassword,sPath='/'

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($sHost, $sLogin, $sPassword, $sPath = '/')
    #     {
    #         parent::__construct();
    #         $this->_sHost = $sHost;
    #         $this->_sLogin = $sLogin;
    #         $this->_sPassword = $sPassword;
    # 
    #         $this->_sPathFrom = '';
    #         $this->_sPathTo = $sPath . ('/' == substr($sPath, -1) ? '' : '/');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP connect

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def connect(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function connect()
    #     {
    #         $this->_rStream = ftp_connect($this->_sHost);
    #         return @ftp_login($this->_rStream, $this->_sLogin, $this->_sPassword);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isUna

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isUna(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function isUna()
    #     {
    #         return @ftp_size($this->_rStream, $this->_sPathTo . 'inc/header.inc.php') > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _copyFile

  ## Parametros
    - sFilePathFrom,sFilePathTo

  ## Retorno
    - any
  """
  def _copyFile(%{}) do
    # TODO: Implementacao futura
        # protected function _copyFile($sFilePathFrom, $sFilePathTo)
    #     {
    #         if(substr($sFilePathFrom, -1) == '*')
    #             $sFilePathFrom = substr($sFilePathFrom, 0, -1);
    # 
    #         $bResult = false;
    #         if(is_file($sFilePathFrom)) {
    #             if($this->_isFile($sFilePathTo)) {
    #                 $aFileParts = $this->_parseFile($sFilePathTo);
    #                 if(isset($aFileParts[0]))
    #                     $this->_mkDirR($aFileParts[0]);
    # 
    #                 $bResult = @ftp_put($this->_rStream, $sFilePathTo, $sFilePathFrom, FTP_BINARY);
    #             } else if($this->_isDirectory($sFilePathTo)) {
    #                 $this->_mkDirR($sFilePathTo);
    # 
    #                 $aFileParts = $this->_parseFile($sFilePathFrom);
    #                 if(isset($aFileParts[1]))
    #                     $bResult = @ftp_put($this->_rStream, $this->_validatePath($sFilePathTo) . $aFileParts[1], $sFilePathFrom, FTP_BINARY);
    #             }
    #         } else if(is_dir($sFilePathFrom) && $this->_isDirectory($sFilePathTo)) {
    #             $this->_mkDirR($sFilePathTo);
    # 
    #             $aInnerFiles = $this->_readDirectory($sFilePathFrom);
    #             foreach($aInnerFiles as $sFile)
    #                 $bResult = $this->_copyFile($this->_validatePath($sFilePathFrom) . $sFile, $this->_validatePath($sFilePathTo) . $sFile);
    #         } else
    #             $bResult = false;
    # 
    #         return $bResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _deleteDirectory

  ## Parametros
    - sPath

  ## Retorno
    - any
  """
  def _deleteDirectory(%{}) do
    # TODO: Implementacao futura
        # protected function _deleteDirectory($sPath)
    #     {
    #         if($this->_isDirectory($sPath)) {
    #             if(substr($sPath, -1) != '/')
    #                 $sPath .= '/';
    # 
    #             if(($aFiles = @ftp_nlist($this->_rStream, $sPath)) !== false)
    #                 foreach($aFiles as $sFile)
    #                     if($sFile != '.' && $sFile != '..')
    #                         $this->_deleteDirectory(false === strpos($sFile, '/') ? $sPath . $sFile : $sFile);
    # 
    #                 if(!@ftp_rmdir($this->_rStream, $sPath))
    #                     return false;
    # 
    #         } else if(!@ftp_delete($this->_rStream, $sPath))
    #             return false;
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _parseFile

  ## Parametros
    - sFilePath

  ## Retorno
    - any
  """
  def _parseFile(%{}) do
    # TODO: Implementacao futura
        # protected function _parseFile($sFilePath)
    #     {
    #         $aParts = array();
    #         preg_match("/^([a-zA-Z0-9@~_\.\\\\\/:-]+[\\\\\/])([a-zA-Z0-9~_-]+\.[a-zA-Z]{2,8})$/", $sFilePath, $aParts);
    #         return count($aParts) > 1 ? array_slice($aParts, 1) : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isFile

  ## Parametros
    - sFilePath

  ## Retorno
    - any
  """
  def _isFile(%{}) do
    # TODO: Implementacao futura
        # protected function _isFile($sFilePath)
    #     {
    #         return preg_match("/^([a-zA-Z0-9@~_\.\\\\\/:-]+)\.([a-zA-Z]){2,8}$/", $sFilePath) ? true : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isDirectory

  ## Parametros
    - sFilePath

  ## Retorno
    - any
  """
  def _isDirectory(%{}) do
    # TODO: Implementacao futura
        # protected function _isDirectory($sFilePath)
    #     {
    #         return preg_match("/^([a-zA-Z0-9@~_\.\\\\\/:-]+)[\\\\\/]([a-zA-Z0-9~_-]+)[\\\\\/]?$/", $sFilePath) ? true : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _setPermissions

  ## Parametros
    - sPath,sMode

  ## Retorno
    - any
  """
  def _setPermissions(%{}) do
    # TODO: Implementacao futura
        # protected function _setPermissions($sPath, $sMode)
    #     {
    #         $aConvert = array(
    #             'writable' => $this->_isDirectory($sPath) ? 0777 : 0666,
    #             'executable' => 0777
    #         );
    # 
    #         if(@ftp_chmod($this->_rStream, $aConvert[$sMode], $sPath) === false)
    #             return false;
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _mkDirR

  ## Parametros
    - sPath

  ## Retorno
    - any
  """
  def _mkDirR(%{}) do
    # TODO: Implementacao futura
        # protected function _mkDirR($sPath)
    #     {
    #         $sPwd = ftp_pwd ($this->_rStream);
    #         $aParts = explode("/", $sPath);
    #         $sPathFull = '';
    #         if ('/' == $sPath[0]) {
    #             $sPathFull = '/';
    #             ftp_chdir($this->_rStream, '/');
    #         }
    #         foreach ($aParts as $sPart) {
    #             if (!$sPart)
    #                 continue;
    #             $sPathFull .= $sPart;
    #             if ('..' == $sPart) {
    #                 @ftp_cdup($this->_rStream);
    #             } elseif (!@ftp_chdir($this->_rStream, $sPart)) {
    #                 if (!@ftp_mkdir($this->_rStream, $sPart)) {
    #                     ftp_chdir($this->_rStream, $sPwd);
    #                     return false;
    #                 }
    #                 @ftp_chdir($this->_rStream, $sPart);
    #             }
    #             $sPathFull .= '/';
    #         }
    #         ftp_chdir($this->_rStream, $sPwd);
    #         return true;
    #     }
    :ok
  end

end
