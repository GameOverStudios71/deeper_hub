
defmodule DeeperHub.Inc.Classes.BxMarketGridLicenses do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/market/classes/BxMarketGridLicenses.php
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
    #         $iProfileId = bx_get_logged_profile_id();
    #         if($iProfileId !== false)
    #             $this->_aQueryAppend['profile_id'] = (int)$iProfileId;
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
    #         if(empty($this->_aQueryAppend['profile_id']))
    #             return array();
    # 
    #         $this->_aOptions['source'] .= $this->_oModule->_oDb->prepareAsString(" AND `tl`.`profile_id`=?", $this->_aQueryAppend['profile_id']);
    # 
    #         return parent::_getDataSql($sFilter, $sOrderField, $sOrderDir, $iStart, $iPerPage);
    #     }
    :ok
  end

end
