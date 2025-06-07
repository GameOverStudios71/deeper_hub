
defmodule DeeperHub.Inc.Classes.BxDolSearchResult do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolSearch.php
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
        # 
    #     function __construct ()
    #     {
    #         $this->_bIsApi = bx_is_api();
    # 
    #         if (isset($this->aPseud['id']))
    #             $this->aCurrent['ident'] = $this->aPseud['id'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getId

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getId(%{}) do
    # TODO: Implementacao futura
        # public function getId()
    #     {
    #         return $this->id;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setId

  ## Parametros
    - sId

  ## Retorno
    - any
  """
  def setId(%{}) do
    # TODO: Implementacao futura
        # public function setId($sId)
    #     {
    #         $this->id = $sId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getModuleName

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getModuleName(%{}) do
    # TODO: Implementacao futura
        # public function getModuleName()
    #     {
    #         return isset($this->aCurrent['module_name']) ? $this->aCurrent['module_name'] : '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getContentInfoName

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getContentInfoName(%{}) do
    # TODO: Implementacao futura
        # public function getContentInfoName()
    #     {
    #         return isset($this->aCurrent['name']) ? $this->aCurrent['name'] : '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setAjaxPaginate

  ## Parametros
    - b=true

  ## Retorno
    - any
  """
  def setAjaxPaginate(%{}) do
    # TODO: Implementacao futura
        # public function setAjaxPaginate($b = true)
    #     {
    #         $this->bForceAjaxPaginate = $b;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setPaginatePerPage

  ## Parametros
    - iPerPage

  ## Retorno
    - any
  """
  def setPaginatePerPage(%{}) do
    # TODO: Implementacao futura
        # public function setPaginatePerPage($iPerPage)
    #     {
    #         $this->iPaginatePerPage = $iPerPage;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setSingleSearch

  ## Parametros
    - bSingleSearch

  ## Retorno
    - any
  """
  def setSingleSearch(%{}) do
    # TODO: Implementacao futura
        # public function setSingleSearch($bSingleSearch)
    #     {
    #         $this->_bSingleSearch = $bSingleSearch;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setLiveSearch

  ## Parametros
    - bLiveSearch

  ## Retorno
    - any
  """
  def setLiveSearch(%{}) do
    # TODO: Implementacao futura
        # public function setLiveSearch($bLiveSearch)
    #     {
    #         $this->_bLiveSearch = $bLiveSearch;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setMetaType

  ## Parametros
    - s

  ## Retorno
    - any
  """
  def setMetaType(%{}) do
    # TODO: Implementacao futura
        # public function setMetaType($s)
    #     {
    #         $this->_sMetaType = $s;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isMetaEnabled

  ## Parametros
    - s

  ## Retorno
    - any
  """
  def isMetaEnabled(%{}) do
    # TODO: Implementacao futura
        # public function isMetaEnabled($s)
    #     {
    #         if (empty($this->aCurrent['object_metatags']))
    #             return false;
    #             
    #         if (!($o = BxDolMetatags::getObjectInstance($this->aCurrent['object_metatags'])))
    #             return false;
    # 
    #         switch ($s) {
    #             case 'location_country_city':
    #             case 'location_country_state':            
    #             case 'location_country':
    #                 return $o->locationsIsEnabled();
    #             case 'mention':
    #                 return $o->mentionsIsEnabled();
    #             case 'keyword':
    #                 return $o->keywordsIsEnabled();
    #         }
    # 
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setCategoryObject

  ## Parametros
    - s

  ## Retorno
    - any
  """
  def setCategoryObject(%{}) do
    # TODO: Implementacao futura
        # public function setCategoryObject($s)
    #     {
    #         $this->_sCategoryObject = $s;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setCustomSearchCondition

  ## Parametros
    - a

  ## Retorno
    - any
  """
  def setCustomSearchCondition(%{}) do
    # TODO: Implementacao futura
        # public function setCustomSearchCondition($a)
    #     {
    #         $this->_aCustomSearchCondition = $a;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setCustomCurrentCondition

  ## Parametros
    - a

  ## Retorno
    - any
  """
  def setCustomCurrentCondition(%{}) do
    # TODO: Implementacao futura
        # public function setCustomCurrentCondition($a)
    #     {
    #         $this->aCurrent = array_merge_recursive($this->aCurrent, $a);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setCategoriesCondition

  ## Parametros
    - sKeyword

  ## Retorno
    - any
  """
  def setCategoriesCondition(%{}) do
    # TODO: Implementacao futura
        # public function setCategoriesCondition($sKeyword)
    #     {
    # 		$this->aCurrent['join']['multicat'] = array(
    #             'type' => 'INNER',
    #             'table' => 'sys_categories2objects',
    #             'mainField' => 'id',
    #             'onField' => 'object_id',
    #             'joinFields' => array(),
    #         );
    # 		
    # 		if (isset($this->aCurrent['tableSearch'])){
    # 			$this->aCurrent['join']['multicat']['mainTable'] = $this->aCurrent['tableSearch'];
    # 		}
    # 		
    #         $this->aCurrent['join']['multicat2'] = array(
    #            'type' => 'INNER',
    #            'table' => 'sys_categories',
    #            'mainField' => 'category_id',
    #            'mainTable' => 'sys_categories2objects',
    #            'onField' => 'id',
    #            'joinFields' => array(),
    #        );
    #        $this->aCurrent['restriction']['multicat'] = array('value' => $sKeyword, 'field' => 'value', 'operator' => '=', 'table' => 'sys_categories');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setDisplayEmptyMsg

  ## Parametros
    - b,sLangKey=''

  ## Retorno
    - any
  """
  def setDisplayEmptyMsg(%{}) do
    # TODO: Implementacao futura
        # public function setDisplayEmptyMsg($b, $sLangKey = '')
    #     {
    #         $this->bDisplayEmptyMsg = $b;
    #         if ($sLangKey)
    #            $this->sDisplayEmptyMsgKey = $sLangKey;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setProcessPrivateContent

  ## Parametros
    - b

  ## Retorno
    - any
  """
  def setProcessPrivateContent(%{}) do
    # TODO: Implementacao futura
        # public function setProcessPrivateContent ($b)
    #     {
    #         $this->bProcessPrivateContent = $b;
    #         if ($b) {
    #             // unset condition which was set when 'bProcessPrivateContent' was set to 'false'
    #             foreach ($this->aPrivateConditionsIndexes['restriction'] as $sKey) 
    #                 unset($this->aCurrent['restriction'][$sKey]);
    #             foreach ($this->aPrivateConditionsIndexes['join'] as $sKey)
    #                 unset($this->aCurrent['join'][$sKey]);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP processingRaw

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def processingRaw(%{}) do
    # TODO: Implementacao futura
        # 
    #     function processingRaw ()
    #     {
    #         $sCode = $this->displayResultBlock();
    #         return $this->aCurrent['paginate']['num'] > 0 ? $sCode : '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP processing

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def processing(%{}) do
    # TODO: Implementacao futura
        # 
    #     function processing ()
    #     {
    #         if($this->_bIsApi)
    #             return $this->processingAPI();
    # 
    #         if($this->_bValidate)
    #             return $this->getSearchData();
    # 
    #         $sCode = $this->displayResultBlock();
    #         if ($this->aCurrent['paginate']['num'] > 0) {
    #             $sPaginate = $this->showPagination();
    #             $sCode = $this->displaySearchBox($sCode, $sPaginate);
    #         }
    #         else {
    #             $sCode = $this->bDisplayEmptyMsg ? $this->displaySearchBox($this->displayResultBlockEmpty()) : '';
    #         }
    # 
    #         return $sCode;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP processingAPI

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def processingAPI(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function processingAPI () 
    #     {
    #         $sModule = 'system';
    #         $sUnitType = 'content';
    #         if(!empty($this->oModule)) {
    #             $sModule = $this->oModule->getName();
    # 
    #             if(method_exists($this->oModule, 'serviceActAsProfile') && $this->oModule->serviceActAsProfile())
    #                  $sUnitType = 'profile';
    #             if(method_exists($this->oModule, 'serviceIsGroupProfile') && $this->oModule->serviceIsGroupProfile())
    #                  $sUnitType = 'context';
    #         }
    # 
    #         $sUnit =  'list';
    #         if(in_array($this->sUnitViewDefault, ['showcase', 'gallery']))
    #             $sUnit = 'card';
    #         
    #         $aData = defined('BX_API_PAGE') ? [] : $this->decodeDataAPI($this->getSearchData());
    #         
    #         $aParams =  [
    #             'per_page' => $this->aCurrent['paginate']['perPage'],
    #             'start' => $this->aCurrent['paginate']['start'],
    #             'type' => $this->_sMode,
    #         ];
    # 
    #         foreach(['author', 'category', 'context'] as $sParamAdd)
    #             if(isset($this->_aParams[$sParamAdd]))
    #                 $aParams[$sParamAdd] = $this->_aParams[$sParamAdd];
    # 
    #         return [
    #             'module' => $sModule,
    #             'unit' => 'general-' . $sUnitType . '-' . $sUnit,
    #             'request_url' => !empty($this->aCurrent['api_request_url']) ? $this->aCurrent['api_request_url'] : '/api.php?r=' . $sModule . '/browse/&params[]=',
    #             'data' =>  $aData,
    #             'params' => $aParams
    #         ];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP decodeDataAPI

  ## Parametros
    - a

  ## Retorno
    - any
  """
  def decodeDataAPI(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function decodeDataAPI ($a)
    #     {
    #         return $a;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP displayResultBlock

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def displayResultBlock(%{}) do
    # TODO: Implementacao futura
        # 
    #     function displayResultBlock ()
    #     {
    #         $aData = $this->getSearchData();
    # 
    #         $sCode = '';
    #         if (count($aData) > 0) {
    #             $sCode = $this->addCustomParts();
    #             foreach ($aData as $iKey => $aValue) {
    #                 $sCode .= $this->displaySearchUnit($aValue);
    #             }
    #         }
    #         return $sCode;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP displayResultBlockEmpty

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def displayResultBlockEmpty(%{}) do
    # TODO: Implementacao futura
        # 
    #     function displayResultBlockEmpty ()
    #     {
    #         return MsgBox(_t($this->sDisplayEmptyMsgKey ? $this->sDisplayEmptyMsgKey : '_Empty'));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP rss

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def rss(%{}) do
    # TODO: Implementacao futura
        # 
    #     function rss ()
    #     {
    #         if (!isset($this->aCurrent['rss']['fields']) || !isset($this->aCurrent['rss']['link']))
    #             return '';
    # 
    #         $aData = $this->getSearchData();
    #         $f = &$this->aCurrent['rss']['fields'];
    #         if ($aData) {
    #             foreach ($aData as $k => $a) {
    #                 $aData[$k][$f['Link']] = $this->getRssUnitLink ($a);
    # 
    #                 if(isset($f['Image']))
    #                     $aData[$k][$f['Image']] = $this->getRssUnitImage ($a, $f['Image']);
    #             }
    #         }
    # 
    #         $oRss = new BxDolRssFactory ();
    # 
    #         return $oRss->GenRssByCustomData(
    #             $aData,
    #             isset($this->aCurrent['rss']['title']) && $this->aCurrent['rss']['title'] ? $this->aCurrent['rss']['title'] : $this->aCurrent['title'],
    #             $this->aCurrent['rss']['link'],
    #             $this->aCurrent['rss']['fields'],
    #             isset($this->aCurrent['rss']['image']) ? $this->aCurrent['rss']['image'] : '',
    #             isset($this->aCurrent['rss']['profile']) ? $this->aCurrent['rss']['profile'] : 0
    #         );
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP outputRSS

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def outputRSS(%{}) do
    # TODO: Implementacao futura
        # 
    #     function outputRSS ()
    #     {
    #         header('Content-Type: text/xml; charset=UTF-8');
    #         echo $this->rss();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getRssUnitLink

  ## Parametros
    - &a

  ## Retorno
    - any
  """
  def getRssUnitLink(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getRssUnitLink (&$a)
    #     {
    #         // override this functions to return permalink to rss unit
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getRssUnitImage

  ## Parametros
    - &a,sField

  ## Retorno
    - any
  """
  def getRssUnitImage(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getRssUnitImage (&$a, $sField)
    #     {
    #         // override this functions to return image for rss unit
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setFieldUnit

  ## Parametros
    - sFieldName,sTableName,sOperator='',bRenameMode=true

  ## Retorno
    - any
  """
  def setFieldUnit(%{}) do
    # TODO: Implementacao futura
        # 
    #     function setFieldUnit ($sFieldName, $sTableName, $sOperator = '', $bRenameMode = true)
    #     {
    #         $bOperator = !empty($sOperator);
    # 
    #         $sqlUnit  = "`$sTableName`.`$sFieldName`";
    #         if($bOperator)
    #             $sqlUnit = $sOperator . '(' . $sqlUnit . ')';
    # 
    #         if(!empty($this->aPseud) && $bRenameMode !== false && ($sKey = array_search($sFieldName . ($bOperator ? '_' . strtolower($sOperator) : ''), $this->aPseud)) !== false) {
    #             $sqlUnit .= " as `$sKey`";
    #             unset($this->aPseud[$sKey]);
    #         }
    # 
    #         return $sqlUnit . ', ';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSearchData

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getSearchData(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getSearchData ()
    #     {
    #         /**
    #          * @hooks
    #          * @hookdef hook-simple_search-before_get_data 'simple_search', 'before_get_data' - hook on before after get data 
    #          * - $unit_name - equals `simple_search`
    #          * - $action - equals `before_get_data` 
    #          * - $object_id - not used 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `object` - [array] by ref, array of parameters, can be overridden in hook processing
    #          *      - `mode` - [string] search mode
    #          * @hook @ref hook-simple_search-before_get_data
    #          */
    #         bx_alert('simple_search', 'before_get_data', 0, false, [
    #             'object' => &$this->aCurrent, 
    #             'mode' => $this->_sMode
    #         ]);
    # 
    #         if(($this->aPseud = $this->_getPseudFromParam()) === false)
    #             $this->aPseud = $this->_getPseud();
    # 
    #         $this->setConditionParams();
    #         $aData = $this->aCurrent['paginate']['num'] > 0 ? $this->getSearchDataByParams() : [];
    #         
    #         if($this->_bValidate) {
    #             $aIds = array_map(function($aItem) {
    #                 return $aItem['id'];
    #             }, $aData);
    # 
    #             sort($aIds);
    #             sort($this->_aParams['validate']);
    #             $aData = $aIds == $this->_aParams['validate'] ? 'valid' : 'invalid';
    #         }
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-simple_search-get_data 'simple_search', 'get_data' - hook on after get data 
    #          * - $unit_name - equals `simple_search`
    #          * - $action - equals `get_data` 
    #          * - $object_id - not used 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `object` - [array] by ref, array of parameters, can be overridden in hook processing
    #          *      - `mode` - [string] search mode
    #          *      - `search_object` - [string] search object name
    #          * @hook @ref hook-simple_search-get_data
    #          */
    #         bx_alert('simple_search', 'get_data', 0, false, [
    #             'object' => &$this->aCurrent, 
    #             'mode' => $this->_sMode, 
    #             'search_results' => &$aData
    #         ]);
    # 
    #         return $aData;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSearchQuery

  ## Parametros
    - sObject,aParams=[]

  ## Retorno
    - any
  """
  def getSearchQuery(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getSearchQuery($sObject, $aParams = [])
    #     {
    #         if(!is_array($aParams))
    #             $aParams = [];
    #         $aParams = array_merge($aParams, ['for_union' => true]);
    # 
    #         $this->aPseud = [
    #             'id' => !empty($this->aCurrent['ident']) ? $this->aCurrent['ident'] : 'id', 
    #             'added' => !empty($this->aCurrent['added']) ? $this->aCurrent['added'] : 'added'
    #         ];
    # 
    #         $this->setConditionParams();
    #         $aQuery = $this->getSearchDataByParams($aParams);
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-simple_search-get_query 'simple_search', 'get_query' - hook on get sql queries
    #          * - $unit_name - equals `simple_search`
    #          * - $action - equals `get_query` 
    #          * - $object_id - not used 
    #          * - $sender_id - not used 
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `object` - [array] by ref, array of parameters, can be overridden in hook processing
    #          *      - `mode` - [string] search mode
    #          *      - `search_object` - [string] search object name
    #          *      - `search_query` - [array] by ref, array of sql, can be overridden in hook processing
    #          * @hook @ref hook-simple_search-get_query
    #          */
    #         bx_alert('simple_search', 'get_query', 0, false, [
    #             'object' => &$this->aCurrent, 
    #             'mode' => $this->_sMode, 
    #             'search_object' => $sObject,
    #             'search_query' => &$aQuery
    #         ]);
    # 
    #         return $aQuery;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFieldsOwn

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getFieldsOwn(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getFieldsOwn()
    #     {
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFieldsJoin

  ## Parametros
    - sJoin

  ## Retorno
    - any
  """
  def getFieldsJoin(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getFieldsJoin($sJoin)
    #     {
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getJoins

  ## Parametros
    - bRenameMode=true

  ## Retorno
    - any
  """
  def getJoins(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getJoins ($bRenameMode = true)
    #     {
    #         if(!isset($this->aCurrent['join']) || !is_array($this->aCurrent['join']))
    #             return false;
    # 
    #         $aSql = [
    #             'join' => '', 
    #             'ownFields' => '', 
    #             'joinFields' => '', 
    #             'groupBy' => '', 
    #             'groupHaving' => ''
    #         ];
    # 
    #         foreach($this->aCurrent['join'] as $sKey => $aValue) {
    #             $sAlias = isset($aValue['table_alias']) ? $aValue['table_alias'] : $aValue['table'];
    #             $sTableAlias = isset($aValue['table_alias']) ? " AS {$aValue['table_alias']} " : '';
    #             $sOperator = isset($aValue['operator']) ? $aValue['operator'] : null;
    # 
    #             // joinFields
    #             $aJoinFields = $this->getFieldsJoin($sKey);
    #             if($aJoinFields === false && !empty($aValue['joinFields']) && is_array($aValue['joinFields']))
    #                 $aJoinFields = $aValue['joinFields'];
    # 
    #             if($aJoinFields)
    #                 foreach($aJoinFields as $mixedField) {
    #                     list($sFldName, $sFldOperator) = is_array($mixedField) ? $mixedField : [$mixedField, $sOperator];
    # 
    #                     $aSql['joinFields'] .= $this->setFieldUnit($sFldName, $sAlias, $sFldOperator, $bRenameMode);
    #                 }
    # 
    #             // group by
    #             if(isset($aValue['groupTable']))
    #                 $aSql['groupBy'] .= "`{$aValue['groupTable']}`.`{$aValue['groupField']}`, ";
    # 
    #             // having
    #             if(isset($aValue['groupHaving']))
    #                 $aSql['groupHaving'] .= $aValue['groupHaving'];
    # 
    #             $sOn = isset($aValue['mainTable']) ? $aValue['mainTable'] : $this->aCurrent['table'];
    #             $aSql['join'] .= " {$aValue['type']} JOIN `{$aValue['table']}` $sTableAlias ON " . (!empty($aValue['on_sql']) ? $aValue['on_sql'] : "`{$sAlias}`.`{$aValue['onField']}`=" . trim($this->setFieldUnit($aValue['mainField'], $sOn, isset($aValue['mainFieldFunc']) ? $aValue['mainFieldFunc'] : '', false), ", "));
    #             $aSql['ownFields'] .= $this->setFieldUnit($aValue['mainField'], $sOn, '', $bRenameMode);
    #         }
    # 
    #         $aSql['joinFields'] = trim($aSql['joinFields'], ', ');
    # 
    #         if(!empty($aSql['groupBy']))
    #             $aSql['groupBy'] = trim('GROUP BY ' . $aSql['groupBy'], ', ');
    # 
    #         if(!empty($aSql['groupHaving']))
    #             $aSql['groupHaving'] = 'HAVING ' . $aSql['groupHaving'];
    # 
    #         return $aSql;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSearchDataByParams

  ## Parametros
    - aParams=''

  ## Retorno
    - any
  """
  def getSearchDataByParams(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getSearchDataByParams ($aParams = '')
    #     {
    #         $bForUnion = isset($aParams['for_union']) && $aParams['for_union'] === true;
    # 
    #         $aSql = [
    #             'ownFields' => '', 
    #             'order' => ''
    #         ];
    # 
    #         // searchFields
    #         if($bForUnion) {
    #             $sTable = isset($this->aCurrent['tableSearch']) ? $this->aCurrent['tableSearch'] : $this->aCurrent['table'];
    # 
    #             $aSql['ownFields'] .= $this->setFieldUnit(!empty($this->aCurrent['ident']) ? $this->aCurrent['ident'] : 'id', $sTable);
    #             $aSql['ownFields'] .= $this->setFieldUnit(!empty($this->aCurrent['added']) ? $this->aCurrent['added'] : 'added', $sTable);
    #             $aSql['ownFields'] .= "'" . $this->getContentInfoName()  . "' AS `content_info`";
    #         }
    #         else {
    #             $aOwnFields = $this->getFieldsOwn();
    #             if($aOwnFields === false)
    #                 $aOwnFields = $this->aCurrent['ownFields'];
    # 
    #             foreach($aOwnFields as $mixedField) {
    #                 list($sFldName, $sFldOperator) = is_array($mixedField) ? $mixedField : [$mixedField, ''];
    # 
    #                 $aSql['ownFields'] .= $this->setFieldUnit($sFldName, $this->aCurrent['table'], $sFldOperator);
    #             }
    #         }
    # 
    #         // joinFields & join
    #         if(($aJoins = $this->getJoins()) !== false) {
    #             if(!$bForUnion) {
    #                 $aSql['ownFields'] .= $aJoins['ownFields'];
    #                 $aSql['ownFields'] .= $aJoins['joinFields'];
    #             }
    # 
    #             $aSql['join'] = $aJoins['join'];
    #             $aSql['groupBy'] = $aJoins['groupBy'];
    #             $aSql['groupHaving'] = $aJoins['groupHaving'];
    #         }
    # 
    #         $aSql['ownFields'] = trim($aSql['ownFields'], ', ');
    # 
    #         // from
    #         $aSql['from'] = " FROM `{$this->aCurrent['table']}`";
    # 
    #         // where
    #         $aSql['where'] = $this->getRestriction();
    # 
    #         // limit
    #         $aSql['limit'] = $this->getLimit();
    # 
    #         // sorting
    #         $this->setSorting();
    # 
    #         $aSort = $this->getSorting($this->aCurrent['sorting']);
    #         foreach ($aSort as $sKey => $sValue)
    #             $aSql[$sKey] .= $sValue;
    # 
    #         // execution
    #         $sqlQuery = 'SELECT';
    # 
    #         if(isset($this->aCurrent['distinct']) && $this->aCurrent['distinct'] === true)
    #             $sqlQuery .= ' DISTINCT';
    # 
    #         $sqlQuery .= ' ' . $aSql['ownFields'];
    # 
    #         $sqlQuery .= ' ' . $aSql['from'];
    # 
    #         if (isset($aSql['join']))
    #             $sqlQuery .= ' ' . $aSql['join'];
    # 
    #         if (isset($aSql['where']))
    #             $sqlQuery .= ' ' . $aSql['where'];
    # 
    #         if (isset($aSql['groupBy']))
    #             $sqlQuery .= ' ' . $aSql['groupBy'];
    # 
    #         if (isset($aSql['groupHaving']))
    #             $sqlQuery .= ' ' . $aSql['groupHaving'];
    # 
    #         if($bForUnion)
    #             return [
    #                 'query' => $sqlQuery, 
    #                 'limit' => $aSql['limit']
    #             ];
    # 
    #         if (isset($aSql['order']))
    #             $sqlQuery .= ' ' . $aSql['order'];
    # 
    #         if (isset($aSql['limit']))
    #             $sqlQuery .= ' ' . $aSql['limit'];
    # 
    #         //echoDbg($sqlQuery);
    #         $aRes = BxDolDb::getInstance()->getAll($sqlQuery);
    #         return $aRes;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setConditionParams

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def setConditionParams(%{}) do
    # TODO: Implementacao futura
        # 
    #     function setConditionParams()
    #     {
    #         $this->aCurrent['paginate']['num'] = 0;
    # 
    #         // keyword
    #         $sKeyword = bx_process_input(isset($this->_aCustomSearchCondition['keyword']) ? $this->_aCustomSearchCondition['keyword'] : bx_get('keyword'));
    # 
    #         if ($this->_bLiveSearch && empty($sKeyword))
    #             return;
    # 
    #         if ($sKeyword !== false) {
    #             if (substr($sKeyword, 0, 1) == '@') {
    #                 $sModule = $this->aCurrent['module_name'];
    #                 $sMethod = 'act_as_profile';
    #                 if(!bx_is_srv($sModule, $sMethod) || !bx_srv($sModule, $sMethod))
    #                     return;
    # 
    #                 $sKeyword = substr($sKeyword, 1);
    #             }
    # 
    #             $this->aCurrent['restriction']['keyword'] = array(
    #                 'value' => $sKeyword,
    #                 'field' => '',
    #                 'operator' => 'against'
    #             );
    # 
    #             // for search results we need to show all items, not only public content
    #             $this->setProcessPrivateContent(true);
    #         }
    # 
    #         // owner
    #         if (isset($_GET['ownerName'])) {
    #             $sName = bx_process_input($_GET['ownerName']);
    #             $iUser = (int)BxDolProfileQuery::getInstance()->getIdByNickname($sName);
    #             BxDolMenu::getInstance()->setCurrentProfileID($iUser);
    #         } elseif (isset($_GET['userID']))
    #             $iUser = bx_process_input($_GET['userID'], BX_DATA_INT);
    # 
    #         if (!empty($iUser))
    #             $this->aCurrent['restriction']['owner']['value'] = $iUser;
    #         
    #         // meta info
    #         if ($this->_sMetaType && !empty($this->aCurrent['object_metatags'])) {
    #             $o = BxDolMetatags::getObjectInstance($this->aCurrent['object_metatags']);
    #             if ($o) {
    #                 unset($this->aCurrent['restriction']['keyword']);
    #                 switch ($this->_sMetaType) {
    #                     case 'location_country':
    #                         $o->locationsSetSearchCondition($this, $sKeyword);
    #                         break;
    #                     case 'location_country_state':
    #                         $o->locationsSetSearchCondition($this, $sKeyword, bx_process_input(isset($this->_aCustomSearchCondition['state']) ? $this->_aCustomSearchCondition['state'] : bx_get('state')));
    #                         break;
    #                     case 'location_country_city':
    #                         $o->locationsSetSearchCondition($this, $sKeyword, bx_process_input(isset($this->_aCustomSearchCondition['state']) ? $this->_aCustomSearchCondition['state'] : bx_get('state')), bx_process_input(isset($this->_aCustomSearchCondition['city']) ? $this->_aCustomSearchCondition['city'] : bx_get('city')));
    #                         break;
    #                     case 'location_state':
    #                         $o->locationsSetSearchCondition($this, false, $sKeyword);
    #                         break;
    #                     case 'location_city':
    #                         $o->locationsSetSearchCondition($this, false, false, $sKeyword);
    #                         break;
    #                     case 'mention':
    #                         $oCmts = !empty($this->sModuleObjectComments) ? BxDolCmts::getObjectInstance($this->sModuleObjectComments, 0, false) : false;
    #                         $o->mentionsSetSearchCondition($this, $sKeyword, $oCmts ? $oCmts->getSystemId() : 0);
    #                         break;
    #                     case 'keyword':
    #                         $oCmts = !empty($this->sModuleObjectComments) ? BxDolCmts::getObjectInstance($this->sModuleObjectComments, 0, false) : false;
    #                         $o->keywordsSetSearchCondition($this, $sKeyword, $oCmts ? $oCmts->getSystemId() : 0);
    #                         break;
    #                 }
    #             }
    #         }
    # 
    #         // category
    #         if ($this->_sCategoryObject){
    #             if(($o = BxDolCategory::getObjectInstance($this->_sCategoryObject)) && $this->_bSingleSearch) {
    #                 if ($this->aCurrent['name'] == $o->getSearchObject()) {
    #                     unset($this->aCurrent['restriction']['keyword']);
    #                     $o->setSearchCondition($this, $sKeyword);
    #                 }
    #             }
    #             if ($this->_sCategoryObject == 'multi'){
    #                 unset($this->aCurrent['restriction']['keyword']);
    #                 $this->setCategoriesCondition($sKeyword);
    #             }
    #         }
    # 
    #         $this->setPaginate();
    #         $iNum = $this->getNum();
    #         if ($iNum > 0)
    #             $this->aCurrent['paginate']['num'] = $iNum;
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
        # 
    #     function getNum ()
    #     {
    #         $aJoins = $this->getJoins(false);
    #         $sqlQuery =  "SELECT * FROM `{$this->aCurrent['table']}` " . (isset($aJoins['join']) ? ' ' . $aJoins['join'] : '' ) . $this->getRestriction() . (isset($aJoins['groupBy']) ? ' ' . $aJoins['groupBy'] : '') . ' ' . $this->getLimit(true);
    #         return count(BxDolDb::getInstance()->getAll($sqlQuery));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTotal

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getTotal(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getTotal ()
    #     {
    #         $aJoins = $this->getJoins(false);
    #         $sqlQuery =  "SELECT COUNT(*) FROM `{$this->aCurrent['table']}` " . (isset($aJoins['join']) ? ' ' . $aJoins['join'] : '' ) . $this->getRestriction() . (isset($aJoins['groupBy']) ? ' ' . $aJoins['groupBy'] : '');
    #         return BxDolDb::getInstance()->getOne($sqlQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getRestriction

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getRestriction(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getRestriction ()
    #     {
    #         $oDb = BxDolDb::getInstance();
    #         $sqlWhere = '';
    #         if (isset($this->aCurrent['restriction'])) {
    #             $aWhere[] = '1';
    #             foreach ($this->aCurrent['restriction'] as $sKey => $aValue) {
    #                 $sqlCondition = '';
    #                 if (isset($aValue['operator']) && isset($aValue['value']) && $aValue['value'] !== '' && $aValue['value'] !== false && $aValue['value'] !== null) {
    #                    $sFieldTable = isset($aValue['table']) ? $aValue['table'] : $this->aCurrent['table'];
    #                    $sqlCondition = "`{$sFieldTable}`.`{$aValue['field']}` ";
    #                    switch ($aValue['operator']) {
    #                        case 'empty value':
    #                             $sqlCondition .= " = '' ";
    #                             break;
    #                        case 'not empty value':
    #                             $sqlCondition .= " != '' ";
    #                             break;
    #                        case 'nothing':
    #                             $sqlCondition = " 0 ";
    #                             break;
    #                        case 'against':
    #                             $aCond = isset($aValue['field']) && strlen($aValue['field']) > 0 ? $aValue['field'] : $this->aCurrent['searchFields'];
    #                             $sqlCondition = !empty($aCond) ? $this->getSearchFieldsCond($aCond, $aValue['value']) : "";
    #                             break;
    #                        case 'like':
    #                             $sqlCondition .= "LIKE " . $oDb->escape('%' . $aValue['value'] . '%');
    #                             break;
    #                        case 'in':
    #                        case 'not in':
    #                             $sValuesString = $this->getMultiValues($aValue['value']);
    #                             $sqlCondition .= strtoupper($aValue['operator']) . '(' . $sValuesString . ')';
    #                             break;
    #                        case 'in_set':
    #                            $sqlCondition = "1 << (" . $sqlCondition . " - 1) & " . (int)$aValue['value'];
    #                            break;
    #                        default:
    #                                $sqlCondition .= $aValue['operator'] . (isset($aValue['no_quote_value']) && $aValue['no_quote_value'] ?  $aValue['value'] : $oDb->escape($aValue['value']));
    #                        break;
    #                     }
    #                 }
    #                 if (strlen($sqlCondition) > 0)
    #                     $aWhere[] = $sqlCondition;
    #             }
    #             $sqlWhere .= "WHERE ". implode(' AND ', $aWhere) . (isset($this->aCurrent['restriction_sql']) ? $this->aCurrent['restriction_sql'] : '');
    #         }
    # 
    #         return $sqlWhere;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLimit

  ## Parametros
    - isAddPlusOne=false

  ## Retorno
    - any
  """
  def getLimit(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getLimit ($isAddPlusOne = false)
    #     {
    #         if (!isset($this->aCurrent['paginate']))
    #             return;
    # 
    #         $sqlFrom = (int)$this->aCurrent['paginate']['start'] > 0 ? (int)$this->aCurrent['paginate']['start'] : 0;
    #         $sqlTo = $this->aCurrent['paginate']['perPage'] + ($isAddPlusOne ? 1 : 0);
    #         if ($sqlTo > 0)
    #             return 'LIMIT ' . $sqlFrom . ', ' . $sqlTo;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setSorting

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def setSorting(%{}) do
    # TODO: Implementacao futura
        # 
    #     function setSorting ()
    #     {
    #         $this->aCurrent['sorting'] = isset($_GET[$this->aCurrent['name'] . '_mode']) ? $_GET[$this->aCurrent['name'] . '_mode'] : $this->aCurrent['sorting'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSorting

  ## Parametros
    - sSortType='last'

  ## Retorno
    - any
  """
  def getSorting(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getSorting ($sSortType = 'last')
    #     {
    #         if (isset($this->aCurrent['sorting_sql']))
    #             return array('order' => $this->aCurrent['sorting_sql']);
    #         
    #         $aOverride = $this->getAlterOrder();
    #         if (is_array($aOverride) && !empty($aOverride))
    #             return $aOverride;
    # 
    #        $aSql = array();
    #        switch ($sSortType) {
    #            case 'rand':
    #                 $aSql['order'] = "ORDER BY RAND()";
    #                 break;
    #            case 'score':
    #                 if (is_array($this->aCurrent['restriction']['keyword'])) {
    #                     $sPseud = '';
    #                     if ('on' == getParam('useLikeOperator')) {
    #                         $aSql['order'] = "ORDER BY `score` DESC";
    #                         $sPseud = 'score';
    #                     }
    #                     $aSql['ownFields'] .= $this->getSearchFieldsCond($this->aCurrent['searchFields'], $this->aCurrent['restriction']['keyword']['value'], $sPseud) . ',';
    #                 }
    #                 break;
    #            case 'none':
    #                 $aSql['order'] = "";
    #                 break;
    #            default:
    #                 $aSql['order'] = "ORDER BY `date` DESC";
    #         }
    #         return $aSql;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAlterOrder

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getAlterOrder(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getAlterOrder ()
    #     {
    #         return array();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP setPaginate

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def setPaginate(%{}) do
    # TODO: Implementacao futura
        # 
    #     function setPaginate ()
    #     {
    #         if($this->_bValidate) {
    #             $this->aCurrent['paginate']['start'] = 0;
    #             $this->aCurrent['paginate']['perPage'] = count($this->_aParams['validate']);
    # 
    #             return;
    #         }
    # 
    #         $iStart = 0;
    #         $iPerPage = 0;
    # 
    #         //--- Check in aCurrent (low priority).
    #         if(isset($this->aCurrent['paginate']['perPage']) && (int)$this->aCurrent['paginate']['perPage'] != 0)
    #             $iPerPage = (int)$this->aCurrent['paginate']['perPage'];
    #         
    #         //--- Check in aParams (middle priority).
    #         if(isset($this->_aParams['per_page']) && (int)$this->_aParams['per_page'] != 0)
    #             $iPerPage = (int)$this->_aParams['per_page'];
    # 
    #         //--- Check in GET params (high priority).
    #         if(isset($_GET['per_page']) && (int)$_GET['per_page'] != 0)
    #             $iPerPage = (int)$_GET['per_page'];
    # 
    #         //--- Trying to get from System settings.
    #         if (empty($iPerPage))
    #             $iPerPage = (int)getParam('sys_per_page_search_keyword_' . ($this->_bSingleSearch ? 'single' : 'plural'));
    # 
    #         //--- Use default value in case of emergency.
    #         if (empty($iPerPage))
    #             $iPerPage = BX_DOL_SEARCH_RESULTS_PER_PAGE_DEFAULT;
    #         
    #         if ($this->iPaginatePerPage != BX_DOL_SEARCH_RESULTS_PER_PAGE_DEFAULT)
    #             $iPerPage = $this->iPaginatePerPage;
    # 
    #         $this->aCurrent['paginate']['perPage'] = $iPerPage;
    # 
    #         if(!isset($this->aCurrent['paginate']['forceStart'])) {
    #             if(isset($this->_aParams['start']))
    #                 $iStart = (int)$this->_aParams['start'];
    # 
    #             if(($iStartGet = bx_get('start')) !== false)
    #                 $iStart = (int)$iStartGet;
    #         }
    #         else
    #             $iStart = (int)$this->aCurrent['paginate']['forceStart'];
    # 
    #         if($iStart < 0)
    #             $iStart = 0;
    # 
    #         $this->aCurrent['paginate']['start'] = $iStart;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP unsetPaginate

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def unsetPaginate(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function unsetPaginate()
    #     {
    #     	unset($this->aCurrent['paginate']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSearchFieldsCond

  ## Parametros
    - aFields,sKeyword,sPseud=''

  ## Retorno
    - any
  """
  def getSearchFieldsCond(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getSearchFieldsCond ($aFields, $sKeyword, $sPseud = '')
    #     {
    #         if (!$sKeyword)
    #             return '';
    # 
    #         $sTable = empty($this->aCurrent['tableSearch']) ? $this->aCurrent['table'] : $this->aCurrent['tableSearch'];
    # 
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $bLike = getParam('useLikeOperator');
    # 
    #         if (!is_array($aFields))
    #             $aFields = array($aFields);
    # 
    #         if ($bLike == 'on') {
    #             $sKeyword = $oDb->escape('%' . preg_replace('/\s+/', '%', $sKeyword) . '%');
    # 
    #             $sSqlWhere = '';
    #             foreach ($aFields as $sValue)
    #                 $sSqlWhere .= "`{$sTable}`.`$sValue` LIKE  " . $sKeyword . " OR ";
    # 
    #             $sSqlWhere = '(' . trim($sSqlWhere, 'OR ') . ')';
    # 
    #         } else {
    #         	$sKeyword = $oDb->escape($sKeyword);
    # 
    #             $sSqlWhere = '';
    #             foreach ($aFields as $sValue)
    #                 $sSqlWhere .= "`{$sTable}`.`$sValue`, ";
    # 
    #             $sSqlWhere = trim($sSqlWhere, ', ');
    #             $sSqlWhere = " MATCH({$sSqlWhere}) AGAINST (" . $sKeyword . ") ";
    # 
    #             if (!empty($sPseud))
    #                 $sSqlWhere .= " AS `$sPseud` ";
    #         }
    # 
    #         return $sSqlWhere;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getMultiValues

  ## Parametros
    - aValues

  ## Retorno
    - any
  """
  def getMultiValues(%{}) do
    # TODO: Implementacao futura
        # 
    #     function getMultiValues ($aValues)
    #     {
    #         $oDb = BxDolDb::getInstance();
    #         return $oDb->implode_escape($aValues);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getPseudFromParam

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getPseudFromParam(%{}) do
    # TODO: Implementacao futura
        # 
    #     function _getPseudFromParam ()
    #     {
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addMarkers

  ## Parametros
    - a

  ## Retorno
    - any
  """
  def addMarkers(%{}) do
    # TODO: Implementacao futura
        # public function addMarkers ($a)
    #     {
    #         if (empty($a) || !is_array($a))
    #             return false;
    #         $this->_aMarkers = array_merge ($this->_aMarkers, $a);
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _replaceMarkers

  ## Parametros
    - mixed

  ## Retorno
    - any
  """
  def _replaceMarkers(%{}) do
    # TODO: Implementacao futura
        # protected function _replaceMarkers ($mixed)
    #     {
    #         return bx_replace_markers($mixed, $this->_aMarkers);
    #     }
    :ok
  end

end
