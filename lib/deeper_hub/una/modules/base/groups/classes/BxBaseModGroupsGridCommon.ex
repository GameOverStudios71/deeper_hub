
defmodule DeeperHub.Inc.Classes.BxBaseModGroupsGridCommon do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/groups/classes/BxBaseModGroupsGridCommon.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aOptions,oTemplate=false

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct ($aOptions, $oTemplate = false)
    #     {
    #         parent::__construct ($aOptions, $oTemplate);
    # 
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $this->_sStatusField = $CNF['FIELD_STATUS'];
    #         $this->_aStatusValues = [
    #             BX_BASE_MOD_GENERAL_STATUS_ACTIVE, 
    #             BX_BASE_MOD_GENERAL_STATUS_HIDDEN
    #         ];
    # 
    #         if($this->_oModule->_oConfig->isAutoApprove() && isset($this->_aFilter1Values[BX_BASE_MOD_GENERAL_STATUS_PENDING]))
    #             unset($this->_aFilter1Values[BX_BASE_MOD_GENERAL_STATUS_PENDING]);
    # 
    #         $this->_sManageType = BX_DOL_MANAGE_TOOLS_COMMON;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getDataSql

  ## Parametros
    - sFilter,sOrderField,sOrderDir,iStart,iPerPage

  ## Retorno
    - any
  """
  def _getDataSql(%{}) do
    # TODO: Implementacao futura
        # protected function _getDataSql($sFilter, $sOrderField, $sOrderDir, $iStart, $iPerPage)
    #     {
    #         $this->_aOptions['source'] .= $this->_oModule->_oDb->prepareAsString(" AND `tp`.`account_id`=?", getLoggedId());
    # 
    #         return parent::_getDataSql($sFilter, $sOrderField, $sOrderDir, $iStart, $iPerPage);
    #     }
    :ok
  end

end
