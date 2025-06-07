
defmodule DeeperHub.Inc.Classes.BxDolStudioLanguagesUtilsQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//studio/classes/BxDolStudioLanguagesUtilsQuery.php
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
    #     function __construct()
    #     {
    #         parent::__construct();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteLanguage

  ## Parametros
    - iId=0

  ## Retorno
    - any
  """
  def deleteLanguage(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function deleteLanguage($iId = 0)
    #     {
    #         $iId = (int)$iId;
    #         if($iId <= 0)
    #             return false;
    # 
    #         $sSql = $this->prepare("SELECT `ID`, `Name` FROM `sys_localization_languages` WHERE `ID`=?", $iId);
    #         $aLanguage = $this->getRow($sSql);
    #         if(empty($aLanguage))
    #             return false;
    # 
    #         $sSql = $this->prepare("SELECT COUNT(`IDKey`) FROM `sys_localization_strings` WHERE `IDLanguage`=?", $iId);
    #         $iStrings = (int)$this->getOne();
    # 
    #         $sSql = $this->prepare("DELETE FROM `sys_localization_strings` WHERE `IDLanguage`=?", $iId);
    #         if((int)$this->query($sSql) < $iStrings)
    #             return false;
    # 
    #         $sSql = $this->prepare("DELETE FROM `sys_localization_languages` WHERE `ID`=?", $iId);
    #         if((int)$this->query($sSql) <= 0)
    #             return false;
    # 
    #         @unlink( BX_DIRECTORY_PATH_ROOT . 'langs/lang-' . $aLanguage['Name'] . '.php');
    # 
    #         $sSql = $this->prepare("DELETE FROM `sys_email_templates` WHERE `LangID`=?", $iId);
    #         $this->query($sSql);
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addKey

  ## Parametros
    - iCategoryId,sKey

  ## Retorno
    - any
  """
  def addKey(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function addKey($iCategoryId, $sKey)
    #     {
    #         $sSql = $this->prepare("SELECT `ID`, `IDCategory` FROM `sys_localization_keys` WHERE `Key`=? LIMIT 1", $sKey);
    #         $aKey = $this->getRow($sSql);
    #         if(!empty($aKey) && is_array($aKey)) {
    #         	if((int)$aKey['IDCategory'] != $iCategoryId)
    #         		$this->updateKeys(array('IDCategory' => $iCategoryId), array('ID' => $aKey['ID']));
    # 
    #             return $aKey['ID'];
    #         }
    # 
    #         $sSql = $this->prepare("INSERT INTO `sys_localization_keys` SET `IDCategory`=?, `Key`=?", $iCategoryId, $sKey);
    #         return (int)$this->query($sSql) > 0 ? $this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addKeys

  ## Parametros
    - iLanguageId,iCategoryId,&aKeys

  ## Retorno
    - any
  """
  def addKeys(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function addKeys($iLanguageId, $iCategoryId, &$aKeys)
    #     {
    #         foreach($aKeys as $sKey => $sValue) {
    #             $sQuery = $this->prepare("SELECT `ID` FROM `sys_localization_keys` WHERE `IDCategory`=? AND `Key`=? LIMIT 1", $iCategoryId, $sKey);
    #             $iKeyId = (int)$this->getOne($sQuery);
    # 
    #             if($iKeyId == 0) {
    #                 $sQuery = $this->prepare("INSERT INTO `sys_localization_keys`(`IDCategory`, `Key`) VALUES(?, ?)", $iCategoryId, $sKey);
    #                 if((int)$this->query($sQuery) <= 0)
    #                     continue;
    # 
    #                 $iKeyId = (int)$this->lastId();
    #             }
    # 
    #             $sQuery = $this->prepare("INSERT IGNORE INTO `sys_localization_strings`(`IDKey`, `IDLanguage`, `String`) VALUES(?, ?, ?)", $iKeyId, $iLanguageId, $sValue);
    #             $this->query($sQuery);
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteKey

  ## Parametros
    - iKeyId

  ## Retorno
    - any
  """
  def deleteKey(%{}) do
    # TODO: Implementacao futura
        # 
    #     function deleteKey($iKeyId)
    #     {
    #         $sQuery = $this->prepare("DELETE FROM `sys_localization_keys` WHERE `ID`=? LIMIT 1", $iKeyId);
    #         return (int)$this->query($sQuery) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteKeys

  ## Parametros
    - aKeys

  ## Retorno
    - any
  """
  def deleteKeys(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function deleteKeys($aKeys)
    #     {
    #     	$iResult = 0;
    # 
    #         foreach($aKeys as $sKey => $sValue) {
    #             $sQuery = $this->prepare("DELETE FROM `tk`, `ts` USING `sys_localization_keys` AS `tk` LEFT JOIN `sys_localization_strings` AS `ts` ON `tk`.`ID`=`ts`.`IDKey` WHERE `tk`.`Key`=?", $sKey);
    #             $iResult += (int)$this->query($sQuery);
    #         }
    # 
    #         return $iResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateKeys

  ## Parametros
    - aParamsSet,aParamsWhere

  ## Retorno
    - any
  """
  def updateKeys(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function updateKeys($aParamsSet, $aParamsWhere)
    #     {
    #         if(empty($aParamsSet) || empty($aParamsWhere))
    #             return false;
    # 
    #         $sSql = "UPDATE `sys_localization_keys` SET " . $this->arrayToSQL($aParamsSet) . " WHERE " . $this->arrayToSQL($aParamsWhere, " AND ");
    #         return $this->query($sSql);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addString

  ## Parametros
    - iKeyId,iLanguageId,sString

  ## Retorno
    - any
  """
  def addString(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function addString($iKeyId, $iLanguageId, $sString)
    #     {
    #         $sSql = $this->prepare("INSERT IGNORE INTO `sys_localization_strings` SET `IDKey`=?, `IDLanguage`=?, `String`=?", $iKeyId, $iLanguageId, $sString);
    #         return (int)$this->query($sSql) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateString

  ## Parametros
    - iKeyId,iLanguageId,sString

  ## Retorno
    - any
  """
  def updateString(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function updateString($iKeyId, $iLanguageId, $sString)
    #     {
    #         $sSql = $this->prepare("SELECT `IDKey` FROM `sys_localization_strings` WHERE `IDKey`=? AND `IDLanguage`=?", $iKeyId, $iLanguageId);
    #         $iKeyIdDb = (int)$this->getOne($sSql);
    # 
    #         if($iKeyIdDb != 0)
    #             $sSql = $this->prepare("UPDATE `sys_localization_strings` SET `String`=? WHERE `IDKey`=? AND `IDLanguage`=?", $sString, $iKeyId, $iLanguageId);
    #         else
    #             $sSql = $this->prepare("INSERT INTO `sys_localization_strings` SET `IDKey`=?, `IDLanguage`=?, `String`=?", $iKeyId, $iLanguageId, $sString);
    #         return (int)$this->query($sSql) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteString

  ## Parametros
    - iKeyId,iLanguageId

  ## Retorno
    - any
  """
  def deleteString(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function deleteString($iKeyId, $iLanguageId)
    #     {
    #         $sSql = $this->prepare("DELETE FROM `sys_localization_strings` WHERE `IDKey`=? AND `IDLanguage`=?", $iKeyId, $iLanguageId);
    #         return (int)$this->query($sSql) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addCategory

  ## Parametros
    - sName

  ## Retorno
    - any
  """
  def addCategory(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function addCategory($sName)
    #     {
    #         $sQuery = $this->prepare("INSERT IGNORE INTO `sys_localization_categories` SET `Name`=?", $sName);
    #         if((int)$this->query($sQuery) > 0)
    #             return (int)$this->lastId();
    # 
    #         $iCategoryId = 0;
    #         $this->getCategoriesBy(array('type' => 'id_by_name', 'value' => $sName), $iCategoryId);
    #         return $iCategoryId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteCategory

  ## Parametros
    - sName

  ## Retorno
    - any
  """
  def deleteCategory(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function deleteCategory($sName)
    #     {
    #         $sQuery = $this->prepare("DELETE FROM `sys_localization_categories` WHERE `Name`=?", $sName);
    #         $this->query($sQuery);
    #     }
    :ok
  end

end
