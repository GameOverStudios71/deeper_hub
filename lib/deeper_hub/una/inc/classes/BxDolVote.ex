
defmodule DeeperHub.Inc.Classes.BxDolVote do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolVote.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - sSystem,iId,iInit=true,oTemplate=false

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # protected function __construct($sSystem, $iId, $iInit = true, $oTemplate = false)
    #     {
    #         parent::__construct($sSystem, $iId, $iInit, $oTemplate);
    #         if(empty($this->_sSystem))
    #             return;
    # 
    #         $this->_aVote = [];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectInstance

  ## Parametros
    - sSys,iId,iInit=true,oTemplate=false

  ## Retorno
    - any
  """
  def getObjectInstance(%{}) do
    # TODO: Implementacao futura
        # public static function getObjectInstance($sSys, $iId, $iInit = true, $oTemplate = false)
    #     {
    #         $sKey = 'BxDolVote!' . $sSys . $iId . ($oTemplate ? $oTemplate->getClassName() : '');
    #         if(isset($GLOBALS['bxDolClasses'][$sKey]))
    #             return $GLOBALS['bxDolClasses'][$sKey];
    # 
    #         $aSystems = self::getSystems();
    #         if(!isset($aSystems[$sSys]))
    #             return null;
    # 
    #         $sClassName = 'BxTemplVoteLikes';
    #         if(!empty($aSystems[$sSys]['class_name'])) {
    #             $sClassName = $aSystems[$sSys]['class_name'];
    #             if(!empty($aSystems[$sSys]['class_file']))
    #                 require_once(BX_DIRECTORY_PATH_ROOT . $aSystems[$sSys]['class_file']);
    #         }
    # 
    #         $o = new $sClassName($sSys, $iId, false, $oTemplate);
    #         if($iInit && method_exists($o, 'init'))
    #             $o->init($iId);
    # 
    #         return ($GLOBALS['bxDolClasses'][$sKey] = $o);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP onAuthorDelete

  ## Parametros
    - iAuthorId

  ## Retorno
    - any
  """
  def onAuthorDelete(%{}) do
    # TODO: Implementacao futura
        # public static function onAuthorDelete ($iAuthorId)
    #     {
    #         $aSystems = self::getSystems();
    #         foreach($aSystems as $sSystem => $aSystem)
    #             self::getObjectInstance($sSystem, 0)->getQueryObject()->deleteAuthorEntries($iAuthorId);
    # 
    #         return true;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getObjectAuthorId

  ## Parametros
    - iObjectId=0

  ## Retorno
    - any
  """
  def getObjectAuthorId(%{}) do
    # TODO: Implementacao futura
        # public function getObjectAuthorId($iObjectId = 0)
    #     {
    #     	if(empty($this->_aSystem['trigger_field_author']))
    #             return 0;
    # 
    #         return $this->_oQuery->getObjectAuthorId($iObjectId ? $iObjectId : $this->getId());
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isUndo

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def isUndo(%{}) do
    # TODO: Implementacao futura
        # public function isUndo()
    #     {
    #         return (int)$this->_aSystem['is_undo'] == 1;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getType

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getType(%{}) do
    # TODO: Implementacao futura
        # public function getType()
    #     {
    #         return $this->_sType;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getMinValue

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getMinValue(%{}) do
    # TODO: Implementacao futura
        # public function getMinValue()
    #     {
    #         return (int)$this->_aSystem['min_value'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getMaxValue

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getMaxValue(%{}) do
    # TODO: Implementacao futura
        # public function getMaxValue()
    #     {
    #         return (int)$this->_aSystem['max_value'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStatCounter

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getStatCounter(%{}) do
    # TODO: Implementacao futura
        # public function getStatCounter()
    #     {
    #         $aVote = $this->_getVote();
    #         return $aVote['count'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getStatRate

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getStatRate(%{}) do
    # TODO: Implementacao futura
        # public function getStatRate()
    #     {
    #         $aVote = $this->_getVote();
    #         return $aVote['rate'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getSocketName

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getSocketName(%{}) do
    # TODO: Implementacao futura
        # public function getSocketName()
    #     {
    #         return $this->_sSystem . '_' . $this->_sType;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionVote

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionVote(%{}) do
    # TODO: Implementacao futura
        # public function actionVote()
    #     {
    #         if(!$this->isEnabled())
    #             return echoJson(['code' => BX_DOL_OBJECT_ERR_NOT_AVAILABLE, 'message' => _t('_vote_err_not_enabled')]);
    # 
    #         $aVoteData = $this->_getVoteData();
    #         $aRequestParamsData = $this->_getRequestParamsData();
    #         if($aVoteData === false)
    #             return echoJson(['code' => BX_DOL_OBJECT_ERR_WRONG_DATE]);
    # 
    #         return echoJson($this->vote($aVoteData, $aRequestParamsData));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP vote

  ## Parametros
    - aVoteData=[],aRequestParamsData=[]

  ## Retorno
    - any
  """
  def vote(%{}) do
    # TODO: Implementacao futura
        # public function vote($aVoteData = [], $aRequestParamsData = [])
    #     {
    #         $iObjectId = $this->getId();
    #         $iObjectAuthorId = $this->getObjectAuthorId($iObjectId);
    #         $iAuthorId = $this->_getAuthorId();
    #         $iAuthorIp = $this->_getAuthorIp();
    # 
    #         $bUndo = $this->isUndo();
    #         $bVoted = $this->isPerformed($iObjectId, $iAuthorId);
    #         $bPerformUndo = $bVoted && $bUndo;
    # 
    #         if(!$bPerformUndo && !$this->isAllowedVote())
    #             return ['code' => BX_DOL_OBJECT_ERR_ACCESS_DENIED, 'message' => $this->msgErrAllowedVote()];
    # 
    #         if($this->_isDuplicate($iObjectId, $iAuthorId, $iAuthorIp, $bVoted))
    #             return ['code' => BX_DOL_OBJECT_ERR_DUPLICATE, 'message' => _t('_vote_err_duplicate_vote')];
    # 
    #         if($bPerformUndo) {
    #             $aTrack = $this->_getTrack($iObjectId, $iAuthorId);
    #             if(!empty($aTrack) && is_array($aTrack))
    #                 $aVoteData = array_intersect_key($aTrack, $aVoteData);
    #         }
    # 
    #         $iId = $this->_putVoteData($iObjectId, $iAuthorId, $iAuthorIp, $aVoteData, $bPerformUndo);
    #         if($iId === false)
    #             return ['code' => BX_DOL_OBJECT_ERR_CANNOT_PERFORM];
    # 
    #         if(!$bPerformUndo)
    #             $this->isAllowedVote(true);
    # 
    #         $this->_trigger();
    # 
    #         /**
    #          * @hooks
    #          * @hookdef hook-vote-undo 'vote', 'undo' - hook on cancel vote 
    #          * - $unit_name - equals `vote`
    #          * - $action - equals `undo` 
    #          * - $object_id - vote id 
    #          * - $sender_id - profile_id for vote's author
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `object_system` - [string] system name, ex: bx_posts
    #          *      - `object_id` - [int] reported object id 
    #          *      - `object_author_id` - [int] author's profile_id for reported object_id 
    #          * @hook @ref hook-vote-undo
    #          */
    #         bx_alert($this->_sSystem, ($bPerformUndo ? 'un' : '') . 'doVote', $iObjectId, $iAuthorId, array_merge(['vote_id' => $iId, 'vote_author_id' => $iAuthorId, 'object_author_id' => $iObjectAuthorId], $aVoteData));
    #         /**
    #          * @hooks
    #          * @hookdef hook-vote-do 'vote', 'do' - hook on new vote 
    #          * - $unit_name - equals `vote`
    #          * - $action - equals `do` 
    #          * - $object_id - vote id 
    #          * - $sender_id - profile_id for vote's author
    #          * - $extra_params - array of additional params with the following array keys:
    #          *      - `object_system` - [string] system name, ex: bx_posts
    #          *      - `object_id` - [int] reported object id 
    #          *      - `object_author_id` - [int] author's profile_id for reported object_id 
    #          * @hook @ref hook-vote-do
    #          */
    #         
    #         bx_alert('vote', ($bPerformUndo ? 'un' : '') . 'do', $iId, $iAuthorId, array_merge(['object_system' => $this->_sSystem, 'object_id' => $iObjectId, 'object_author_id' => $iObjectAuthorId], $aVoteData));
    # 
    #         $aResult = $this->_returnVoteData($iObjectId, $iAuthorId, $iAuthorIp, $aVoteData, !$bVoted, $aRequestParamsData);
    # 
    #         if(($oSockets = BxDolSockets::getInstance()) && $oSockets->isEnabled())
    #             $oSockets->sendEvent($this->getSocketName(), $iObjectId, 'voted', json_encode($this->_returnVoteDataForSocket($aResult)));
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetVotedBy

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionGetVotedBy(%{}) do
    # TODO: Implementacao futura
        # public function actionGetVotedBy()
    #     {
    #         if (!$this->isEnabled())
    #            return '';
    # 
    #         return $this->_getVotedBy();
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowedVote

  ## Parametros
    - isPerformAction=false

  ## Retorno
    - any
  """
  def isAllowedVote(%{}) do
    # TODO: Implementacao futura
        # public function isAllowedVote($isPerformAction = false)
    #     {
    #         if(isAdmin())
    #             return true;
    #         
    #         if(!$this->checkAction('vote', $isPerformAction))
    #             return false;
    # 
    #         $aObject = $this->_oQuery->getObjectInfo($this->_iId);
    #         if(empty($aObject) || !is_array($aObject))
    #             return false;
    # 
    #         return $this->_isAllowedVoteByObject($aObject);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrAllowedVote

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def msgErrAllowedVote(%{}) do
    # TODO: Implementacao futura
        # public function msgErrAllowedVote()
    #     {
    #         $sMsg = $this->checkActionErrorMsg('vote');
    #         if(empty($sMsg))
    #             $sMsg = _t('_sys_txt_access_denied');
    # 
    #         return $sMsg;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowedVoteView

  ## Parametros
    - isPerformAction=false

  ## Retorno
    - any
  """
  def isAllowedVoteView(%{}) do
    # TODO: Implementacao futura
        # public function isAllowedVoteView($isPerformAction = false)
    #     {
    #         if(isAdmin())
    #             return true;
    # 
    #         return $this->checkAction('vote_view', $isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrAllowedVoteView

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def msgErrAllowedVoteView(%{}) do
    # TODO: Implementacao futura
        # public function msgErrAllowedVoteView()
    #     {
    #         return $this->checkActionErrorMsg('vote_view');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP isAllowedVoteViewVoters

  ## Parametros
    - isPerformAction=false

  ## Retorno
    - any
  """
  def isAllowedVoteViewVoters(%{}) do
    # TODO: Implementacao futura
        # public function isAllowedVoteViewVoters($isPerformAction = false)
    #     {
    #         if(isAdmin())
    #             return true;
    # 
    #         return $this->checkAction('vote_view_voters', $isPerformAction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP msgErrAllowedVoteViewVoters

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def msgErrAllowedVoteViewVoters(%{}) do
    # TODO: Implementacao futura
        # public function msgErrAllowedVoteViewVoters()
    #     {
    #         return $this->checkActionErrorMsg('vote_view_voters');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isDuplicate

  ## Parametros
    - iObjectId,iAuthorId,iAuthorIp,bVoted

  ## Retorno
    - any
  """
  def _isDuplicate(%{}) do
    # TODO: Implementacao futura
        # protected function _isDuplicate($iObjectId, $iAuthorId, $iAuthorIp, $bVoted)
    #     {
    #         return false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isAllowedVoteByObject

  ## Parametros
    - aObject

  ## Retorno
    - any
  """
  def _isAllowedVoteByObject(%{}) do
    # TODO: Implementacao futura
        # protected function _isAllowedVoteByObject($aObject)
    #     {
    #         return bx_srv($this->_aSystem['module'], 'check_allowed_view_for_profile', [$aObject]) === CHECK_ACTION_RESULT_ALLOWED;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getVoteData

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def _getVoteData(%{}) do
    # TODO: Implementacao futura
        # protected function _getVoteData()
    #     {
    #         $iValue = bx_get('value');
    #         if($iValue === false)
    #             return false;
    # 
    #         $iValue = bx_process_input($iValue, BX_DATA_INT);
    # 
    #         $iMinValue = $this->getMinValue();
    #         if($iValue < $iMinValue)
    #             $iValue = $iMinValue;
    # 
    #         $iMaxValue = $this->getMaxValue();
    #         if($iValue > $iMaxValue)
    #             $iValue = $iMaxValue;
    # 
    #         return array('value' => $iValue);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _putVoteData

  ## Parametros
    - iObjectId,iAuthorId,iAuthorIp,aData,bPerformUndo

  ## Retorno
    - any
  """
  def _putVoteData(%{}) do
    # TODO: Implementacao futura
        # protected function _putVoteData($iObjectId, $iAuthorId, $iAuthorIp, $aData, $bPerformUndo)
    #     {
    #         return $this->_oQuery->putVote($iObjectId, $iAuthorId, $iAuthorIp, $aData, $bPerformUndo);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _returnVoteData

  ## Parametros
    - iObjectId,iAuthorId,iAuthorIp,aData,bVoted,aParams=[]

  ## Retorno
    - any
  """
  def _returnVoteData(%{}) do
    # TODO: Implementacao futura
        # protected function _returnVoteData($iObjectId, $iAuthorId, $iAuthorIp, $aData, $bVoted, $aParams = [])
    #     {
    #         $bUndo = $this->isUndo();
    #         $aVote = $this->_getVote($iObjectId, true);
    # 
    #         $aResult = [
    #             'code' => 0,
    #             'rate' => $aVote['rate'],
    #             'count' => $aVote['count'],
    #             'countf' => (int)$aVote['count'] > 0 ? $this->_getCounterLabel($aVote['count'], $aParams) : '',
    #             'label_use' => $this->_useIconAs($aParams),
    #             'label_icon' => $this->_getIconDo($bVoted),
    #             'label_emoji' => $this->_getEmojiDo($bVoted),
    #             'label_image' => $this->_getImageDo($bVoted),
    #             'label_title' => _t($this->_getTitleDo($bVoted)),
    #             'voted' => $bVoted,
    #             'disabled' => $bVoted && !$bUndo,
    #         ];
    # 
    #         $aResult['api'] = [
    #             'performer_id' => $iAuthorId,
    #             'is_voted' => $aResult['voted'],
    #             'is_disabled' => $aResult['disabled'],
    #             'value' => $aResult['voted'] ? $aData['value'] : 0,
    #             'icon' => $aResult['label_emoji'],
    #             'title' => $aResult['label_title'],
    #             'counter' => $this->getVote()
    #         ];
    # 
    #         return $aResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _returnVoteDataForSocket

  ## Parametros
    - aData,aMask=[]

  ## Retorno
    - any
  """
  def _returnVoteDataForSocket(%{}) do
    # TODO: Implementacao futura
        # protected function _returnVoteDataForSocket($aData, $aMask = [])
    #     {
    #         if(empty($aMask) || !is_array($aMask))
    #             $aMask = ['code', 'rate', 'count', 'countf', 'api'];
    # 
    #         return array_intersect_key($aData, array_flip($aMask));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getVote

  ## Parametros
    - iObjectId=0,bForceGet=false

  ## Retorno
    - any
  """
  def _getVote(%{}) do
    # TODO: Implementacao futura
        # protected function _getVote($iObjectId = 0, $bForceGet = false)
    #     {
    #         if(!empty($this->_aVote) && !$bForceGet)
    #             return $this->_aVote;
    # 
    #         if(empty($iObjectId))
    #             $iObjectId = $this->getId();
    # 
    #         $this->_aVote = $this->_oQuery->getVote($iObjectId);
    #         return $this->_aVote;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _isVote

  ## Parametros
    - iObjectId=0,bForceGet=false

  ## Retorno
    - any
  """
  def _isVote(%{}) do
    # TODO: Implementacao futura
        # protected function _isVote($iObjectId = 0, $bForceGet = false)
    #     {
    #         $aVote = $this->_getVote($iObjectId, $bForceGet);
    # 
    #         return (int)$aVote['count'] > 0;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getTrack

  ## Parametros
    - iObjectId,iAuthorId

  ## Retorno
    - any
  """
  def _getTrack(%{}) do
    # TODO: Implementacao futura
        # protected function _getTrack($iObjectId, $iAuthorId)
    #     {
    #         return $this->_oQuery->getTrack($iObjectId, $iAuthorId);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getIconDo

  ## Parametros
    - bVoted

  ## Retorno
    - any
  """
  def _getIconDo(%{}) do
    # TODO: Implementacao futura
        # protected function _getIconDo($bVoted)
    #     {
    #     	return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getImageDo

  ## Parametros
    - bVoted

  ## Retorno
    - any
  """
  def _getImageDo(%{}) do
    # TODO: Implementacao futura
        # protected function _getImageDo($bVoted)
    #     {
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getEmojiDo

  ## Parametros
    - bVoted

  ## Retorno
    - any
  """
  def _getEmojiDo(%{}) do
    # TODO: Implementacao futura
        # protected function _getEmojiDo($bVoted)
    #     {
    #     	return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getTitleDo

  ## Parametros
    - bVoted

  ## Retorno
    - any
  """
  def _getTitleDo(%{}) do
    # TODO: Implementacao futura
        # protected function _getTitleDo($bVoted)
    #     {
    #     	return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getTitleDoBy

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def _getTitleDoBy(%{}) do
    # TODO: Implementacao futura
        # protected function _getTitleDoBy($aParams = [])
    #     {
    #     	return _t('_vote_do_by');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _useIconAs

  ## Parametros
    - aParams=[]

  ## Retorno
    - any
  """
  def _useIconAs(%{}) do
    # TODO: Implementacao futura
        # protected function _useIconAs($aParams = [])
    #     {
    #     	return 'emoji';
    #     }
    :ok
  end

end
