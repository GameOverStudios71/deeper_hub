
defmodule DeeperHub.Inc.Classes.BxPaymentGridSbsList do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/payment/classes/BxPaymentGridSbsList.php
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
    #         $this->_sManageType = 'common';
    #         $this->_aProvidersAttached = array();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCode

  ## Parametros
    - isDisplayHeader=true

  ## Retorno
    - any
  """
  def getCode(%{}) do
    # TODO: Implementacao futura
        # public function getCode ($isDisplayHeader = true)
    #     {
    #         if(empty($this->_aQueryAppend['client_id']) || $this->_aQueryAppend['client_id'] != bx_get_logged_profile_id())
    #             return '';
    # 
    #         return parent::getCode($isDisplayHeader);
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
    # 		if(empty($this->_aQueryAppend['client_id']))
    # 			return array();
    # 
    # 		$this->_aOptions['source'] .= $this->_oModule->_oDb->prepareAsString(" AND `client_id`=?", $this->_aQueryAppend['client_id']);
    # 
    #         return parent::_getDataSql($sFilter, $sOrderField, $sOrderDir, $iStart, $iPerPage);
    #     }
    :ok
  end

end
