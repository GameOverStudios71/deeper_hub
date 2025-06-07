
defmodule DeeperHub.Inc.Classes.BxDolPaginate do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C:\\Users\\Admin\\deeper_hub\\una\\inc\classes\BxDolPaginate.php
  """

  # Heranca de BxDol

  @doc """
  Funcao correspondente ao metodo PHP construct

  ## Parametros
    - $aParams
    -  $oTemplate = null

  ## Retorno
    - any
  """
  def construct(params) do
    # TODO: Implementacao futura
        # public function __construct($aParams, $oTemplate = null)
    #     {
    #         parent::__construct();
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getNum

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getNum(params) do
    # TODO: Implementacao futura
        # public function getNum()
    #     {
    #         return $this->_iNum;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setNumFromDataArray

  ## Parametros
    - &$a
    -  $isAutoPopLastElement = true

  ## Retorno
    - any
  """
  def setNumFromDataArray(params) do
    # TODO: Implementacao futura
        # public function setNumFromDataArray(&$a, $isAutoPopLastElement = true)
    #     {
    #         if ($a && is_array($a))
    #             $this->_iNum = count($a);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setNum

  ## Parametros
    - $i

  ## Retorno
    - any
  """
  def setNum(params) do
    # TODO: Implementacao futura
        # public function setNum($i)
    #     {
    #         if ($i >= 0) {
    #             $this->_iNum = (int)$i;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStart

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getStart(params) do
    # TODO: Implementacao futura
        # public function getStart()
    #     {
    #         return $this->_iStart;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setStart

  ## Parametros
    - $i

  ## Retorno
    - any
  """
  def setStart(params) do
    # TODO: Implementacao futura
        # public function setStart($i)
    #     {
    #         if ($i >= 0) {
    #             $this->_iStart = (int)$i;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPerPage

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getPerPage(params) do
    # TODO: Implementacao futura
        # public function getPerPage()
    #     {
    #         return $this->_iPerPage;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setPerPage

  ## Parametros
    - $i

  ## Retorno
    - any
  """
  def setPerPage(params) do
    # TODO: Implementacao futura
        # public function setPerPage($i)
    #     {
    #         if ((int)$i > 0) {
    #             $this->_iPerPage = $i;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setOnChangePage

  ## Parametros
    - $s

  ## Retorno
    - any
  """
  def setOnChangePage(params) do
    # TODO: Implementacao futura
        # public function setOnChangePage($s)
    #     {
    #         $this->_sOnChangePage = $s;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isPrevAvail

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isPrevAvail(params) do
    # TODO: Implementacao futura
        # public function isPrevAvail ()
    #     {
    #         return $this->_iStart > 0 ? true : false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isNextAvail

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isNextAvail(params) do
    # TODO: Implementacao futura
        # public function isNextAvail ()
    #     {
    #         return $this->_iNum > $this->_iPerPage ? true : false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPaginate

  ## Parametros
    - $iStart = -1
    -  $iNum = -1
    -  $iPerPage = -1

  ## Retorno
    - any
  """
  def getPaginate(params) do
    # TODO: Implementacao futura
        # public function getPaginate($iStart = -1, $iNum = -1, $iPerPage = -1)
    #     {
    #         $this->setNum($iNum);
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSimplePaginate

  ## Parametros
    - $sViewAllUrl = ''
    -  $iStart = -1
    -  $iNum = -1
    -  $iPerPage = -1

  ## Retorno
    - any
  """
  def getSimplePaginate(params) do
    # TODO: Implementacao futura
        # public function getSimplePaginate($sViewAllUrl = '', $iStart = -1, $iNum = -1, $iPerPage = -1)
    #     {
    #         if($sViewAllUrl)
    #             $this->_sViewAllUrl = $sViewAllUrl;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addCssJs

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def addCssJs(params) do
    # TODO: Implementacao futura
        # public function addCssJs ()
    #     {
    #         if (self::$_isCssAdded)
    #             return false;
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getReplacement

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getReplacement(params) do
    # TODO: Implementacao futura
        # protected function _getReplacement()
    #     {
    #         return array(
    #             'start' => $this->_iStart,
    #             'per_page' => $this->_iPerPage,
    #         );
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPageChangeUrl

  ## Parametros
    - $aReplacement

  ## Retorno
    - any
  """
  def getPageChangeUrl(params) do
    # TODO: Implementacao futura
        # protected function _getPageChangeUrl($aReplacement)
    #     {
    #         return $this->_oTemplate->parseHtmlByContent($this->_sPageUrl, $aReplacement, array('{', '}'));
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPageChangeOnClick

  ## Parametros
    - $aReplacement

  ## Retorno
    - any
  """
  def getPageChangeOnClick(params) do
    # TODO: Implementacao futura
        # protected function _getPageChangeOnClick($aReplacement)
    #     {
    #         return !empty($this->_sOnChangePage) ? 'onclick="javascript:' . $this->_oTemplate->parseHtmlByContent($this->_sOnChangePage, $aReplacement, array('{', '}')) . '; 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getButtonIconPrev

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getButtonIconPrev(params) do
    # TODO: Implementacao futura
        # protected function _getButtonIconPrev()
    #     {
    #         return 'angle-double-left';
    # 
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getButtonIconNext

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getButtonIconNext(params) do
    # TODO: Implementacao futura
        # protected function _getButtonIconNext()
    #     {
    #         return 'angle-double-right';
    # 
    :ok
  end
end
