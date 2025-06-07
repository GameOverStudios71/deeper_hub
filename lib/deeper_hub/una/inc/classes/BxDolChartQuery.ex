
defmodule DeeperHub.Inc.Classes.BxDolChartQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolChartQuery.php
  """

  @doc """
  Funcao correspondente ao metodo PHP getChartObject

  ## Parametros
    - sObject

  ## Retorno
    - any
  """
  def getChartObject(%{}) do
    # TODO: Implementacao futura
        # public function getChartObject($sObject)
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $sQuery = $oDb->prepare("SELECT * FROM `sys_objects_chart` WHERE `object` = ?", $sObject);
    # 
    #         $aObject = $oDb->getRow($sQuery);
    #         if(!$aObject || !is_array($aObject))
    #             return false;
    # 
    #         return $aObject;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getChartObjects

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getChartObjects(%{}) do
    # TODO: Implementacao futura
        # public function getChartObjects()
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $aObjects = $oDb->getAll("SELECT * FROM `sys_objects_chart` WHERE `active` = '1' ORDER BY `order` ASC");
    #         if(!$aObjects || !is_array($aObjects))
    #             return false;
    # 
    #         return $aObjects;
    #     }
    :ok
  end

end
