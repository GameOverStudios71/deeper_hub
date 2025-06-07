
defmodule DeeperHub.Inc.Classes.BxMapShowDb do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/mapshow/classes/BxMapShowDb.php
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
        # 
    #     function __construct(&$oConfig)
    #     {
    #         parent::__construct($oConfig);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getLngLatData

  ## Parametros
    - iLastId

  ## Retorno
    - any
  """
  def getLngLatData(%{}) do
    # TODO: Implementacao futura
        # public function getLngLatData($iLastId)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $iIntervalInHour = intval(getParam('bx_mapshow_initial_timeframe_users_shown_in_hours'));
    #         $sSql = "";
    #         $aBindings = array();
    #         if ($iLastId == 0) {
    #             $aBindings['interval'] = time() - $iIntervalInHour * 3600;
    #             $sSql = "`sys_accounts`.`added` > :interval "  ;
    #         }
    #         else{
    #             $aBindings['id'] = $iLastId;
    #             $sSql = "`" . $CNF['TABLE_ENTRIES'] . "`.`" . $CNF['FIELD_ID'] . "` > :id";
    #         }
    #         
    #         return $this->getAll("SELECT `" . $CNF['TABLE_ENTRIES'] . "`." . $CNF['FIELD_LNG'] . ", `" . $CNF['TABLE_ENTRIES'] . "`." . $CNF['FIELD_LAT'] . ", `" . $CNF['TABLE_ENTRIES'] . "`." . $CNF['FIELD_ID'] . " FROM `" . $CNF['TABLE_ENTRIES'] . "` LEFT JOIN `sys_accounts` ON `sys_accounts`.`id` = `" . $CNF['TABLE_ENTRIES'] . "`." . $CNF['FIELD_ACCOUNT_ID'] . "  WHERE " . $sSql, $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP addIpInfo

  ## Parametros
    - iAccountId,sIp,sLng,sLat

  ## Retorno
    - any
  """
  def addIpInfo(%{}) do
    # TODO: Implementacao futura
        # public function addIpInfo($iAccountId, $sIp, $sLng, $sLat)
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aBindings = array(
    #             'account_id' => $iAccountId,
    #             'lng' => $sLng,
    #             'lat' => $sLat
    #         );
    #         $this->query("INSERT INTO " . $CNF['TABLE_ENTRIES'] . " (" . $CNF['FIELD_ACCOUNT_ID'] . ", " . $CNF['FIELD_LNG'] . ", " . $CNF['FIELD_LAT'] . ") VALUES (:account_id, :lng, :lat)", $aBindings);
    #     }
    :ok
  end

end
