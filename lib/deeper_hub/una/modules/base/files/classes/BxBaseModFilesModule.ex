
defmodule DeeperHub.Inc.Classes.BxBaseModFilesModule do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/base/files/classes/BxBaseModFilesModule.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - &oConfig

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct(&$oConfig)
    #     {
    #         parent::__construct($oConfig);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceGetFile

  ## Parametros
    - iContentId,aParams=[]

  ## Retorno
    - any
  """
  def serviceGetFile(%{}) do
    # TODO: Implementacao futura
        # public function serviceGetFile ($iContentId, $aParams = []) 
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         $aContentInfo = $this->_oDb->getContentInfoById($iContentId);
    #         if(empty($aContentInfo) || !is_array($aContentInfo))
    #             return false;
    # 
    #         $sStorage = '';
    #         if(!empty($aParams['storage']))
    #             $sStorage = $aParams['storage'];
    #         else if(!empty($CNF['OBJECT_STORAGE']))
    #             $sStorage = $CNF['OBJECT_STORAGE'];
    #         else 
    #             return false;
    # 
    #         $oStorage = BxDolStorage::getObjectInstance($sStorage);
    #         if(!$oStorage)
    #             return false;
    # 
    #         $sFieldFileId = '';
    #         if(!empty($aParams['field']))
    #             $sFieldFileId = $aParams['field'];
    #         else if(!empty($CNF['FIELD_FILE_ID']))
    #             $sFieldFileId = $CNF['FIELD_FILE_ID'];
    #         else 
    #             return false;
    # 
    #         return $oStorage->getFile($aContentInfo[$sFieldFileId]);
    #     }
    :ok
  end

end
