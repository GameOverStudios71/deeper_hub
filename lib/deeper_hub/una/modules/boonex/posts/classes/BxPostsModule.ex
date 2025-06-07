
defmodule DeeperHub.Inc.Classes.BxPostsModule do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/posts/classes/BxPostsModule.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - &aModule

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # 
    #     function __construct(&$aModule)
    #     {
    #         parent::__construct($aModule);
    # 
    #         $CNF = &$this->_oConfig->CNF;
    #         $this->_aSearchableNamesExcept = array_merge($this->_aSearchableNamesExcept, array(
    #             $CNF['FIELD_PUBLISHED'],
    #             $CNF['FIELD_ANONYMOUS'],
    #             $CNF['FIELD_ALLOW_COMMENTS']
    #         ));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceCheckAllowedCommentsPost

  ## Parametros
    - iContentId,sObjectComments

  ## Retorno
    - any
  """
  def serviceCheckAllowedCommentsPost(%{}) do
    # TODO: Implementacao futura
        # public function serviceCheckAllowedCommentsPost($iContentId, $sObjectComments) 
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aContentInfo = $this->_oDb->getContentInfoById($iContentId);
    #         if ($aContentInfo && $aContentInfo[$CNF['FIELD_ALLOW_COMMENTS']] == 0)
    #             return false;
    #         
    #         return parent::serviceCheckAllowedCommentsPost($iContentId, $sObjectComments);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP serviceCheckAllowedCommentsView

  ## Parametros
    - iContentId,sObjectComments

  ## Retorno
    - any
  """
  def serviceCheckAllowedCommentsView(%{}) do
    # TODO: Implementacao futura
        # public function serviceCheckAllowedCommentsView($iContentId, $sObjectComments) 
    #     {
    #         $CNF = &$this->_oConfig->CNF;
    #         $aContentInfo = $this->_oDb->getContentInfoById($iContentId);
    #         if ($aContentInfo && $aContentInfo[$CNF['FIELD_ALLOW_COMMENTS']] == 0)
    #             return false;
    # 
    #         return parent::serviceCheckAllowedCommentsView($iContentId, $sObjectComments);
    #     }
    :ok
  end

end
