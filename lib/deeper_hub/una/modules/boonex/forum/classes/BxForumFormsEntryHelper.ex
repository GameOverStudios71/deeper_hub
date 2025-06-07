
defmodule DeeperHub.Inc.Classes.BxForumFormsEntryHelper do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/forum/classes/BxForumFormsEntryHelper.php
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
  Funcao correspondente ao metodo PHP onDataAddAfter

  ## Parametros
    - iAccountId,iContentId

  ## Retorno
    - any
  """
  def onDataAddAfter(%{}) do
    # TODO: Implementacao futura
        # public function onDataAddAfter ($iAccountId, $iContentId)
    #     {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         $s = parent::onDataAddAfter($iAccountId, $iContentId);
    #         if(!empty($s))
    #             return $s;
    # 
    #         if(getParam($CNF['PARAM_AUTOSUBSCRIBE_CREATED']) == 'on')
    #             BxDolConnection::getObjectInstance($CNF['OBJECT_CONNECTION_SUBSCRIBERS'])->actionAdd($iContentId, BxDolProfile::getInstanceByAccount($iAccountId)->id());
    # 
    #         return '';
    #     }
    :ok
  end

end
