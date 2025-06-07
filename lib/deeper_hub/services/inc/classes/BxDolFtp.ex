
defmodule DeeperHub.Inc.Classes.BxDolFtp do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C:\\Users\\Admin\\deeper_hub\\una\\inc\classes\BxDolFtp.php
  """

  # Heranca de BxDolFile

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - $sHost
    -  $sLogin
    -  $sPassword
    -  $sPath = '/'

  ## Retorno
    - any
  """
  def __construct(params) do
    # TODO: Implementacao futura
        # public function __construct($sHost, $sLogin, $sPassword, $sPath = '/')
    #     {
    #         parent::__construct();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP connect

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def connect(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function connect()
    #     {
    #         $this->_rStream = ftp_connect($this->_sHost);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isUna

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isUna(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function isUna()
    #     {
    #         return @ftp_size($this->_rStream, $this->_sPathTo . 'inc/header.inc.php') > 0;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _copyFile

  ## Parametros
    - $sFilePathFrom
    -  $sFilePathTo

  ## Retorno
    - any
  """
  def _copyFile(params) do
    # TODO: Implementacao futura
        # protected function _copyFile($sFilePathFrom, $sFilePathTo)
    #     {
    #         if(substr($sFilePathFrom, -1) == '*')
    #             $sFilePathFrom = substr($sFilePathFrom, 0, -1);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _deleteDirectory

  ## Parametros
    - $sPath

  ## Retorno
    - any
  """
  def _deleteDirectory(params) do
    # TODO: Implementacao futura
        # protected function _deleteDirectory($sPath)
    #     {
    #         if($this->_isDirectory($sPath)) {
    #             if(substr($sPath, -1) != '/')
    #                 $sPath .= '/';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _parseFile

  ## Parametros
    - $sFilePath

  ## Retorno
    - any
  """
  def _parseFile(params) do
    # TODO: Implementacao futura
        # protected function _parseFile($sFilePath)
    #     {
    #         $aParts = array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isFile

  ## Parametros
    - $sFilePath

  ## Retorno
    - any
  """
  def _isFile(params) do
    # TODO: Implementacao futura
        # protected function _isFile($sFilePath)
    #     {
    #         return preg_match("/^([a-zA-Z0-9@~_\.\\\\\/:-]+)\.([a-zA-Z]){2,8}$/", $sFilePath) ? true : false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isDirectory

  ## Parametros
    - $sFilePath

  ## Retorno
    - any
  """
  def _isDirectory(params) do
    # TODO: Implementacao futura
        # protected function _isDirectory($sFilePath)
    #     {
    #         return preg_match("/^([a-zA-Z0-9@~_\.\\\\\/:-]+)[\\\\\/]([a-zA-Z0-9~_-]+)[\\\\\/]?$/", $sFilePath) ? true : false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _setPermissions

  ## Parametros
    - $sPath
    -  $sMode

  ## Retorno
    - any
  """
  def _setPermissions(params) do
    # TODO: Implementacao futura
        # protected function _setPermissions($sPath, $sMode)
    #     {
    #         $aConvert = array(
    #             'writable' => $this->_isDirectory($sPath) ? 0777 : 0666,
    #             'executable' => 0777
    #         );
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _mkDirR

  ## Parametros
    - $sPath

  ## Retorno
    - any
  """
  def _mkDirR(params) do
    # TODO: Implementacao futura
        # protected function _mkDirR($sPath)
    #     {
    #         $sPwd = ftp_pwd ($this->_rStream);
    # 
    :ok
  end
end
