
defmodule DeeperHub.Inc.Classes.BxStoriesSearchResultMedia do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/stories/classes/BxStoriesSearchResultMedia.php
  """

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
    #         $sTable = $this->aCurrent['table'];
    #         $sWay = $this->sOrderDirection;
    # 
    #         $aSql = array();
    #         switch ($this->aCurrent['sorting']) {
    #             case 'order':
    #                 $aSql['order'] = " ORDER BY `" . $sTable . "`.`order` " . $sWay . ", `" . $sTable . "`.`id` " . $sWay . " ";
    #                 break;
    # 
    #             case 'order_by_ghosts':
    #                 $aSql['order'] = " ORDER BY `g`.`order` " . $sWay . ", `" . $sTable . "`.`id` " . $sWay . " ";
    #                 break;
    # 
    #             case 'last':
    #                 $aSql['order'] = " ORDER BY `f`.`added` " . $sWay . ", `" . $sTable . "`.`id` " . $sWay . " ";
    #                 break;
    #         }
    # 
    #         return $aSql;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _updateCurrentForOrderByGhosts

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _updateCurrentForOrderByGhosts(%{}) do
    # TODO: Implementacao futura
        # protected function _updateCurrentForOrderByGhosts()
    #     {
    #         $CNF = &$this->oModule->_oConfig->CNF;
    # 
    #         $this->aCurrent['join']['ghosts'] = [
    #             'type' => 'INNER',
    #             'table' => 'sys_storage_ghosts',
    #             'table_alias' => 'g',
    #             'mainField' => 'file_id',
    #             'on_sql' => $this->oModule->_oDb->prepareAsString(" `g`.`id`=`bx_stories_entries_media`.`file_id` AND `g`.`content_id`=`bx_stories_entries_media`.`content_id` AND `g`.`object`=? ", $CNF['OBJECT_STORAGE']),
    #             'joinFields' => array('order'),
    #         ];
    #         $this->aCurrent['sorting'] = 'order_by_ghosts';
    #         $this->sOrderDirection = 'ASC';
    #     }
    :ok
  end

end
