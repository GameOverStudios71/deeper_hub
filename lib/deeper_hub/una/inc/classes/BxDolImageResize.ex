
defmodule DeeperHub.Inc.Classes.BxDolImageResize do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolImageResize.php
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
        # protected function __construct()
    #     {
    #         if (isset($GLOBALS['bxDolClasses'][get_class($this)]))
    #             trigger_error ('Multiple instances are not allowed for the class: ' . get_class($this), E_USER_ERROR);
    # 
    #         parent::__construct();
    # 
    #         $this->_isUseGD = getParam('enable_gd') == 'on' && extension_loaded('gd') ? true : false;
    # 
    #         $this->_oManager = new Intervention\Image\ImageManager(array('driver' => $this->_isUseGD ? 'gd' : 'imagick'));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP __clone

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def __clone(%{}) do
    # TODO: Implementacao futura
        # public function __clone()
    #     {
    #         if (isset($GLOBALS['bxDolClasses'][get_class($this)]))
    #             trigger_error('Clone is not allowed for the class: ' . get_class($this), E_USER_ERROR);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getInstance

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getInstance(%{}) do
    # TODO: Implementacao futura
        # public static function getInstance()
    #     {
    #         if(!isset($GLOBALS['bxDolClasses'][__CLASS__]))
    #             $GLOBALS['bxDolClasses'][__CLASS__] = new BxDolImageResize();
    # 
    #         return $GLOBALS['bxDolClasses'][__CLASS__];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getManager

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getManager(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getManager ()
    #     {
    #         return $this->_oManager;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getError

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getError(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getError ()
    #     {
    #         return $this->_sError;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowedImage

  ## Parametros
    - sSrcImage

  ## Retorno
    - any
  """
  def isAllowedImage(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function isAllowedImage ($sSrcImage)
    #     {
    #         try {
    #             $this->_oManager->make($sSrcImage);
    #         }
    #         catch (Exception $e) {
    #             return false;
    #         }
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP resize

  ## Parametros
    - mixedImage,sDstImage=''

  ## Retorno
    - any
  """
  def resize(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function resize ($mixedImage, $sDstImage = '')
    #     {
    #         if (is_array($mixedImage)) {
    #             $aRet = array();
    #             foreach ($mixedImage as $s) {
    #                 $aRet[] = $this->_resize ($s, $s);
    #             }
    #             return $aRet;
    #         } else {
    #             return $this->_resize ($mixedImage, $sDstImage);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP applyWatermark

  ## Parametros
    - mixedImage,sDstImage,sWtrImage,iTransparency,sPosition='bottom-right',sPositionOffsetX=0,sPositionOffsetY=0,sScaleFactor=0.2

  ## Retorno
    - any
  """
  def applyWatermark(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function applyWatermark ($mixedImage, $sDstImage, $sWtrImage, $iTransparency, $sPosition = 'bottom-right', $sPositionOffsetX = 0, $sPositionOffsetY = 0, $sScaleFactor = 0.2 )
    #     {
    #         if (is_array($mixedImage)) {
    #             $aRet = array();
    #             foreach ($mixedImage as $s)
    #                 $aRet[] = $this->_applyWatermark ($s, $s, $sWtrImage, $iTransparency, $sPosition, $sPositionOffsetX, $sPositionOffsetY, $sScaleFactor);
    #             return $aRet;
    #         } else {
    #             return $this->_applyWatermark ($mixedImage, $sDstImage, $sWtrImage, $iTransparency, $sPosition, $sPositionOffsetX, $sPositionOffsetY, $sScaleFactor);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP grayscale

  ## Parametros
    - mixedImage,sDstImage=''

  ## Retorno
    - any
  """
  def grayscale(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function grayscale ($mixedImage, $sDstImage = '')
    #     {
    #         if (is_array($mixedImage)) {
    #             $aRet = array();
    #             foreach ($mixedImage as $s) {
    #                 $aRet[] = $this->_grayscale ($s, $s);
    #             }
    #             return $aRet;
    #         } else {
    #             return $this->_grayscale ($mixedImage, $sDstImage);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setSize

  ## Parametros
    - w,h

  ## Retorno
    - any
  """
  def setSize(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function setSize ($w, $h)
    #     {
    #         $this->w = $w;
    #         $this->h = $h;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP removeCropOptions

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def removeCropOptions(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function removeCropOptions ()
    #     {
    #         $this->_isAutoCrop = false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setAutoCrop

  ## Parametros
    - b

  ## Retorno
    - any
  """
  def setAutoCrop(%{}) do
    # TODO: Implementacao futura
        # 
    #     function setAutoCrop ($b)
    #     {
    #         $this->_isAutoCrop = $b;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setJpegQuality

  ## Parametros
    - i

  ## Retorno
    - any
  """
  def setJpegQuality(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function setJpegQuality ($i)
    #     {
    #         $this->_iJpegQuality = $i;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setSquareResize

  ## Parametros
    - b

  ## Retorno
    - any
  """
  def setSquareResize(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function setSquareResize ($b)
    #     {
    #         $this->_isSquareResize = ($b ? true : false);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isUsedGD

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isUsedGD(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function isUsedGD ()
    #     {
    #         return $this->_isUseGD;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getImageSize

  ## Parametros
    - sPath

  ## Retorno
    - any
  """
  def getImageSize(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     static function getImageSize($sPath)
    #     {
    #         $o = self::getInstance();
    #         return $o->_getImageSize($sPath);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getImageSize

  ## Parametros
    - sPath

  ## Retorno
    - any
  """
  def _getImageSize(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function _getImageSize($sPath)
    #     {
    #         $this->_sError = '';
    #         try {        
    #             $o = $this->_oManager->make($sPath);
    #         } 
    #         catch (Exception $e) {
    #             $this->_sError = $e->getMessage();
    #             return false;
    #         }
    #         return array ('w' => $o->width(), 'h' => $o->height());
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getExifInfo

  ## Parametros
    - sSrcImage,bCreateLocalFileIfUrl=true

  ## Retorno
    - any
  """
  def getExifInfo(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getExifInfo($sSrcImage, $bCreateLocalFileIfUrl = true)
    #     {
    #         $this->_sError = '';
    #         $sTmpFileName = false;
    #         $mixedRet = false;
    # 
    #         if ($bCreateLocalFileIfUrl && preg_match('/^https?:\/\//', $sSrcImage)) {
    #             $sTmpFileName = tempnam(BX_DIRECTORY_PATH_TMP, '');
    #             file_put_contents($sTmpFileName, file_get_contents($sSrcImage));
    #         }
    # 
    #         try {
    #             $mixedRet = $this->_oManager
    #                 ->make($sTmpFileName ? $sTmpFileName : $sSrcImage)
    #                 ->exif();
    #         }
    #         catch (Exception $e) {
    #             $this->_sError = $e->getMessage();
    #         }
    # 
    #         if ($sTmpFileName)
    #             @unlink($sTmpFileName);
    # 
    #         return $mixedRet;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAverageColor

  ## Parametros
    - sSrcImage

  ## Retorno
    - any
  """
  def getAverageColor(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getAverageColor($sSrcImage)
    #     {
    #         $this->_sError = '';
    #         try {
    #             $a = $this->_oManager
    #                 ->make($sSrcImage)
    #                 ->resize(1, 1)
    #                 ->pickColor(0, 0, 'array');
    # 
    #             return array('r' => $a[0], 'g' => $a[1], 'b' => $a[2]);
    #         }
    #         catch (Exception $e) {
    #             $this->_sError = $e->getMessage();
    #             return false;
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _grayscale

  ## Parametros
    - sSrcImage,sDstImage=''

  ## Retorno
    - any
  """
  def _grayscale(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function _grayscale ($sSrcImage, $sDstImage = '')
    #     {
    #         $this->_sError = '';
    #         try {
    #             $this->_oManager
    #                 ->make($sSrcImage)
    #                 ->greyscale()
    #                 ->save($sDstImage ? $sDstImage : $sSrcImage, $this->_iJpegQuality);
    # 
    #             chmod($sDstImage ? $sDstImage : $sSrcImage, BX_DOL_FILE_RIGHTS);
    #         }
    #         catch (Exception $e) {
    #             $this->_sError = $e->getMessage();
    #             return IMAGE_ERROR_WRONG_TYPE;
    #         }
    # 
    #         return IMAGE_ERROR_SUCCESS;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _removeTransparency

  ## Parametros
    - oImg

  ## Retorno
    - any
  """
  def _removeTransparency(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function _removeTransparency ($oImg)
    #     {
    #         $oImgBack = $this->_oManager->canvas($oImg->width(), $oImg->height(), $this->_sRemoveTransparencyFillColor);
    #         return $oImgBack->insert($oImg);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _resize

  ## Parametros
    - sSrcImage,sDstImage=''

  ## Retorno
    - any
  """
  def _resize(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function _resize ($sSrcImage, $sDstImage = '')
    #     {       
    #         $this->_sError = '';
    #         try {
    #             if ($this->_isAutoCrop || $this->_isSquareResize) {
    # 
    #                 $oImg = $this->_oManager
    #                     ->make($sSrcImage)
    #                     ->orientate();
    # 
    #                 if ($this->_bRemoveTransparency)
    #                     $oImg = $this->_removeTransparency($oImg);
    # 
    #                 $oImg
    #                     ->fit($this->w, $this->_isSquareResize ? $this->w : $this->h)
    #                     ->save($sDstImage ? $sDstImage : $sSrcImage, $this->_iJpegQuality);
    # 
    #             } 
    #             else {
    # 
    #                 $oImg = $this->_oManager
    #                     ->make($sSrcImage)
    #                     ->orientate();
    # 
    #                 if ($this->_bRemoveTransparency)
    #                     $oImg = $this->_removeTransparency($oImg);
    # 
    #                 $oImg
    #                     ->resize($this->w, $this->h, function ($constraint) {
    #                         $constraint->aspectRatio();
    #                         $constraint->upsize();
    #                     })
    #                     ->save($sDstImage ? $sDstImage : $sSrcImage, $this->_iJpegQuality);
    #             }
    #             chmod($sDstImage ? $sDstImage : $sSrcImage, BX_DOL_FILE_RIGHTS);
    #         }
    #         catch (Exception $e) {
    #             $this->_sError = $e->getMessage();
    #             return IMAGE_ERROR_WRONG_TYPE;
    #         }
    # 
    #         return IMAGE_ERROR_SUCCESS;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _applyWatermark

  ## Parametros
    - sSrcImage,sDstImage,sWtrImage,iTransparency,sPosition='bottom-right',sPositionOffsetX=0,sPositionOffsetY=0,sScaleFactor=0.2

  ## Retorno
    - any
  """
  def _applyWatermark(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function _applyWatermark( $sSrcImage, $sDstImage, $sWtrImage, $iTransparency, $sPosition = 'bottom-right', $sPositionOffsetX = 0, $sPositionOffsetY = 0, $sScaleFactor = 0.2)
    #     {
    #         $this->_sError = '';
    #         try {
    #             $oImageOrig = $this->_oManager->make($sSrcImage);
    # 
    #             $oImageOrig
    #                 ->insert($this->_oManager
    #                     ->make($sWtrImage)
    #                     ->resize(round($oImageOrig->width() * $sScaleFactor), round($oImageOrig->height() * $sScaleFactor),  function ($constraint) {
    #                         $constraint->aspectRatio();
    #                         $constraint->upsize();
    #                     })
    #                     ->opacity($iTransparency), 
    #                 $sPosition, $sPositionOffsetX, $sPositionOffsetY)
    #                 ->save($sDstImage ? $sDstImage : $sSrcImage, $this->_iJpegQuality);
    # 
    #             chmod($sDstImage ? $sDstImage : $sSrcImage, BX_DOL_FILE_RIGHTS);
    #         }
    #         catch (Exception $e) {
    #             $this->_sError = $e->getMessage();
    #             return IMAGE_ERROR_WRONG_TYPE;
    #         }
    # 
    #         return IMAGE_ERROR_SUCCESS;        
    #     }
    :ok
  end

end
