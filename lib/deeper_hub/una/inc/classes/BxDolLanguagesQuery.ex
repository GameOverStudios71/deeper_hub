
defmodule DeeperHub.Inc.Classes.BxDolLanguagesQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolLanguagesQuery.php
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
        # 
    #     static function getInstance()
    #     {
    #         if(!isset($GLOBALS['bxDolClasses'][__CLASS__]))
    #             $GLOBALS['bxDolClasses'][__CLASS__] = new BxDolLanguagesQuery();
    # 
    #         return $GLOBALS['bxDolClasses'][__CLASS__];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguageId

  ## Parametros
    - sName,bFromCache=true

  ## Retorno
    - any
  """
  def getLanguageId(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getLanguageId($sName, $bFromCache = true)
    #     {
    #         return (int)$this->getLanguageField($sName, 'ID', $bFromCache);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguageName

  ## Parametros
    - iId,bFromCache=true

  ## Retorno
    - any
  """
  def getLanguageName(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getLanguageName($iId, $bFromCache = true)
    #     {
    #         return $this->getLanguageFieldById($iId, 'Name', $bFromCache);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguageTitle

  ## Parametros
    - iId,bFromCache=true

  ## Retorno
    - any
  """
  def getLanguageTitle(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getLanguageTitle($iId, $bFromCache = true)
    #     {
    #         return $this->getLanguageFieldById($iId, 'Title', $bFromCache);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguageFlag

  ## Parametros
    - sName,bFromCache=true

  ## Retorno
    - any
  """
  def getLanguageFlag(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getLanguageFlag($sName, $bFromCache = true)
    #     {
    #         return $this->getLanguageField($sName, 'Flag', $bFromCache);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguageDirection

  ## Parametros
    - sName,bFromCache=true

  ## Retorno
    - any
  """
  def getLanguageDirection(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getLanguageDirection($sName, $bFromCache = true)
    #     {
    #         return $this->getLanguageField($sName, 'Direction', $bFromCache);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLangCountryCode

  ## Parametros
    - sName,bFromCache=true

  ## Retorno
    - any
  """
  def getLangCountryCode(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getLangCountryCode($sName, $bFromCache = true)
    #     {
    #         return $this->getLanguageField($sName, 'LanguageCountry', $bFromCache);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguageField

  ## Parametros
    - sName,sField,bFromCache=true

  ## Retorno
    - any
  """
  def getLanguageField(%{}) do
    # TODO: Implementacao futura
        # protected function getLanguageField($sName, $sField, $bFromCache = true)
    #     {
    #         $sSql = $this->prepare("SELECT `" . $sField . "` FROM `sys_localization_languages` WHERE `Name`=? AND `Enabled`='1' LIMIT 1", $sName);
    # 
    #         if($bFromCache)
    #             return $this->fromCache('checkLangExists_' . $sName . '_' . $sField, 'getOne', $sSql);
    #         else
    #             return $this->getOne($sSql);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguageFieldById

  ## Parametros
    - iId,sField,bFromCache=true

  ## Retorno
    - any
  """
  def getLanguageFieldById(%{}) do
    # TODO: Implementacao futura
        # protected function getLanguageFieldById($iId, $sField, $bFromCache = true)
    #     {
    #         $sSql = $this->prepare("SELECT `" . $sField . "` FROM `sys_localization_languages` WHERE `ID`=? AND `Enabled`='1' LIMIT 1", $iId);
    # 
    #         if($bFromCache)
    #             return $this->fromCache('checkLangExists_' . $iId . '_' . $sField, 'getOne', $sSql);
    #         else
    #             return $this->getOne($sSql);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguages

  ## Parametros
    - bIdAsKey=false,bActiveOnly=false

  ## Retorno
    - any
  """
  def getLanguages(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getLanguages($bIdAsKey = false, $bActiveOnly = false)
    #     {
    #         return $this->getLanguagesWithKey($bIdAsKey ? 'ID' : 'Name', $bActiveOnly);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguagesWithKey

  ## Parametros
    - sKey='Name',bActiveOnly=false

  ## Retorno
    - any
  """
  def getLanguagesWithKey(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getLanguagesWithKey($sKey = 'Name', $bActiveOnly = false)
    #     {
    #         $sSql = "SELECT * FROM `sys_localization_languages` WHERE 1 " . ($bActiveOnly ? " AND `Enabled`='1'" : "") . " ORDER BY `Title` ASC";
    #         return $this->getPairs($sSql, $sKey, 'Title');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLanguagesBy

  ## Parametros
    - aParams,&aItems,bReturnCount=true

  ## Retorno
    - any
  """
  def getLanguagesBy(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getLanguagesBy($aParams, &$aItems, $bReturnCount = true)
    #     {
    #         $aMethod = array('name' => 'getAll', 'params' => array(0 => 'query'));
    #         $sSelectClause = $sJoinClause = $sWhereClause = $sOrderClause = $sLimitClause = "";
    # 
    #         if(!isset($aParams['order']) || empty($aParams['order']))
    #            $sOrderClause = " `tl`.`ID` ASC ";
    # 
    #         switch($aParams['type']) {
    #             case 'by_id':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = array(
    #                 	'id' => $aParams['value']
    #                 );
    # 
    #                 $sWhereClause .= " AND `tl`.`ID`=:id";
    #                 break;
    # 
    #             case 'by_name':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = array(
    #                 	'name' => $aParams['value']
    #                 );
    # 
    #                 $sWhereClause .= " AND `tl`.`Name`=:name";
    #                 break;
    # 
    #             case 'default':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = array(
    #                 	'name' => getParam('lang_default')
    #                 );
    # 
    #                 $sWhereClause .= " AND `tl`.`Name`=:name";
    #                 break;
    # 
    #             case 'active':
    #                 $sWhereClause = " AND `tl`.`Enabled`='1'";
    #                 break;
    # 
    #             case 'all':
    #                 $sOrderClause = " `tl`.`Name` ASC ";
    #                 break;
    # 
    #             case 'all_by_id':
    #             	$aMethod['params'][1] = array(
    #                     'id' => $aParams['value']
    #                 );
    # 
    #                 $sWhereClause .= " AND `tl`.`ID`=:id";
    #                 $sOrderClause = " `tl`.`Name` ASC ";
    #                 break;
    # 
    #             case 'all_by_name':
    #                 $aMethod['params'][1] = array(
    #                     'name' => $aParams['value']
    #                 );
    # 
    #                 $sWhereClause .= " AND `tl`.`Name`=:name";
    #                 $sOrderClause = " `tl`.`Name` ASC ";
    #                 break;
    # 
    #             case 'all_key_id':
    #                 $aMethod['name'] = 'getAllWithKey';
    #                 $aMethod['params'][1] = 'id';
    #                 $aMethod['params'][2] = array();
    # 
    #                 if(!empty($aParams['language'])) {
    #                     $aMethod['params'][2]['id'] = $aParams['language'];
    # 
    #                     $sWhereClause .= " AND `tl`.`ID`=:id";
    #                 }
    # 
    #                 if(isset($aParams['enabled'])) {
    #                     $aMethod['params'][2]['enabled'] = (int)$aParams['enabled'];
    # 
    #                     $sWhereClause .= " AND `tl`.`Enabled`=:enabled";
    #                 }
    #                 break;
    # 
    #             case 'all_key_name':
    #                 $aMethod['name'] = 'getAllWithKey';
    #                 $aMethod['params'][1] = 'name';
    #                 $aMethod['params'][2] = array();
    # 
    #                 if(!empty($aParams['language'])) {
    #                     $aMethod['params'][2]['name'] = $aParams['language'];
    # 
    #                     $sWhereClause .= " AND `tl`.`Name`=:name";
    #                 }
    # 
    #                 if(isset($aParams['enabled'])) {
    #                     $aMethod['params'][2]['enabled'] = (int)$aParams['enabled'];
    # 
    #                     $sWhereClause .= " AND `tl`.`Enabled`=:enabled";
    #                 }
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT SQL_CALC_FOUND_ROWS
    #                 `tl`.`ID` AS `id`,
    #                 `tl`.`Name` AS `name`,
    #                 `tl`.`Flag` AS `flag`,
    #                 `tl`.`Title` AS `title`,
    #                 `tl`.`Enabled` AS `enabled`" . $sSelectClause . "
    #             FROM `sys_localization_languages` AS `tl`" . $sJoinClause . "
    #             WHERE 1" . $sWhereClause . "
    #             ORDER BY" . $sOrderClause . $sLimitClause;
    #         $aItems = call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    # 
    #         if(!$bReturnCount)
    #             return count($aItems) > 0;
    # 
    #         return (int)$this->getOne("SELECT FOUND_ROWS()");
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getKeys

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getKeys(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getKeys()
    #     {
    #         $sSql = "SELECT `ID`, `IDCategory`, `Key` FROM `sys_localization_keys`";
    #         return $this->getAllWithKey($sSql, 'ID');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getKeysBy

  ## Parametros
    - aParams,&aItems

  ## Retorno
    - any
  """
  def getKeysBy(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getKeysBy($aParams, &$aItems)
    #     {
    #         $aMethod = array('name' => 'getAll', 'params' => array(0 => 'query'));
    #         $sSelectClause = $sJoinClause = $sWhereClause = $sGroupClause = $sOrderClause = $sLimitClause = "";
    # 
    #         $sSelectClause = "`tk`.`ID` AS `id`, `tk`.`IDCategory` AS `category_id`, `tk`.`Key` AS `key`";
    # 
    #         if(!isset($aParams['order']) || empty($aParams['order']))
    #            $sOrderClause = " `tk`.`Key` ASC ";
    # 
    #         switch($aParams['type']) {
    #             case 'by_ids':
    #                 $sSelectClause .= ", `tc`.`Name` AS `category_name`, `ts`.`IDLanguage` AS `language_id`, `tl`.`Name` AS `language_name`, `tl`.`Title` AS `language_title`, `ts`.`String` AS `string`";
    #                 $sJoinClause = " LEFT JOIN `sys_localization_categories` AS `tc` ON `tk`.`IDCategory`=`tc`.`ID` LEFT JOIN `sys_localization_strings` AS `ts` ON `tk`.`ID`=`ts`.`IDKey` LEFT JOIN `sys_localization_languages` AS `tl` ON `ts`.`IDLanguage`=`tl`.`ID` ";
    #                 $sWhereClause .= " AND `tk`.`ID` IN ('" . implode("','", $aParams['value']) . "')";
    # 
    #                 if(isset($aParams['language']) && (int)$aParams['language'] != 0) {
    #                 	$aMethod['params'][1] = array(
    # 	                	'id' => $aParams['language']
    # 	                );
    # 
    #                     $sWhereClause .= " AND `tl`.`ID`=:id";
    #                 }
    #                 break;
    # 
    #             case 'by_name':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = array(
    #                     'key' => $aParams['value']
    #                 );
    # 
    #                 $sWhereClause = " AND `tk`.`Key`=:key ";
    #                 break;
    # 
    #             case 'by_language_name_key_key':
    #             	$aMethod['name'] = 'getAllWithKey';
    #             	$aMethod['params'][1] = 'key';
    #             	$aMethod['params'][2] = array(
    #                     'name' => $aParams['value']
    #                 );
    # 
    #                 $sSelectClause .= ", `ts`.`String` AS `string` ";
    #                 $sJoinClause = " LEFT JOIN `sys_localization_strings` AS `ts` ON `tk`.`ID`=`ts`.`IDKey` LEFT JOIN `sys_localization_languages` AS `tl` ON `ts`.`IDLanguage`=`tl`.`ID` ";
    #                 $sWhereClause = " AND `tl`.`Name`=:name ";
    #                 break;
    # 
    #             case 'by_language_id_key_key':
    #             	$aMethod['name'] = 'getAllWithKey';
    #             	$aMethod['params'][1] = 'key';
    #             	$aMethod['params'][2] = array(
    #                     'language_id' => (int)$aParams['value']
    #                 );
    # 
    #                 $sSelectClause .= ", `ts`.`String` AS `string` ";
    #                 $sJoinClause = " LEFT JOIN `sys_localization_strings` AS `ts` ON `tk`.`ID`=`ts`.`IDKey` ";
    #                 $sWhereClause = " AND `ts`.`IDLanguage`=:language_id ";
    #                 break;
    # 
    #             case 'autogenerated':
    #                 $sWhereClause = " AND `tk`.`Key` REGEXP '.+_[0-9]{8,10}$' ";
    # 
    #                 if(isset($aParams['empty']) && $aParams['empty'] === true) {
    #                     $aMethod['params'][1] = array(
    #                         'language_id' => (int)$aParams['language_id']
    #                     );
    #                     
    #                     $sJoinClause = " LEFT JOIN `sys_localization_strings` AS `ts` ON `tk`.`ID`=`ts`.`IDKey` AND `ts`.`IDLanguage`=:language_id ";
    #                     $sWhereClause .= " AND ISNULL(`ts`.`String`)";
    #                 }
    #                 break;
    # 
    #             case 'search':
    #                 $aMethod['name'] = 'getColumn';
    #                 $aMethod['params'][1] = array();
    # 
    #                 $sSelectClause = "DISTINCT `tk`.`ID` AS `id`";
    #                 $sJoinClause = " LEFT JOIN `sys_localization_categories` AS `tc` ON `tk`.`IDCategory`=`tc`.`ID` LEFT JOIN `sys_localization_strings` AS `ts` ON `tk`.`ID`=`ts`.`IDKey` LEFT JOIN `sys_localization_languages` AS `tl` ON `ts`.`IDLanguage`=`tl`.`ID` ";
    # 
    #                 if(isset($aParams['category']) && (int)$aParams['category'] != 0) {
    #                     $aMethod['params'][1]['category_id'] = $aParams['category'];
    # 
    #                     $sWhereClause .= " AND `tc`.`ID`=:category_id";
    #                 }
    # 
    #                 if(isset($aParams['language']) && (int)$aParams['language'] != 0) {
    #                     $aMethod['params'][1]['language_id'] = $aParams['language'];
    # 
    #                     $sWhereClause .= " AND `tl`.`ID`=:language_id";
    #                 }
    # 
    #                 if(isset($aParams['keyword']) && $aParams['keyword'] != '' && $aParams['keyword'] != _t('_adm_pgt_txt_keyword')) {
    #                     $aMethod['params'][1]['key'] = '%' . $aParams['keyword'] . '%';
    #                     $aMethod['params'][1]['string'] = '%' . $aParams['keyword'] . '%';
    # 
    #                     $sWhereClause .= " AND (`tk`.`Key` LIKE :key OR `ts`.`String` LIKE :string)";
    #                 }
    # 
    #                 $iStart = 0;
    #                 if(isset($aParams['start']) && (int)$aParams['start'] != 0)
    #                     $iStart = $aParams['start'];
    # 
    #                 $iLength = 20;
    #                 if(isset($aParams['length']) && (int)$aParams['length'] != 0)
    #                     $iLength = $aParams['length'];
    # 
    #                 $aMethod['params'][1]['start'] = $iStart;
    #                 $aMethod['params'][1]['length'] = $iLength;
    #                 $sLimitClause .= " LIMIT :start, :length";
    #                 break;
    # 
    #             case 'counter_by_category':
    #                 $aMethod['name'] = 'getPairs';
    #                 $aMethod['params'][1] = 'category_id';
    #                 $aMethod['params'][2] = 'counter';
    #                 $sSelectClause .= ", COUNT(*) AS `counter`";
    #                 $sGroupClause = "GROUP BY `tk`.`IDCategory`";
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . "
    #             FROM `sys_localization_keys` AS `tk`" . $sJoinClause . "
    #             WHERE 1" . $sWhereClause . " " . $sGroupClause . "
    #             ORDER BY" . $sOrderClause . $sLimitClause;
    #         $aItems = call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    # 
    #         return $aItems !== false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCategories

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getCategories(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getCategories()
    #     {
    #         $sSql = "SELECT `ID`, `Name` FROM `sys_localization_categories` ORDER BY `Name`";
    #         return $this->getPairs($sSql, 'ID', 'Name');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCategoriesBy

  ## Parametros
    - aParams,&aItems,bReturnCount=true

  ## Retorno
    - any
  """
  def getCategoriesBy(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getCategoriesBy($aParams, &$aItems, $bReturnCount = true)
    #     {
    #         $aMethod = array('name' => 'getAll', 'params' => array(0 => 'query'));
    #         $sSelectClause = $sJoinClause = $sWhereClause = $sOrderClause = $sLimitClause = "";
    # 
    #         $sSelectClause = "`tc`.`ID` AS `id`, `tc`.`Name` AS `name`";
    # 
    #         if(!isset($aParams['order']) || empty($aParams['order']))
    #            $sOrderClause = " `tc`.`ID` ASC ";
    # 
    #         switch($aParams['type']) {
    #             case 'id_by_name':
    #                 $aMethod['name'] = 'getOne';
    #                 $aMethod['params'][1] = array(
    #                 	'name' => $aParams['value']
    #                 );
    # 
    #                 $sSelectClause = "`tc`.`ID` AS `id`";
    #                 $sWhereClause = " AND `tc`.`Name`=:name";
    #                 break;
    #             case 'by_name':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = array(
    #                 	'name' => $aParams['value']
    #                 );
    # 
    #                 $sWhereClause = " AND `tc`.`Name`=:name";
    #                 break;
    # 
    #             case 'all':
    #                 $sOrderClause = " `tc`.`Name` ASC ";
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT " . ($bReturnCount ? "SQL_CALC_FOUND_ROWS" : "") . "
    #                 " . $sSelectClause . "
    #             FROM `sys_localization_categories` AS `tc`" . $sJoinClause . "
    #             WHERE 1" . $sWhereClause . "
    #             ORDER BY" . $sOrderClause . $sLimitClause;
    #         $aItems = call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    # 
    #         if(!$bReturnCount)
    #             return !empty($aItems);
    # 
    #         return (int)$this->getOne("SELECT FOUND_ROWS()");
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStringsBy

  ## Parametros
    - aParams,&aItems,bReturnCount=true

  ## Retorno
    - any
  """
  def getStringsBy(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function getStringsBy($aParams, &$aItems, $bReturnCount = true)
    #     {
    #         $aMethod = array('name' => 'getAll', 'params' => array(0 => 'query'));
    #         $sSelectClause = $sJoinClause = $sWhereClause = $sOrderClause = $sLimitClause = "";
    # 
    #         if(!isset($aParams['order']) || empty($aParams['order']))
    #            $sOrderClause = "`ts`.`IDKey` ASC";
    # 
    #         switch($aParams['type']) {
    #             case 'by_key_language_id':
    #                 $aMethod['name'] = 'getRow';
    #                 $aMethod['params'][1] = array(
    #                 	'key' => $aParams['key'],
    #                 	'language_id' => $aParams['language_id']
    #                 );
    # 
    #                 $sJoinClause = "LEFT JOIN `sys_localization_keys` AS `tk` ON `ts`.`IDKey`=`tk`.`ID`";
    #                 $sWhereClause .= "AND `tk`.`Key`=:key AND `ts`.`IDLanguage`=:language_id";
    #                 break;
    # 
    #             case 'all_by_key_key_language_id':
    #                 $aMethod['name'] = 'getAllWithKey';
    #                 $aMethod['params'][1] = 'language_id';
    #                 $aMethod['params'][2] = array(
    #                 	'key' => $aParams['value']
    #                 );
    # 
    #                 $sJoinClause = "LEFT JOIN `sys_localization_keys` AS `tk` ON `ts`.`IDKey`=`tk`.`ID`";
    #                 $sWhereClause .= "AND `tk`.`Key`=:key";
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT SQL_CALC_FOUND_ROWS
    #                 `ts`.`IDKey` AS `key_id`,
    #                 `ts`.`IDLanguage` AS `language_id`,
    #                 `ts`.`String` AS `string` " . $sSelectClause . "
    #             FROM `sys_localization_strings` AS `ts` " . $sJoinClause . "
    #             WHERE 1 " . $sWhereClause . "
    #             ORDER BY " . $sOrderClause . " " . $sLimitClause;
    #         $aItems = call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    # 
    #         if(!$bReturnCount)
    #             return count($aItems) > 0;
    # 
    #         return (int)$this->getOne("SELECT FOUND_ROWS()");
    #     }
    :ok
  end

end
