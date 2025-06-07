
defmodule DeeperHub.Inc.Classes.BxAdsSearchResult do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/ads/classes/BxAdsSearchResult.php
  """

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
    # 
    #     function displayResultBlock()
    #     {
    #         $this->oModule->_oTemplate->addJs(['main.js']);
    # 
    #         return $this->oModule->_oTemplate->getJsCode('main') . parent::displayResultBlock();
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
    # 
    #     function getAlterOrder()
    #     {
    #         $CNF = &$this->oModule->_oConfig->CNF;
    # 
    #         $aSql = array();
    #         switch ($this->aCurrent['sorting']) {
    #             case 'last':
    #                 $aSql['order'] = ' ORDER BY `' . $CNF['TABLE_ENTRIES'] . '`.`added` DESC';
    #                 break;
    #             case 'featured':
    #                 $aSql['order'] = ' ORDER BY `' . $CNF['TABLE_ENTRIES'] . '`.`featured` DESC';
    #                 break;
    #             case 'updated':
    #                 $aSql['order'] = ' ORDER BY `' . $CNF['TABLE_ENTRIES'] . '`.`changed` DESC';
    #                 break;
    #             case 'popular':
    #                 $aSql['order'] = ' ORDER BY `' . $CNF['TABLE_ENTRIES'] . '`.`views` DESC';
    #                 break;
    #         }
    #         return $aSql;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addConditionsForPromotion

  ## Parametros
    - CNF,oProfile,sMode,aParams

  ## Retorno
    - any
  """
  def addConditionsForPromotion(%{}) do
    # TODO: Implementacao futura
        # protected function addConditionsForPromotion($CNF, $oProfile, $sMode, $aParams)
    #     {
    #         $CNF = &$this->oModule->_oConfig->CNF;
    # 
    #         $iDay = $this->oModule->_oConfig->getDay();
    #         $fPromotionCpm = $this->oModule->_oConfig->getPromotionCpm();
    # 
    #         if(!isset($this->aCurrent['join']))
    #             $this->aCurrent['join'] = [];
    # 
    #         $this->aCurrent['join'][] = [
    #             'type' => 'LEFT',
    #             'table' => $CNF['TABLE_PROMO_TRACKER'],
    #             'mainField' => $CNF['FIELD_ID'],
    #             'on_sql' => $this->oModule->_oDb->prepareAsString("`{$CNF['TABLE_PROMO_TRACKER']}`.`entry_id`=`{$this->aCurrent['table']}`.`{$CNF['FIELD_ID']}` AND `{$CNF['TABLE_PROMO_TRACKER']}`.`date`=?", $iDay),
    #             'joinFields' => ['impressions', 'clicks'],
    #         ];
    # 
    #         $this->aCurrent['restriction'] = array_merge($this->aCurrent['restriction'], [
    #             'budget_total' => ['value' => 0, 'field' => 'budget_total', 'operator' => '<>'],
    #         ]);
    # 
    #         if(!isset($this->aCurrent['restriction_sql']))
    #             $this->aCurrent['restriction_sql'] = "";
    # 
    #         $this->aCurrent['restriction_sql'] .= " AND `{$this->aCurrent['table']}`.`{$CNF['FIELD_BUDGET_TOTAL']}` > ({$fPromotionCpm} * `{$this->aCurrent['table']}`.`impressions`)/1000";
    #         $this->aCurrent['restriction_sql'] .= " AND (ISNULL(`{$CNF['TABLE_PROMO_TRACKER']}`.`impressions`) OR `{$this->aCurrent['table']}`.`{$CNF['FIELD_BUDGET_DAILY']}` > ({$fPromotionCpm} * `{$CNF['TABLE_PROMO_TRACKER']}`.`impressions`)/1000)";
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addConditionsForSegmentation

  ## Parametros
    - CNF,oProfile,sMode,aParams

  ## Retorno
    - any
  """
  def addConditionsForSegmentation(%{}) do
    # TODO: Implementacao futura
        # protected function addConditionsForSegmentation($CNF, $oProfile, $sMode, $aParams)
    #     {
    #         $iViewer = bx_get_logged_profile_id();
    #         if(!$iViewer)
    #             return;
    # 
    #         $oViewer = BxDolProfile::getInstance($iViewer);
    #         if(!$oViewer)
    #             return;
    # 
    #         $sViewerModule = $oViewer->getModule();
    #         if($sViewerModule != 'bx_persons')
    #             return;
    # 
    #         $aViewerInfo = bx_srv($sViewerModule, 'get_info', [$oViewer->getContentId(), false]);
    #         if(empty($aViewerInfo) || !is_array($aViewerInfo))
    #             return;
    # 
    #         $sWhereClause = "1";
    #         if(!empty($aViewerInfo['gender']))
    #             $sWhereClause .= $this->oModule->_oDb->prepareAsString(" AND IF(`seg_gender` <> 0, `seg_gender` & ?, 1)", $aViewerInfo['gender']);
    # 
    #         if(!empty($aViewerInfo['birthday'])) {
    #             $iAge = bx_birthday2age($aViewerInfo['birthday']);
    #             $sWhereClause .= $this->oModule->_oDb->prepareAsString(" AND IF(`seg_age_min` <> 0 AND `seg_age_max` <> 0 AND `seg_age_min` <= `seg_age_max`, `seg_age_min` <= ? AND `seg_age_max` >= ?, 1)", $iAge, $iAge);
    #         }
    # 
    #         if(!empty($aViewerInfo['location'])) {
    #             $aLocation = unserialize($aViewerInfo['location']);
    #             if(!empty($aLocation['country']))
    #                 $sWhereClause .= $this->oModule->_oDb->prepareAsString(" AND IF(`seg_country` <> '', `seg_country` = ?, 1)", $aLocation['country']);
    #         }
    # 
    #         if(empty($sWhereClause)) 
    #             return;
    # 
    #         if(!isset($this->aCurrent['restriction_sql']))
    #             $this->aCurrent['restriction_sql'] = "";
    # 
    #         $this->aCurrent['restriction_sql'] .= " AND IF(`seg` = 1, " . $sWhereClause . ", 1)";
    #     }
    :ok
  end

end
