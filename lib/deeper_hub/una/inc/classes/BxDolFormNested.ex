
defmodule DeeperHub.Inc.Classes.BxDolFormNested do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolFormNested.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aInfo,oTemplate

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct ($aInfo, $oTemplate)
    #     {
    #         parent::__construct($aInfo, $oTemplate);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP genInputStandard

  ## Parametros
    - &aInput

  ## Retorno
    - any
  """
  def genInputStandard(%{}) do
    # TODO: Implementacao futura
        # 
    #     
    #     function genInputStandard(&$aInput)
    #     {
    #         if($aInput['type'] != 'checkbox')
    #             return parent::genInputStandard($aInput);
    # 
    #         $aInputHidden = $aInput;
    #         
    #         $aInputHidden['type'] = 'hidden';
    #         if (isset($aInput['checked']) and $aInput['checked'])
    #             $aInputHidden['value'] = '1';
    #         else
    #             $aInputHidden['value'] = '0';
    #         
    #         $sRv = parent::genInputStandard($aInputHidden);
    #         $aInput['name'] = 'chk_' . $aInput['name'];
    #         $aInput['attrs']['onchange'] = 'BxDolForm.setCheckBoxValue(this)';
    #         $sRv .= parent::genInputStandard($aInput);
    #    
    #         return $sRv;
    #     }
    :ok
  end

end
