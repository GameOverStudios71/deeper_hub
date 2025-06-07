
defmodule DeeperHub.Inc.Classes.BxReviewsMenuViewActions do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/reviews/classes/BxReviewsMenuViewActions.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aObject,oTemplate=false

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($aObject, $oTemplate = false)
    #     {
    #         $this->_sModule = 'bx_reviews';
    # 
    #         parent::__construct($aObject, $oTemplate);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemEditReview

  ## Parametros
    - aItem

  ## Retorno
    - any
  """
  def _getMenuItemEditReview(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemEditReview($aItem)
    #     {
    #         return $this->_getMenuItemByNameActions($aItem);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getMenuItemDeleteReview

  ## Parametros
    - aItem

  ## Retorno
    - any
  """
  def _getMenuItemDeleteReview(%{}) do
    # TODO: Implementacao futura
        # protected function _getMenuItemDeleteReview($aItem)
    #     {
    #         return $this->_getMenuItemByNameActions($aItem);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isContentPublic

  ## Parametros
    - iContentId,aPublicGroups=[]

  ## Retorno
    - any
  """
  def _isContentPublic(%{}) do
    # TODO: Implementacao futura
        # protected function _isContentPublic($iContentId, $aPublicGroups = []) {
    #         $CNF = &$this->_oModule->_oConfig->CNF;
    # 
    #         if(empty($CNF['FIELD_ALLOW_VIEW_TO']))
    #             return true;
    # 
    #         $aContentInfo = $iContentId == $this->_iContentId ? $this->_aContentInfo : $this->_oModule->_oDb->getContentInfoById($iContentId);
    #         if(!isset($aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']]))
    #             return true;
    # 
    #         if(empty($aPublicGroups))
    #             $aPublicGroups = [BX_DOL_PG_ALL, BX_DOL_PG_MEMBERS];
    # 
    #         return $aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']] < 0 || in_array($aContentInfo[$CNF['FIELD_ALLOW_VIEW_TO']], $aPublicGroups);
    #     }
    :ok
  end

end
