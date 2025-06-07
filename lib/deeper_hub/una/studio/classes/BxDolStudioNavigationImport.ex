
defmodule DeeperHub.Inc.Classes.BxDolStudioNavigationImport do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//studio/classes/BxDolStudioNavigationImport.php
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
    #         $this->oDb = new BxDolStudioNavigationQuery();
    # 
    #         $sSet = bx_get('set');
    #         if(!empty($sSet))
    #             $this->sSet = bx_process_input($sSet);
    # 
    #         $this->_aQueryAppend['set'] = $this->sSet;
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
    #         $sSet = $sModule = '';
    #         if(strpos($sFilter, $this->sParamsDivider) !== false)
    #             list($sSet, $sModule, $sFilter) = explode($this->sParamsDivider, $sFilter);
    # 
    #         if($sSet != '')
    #             $this->_aOptions['source'] .= $this->oDb->prepareAsString(" AND `set_name`=?", $sSet);
    # 
    #         if($sModule != '')
    #             $this->_aOptions['source'] .= $this->oDb->prepareAsString(" AND `module`=?", $sModule);
    # 
    #         $this->_aOptions['source'] .= $this->oDb->prepareAsString(" AND `set_name`<>?", $this->sSet);
    #         return parent::_getDataSql($sFilter, $sOrderField, $sOrderDir, $iStart, $iPerPage);
    #     }
    :ok
  end

end
