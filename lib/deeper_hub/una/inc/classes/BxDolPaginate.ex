
defmodule DeeperHub.Inc.Classes.BxDolPaginate do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolPaginate.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aParams,oTemplate=null

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($aParams, $oTemplate = null)
    #     {
    #         parent::__construct();
    # 
    #         if ($oTemplate)
    #             $this->_oTemplate = $oTemplate;
    #         else
    #             $this->_oTemplate = BxDolTemplate::getInstance();
    # 
    #         if (isset($aParams['count']))
    #            trigger_error ('Paginate "count" is deprecated - use "num" instead: ' . get_class($this), E_USER_ERROR);
    # 
    #         //--- Main settings ---//
    #         $this->_aParams = $aParams;
    # 
    #         $this->_iStart = isset($aParams['start']) && (int)$aParams['start'] > 0 ? (int)$aParams['start'] : 0;
    #         $this->_iPerPage = isset($aParams['per_page']) && (int)$aParams['per_page'] > 0 ? (int)$aParams['per_page'] : BX_DOL_PAGINATE_PER_PAGE_DEFAULT;
    #         $this->_iNum = isset($aParams['num']) ? (int)$aParams['num'] : 0;
    # 
    #         $this->_iTotal = isset($aParams['total']) ? (int)$aParams['total'] : 0;
    #         $this->_bTotal = $this->_iTotal > 0;
    # 
    #         $this->_bInfo = isset($aParams['info']) ? (bool)$aParams['info'] : true;
    #         $this->_sButtonsClass = isset($aParams['buttons_class']) ? $aParams['buttons_class'] : '';
    #         $this->_sViewAllUrl = isset($aParams['view_all_url']) ? $aParams['view_all_url'] : false;
    #         $this->_sViewAllCaption = isset($aParams['view_all_caption']) ? $aParams['view_all_caption'] : _t('_sys_paginate_view_all');
    # 
    #         $this->_sPaginateClass = isset($aParams['paginate_class']) ? $aParams['paginate_class'] : '';
    # 
    #         // page url
    #         $this->_sPageUrl = isset($aParams['page_url']) ? $aParams['page_url'] : BX_DOL_URL_ROOT;
    # 
    #         // on click (js mode)
    #         $this->_sOnChangePage = isset($aParams['on_change_page']) ? $aParams['on_change_page'] : '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getNum

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getNum(%{}) do
    # TODO: Implementacao futura
        # public function getNum()
    #     {
    #         return $this->_iNum;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setNumFromDataArray

  ## Parametros
    - &a,isAutoPopLastElement=true

  ## Retorno
    - any
  """
  def setNumFromDataArray(%{}) do
    # TODO: Implementacao futura
        # public function setNumFromDataArray(&$a, $isAutoPopLastElement = true)
    #     {
    #         if ($a && is_array($a))
    #             $this->_iNum = count($a);
    #         else
    #             $this->_iNum = 0;
    # 
    #         if ($this->_iNum > $this->_iPerPage && $isAutoPopLastElement)
    #             array_pop($a);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setNum

  ## Parametros
    - i

  ## Retorno
    - any
  """
  def setNum(%{}) do
    # TODO: Implementacao futura
        # public function setNum($i)
    #     {
    #         if ($i >= 0) {
    #             $this->_iNum = (int)$i;
    #             return true;
    #         }
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStart

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getStart(%{}) do
    # TODO: Implementacao futura
        # public function getStart()
    #     {
    #         return $this->_iStart;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setStart

  ## Parametros
    - i

  ## Retorno
    - any
  """
  def setStart(%{}) do
    # TODO: Implementacao futura
        # public function setStart($i)
    #     {
    #         if ($i >= 0) {
    #             $this->_iStart = (int)$i;
    #             return true;
    #         }
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPerPage

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getPerPage(%{}) do
    # TODO: Implementacao futura
        # public function getPerPage()
    #     {
    #         return $this->_iPerPage;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setPerPage

  ## Parametros
    - i

  ## Retorno
    - any
  """
  def setPerPage(%{}) do
    # TODO: Implementacao futura
        # public function setPerPage($i)
    #     {
    #         if ((int)$i > 0) {
    #             $this->_iPerPage = $i;
    #             return true;
    #         }
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setOnChangePage

  ## Parametros
    - s

  ## Retorno
    - any
  """
  def setOnChangePage(%{}) do
    # TODO: Implementacao futura
        # public function setOnChangePage($s)
    #     {
    #         $this->_sOnChangePage = $s;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isPrevAvail

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isPrevAvail(%{}) do
    # TODO: Implementacao futura
        # public function isPrevAvail ()
    #     {
    #         return $this->_iStart > 0 ? true : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isNextAvail

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isNextAvail(%{}) do
    # TODO: Implementacao futura
        # public function isNextAvail ()
    #     {
    #         return $this->_iNum > $this->_iPerPage ? true : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPaginate

  ## Parametros
    - iStart=-1,iNum=-1,iPerPage=-1

  ## Retorno
    - any
  """
  def getPaginate(%{}) do
    # TODO: Implementacao futura
        # public function getPaginate($iStart = -1, $iNum = -1, $iPerPage = -1)
    #     {
    #         $this->setNum($iNum);
    #         if (!$this->_iNum)
    #             return '';
    # 
    #         $this->setStart($iStart);
    #         $this->setPerPage($iPerPage);
    # 
    #         if (0 == $this->getStart() && !$this->isNextAvail ())
    #             return '';
    # 
    #         $aReplacement = $this->_getReplacement();
    # 
    #         //--- Previous Page button ---//
    #         $sPrevLnkUrl = 'javascript:void(0);';
    #         $sPrevLnkClick = '';
    #         $sPrevClassAdd = ' bx-btn-disabled';
    #         if ($this->isPrevAvail()) {
    #             $iStartPrev = $this->_iStart - $this->_iPerPage > 0 ? $this->_iStart - $this->_iPerPage : 0;
    #             $aReplacementLink = array_merge($aReplacement, array('start' => $iStartPrev));
    #             $sPrevLnkUrl = $this->_getPageChangeUrl($aReplacementLink);
    #             $sPrevLnkClick = $this->_getPageChangeOnClick($aReplacementLink);
    #             $sPrevClassAdd = '';
    #         }
    # 
    #         //--- Next Page button ---//
    #         $sNextLnkUrl = 'javascript:void(0);';
    #         $sNextLnkClick = '';
    #         $sNextClassAdd = ' bx-btn-disabled';
    #         if ($this->isNextAvail()) {
    #             $aReplacementLink = array_merge($aReplacement, array('start' => $this->_iStart + $this->_iPerPage));
    #             $sNextLnkUrl = $this->_getPageChangeUrl($aReplacementLink);
    #             $sNextLnkClick = $this->_getPageChangeOnClick($aReplacementLink);
    #             $sNextClassAdd = '';
    #         }
    # 
    #         $sClassAdd = ($this->_sButtonsClass ? ' ' . $this->_sButtonsClass : '');
    # 
    #         $aVariables = [
    #             'bx_if:info' => [
    #                 'condition' => $this->_bInfo && !$this->_bTotal,
    #                 'content' => [
    #                     'text' => _t('_sys_paginate_info', $this->_iStart + 1, $this->_iStart + ($this->isNextAvail () ? $this->_iPerPage : $this->_iNum)),
    #                 ],
    #             ],
    #             'bx_if:total' => [
    #                 'condition' => $this->_bTotal,
    #                 'content' => [
    #                     'text' => _t('_sys_paginate_total', $this->_iStart + 1, $this->_iStart + ($this->isNextAvail() ? $this->_iPerPage : $this->_iNum), $this->_iTotal),
    #                 ],
    #             ],
    #             'bx_if:view_all' => [
    #                 'condition' => (bool)$this->_sViewAllUrl,
    #                 'content' => [
    #                     'lnk_url' => $this->_sViewAllUrl,
    #                     'lnk_title' => $this->_sViewAllCaption,
    #                     'lnk_content' => $this->_sViewAllCaption,
    #                 ],
    #             ],
    #             'btn_prev' => $this->_getButton('prev', [
    #                 'class' => $sClassAdd . $sPrevClassAdd,
    #                 'href' => $sPrevLnkUrl,
    #                 'onclick' => $sPrevLnkClick,
    #             ]),
    #             'btn_next' => $this->_getButton('next', [
    #                 'class' => $sClassAdd . $sNextClassAdd,
    #                 'href' => $sNextLnkUrl,
    #                 'onclick' => $sNextLnkClick,
    #             ]),
    #             'paginate_class' => $this->_sPaginateClass,
    #             'bx_repeat:attrs' => [
    #                 ['key' => 'bx-data-start', 'value' => $this->_iStart],
    #                 ['key' => 'bx-data-perpage', 'value' => $this->_iPerPage]
    #             ]
    #         ];
    # 
    #         $this->addCssJs();
    #         return $this->_oTemplate->parseHtmlByName('paginate.html', $aVariables);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSimplePaginate

  ## Parametros
    - sViewAllUrl='',iStart=-1,iNum=-1,iPerPage=-1

  ## Retorno
    - any
  """
  def getSimplePaginate(%{}) do
    # TODO: Implementacao futura
        # public function getSimplePaginate($sViewAllUrl = '', $iStart = -1, $iNum = -1, $iPerPage = -1)
    #     {
    #         if($sViewAllUrl)
    #             $this->_sViewAllUrl = $sViewAllUrl;
    # 
    #         if(!isset($this->_aParams['info']))
    #             $this->_bInfo = false;
    # 
    #         $this->_sButtonsClass .= ($this->_sButtonsClass ? ' ' : '') . 'bx-btn-small bx-btn-symbol-small';
    #         $this->_sPaginateClass = 'bx-paginate-simple';
    # 
    #         return $this->getPaginate($iStart, $iNum, $iPerPage);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addCssJs

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def addCssJs(%{}) do
    # TODO: Implementacao futura
        # public function addCssJs ()
    #     {
    #         if (self::$_isCssAdded)
    #             return false;
    #         $this->_oTemplate->addCss('paginate.css');
    #         self::$_isCssAdded = true;
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getReplacement

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getReplacement(%{}) do
    # TODO: Implementacao futura
        # protected function _getReplacement()
    #     {
    #         return array(
    #             'start' => $this->_iStart,
    #             'per_page' => $this->_iPerPage,
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getPageChangeUrl

  ## Parametros
    - aReplacement

  ## Retorno
    - any
  """
  def _getPageChangeUrl(%{}) do
    # TODO: Implementacao futura
        # protected function _getPageChangeUrl($aReplacement)
    #     {
    #         return $this->_oTemplate->parseHtmlByContent($this->_sPageUrl, $aReplacement, array('{', '}'));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getPageChangeOnClick

  ## Parametros
    - aReplacement

  ## Retorno
    - any
  """
  def _getPageChangeOnClick(%{}) do
    # TODO: Implementacao futura
        # protected function _getPageChangeOnClick($aReplacement)
    #     {
    #         return !empty($this->_sOnChangePage) ? 'onclick="javascript:' . $this->_oTemplate->parseHtmlByContent($this->_sOnChangePage, $aReplacement, array('{', '}')) . '; return false;"' : '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getButtonIconPrev

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getButtonIconPrev(%{}) do
    # TODO: Implementacao futura
        # protected function _getButtonIconPrev()
    #     {
    #         return 'angle-double-left';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getButtonIconNext

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getButtonIconNext(%{}) do
    # TODO: Implementacao futura
        # protected function _getButtonIconNext()
    #     {
    #         return 'angle-double-right';
    #     }
    :ok
  end

end
