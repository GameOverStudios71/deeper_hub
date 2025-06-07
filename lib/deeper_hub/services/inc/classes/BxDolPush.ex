
defmodule DeeperHub.Inc.Classes.BxDolPush do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C:\\Users\\Admin\\deeper_hub\\una\\inc\classes\BxDolPush.php
  """

  # Heranca de BxDolFactoryObject

  @doc """
  Funcao correspondente ao metodo PHP construct

  ## Parametros
    - $aObject
    -  $oTemplate = null
    -  $sDbClassName = 'BxDolPushQuery'

  ## Retorno
    - any
  """
  def construct(params) do
    # TODO: Implementacao futura
        # protected function __construct($aObject, $oTemplate = null, $sDbClassName = 'BxDolPushQuery')
    #     {
    #         parent::__construct($aObject, $oTemplate, $sDbClassName);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectInstance

  ## Parametros
    - $sObject = false
    -  $oTemplate = false

  ## Retorno
    - any
  """
  def getObjectInstance(params) do
    # TODO: Implementacao futura
        # public function getObjectInstance($sObject = false, $oTemplate = false)
    #     {
    #         if(!$sObject)
    #             $sObject = getParam('sys_push_default');
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTags

  ## Parametros
    - $iProfileId = false

  ## Retorno
    - any
  """
  def getTags(params) do
    # TODO: Implementacao futura
        # public static function getTags($iProfileId = false)
    #     {
    #         if (false === $iProfileId)
    #             $iProfileId = bx_get_logged_profile_id();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getNotificationsCount

  ## Parametros
    - $iProfileId = 0
    -  &$aBubbles = null

  ## Retorno
    - any
  """
  def getNotificationsCount(params) do
    # TODO: Implementacao futura
        # public static function getNotificationsCount($iProfileId = 0, &$aBubbles = null)
    #     {    
    #         if ('' != trim(getParam('sys_api_url_root_push'))) {
    #              return bx_srv('bx_notifications', 'get_unread_notifications_num', [$iProfileId]);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCode

  ## Parametros
    - $sFor = ''

  ## Retorno
    - any
  """
  def getCode(params) do
    # TODO: Implementacao futura
        # public function getCode($sFor = '')
    #     {
    #         if($sFor && ($sMethod = '_getCode' . bx_gen_method_name($sFor)) && method_exists($this, $sMethod))
    #             return $this->$sMethod();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP send

  ## Parametros
    - $iProfileId
    -  $aMessage
    -  $bAddToQueue = false

  ## Retorno
    - any
  """
  def send(params) do
    # TODO: Implementacao futura
        # public function send($iProfileId, $aMessage, $bAddToQueue = false) {}
    # 
    #     protected function _getUrlRoot($sType)
    #     {
    #         $sRootUrl = getParam('sys_api_url_root_' . $sType);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUrlRoot

  ## Parametros
    - $sType

  ## Retorno
    - any
  """
  def getUrlRoot(params) do
    # TODO: Implementacao futura
        # protected function _getUrlRoot($sType)
    #     {
    #         $sRootUrl = getParam('sys_api_url_root_' . $sType);
    # 
    :ok
  end
end
