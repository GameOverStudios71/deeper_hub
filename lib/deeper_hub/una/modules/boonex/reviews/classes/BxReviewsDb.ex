
defmodule DeeperHub.Inc.Classes.BxReviewsDb do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/reviews/classes/BxReviewsDb.php
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
  Funcao correspondente ao metodo PHP getVotingOptionLKey

  ## Parametros
    - iOptionId

  ## Retorno
    - any
  """
  def getVotingOptionLKey(%{}) do
    # TODO: Implementacao futura
        # public function getVotingOptionLKey($iOptionId) {
    #         return $this->getOne("SELECT `lkey` FROM `bx_reviews_voting_options` WHERE `id` = :id", [
    #             'id' => $iOptionId,
    #         ]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getVotingOptions

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getVotingOptions(%{}) do
    # TODO: Implementacao futura
        # public function getVotingOptions() {
    #         return $this->getAll("SELECT `id`, `lkey` FROM `bx_reviews_voting_options` ORDER BY `order`");
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getReviewedContent

  ## Parametros
    - iLimitFrom,iLimitNum,sOrderBy='avg_rating'

  ## Retorno
    - any
  """
  def getReviewedContent(%{}) do
    # TODO: Implementacao futura
        # public function getReviewedContent($iLimitFrom, $iLimitNum, $sOrderBy = 'avg_rating') {
    #         $CNF = &$this->_oConfig->CNF;
    # 
    #         if ($sOrderBy != 'avg_rating' && $sOrderBy != 'reviews_num') $sOrderBy = 'avg_rating';
    # 
    #         return $this->getAll("
    #             SELECT `bx_reviews_reviews`.`{$CNF['FIELD_REVIEWED_PROFILE']}`, AVG(NULLIF(`{$CNF['FIELD_VOTING_AVG']}`, 0)) AS `avg_rating`, COUNT(*) AS `reviews_num`
    #             FROM `bx_reviews_reviews`
    #             JOIN `sys_profiles` ON `sys_profiles`.`id` = `bx_reviews_reviews`.`{$CNF['FIELD_ID']}`  
    #             WHERE `{$CNF['FIELD_REVIEWED_PROFILE']}` > 0 AND `sys_profiles`.`status` = 'active'
    #             GROUP BY `{$CNF['FIELD_REVIEWED_PROFILE']}`
    #             ORDER BY `{$sOrderBy}` DESC
    #             LIMIT :from, :num
    #         ", [
    #             'from' => $iLimitFrom,
    #             'num' => $iLimitNum,
    #         ]);
    #     }
    :ok
  end

end
