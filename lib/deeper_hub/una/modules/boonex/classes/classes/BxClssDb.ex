
defmodule DeeperHub.Inc.Classes.BxClssDb do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/classes/classes/BxClssDb.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - &oConfig

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # 
    # 
    #     function __construct(&$oConfig)
    #     {
    #         parent::__construct($oConfig);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPrevEntry

  ## Parametros
    - iClassId

  ## Retorno
    - any
  """
  def getPrevEntry(%{}) do
    # TODO: Implementacao futura
        # public function getPrevEntry ($iClassId)
    #     {        
    #         return $this->_getNextPrevEntry($iClassId, 'DESC', '<=');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getNextEntry

  ## Parametros
    - iClassId

  ## Retorno
    - any
  """
  def getNextEntry(%{}) do
    # TODO: Implementacao futura
        # public function getNextEntry ($iClassId)
    #     {        
    #         return $this->_getNextPrevEntry($iClassId, 'ASC', '>=');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getNextPrevEntry

  ## Parametros
    - iClassId,sSorting='DESC',sOp='<='

  ## Retorno
    - any
  """
  def _getNextPrevEntry(%{}) do
    # TODO: Implementacao futura
        # protected function _getNextPrevEntry ($iClassId, $sSorting = 'DESC', $sOp = '<=')
    #     {        
    #         $aClass = $this->getRow("SELECT `c`.`id`, `c`.`order`, `m`.`order` as `order_module`, `allow_view_to` as `context_profile_id` FROM `" . $this->_oConfig->CNF['TABLE_ENTRIES'] . "` AS `c` INNER JOIN `" . $this->_oConfig->CNF['TABLE_MODULES'] . "` AS `m` ON (`m`.`id` = `c`.`module_id`) WHERE `c`.`id` = :class", array('class' => $iClassId));
    # 
    #         $sQuery = "SELECT `c`.*, `m`.`module_title` FROM `" . $this->_oConfig->CNF['TABLE_ENTRIES'] . "` AS `c` INNER JOIN `" . $this->_oConfig->CNF['TABLE_MODULES'] . "` AS `m` ON (`m`.`id` = `c`.`module_id`) WHERE `m`.`order`*1000000 + `c`.`order` $sOp :order_module*1000000 + :order AND `c`.`id` != :id AND `allow_view_to` = :context_profile ORDER BY `m`.`order`*1000000 + `c`.`order` $sSorting LIMIT 1";
    # 
    #         $a = $this->getRow($sQuery, array(
    #             'order_module' => $aClass['order_module'], 
    #             'order' => $aClass['order'],
    #             'id' => $aClass['id'],
    #             'context_profile' => $aClass['context_profile_id'],
    #         ));
    # 
    #         return $a;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getEntriesByModule

  ## Parametros
    - iModuleId

  ## Retorno
    - any
  """
  def getEntriesByModule(%{}) do
    # TODO: Implementacao futura
        # public function getEntriesByModule ($iModuleId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         $aBindings = ['module_id' => $iModuleId];
    #         
    #         $sWhereClause = " AND `module_id` = :module_id";
    # 
    #         $oCf = BxDolContentFilter::getInstance();
    #         if($oCf->isEnabled())
    #             $sWhereClause .= $oCf->getSQLParts($CNF['TABLE_ENTRIES'], $CNF['FIELD_CF']);
    # 
    #         return $this->getAll("SELECT * FROM `" . $CNF['TABLE_ENTRIES'] . "` WHERE 1" . $sWhereClause . " ORDER BY `order`", $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getEntriesModulesByContext

  ## Parametros
    - iProfileConextId,bAsPairs=false

  ## Retorno
    - any
  """
  def getEntriesModulesByContext(%{}) do
    # TODO: Implementacao futura
        # public function getEntriesModulesByContext ($iProfileConextId, $bAsPairs = false)
    #     {
    #         $sQuery = $this->prepare ("SELECT * FROM `" . $this->_oConfig->CNF['TABLE_MODULES'] . "` WHERE `profile_id` = ? ORDER BY `order`", $iProfileConextId);
    #         if ($bAsPairs)
    #             return $this->getPairs($sQuery, 'id', 'module_title');
    #         else
    #             return $this->getAll($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getClassModuleTitleById

  ## Parametros
    - iModuleId

  ## Retorno
    - any
  """
  def getClassModuleTitleById(%{}) do
    # TODO: Implementacao futura
        # public function getClassModuleTitleById ($iModuleId)
    #     {
    #         $sQuery = $this->prepare ("SELECT `module_title` FROM `" . $this->_oConfig->CNF['TABLE_MODULES'] . "` WHERE `id` = ?", $iModuleId);
    #         return $this->getOne($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateModulesOrder

  ## Parametros
    - iProfileConextId,aModulesOrder

  ## Retorno
    - any
  """
  def updateModulesOrder(%{}) do
    # TODO: Implementacao futura
        # public function updateModulesOrder ($iProfileConextId, $aModulesOrder)
    #     {
    #         $iAffected = 0;
    #         foreach ($aModulesOrder as $iOrder => $iModuleId) {
    #             $iAffected += ($this->query("UPDATE `" . $this->_oConfig->CNF['TABLE_MODULES'] . "` SET `order` = :order WHERE `profile_id` = :profile_id AND `id` = :module_id", array(
    #                 'order' => $iOrder,
    #                 'profile_id' => $iProfileConextId,
    #                 'module_id' => $iModuleId,
    #             )) ? 1 : 0);
    #         }        
    #         return $iAffected;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getModuleMaxOrder

  ## Parametros
    - iProfileConextId

  ## Retorno
    - any
  """
  def getModuleMaxOrder(%{}) do
    # TODO: Implementacao futura
        # public function getModuleMaxOrder ($iProfileConextId)
    #     {
    #         return $this->getOne("SELECT `order` + 1 FROM `" . $this->_oConfig->CNF['TABLE_MODULES'] . "` WHERE `profile_id` = :profile_context ORDER BY `order` DESC LIMIT 1", array(
    #             'profile_context' => $iProfileConextId,
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getModule

  ## Parametros
    - iProfileConextId,iModuleId

  ## Retorno
    - any
  """
  def getModule(%{}) do
    # TODO: Implementacao futura
        # public function getModule ($iProfileConextId, $iModuleId)
    #     {
    #         return $this->getRow("SELECT * FROM `" . $this->_oConfig->CNF['TABLE_MODULES'] . "` WHERE `profile_id` = :profile_context AND `id` = :id LIMIT 1", array(
    #             'profile_context' => $iProfileConextId,
    #             'id' => $iModuleId,
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteModule

  ## Parametros
    - iProfileConextId,iModuleId

  ## Retorno
    - any
  """
  def deleteModule(%{}) do
    # TODO: Implementacao futura
        # public function deleteModule ($iProfileConextId, $iModuleId)
    #     {
    #         return $this->query("DELETE FROM `" . $this->_oConfig->CNF['TABLE_MODULES'] . "` WHERE `profile_id` = :profile_context AND `id` = :id", array(
    #             'profile_context' => $iProfileConextId,
    #             'id' => $iModuleId,
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getClassMaxOrder

  ## Parametros
    - iProfileConextId,iModuleId

  ## Retorno
    - any
  """
  def getClassMaxOrder(%{}) do
    # TODO: Implementacao futura
        # public function getClassMaxOrder ($iProfileConextId, $iModuleId)
    #     {
    #         return $this->getOne("SELECT `order` + 1 FROM `" . $this->_oConfig->CNF['TABLE_ENTRIES'] . "` WHERE `allow_view_to` = :profile_context AND `module_id` = :module ORDER BY `order` DESC LIMIT 1", array(
    #             'profile_context' => -$iProfileConextId,
    #             'module' => $iModuleId,
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateClassesOrder

  ## Parametros
    - iProfileConextId,iModuleId,aClassesOrder

  ## Retorno
    - any
  """
  def updateClassesOrder(%{}) do
    # TODO: Implementacao futura
        # public function updateClassesOrder($iProfileConextId, $iModuleId, $aClassesOrder)
    #     {
    #         $iAffected = 0;
    #         foreach ($aClassesOrder as $iOrder => $iClassId) {
    #             $iAffected += ($this->query("UPDATE `" . $this->_oConfig->CNF['TABLE_ENTRIES'] . "` SET `order` = :order, `module_id` = :module_id WHERE `allow_view_to` = :profile_context AND `id` = :class_id", array(
    #                 'order' => $iOrder,
    #                 'profile_context' => -$iProfileConextId,
    #                 'module_id' => $iModuleId,
    #                 'class_id' => $iClassId,
    #             )) ? 1 : 0);
    #         }        
    #         return $iAffected;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isClassCompleted

  ## Parametros
    - iClassId,iStudentProfileId

  ## Retorno
    - any
  """
  def isClassCompleted(%{}) do
    # TODO: Implementacao futura
        # public function isClassCompleted($iClassId, $iStudentProfileId)
    #     {
    #         return $this->getClassStatus($iClassId, $iStudentProfileId, 'completed');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getClassStatus

  ## Parametros
    - iClassId,iStudentProfileId,mixedStatus

  ## Retorno
    - any
  """
  def getClassStatus(%{}) do
    # TODO: Implementacao futura
        # public function getClassStatus($iClassId, $iStudentProfileId, $mixedStatus)
    #     {
    #         if (is_numeric($mixedStatus) && is_int($mixedStatus) && isset($this->_aStatuses[$mixedStatus]))
    #             $mixedStatus = $this->_aStatuses[$mixedStatus];
    #         elseif (!in_array($mixedStatus, $this->_aStatuses, true))
    #             return false;
    # 
    #         return $this->getOne("SELECT `$mixedStatus` FROM `bx_classes_statuses` WHERE `class_id` = :class AND `student_profile_id` = :student", array(
    #             'class' => $iClassId,
    #             'student' => $iStudentProfileId,
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateClassStatus

  ## Parametros
    - iClassId,iStudentProfileId,sStatus

  ## Retorno
    - any
  """
  def updateClassStatus(%{}) do
    # TODO: Implementacao futura
        # public function updateClassStatus($iClassId, $iStudentProfileId, $sStatus)
    #     {
    #         if (!in_array($sStatus, $this->_aStatuses))
    #             return false;
    # 
    #         if ($this->getOne("SELECT `id` FROM `bx_classes_statuses` WHERE `class_id` = :class AND `student_profile_id` = :student", array(
    #             'class' => $iClassId,
    #             'student' => $iStudentProfileId,
    #         ))) {
    #             return $this->query("UPDATE `bx_classes_statuses` SET `$sStatus` = :ts WHERE `class_id` = :class AND `student_profile_id` = :student", array(
    #                 'ts' => time(),
    #                 'class' => $iClassId,
    #                 'student' => $iStudentProfileId,
    #             ));
    #         }
    #         else {
    #             return $this->query("INSERT INTO `bx_classes_statuses` SET `class_id` = :class, `student_profile_id` = :student, `$sStatus` = :ts", array(
    #                 'ts' => time(),
    #                 'class' => $iClassId,
    #                 'student' => $iStudentProfileId,
    #             ));
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStudentsInClass

  ## Parametros
    - aContentInfo,iStart=0,iLimit=1000

  ## Retorno
    - any
  """
  def getStudentsInClass(%{}) do
    # TODO: Implementacao futura
        # public function getStudentsInClass($aContentInfo, $iStart = 0, $iLimit = 1000)
    #     {
    #         if (!$aContentInfo)
    #             return array();
    # 
    #         if ($aContentInfo['allow_view_to'] < 0 && $oProfileContext = BxDolProfile::getInstance(abs($aContentInfo['allow_view_to']))) {
    #             $oModule = BxDolModule::getInstance($oProfileContext->getModule());
    # 
    #             if ($oModule && isset($oModule->_oConfig->CNF['OBJECT_CONNECTIONS'])) {
    #                 if (!($o = BxDolConnection::getObjectInstance($oModule->_oConfig->CNF['OBJECT_CONNECTIONS'])))
    #                     return array();
    # 
    #                 // TODO: remake to use SQL parts
    #                 if (BX_CONNECTIONS_TYPE_MUTUAL == $o->getType())
    #                     $a = $o->getConnectedContent($oProfileContext->id(), true, $iStart, $iLimit);
    #                 else
    #                     $a = $o->getConnectedContent($oProfileContext->id(), false, $iStart, $iLimit);
    #             }
    #         }
    # 
    #         if ($a && $aContentInfo['allow_view_to'] < 0)
    #             $a = $this->_removeCourseAdminsFromProfilesArray(abs($aContentInfo['allow_view_to']), $a); // TODO: remake to add condition to query instead of postfiltering
    # 
    #         return $a;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStudentsInClassNotCompleted

  ## Parametros
    - aContentInfo,iStart=0,iLimit=1000

  ## Retorno
    - any
  """
  def getStudentsInClassNotCompleted(%{}) do
    # TODO: Implementacao futura
        # public function getStudentsInClassNotCompleted($aContentInfo, $iStart = 0, $iLimit = 1000)
    #     {
    #         $aAll = $this->getStudentsInClass($aContentInfo, $iStart, $iLimit);
    #         $aCompleted = $this->getStudentsInClassCompleted($aContentInfo, $iStart, $iLimit);
    #         return array_diff($aAll, $aCompleted);;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStudentsInClassCompleted

  ## Parametros
    - aContentInfo,iStart=0,iLimit=1000

  ## Retorno
    - any
  """
  def getStudentsInClassCompleted(%{}) do
    # TODO: Implementacao futura
        # public function getStudentsInClassCompleted($aContentInfo, $iStart = 0, $iLimit = 1000)
    #     {
    #         if (!$aContentInfo)
    #             return array();
    # 
    #         $a = $this->getColumn("SELECT `student_profile_id` FROM `bx_classes_statuses` INNER JOIN `sys_profiles` AS `p` ON(`p`.`id` = `student_profile_id` AND `p`.`status` = 'active') WHERE `class_id` = :class AND `completed` != 0 LIMIT :start, :limit", array(
    #             'class' => $aContentInfo['id'],
    #             'start' => (int)$iStart,
    #             'limit' => (int)$iLimit,
    #         ));
    #         if (!$a)
    #             return array();
    # 
    #         if ($aContentInfo['allow_view_to'] < 0)
    #             $a = $this->_removeCourseAdminsFromProfilesArray(abs($aContentInfo['allow_view_to']), $a); // TODO: remake to add condition to query instead of postfiltering
    # 
    #         return $a;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _removeCourseAdminsFromProfilesArray

  ## Parametros
    - iProfileConextId,a

  ## Retorno
    - any
  """
  def _removeCourseAdminsFromProfilesArray(%{}) do
    # TODO: Implementacao futura
        # protected function _removeCourseAdminsFromProfilesArray($iProfileConextId, $a)
    #     {
    #         if ($oProfileContext = BxDolProfile::getInstance($iProfileConextId)) {
    #             $oModule = BxDolModule::getInstance($oProfileContext->getModule());
    #             if ($oModule && method_exists($oModule->_oDb, 'getAdmins')) {
    #                 $aAdmins = $oModule->_oDb->getAdmins($oProfileContext->id(), 0, 1000);
    #                 $a = array_diff($a, $aAdmins);
    #             }
    #         }
    #         return $a;
    #     }
    :ok
  end

end
