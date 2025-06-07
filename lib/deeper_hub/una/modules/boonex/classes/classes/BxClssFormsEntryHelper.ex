
defmodule DeeperHub.Inc.Classes.BxClssFormsEntryHelper do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/classes/classes/BxClssFormsEntryHelper.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - oModule

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($oModule)
    #     {
    #         parent::__construct($oModule);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP redirectAfterDelete

  ## Parametros
    - aContentInfo

  ## Retorno
    - any
  """
  def redirectAfterDelete(%{}) do
    # TODO: Implementacao futura
        # protected function redirectAfterDelete($aContentInfo)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if ($aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']] < 0)
    #             $oProfileContext = BxDolProfile::getInstance(abs($aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']]));
    #         
    #         $sUrl = BX_DOL_URL_ROOT;
    #         if ($oProfileContext)
    #             $sUrl = $oProfileContext->getUrl();
    # 
    #         $this->_redirectAndExit($sUrl, true, array(
    #             'account_id' => getLoggedId(),
    #             'profile_id' => bx_get_logged_profile_id(),
    #         ));
    #     }
    :ok
  end

end
