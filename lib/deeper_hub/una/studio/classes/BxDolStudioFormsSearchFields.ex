
defmodule DeeperHub.Inc.Classes.BxDolStudioFormsSearchFields do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//studio/classes/BxDolStudioFormsSearchFields.php
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
    #         $this->oDb = new BxDolStudioFormsQuery();
    # 
    #         $sModule = bx_get('module');
    #         if(!empty($sModule)) {
    #             $this->sModule = bx_process_input($sModule);
    #             $this->_aQueryAppend['module'] = $this->sModule;
    #         }
    # 
    #         $sForm = bx_get('form');
    #         if(!empty($sForm)) {
    #             $this->sForm = bx_process_input($sForm);
    #             $this->_aQueryAppend['form'] = $this->sForm;
    #         }
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
    #         if(empty($this->sForm))
    #             return array();
    # 
    #         $this->_aOptions['source'] = $this->oDb->prepareAsString($this->_aOptions['source'], $this->sForm);
    #         return parent::_getDataSql($sFilter, $sOrderField, $sOrderDir, $iStart, $iPerPage);
    #     }
    :ok
  end

end
