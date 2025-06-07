
defmodule DeeperHub.Inc.Classes.BxDolAIQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolAIQuery.php
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
        # public function __construct()
    #     {
    #         parent::__construct();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getModelObject

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def getModelObject(%{}) do
    # TODO: Implementacao futura
        # public function getModelObject($iId)
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $aModel = $oDb->getRow("SELECT * FROM `sys_agents_models` WHERE `id` = :id", ['id' => $iId]);
    #         if(!$aModel || !is_array($aModel))
    #             return false;
    # 
    #         return $aModel;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProviderObject

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def getProviderObject(%{}) do
    # TODO: Implementacao futura
        # public function getProviderObject($iId)
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $aProvider = $oDb->getRow("SELECT * FROM `sys_agents_providers` WHERE `id` = :id", ['id' => $iId]);
    #         if(!$aProvider || !is_array($aProvider))
    #             return false;
    # 
    #         // get type
    #         $aProviderType = $oDb->getRow("SELECT * FROM `sys_agents_provider_types` WHERE `id` = :id", ['id' => $aProvider['type_id']]);
    #         if(!$aProviderType || !is_array($aProviderType))
    #             return false;
    # 
    #         $aProvider['type'] = $aProviderType;
    # 
    #         // get options
    #         $sQuery = "SELECT
    #                `tpo`.`name` AS `name`,
    #                `tpv`.`value` AS `value`
    #             FROM `sys_agents_provider_options` AS `tpo`
    #             LEFT JOIN `sys_agents_providers_values` AS `tpv` ON `tpo`.`id` = `tpv`.`option_id` AND `tpv`.`provider_id` = :provider_id
    #             WHERE 1 ORDER BY `tpo`.`order`";
    # 
    #         $aProvider['options'] = $oDb->getAllWithKey($sQuery, 'name', [
    #             'provider_id' => $iId
    #         ]);
    # 
    #         return $aProvider;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProviderIdByName

  ## Parametros
    - sName

  ## Retorno
    - any
  """
  def getProviderIdByName(%{}) do
    # TODO: Implementacao futura
        # public function getProviderIdByName($sName)
    #     {
    #         return (int)BxDolDb::getInstance()->getOne("SELECT `id` FROM `sys_agents_providers` WHERE `name`=:name LIMIT 1", [
    #             'name' => $sName
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAssistantObject

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def getAssistantObject(%{}) do
    # TODO: Implementacao futura
        # public function getAssistantObject($iId)
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $aAssistant = $oDb->getRow("SELECT * FROM `sys_agents_assistants` WHERE `id` = :id", ['id' => $iId]);
    #         if(!$aAssistant || !is_array($aAssistant))
    #             return false;
    # 
    #         return $aAssistant;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getModelsBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getModelsBy(%{}) do
    # TODO: Implementacao futura
        # public function getModelsBy($aParams = [])
    #     {
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    #     	$sWhereClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `id`=:id";
    #                 break;
    # 
    #             case 'all_pairs':
    #                 $aMethod['name'] = 'getPairs';
    #                 $aMethod['params'][1] = 'id';
    #                 $aMethod['params'][2] = 'title';
    #                 $aMethod['params'][3] = [];
    # 
    #                 if(isset($aParams['for_asst'])) {
    #                     $aMethod['params'][3]['for_asst'] = $aParams['for_asst'];
    # 
    #                     $sWhereClause .= " AND `for_asst`=:for_asst";
    #                 }
    # 
    #                 if(isset($aParams['active'])) {
    #                     $aMethod['params'][3]['active'] = $aParams['active'];
    # 
    #                     $sWhereClause .= " AND `active`=:active";
    #                 }
    # 
    #                 if(isset($aParams['hidden'])) {
    #                     $aMethod['params'][3]['hidden'] = $aParams['hidden'];
    # 
    #                     $sWhereClause .= " AND `hidden`=:hidden";
    #                 }
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT * 
    #             FROM `sys_agents_models`
    #             WHERE 1" . $sWhereClause;
    # 
    #         return call_user_func_array([$this, $aMethod['name']], $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAutomatorsBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getAutomatorsBy(%{}) do
    # TODO: Implementacao futura
        # public function getAutomatorsBy($aParams = [])
    #     {
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    #         $sSelectClause = "`taa`.*";
    #     	$sJoinClause = $sWhereClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `taa`.`id`=:id";
    #                 break;
    # 
    #             case 'id_full':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sSelectClause .= ", `tam`.`name` AS `model_name`, `tam`.`title` AS `model_title`, `tam`.`key` AS `model_key`, `tam`.`params` AS `model_params`";
    #                 $sJoinClause .= " LEFT JOIN `sys_agents_models` AS `tam` ON `taa`.`model_id`=`tam`.`id`";
    #                 $sWhereClause .= " AND `taa`.`id`=:id";
    #                 break;
    #             
    #             case 'events':
    #                 $aMethod['params'][1] = [
    #                     'type' => BX_DOL_AI_AUTOMATOR_EVENT,
    #                     'alert_unit' => $aParams['alert_unit'],
    #                     'alert_action' => $aParams['alert_action']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `taa`.`type`=:type AND `taa`.`alert_unit`=:alert_unit AND `taa`.`alert_action`=:alert_action";
    # 
    #                 if(isset($aParams['active'])) {
    #                     $aMethod['params'][1]['active'] = (int)$aParams['active'];
    # 
    #                     $sWhereClause .= " AND `taa`.`active`=:active";
    #                 }
    #                 break;
    #                 
    #             case 'schedulers':
    #                 $aMethod['params'][1] = [
    #                     'type' => BX_DOL_AI_AUTOMATOR_SCHEDULER,
    #                 ];
    # 
    #                 $sWhereClause .= " AND `taa`.`type`=:type";
    # 
    #                 if(isset($aParams['active'])) {
    #                     $aMethod['params'][1]['active'] = (int)$aParams['active'];
    # 
    #                     $sWhereClause .= " AND `taa`.`active`=:active";
    #                 }
    #                 break;
    # 
    #             case 'webhooks':
    #                 $aMethod['params'][1] = [
    #                     'type' => BX_DOL_AI_AUTOMATOR_WEBHOOK,
    #                 ];
    # 
    #                 $sWhereClause .= " AND `taa`.`type`=:type";
    # 
    #                 if(isset($aParams['provider_id'])) {
    #                     $aMethod['params'][1]['provider_id'] = (int)$aParams['provider_id'];
    # 
    #                     $sJoinClause = "INNER JOIN `sys_agents_automators_providers` AS `tap` ON `taa`.`id`=`tap`.`automator_id`";
    #                     $sWhereClause .= " AND `tap`.`provider_id`=:provider_id";
    #                 }
    # 
    #                 if(isset($aParams['active'])) {
    #                     $aMethod['params'][1]['active'] = (int)$aParams['active'];
    # 
    #                     $sWhereClause .= " AND `taa`.`active`=:active";
    #                 }
    #                 break;
    # 
    #             case 'providers_by_id_pairs':
    #                 $aMethod['name'] = 'getPairs';
    #                 $aMethod['params'][1] = 'id';
    #                 $aMethod['params'][2] = 'provider_id';
    #                 $aMethod['params'][3] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sSelectClause = "`taap`.`id`, `taap`.`provider_id`";
    #                 $sJoinClause = "INNER JOIN `sys_agents_automators_providers` AS `taap` ON `taa`.`id`=`taap`.`automator_id`";
    #                 $sWhereClause = " AND `taa`.`id`=:id";
    #                 break;
    #             
    #             case 'helpers_by_id_pairs':
    #                 $aMethod['name'] = 'getPairs';
    #                 $aMethod['params'][1] = 'id';
    #                 $aMethod['params'][2] = 'helper_id';
    #                 $aMethod['params'][3] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sSelectClause = "`taah`.`id`, `taah`.`helper_id`";
    #                 $sJoinClause = "INNER JOIN `sys_agents_automators_helpers` AS `taah` ON `taa`.`id`=`taah`.`automator_id`";
    #                 $sWhereClause = " AND `taa`.`id`=:id";
    #                 break;
    #             
    #             case 'assistants_by_id_pairs':
    #                 $aMethod['name'] = 'getPairs';
    #                 $aMethod['params'][1] = 'id';
    #                 $aMethod['params'][2] = 'assistant_id';
    #                 $aMethod['params'][3] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sSelectClause = "`taaa`.`id`, `taaa`.`assistant_id`";
    #                 $sJoinClause = "INNER JOIN `sys_agents_automators_assistants` AS `taaa` ON `taa`.`id`=`taaa`.`automator_id`";
    #                 $sWhereClause = " AND `taa`.`id`=:id";
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . "
    #             FROM `sys_agents_automators` AS `taa` " . $sJoinClause . "
    #             WHERE 1" . $sWhereClause;
    # 
    #         return call_user_func_array([$this, $aMethod['name']], $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateAutomators

  ## Parametros
    - aSetClause,aWhereClause

  ## Retorno
    - any
  """
  def updateAutomators(%{}) do
    # TODO: Implementacao futura
        # public function updateAutomators($aSetClause, $aWhereClause)
    #     {
    #         if(empty($aSetClause) || empty($aWhereClause))
    #             return false;
    # 
    #         return (int)$this->query("UPDATE `sys_agents_automators` SET " . $this->arrayToSQL($aSetClause) . " WHERE " . $this->arrayToSQL($aWhereClause)) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertAutomatorProvider

  ## Parametros
    - aParamsSet

  ## Retorno
    - any
  """
  def insertAutomatorProvider(%{}) do
    # TODO: Implementacao futura
        # public function insertAutomatorProvider($aParamsSet)
    #     {
    #         if(empty($aParamsSet))
    #             return false;
    # 
    #         return (int)$this->query("INSERT INTO `sys_agents_automators_providers` SET " . $this->arrayToSQL($aParamsSet)) > 0 ? (int)$this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateAutomatorProvider

  ## Parametros
    - aParamsSet,aParamsWhere

  ## Retorno
    - any
  """
  def updateAutomatorProvider(%{}) do
    # TODO: Implementacao futura
        # public function updateAutomatorProvider($aParamsSet, $aParamsWhere)
    #     {
    #         if(empty($aParamsSet) || empty($aParamsWhere))
    #             return false;
    # 
    #         return $this->query("UPDATE `sys_agents_automators_providers` SET " . $this->arrayToSQL($aParamsSet) . " WHERE " . $this->arrayToSQL($aParamsWhere, " AND "));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteAutomatorProviders

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteAutomatorProviders(%{}) do
    # TODO: Implementacao futura
        # public function deleteAutomatorProviders($aParamsWhere)
    #     {
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return (int)$this->query("DELETE FROM `sys_agents_automators_providers` WHERE " . $this->arrayToSQL($aParamsWhere)) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteAutomatorProvidersById

  ## Parametros
    - mixedId

  ## Retorno
    - any
  """
  def deleteAutomatorProvidersById(%{}) do
    # TODO: Implementacao futura
        # public function deleteAutomatorProvidersById($mixedId)
    #     {
    #         if(!is_array($mixedId))
    #             $mixedId = [$mixedId];
    # 
    #         return (int)$this->query("DELETE FROM `sys_agents_automators_providers` WHERE `id` IN (" . $this->implode_escape($mixedId) . ")") > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertAutomatorHelper

  ## Parametros
    - aParamsSet

  ## Retorno
    - any
  """
  def insertAutomatorHelper(%{}) do
    # TODO: Implementacao futura
        # public function insertAutomatorHelper($aParamsSet)
    #     {
    #         if(empty($aParamsSet))
    #             return false;
    # 
    #         return (int)$this->query("INSERT INTO `sys_agents_automators_helpers` SET " . $this->arrayToSQL($aParamsSet)) > 0 ? (int)$this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateAutomatorHelper

  ## Parametros
    - aParamsSet,aParamsWhere

  ## Retorno
    - any
  """
  def updateAutomatorHelper(%{}) do
    # TODO: Implementacao futura
        # public function updateAutomatorHelper($aParamsSet, $aParamsWhere)
    #     {
    #         if(empty($aParamsSet) || empty($aParamsWhere))
    #             return false;
    # 
    #         return $this->query("UPDATE `sys_agents_automators_helpers` SET " . $this->arrayToSQL($aParamsSet) . " WHERE " . $this->arrayToSQL($aParamsWhere, " AND "));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteAutomatorHelpers

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteAutomatorHelpers(%{}) do
    # TODO: Implementacao futura
        # public function deleteAutomatorHelpers($aParamsWhere)
    #     {
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return (int)$this->query("DELETE FROM `sys_agents_automators_helpers` WHERE " . $this->arrayToSQL($aParamsWhere)) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteAutomatorHelpersById

  ## Parametros
    - mixedId

  ## Retorno
    - any
  """
  def deleteAutomatorHelpersById(%{}) do
    # TODO: Implementacao futura
        # public function deleteAutomatorHelpersById($mixedId)
    #     {
    #         if(!is_array($mixedId))
    #             $mixedId = [$mixedId];
    # 
    #         return (int)$this->query("DELETE FROM `sys_agents_automators_helpers` WHERE `id` IN (" . $this->implode_escape($mixedId) . ")") > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertAutomatorAssistant

  ## Parametros
    - aParamsSet

  ## Retorno
    - any
  """
  def insertAutomatorAssistant(%{}) do
    # TODO: Implementacao futura
        # public function insertAutomatorAssistant($aParamsSet)
    #     {
    #         if(empty($aParamsSet))
    #             return false;
    # 
    #         return (int)$this->query("INSERT INTO `sys_agents_automators_assistants` SET " . $this->arrayToSQL($aParamsSet)) > 0 ? (int)$this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateAutomatorAssistant

  ## Parametros
    - aParamsSet,aParamsWhere

  ## Retorno
    - any
  """
  def updateAutomatorAssistant(%{}) do
    # TODO: Implementacao futura
        # public function updateAutomatorAssistant($aParamsSet, $aParamsWhere)
    #     {
    #         if(empty($aParamsSet) || empty($aParamsWhere))
    #             return false;
    # 
    #         return $this->query("UPDATE `sys_agents_automators_assistants` SET " . $this->arrayToSQL($aParamsSet) . " WHERE " . $this->arrayToSQL($aParamsWhere, " AND "));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteAutomatorAssistants

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteAutomatorAssistants(%{}) do
    # TODO: Implementacao futura
        # public function deleteAutomatorAssistants($aParamsWhere)
    #     {
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return (int)$this->query("DELETE FROM `sys_agents_automators_assistants` WHERE " . $this->arrayToSQL($aParamsWhere)) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteAutomatorAssistantsById

  ## Parametros
    - mixedId

  ## Retorno
    - any
  """
  def deleteAutomatorAssistantsById(%{}) do
    # TODO: Implementacao futura
        # public function deleteAutomatorAssistantsById($mixedId)
    #     {
    #         if(!is_array($mixedId))
    #             $mixedId = [$mixedId];
    # 
    #         return (int)$this->query("DELETE FROM `sys_agents_automators_assistants` WHERE `id` IN (" . $this->implode_escape($mixedId) . ")") > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProviderTypesBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getProviderTypesBy(%{}) do
    # TODO: Implementacao futura
        # public function getProviderTypesBy($aParams = [])
    #     {
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    #     	$sWhereClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `id`=:id";
    #                 break;
    # 
    #             case 'name':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'name' => $aParams['name']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `name`=:name";
    #                 break;
    # 
    #             case 'all_pairs':
    #                 $aMethod['name'] = 'getPairs';
    #                 $aMethod['params'][1] = 'id';
    #                 $aMethod['params'][2] = 'title';
    # 
    #                 if(isset($aParams['active'])) {
    #                     $aMethod['params'][3] = [
    #                         'active' => $aParams['active']
    #                     ];
    # 
    #                     $sWhereClause = " AND `active`=:active";
    #                 }
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT * 
    #             FROM `sys_agents_provider_types`
    #             WHERE 1" . $sWhereClause;
    # 
    #         return call_user_func_array([$this, $aMethod['name']], $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProviderOptionsBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getProviderOptionsBy(%{}) do
    # TODO: Implementacao futura
        # public function getProviderOptionsBy($aParams = [])
    #     {
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    #     	$sWhereClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `id`=:id";
    #                 break;
    # 
    #             case 'provider_type_id':
    #             	$aMethod['params'][1] = [
    #                     'provider_type_id' => $aParams['provider_type_id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `provider_type_id`=:provider_type_id";
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT * 
    #             FROM `sys_agents_provider_options`
    #             WHERE 1" . $sWhereClause;
    # 
    #         return call_user_func_array([$this, $aMethod['name']], $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getProvidersBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getProvidersBy(%{}) do
    # TODO: Implementacao futura
        # public function getProvidersBy($aParams = [])
    #     {
    #     	$aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    # 
    #     	$sSelectClause = "`tp`.*";
    #     	$sJoinClause = $sWhereClause = $sGroupClause = $sOrderClause = $sLimitClause = "";
    #         switch($aParams['sample']) {
    #             case 'id':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause = " AND `tp`.`id`=:id";
    #                 break;
    # 
    #             case 'ids':
    #                 $sSelectClause .= ", `tpt`.`name` AS `type_name`";
    #                 $sJoinClause = "INNER JOIN `sys_agents_provider_types` AS `tpt` ON `tp`.`type_id`=`tpt`.`id`";
    #                 $sWhereClause = " AND `tp`.`id` IN (" . $this->implode_escape($aParams['ids']) . ")";
    #                 break;
    #                  
    #             case 'options_by_id':
    #                 $aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sSelectClause = "`tpo`.`id`, `tpo`.`name`, `tpo`.`type`, `tpo`.`title`, `tpo`.`description`, `tpv`.`value`";
    #                 $sJoinClause = "LEFT JOIN `sys_agents_provider_options` AS `tpo` ON `tp`.`type_id`=`tpo`.`provider_type_id` LEFT JOIN `sys_agents_providers_values` AS `tpv` ON `tp`.`id`=`tpv`.`provider_id` AND `tpo`.`id`=`tpv`.`option_id`";
    #                 $sWhereClause = " AND `tp`.`id`=:id";
    #                 break;
    #             
    #             case 'all_pairs':
    #                 $aMethod['name'] = 'getPairs';
    #                 $aMethod['params'][1] = 'id';
    #                 $aMethod['params'][2] = 'name';
    # 
    #                 if(isset($aParams['active'])) {
    #                     $aMethod['params'][3] = [
    #                         'active' => $aParams['active']
    #                     ];
    # 
    #                     $sWhereClause = " AND `tp`.`active`=:active";
    #                 }
    #                 break;
    #         }
    # 
    #         $sOrderClause = !empty($sOrderClause) ? "ORDER BY " . $sOrderClause : $sOrderClause;
    #         $sLimitClause = !empty($sLimitClause) ? "LIMIT " . $sLimitClause : $sLimitClause;
    # 
    #         $aMethod['params'][0] = "SELECT
    #                 " . $sSelectClause . "
    #             FROM `sys_agents_providers` AS `tp` " . $sJoinClause . "
    #             WHERE 1" . $sWhereClause . " " . $sGroupClause . " " . $sOrderClause . " " . $sLimitClause;
    # 
    #         return call_user_func_array(array($this, $aMethod['name']), $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertProviderValue

  ## Parametros
    - aParamsSet

  ## Retorno
    - any
  """
  def insertProviderValue(%{}) do
    # TODO: Implementacao futura
        # public function insertProviderValue($aParamsSet)
    #     {
    #         if(empty($aParamsSet) || !is_array($aParamsSet) || !isset($aParamsSet['value']))
    #             return false;
    # 
    #         return (int)$this->query("INSERT INTO `sys_agents_providers_values` SET " . $this->arrayToSQL($aParamsSet) . " ON DUPLICATE KEY UPDATE `value`=:value", [
    #             'value' => $aParamsSet['value']
    #         ]) > 0 ? (int)$this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateProviderValue

  ## Parametros
    - aParamsSet,aParamsWhere

  ## Retorno
    - any
  """
  def updateProviderValue(%{}) do
    # TODO: Implementacao futura
        # public function updateProviderValue($aParamsSet, $aParamsWhere)
    #     {
    #         if(empty($aParamsSet))
    #             return false;
    # 
    #         $sWhereClause = "1";
    #         if(!empty($aParamsWhere) && is_array($aParamsWhere))
    #             $sWhereClause = $this->arrayToSQL($aParamsWhere, ' AND ');
    # 
    #         return $this->query("UPDATE `sys_agents_providers_values` SET " . $this->arrayToSQL($aParamsSet) . " WHERE " . $sWhereClause) !== false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteProviderValues

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteProviderValues(%{}) do
    # TODO: Implementacao futura
        # public function deleteProviderValues($aParamsWhere)
    #     {
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return (int)$this->query("DELETE FROM `sys_agents_providers_values` WHERE " . $this->arrayToSQL($aParamsWhere, ' AND ')) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getHelpersBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getHelpersBy(%{}) do
    # TODO: Implementacao futura
        # public function getHelpersBy($aParams = [])
    #     {
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    #         $sSelectClause = "`th`.*";
    #     	$sJoinClause = $sWhereClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `th`.`id`=:id";
    #                 break;
    #             case 'name':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'name' => $aParams['name']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `th`.`name`=:name";
    #                 break;
    #             case 'ids':
    #                 $sWhereClause = " AND `th`.`id` IN (" . $this->implode_escape($aParams['ids']) . ")";
    #                 break;
    # 
    #             case 'all_pairs':
    #                 $aMethod['name'] = 'getPairs';
    #                 $aMethod['params'][1] = 'id';
    #                 $aMethod['params'][2] = 'name';
    # 
    #                 if(isset($aParams['active'])) {
    #                     $aMethod['params'][3] = [
    #                         'active' => $aParams['active']
    #                     ];
    # 
    #                     $sWhereClause = " AND `th`.`active`=:active";
    #                 }
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . "
    #             FROM `sys_agents_helpers` AS `th` " . $sJoinClause . "
    #             WHERE 1" . $sWhereClause;
    # 
    #         return call_user_func_array([$this, $aMethod['name']], $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAssistantsBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getAssistantsBy(%{}) do
    # TODO: Implementacao futura
        # public function getAssistantsBy($aParams = [])
    #     {
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    #         $sSelectClause = "`ta`.*";
    #     	$sJoinClause = $sWhereClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `ta`.`id`=:id";
    #                 break;
    # 
    #             case 'name':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'name' => $aParams['name']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `ta`.`name`=:name";
    #                 break;
    # 
    #             case 'ids':
    #                 $sWhereClause = " AND `ta`.`id` IN (" . $this->implode_escape($aParams['ids']) . ")";
    #                 break;
    # 
    #             case 'all_pairs':
    #                 $aMethod['name'] = 'getPairs';
    #                 $aMethod['params'][1] = 'id';
    #                 $aMethod['params'][2] = 'name';
    #                 $aMethod['params'][3] = [];
    # 
    #                 if(isset($aParams['active'])) {
    #                     $aMethod['params'][3]['active'] = $aParams['active'];
    # 
    #                     $sWhereClause .= " AND `ta`.`active`=:active";
    #                 }
    # 
    #                 if(isset($aParams['hidden'])) {
    #                     $aMethod['params'][3]['hidden'] = $aParams['hidden'];
    # 
    #                     $sWhereClause .= " AND `ta`.`hidden`=:hidden";
    #                 }
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . "
    #             FROM `sys_agents_assistants` AS `ta` " . $sJoinClause . "
    #             WHERE 1" . $sWhereClause;
    # 
    #         return call_user_func_array([$this, $aMethod['name']], $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateAssistants

  ## Parametros
    - aSetClause,aWhereClause

  ## Retorno
    - any
  """
  def updateAssistants(%{}) do
    # TODO: Implementacao futura
        # public function updateAssistants($aSetClause, $aWhereClause)
    #     {
    #         if(empty($aSetClause) || empty($aWhereClause))
    #             return false;
    # 
    #         return (int)$this->query("UPDATE `sys_agents_assistants` SET " . $this->arrayToSQL($aSetClause) . " WHERE " . $this->arrayToSQL($aWhereClause)) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getChatsBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getChatsBy(%{}) do
    # TODO: Implementacao futura
        # public function getChatsBy($aParams = [])
    #     {
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    #         $sSelectClause = "`tac`.*";
    #     	$sJoinClause = $sWhereClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `tac`.`id`=:id";
    #                 break;
    # 
    #             case 'name':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'name' => $aParams['name']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `tac`.`name`=:name";
    #                 break;
    # 
    #             case 'assistant_id':
    #                 $aMethod['params'][1] = [
    #                     'assistant_id' => $aParams['assistant_id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `tac`.`assistant_id`=:assistant_id";
    #                 break;
    # 
    #             case 'type':
    #                 $aMethod['params'][1] = [
    #                     'type' => $aParams['type']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `tac`.`type`=:type";
    #                 
    #                 if(isset($aParams['lifetime']) && (int)$aParams['lifetime'] > 0) {
    #                     $aMethod['params'][1]['lifetime'] = (int)$aParams['lifetime'];
    # 
    #                     $sWhereClause .= " AND (UNIX_TIMESTAMP() - `tac`.`added`) >= :lifetime";
    #                 }
    #                 break;
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . "
    #             FROM `sys_agents_assistants_chats` AS `tac` " . $sJoinClause . "
    #             WHERE 1" . $sWhereClause;
    # 
    #         return call_user_func_array([$this, $aMethod['name']], $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertChat

  ## Parametros
    - aParamsSet

  ## Retorno
    - any
  """
  def insertChat(%{}) do
    # TODO: Implementacao futura
        # public function insertChat($aParamsSet)
    #     {
    #         if(empty($aParamsSet) || !is_array($aParamsSet))
    #             return false;
    # 
    #         return (int)$this->query("INSERT INTO `sys_agents_assistants_chats` SET " . $this->arrayToSQL($aParamsSet)) > 0 ? (int)$this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateChats

  ## Parametros
    - aSetClause,aWhereClause

  ## Retorno
    - any
  """
  def updateChats(%{}) do
    # TODO: Implementacao futura
        # public function updateChats($aSetClause, $aWhereClause)
    #     {
    #         if(empty($aSetClause) || empty($aWhereClause))
    #             return false;
    # 
    #         return (int)$this->query("UPDATE `sys_agents_assistants_chats` SET " . $this->arrayToSQL($aSetClause) . " WHERE " . $this->arrayToSQL($aWhereClause)) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteChats

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteChats(%{}) do
    # TODO: Implementacao futura
        # public function deleteChats($aParamsWhere)
    #     {
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return (int)$this->query("DELETE FROM `sys_agents_assistants_chats` WHERE " . $this->arrayToSQL($aParamsWhere, ' AND ')) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFilesBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def getFilesBy(%{}) do
    # TODO: Implementacao futura
        # public function getFilesBy($aParams = [])
    #     {
    #         $aMethod = ['name' => 'getAll', 'params' => [0 => 'query']];
    #         $sSelectClause = "`taf`.*";
    #     	$sJoinClause = $sWhereClause = "";
    # 
    #         switch($aParams['sample']) {
    #             case 'id':
    #             	$aMethod['name'] = 'getRow';
    #             	$aMethod['params'][1] = [
    #                     'id' => $aParams['id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `taf`.`id`=:id";
    #                 break;
    # 
    #             case 'assistant_id':
    #                 $aMethod['params'][1] = [
    #                     'assistant_id' => $aParams['assistant_id']
    #                 ];
    # 
    #                 $sWhereClause .= " AND `taf`.`assistant_id`=:assistant_id";
    # 
    #                 if(!empty($aParams['name'])) {
    #                     $aMethod['name'] = 'getRow';
    #                     $aMethod['params'][1]['name'] = $aParams['name'];
    # 
    #                     $sWhereClause .= " AND `taf`.`name`=:name";
    #                 }
    #                 break;                
    #         }
    # 
    #         $aMethod['params'][0] = "SELECT " . $sSelectClause . "
    #             FROM `sys_agents_assistants_files` AS `taf` " . $sJoinClause . "
    #             WHERE 1" . $sWhereClause;
    # 
    #         return call_user_func_array([$this, $aMethod['name']], $aMethod['params']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertFile

  ## Parametros
    - aParamsSet

  ## Retorno
    - any
  """
  def insertFile(%{}) do
    # TODO: Implementacao futura
        # public function insertFile($aParamsSet)
    #     {
    #         if(empty($aParamsSet) || !is_array($aParamsSet))
    #             return false;
    # 
    #         return (int)$this->query("INSERT INTO `sys_agents_assistants_files` SET " . $this->arrayToSQL($aParamsSet)) > 0 ? (int)$this->lastId() : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateFiles

  ## Parametros
    - aSetClause,aWhereClause

  ## Retorno
    - any
  """
  def updateFiles(%{}) do
    # TODO: Implementacao futura
        # public function updateFiles($aSetClause, $aWhereClause)
    #     {
    #         if(empty($aSetClause) || empty($aWhereClause))
    #             return false;
    # 
    #         return (int)$this->query("UPDATE `sys_agents_assistants_files` SET " . $this->arrayToSQL($aSetClause) . " WHERE " . $this->arrayToSQL($aWhereClause)) > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteFiles

  ## Parametros
    - aParamsWhere

  ## Retorno
    - any
  """
  def deleteFiles(%{}) do
    # TODO: Implementacao futura
        # public function deleteFiles($aParamsWhere)
    #     {
    #         if(empty($aParamsWhere))
    #             return false;
    # 
    #         return (int)$this->query("DELETE FROM `sys_agents_assistants_files` WHERE " . $this->arrayToSQL($aParamsWhere, ' AND ')) > 0;
    #     }
    :ok
  end

end
