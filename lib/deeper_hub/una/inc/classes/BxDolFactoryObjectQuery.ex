
defmodule DeeperHub.Inc.Classes.BxDolFactoryObjectQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolFactoryObjectQuery.php
  """

  @doc """
  Funcao correspondente ao metodo PHP getObjectFromTable

  ## Parametros
    - sObject,sTable

  ## Retorno
    - any
  """
  def getObjectFromTable(%{}) do
    # TODO: Implementacao futura
        # public function getObjectFromTable($sObject, $sTable)
    #     {
    #         $oDb = BxDolDb::getInstance();
    # 
    #         $sQuery = $oDb->prepare("SELECT * FROM `$sTable` WHERE `object` = ?", $sObject);
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
  Funcao correspondente ao metodo PHP getObjectsFromTable

  ## Parametros
    - sTable

  ## Retorno
    - any
  """
  def getObjectsFromTable(%{}) do
    # TODO: Implementacao futura
        # public function getObjectsFromTable ($sTable)
    #     {
    #         $aObjects = BxDolDb::getInstance()->getAll("SELECT * FROM `$sTable`");
    #         if(empty($aObjects) || !is_array($aObjects))
    #             return array();
    # 
    #         return $aObjects;
    #     }
    :ok
  end

end
