
defmodule DeeperHub.Inc.Classes.BxDolImageResize do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C:\\Users\\Admin\\deeper_hub\\una\\inc\classes\BxDolImageResize.php
  """

  # Heranca de BxDolFactory

  # Implementa interfaces: iBxDolSingleton


  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def __construct(params) do
    # TODO: Implementacao futura
        # protected function __construct()
    #     {
    #         if (isset($GLOBALS['bxDolClasses'][get_class($this)]))
    #             trigger_error ('Multiple instances are not allowed for the class: ' . get_class($this), E_USER_ERROR);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP __clone

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def __clone(params) do
    # TODO: Implementacao futura
        # public function __clone()
    #     {
    #         if (isset($GLOBALS['bxDolClasses'][get_class($this)]))
    #             trigger_error('Clone is not allowed for the class: ' . get_class($this), E_USER_ERROR);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInstance

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getInstance(params) do
    # TODO: Implementacao futura
        # public static function getInstance()
    #     {
    #         if(!isset($GLOBALS['bxDolClasses'][__CLASS__]))
    #             $GLOBALS['bxDolClasses'][__CLASS__] = new BxDolImageResize();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getManager

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getManager(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getManager ()
    #     {
    #         return $this->_oManager;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getError

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getError(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getError ()
    #     {
    #         return $this->_sError;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowedImage

  ## Parametros
    - $sSrcImage

  ## Retorno
    - any
  """
  def isAllowedImage(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function isAllowedImage ($sSrcImage)
    #     {
    #         try {
    #             $this->_oManager->make($sSrcImage);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP resize

  ## Parametros
    - $mixedImage
    -  $sDstImage = ''

  ## Retorno
    - any
  """
  def resize(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function resize ($mixedImage, $sDstImage = '')
    #     {
    #         if (is_array($mixedImage)) {
    #             $aRet = array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP applyWatermark

  ## Parametros
    - $mixedImage
    -  $sDstImage
    -  $sWtrImage
    -  $iTransparency
    -  $sPosition = 'bottom-right'
    -  $sPositionOffsetX = 0
    -  $sPositionOffsetY = 0
    -  $sScaleFactor = 0.2

  ## Retorno
    - any
  """
  def applyWatermark(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function applyWatermark ($mixedImage, $sDstImage, $sWtrImage, $iTransparency, $sPosition = 'bottom-right', $sPositionOffsetX = 0, $sPositionOffsetY = 0, $sScaleFactor = 0.2 )
    #     {
    #         if (is_array($mixedImage)) {
    #             $aRet = array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP grayscale

  ## Parametros
    - $mixedImage
    -  $sDstImage = ''

  ## Retorno
    - any
  """
  def grayscale(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function grayscale ($mixedImage, $sDstImage = '')
    #     {
    #         if (is_array($mixedImage)) {
    #             $aRet = array();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setSize

  ## Parametros
    - $w
    -  $h

  ## Retorno
    - any
  """
  def setSize(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function setSize ($w, $h)
    #     {
    #         $this->w = $w;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP removeCropOptions

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def removeCropOptions(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function removeCropOptions ()
    #     {
    #         $this->_isAutoCrop = false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setAutoCrop

  ## Parametros
    - $b

  ## Retorno
    - any
  """
  def setAutoCrop(params) do
    # TODO: Implementacao futura
        # 
    #     function setAutoCrop ($b)
    #     {
    #         $this->_isAutoCrop = $b;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setJpegQuality

  ## Parametros
    - $i

  ## Retorno
    - any
  """
  def setJpegQuality(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function setJpegQuality ($i)
    #     {
    #         $this->_iJpegQuality = $i;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setSquareResize

  ## Parametros
    - $b

  ## Retorno
    - any
  """
  def setSquareResize(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function setSquareResize ($b)
    #     {
    #         $this->_isSquareResize = ($b ? true : false);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isUsedGD

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isUsedGD(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function isUsedGD ()
    #     {
    #         return $this->_isUseGD;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getImageSize

  ## Parametros
    - $sPath

  ## Retorno
    - any
  """
  def getImageSize(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     static function getImageSize($sPath)
    #     {
    #         $o = self::getInstance();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getImageSize

  ## Parametros
    - $sPath

  ## Retorno
    - any
  """
  def _getImageSize(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function _getImageSize($sPath)
    #     {
    #         $this->_sError = '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getExifInfo

  ## Parametros
    - $sSrcImage
    -  $bCreateLocalFileIfUrl = true

  ## Retorno
    - any
  """
  def getExifInfo(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getExifInfo($sSrcImage, $bCreateLocalFileIfUrl = true)
    #     {
    #         $this->_sError = '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAverageColor

  ## Parametros
    - $sSrcImage

  ## Retorno
    - any
  """
  def getAverageColor(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getAverageColor($sSrcImage)
    #     {
    #         $this->_sError = '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _grayscale

  ## Parametros
    - $sSrcImage
    -  $sDstImage = ''

  ## Retorno
    - any
  """
  def _grayscale(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function _grayscale ($sSrcImage, $sDstImage = '')
    #     {
    #         $this->_sError = '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _removeTransparency

  ## Parametros
    - $oImg

  ## Retorno
    - any
  """
  def _removeTransparency(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function _removeTransparency ($oImg)
    #     {
    #         $oImgBack = $this->_oManager->canvas($oImg->width(), $oImg->height(), $this->_sRemoveTransparencyFillColor);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _resize

  ## Parametros
    - $sSrcImage
    -  $sDstImage = ''

  ## Retorno
    - any
  """
  def _resize(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function _resize ($sSrcImage, $sDstImage = '')
    #     {       
    #         $this->_sError = '';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _applyWatermark

  ## Parametros
    - $sSrcImage
    -  $sDstImage
    -  $sWtrImage
    -  $iTransparency
    -  $sPosition = 'bottom-right'
    -  $sPositionOffsetX = 0
    -  $sPositionOffsetY = 0
    -  $sScaleFactor = 0.2

  ## Retorno
    - any
  """
  def _applyWatermark(params) do
    # TODO: Implementacao futura
        # 
    # 
    #     function _applyWatermark( $sSrcImage, $sDstImage, $sWtrImage, $iTransparency, $sPosition = 'bottom-right', $sPositionOffsetX = 0, $sPositionOffsetY = 0, $sScaleFactor = 0.2)
    #     {
    #         $this->_sError = '';
    # 
    :ok
  end
end
