
defmodule DeeperHub.Inc.Classes.BxDolCategoryQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolCategoryQuery.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aObject

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($aObject)
    #     {
    #         parent::__construct();
    #         $this->_aObject = $aObject;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCategoryObject

  ## Parametros
    - sObject

  ## Retorno
    - any
  """
  def getCategoryObject(%{}) do
    # TODO: Implementacao futura
        # public function getCategoryObject ($sObject)
    #     {
    #         $oDb = BxDolDb::getInstance();
    #         $sQuery = $oDb->prepare("SELECT * FROM `sys_objects_category` WHERE `object` = ?", $sObject);
    #         $aObject = $oDb->getRow($sQuery);
    #         if (!$aObject || !is_array($aObject))
    #             return false;
    # 
    #         return $aObject;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCategoryObjectByFormAndList

  ## Parametros
    - sObjectForm,sListName

  ## Retorno
    - any
  """
  def getCategoryObjectByFormAndList(%{}) do
    # TODO: Implementacao futura
        # public function getCategoryObjectByFormAndList ($sObjectForm, $sListName)
    #     {
    #         $oDb = BxDolDb::getInstance();
    #         $sQuery = $oDb->prepare("SELECT * FROM `sys_objects_category` WHERE `form_object` = ? AND `list_name` = ?", $sObjectForm, $sListName);
    #         $aObject = $oDb->getRow($sQuery);
    #         if (!$aObject || !is_array($aObject))
    #             return false;
    # 
    #         return $aObject;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getItemsNumInCategory

  ## Parametros
    - aObject,sCategoryValue,bPublicOnly=true,aParams=[]

  ## Retorno
    - any
  """
  def getItemsNumInCategory(%{}) do
    # TODO: Implementacao futura
        # public function getItemsNumInCategory ($aObject, $sCategoryValue, $bPublicOnly = true, $aParams = [])
    #     {
    #         $oDb = BxDolDb::getInstance();
    #         $sWhere = '';
    #         if ($bPublicOnly && ($oModule = BxDolModule::getInstance($aObject['module'])) && isset($oModule->_oConfig->CNF)) {
    #             $CNF = &$oModule->_oConfig->CNF;
    # 
    #             if(isset($CNF['FIELD_ALLOW_VIEW_TO'])) {
    #                 if (isset($aParams['context_id']) && !empty($aParams['context_id'])){
    #                     $sWhere .= ' AND `' . $aObject['table'] . '`.`' . $CNF['FIELD_ALLOW_VIEW_TO'] . '` IN(' . -$aParams['context_id'] . ') ';
    #                 }
    #                 else{
    #                     bx_import('BxDolPrivacy');
    #                     $a = isLogged() ? array(BX_DOL_PG_ALL, BX_DOL_PG_MEMBERS) : array(BX_DOL_PG_ALL);
    #                     $sWhere .= ' AND `' . $aObject['table'] . '`.`' . $CNF['FIELD_ALLOW_VIEW_TO'] . '` IN(' . $oDb->implode_escape($a) . ') ';
    #                 }
    #             }
    # 
    #             if(isset($CNF['FIELD_STATUS']))
    #                 $sWhere .= ' AND `' . $aObject['table'] . '`.`' . $CNF['FIELD_STATUS'] . '` = \'active\' ';
    # 
    #             if(isset($CNF['FIELD_STATUS_ADMIN']))
    #                 $sWhere .= ' AND `' . $aObject['table'] . '`.`' . $CNF['FIELD_STATUS_ADMIN'] . '` = \'active\' ';
    #         }
    #         return $oDb->getOne("SELECT COUNT(*) FROM `" . $aObject['table'] . "` " . $aObject['join'] . " WHERE `" . $aObject['field'] . "` = :cat " . $aObject['where'] . $sWhere, array('cat' => $sCategoryValue));
    #     }
    :ok
  end

end
