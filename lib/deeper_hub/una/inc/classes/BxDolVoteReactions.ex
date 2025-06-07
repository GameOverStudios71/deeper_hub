
defmodule DeeperHub.Inc.Classes.BxDolVoteReactions do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolVoteReactions.php
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
        # public function __construct($sSystem, $iId, $iInit = true, $oTemplate = false)
    #     {
    #         parent::__construct($sSystem, $iId, $iInit, $oTemplate);
    # 
    #         $this->_oQuery = new BxDolVoteReactionsQuery($this);
    #         $this->_sType = BX_DOL_VOTE_TYPE_REACTIONS;
    # 
    #         $this->_sMenuDoVote = 'sys_vote_reactions_do';
    # 
    #         $this->_sDataList = 'sys_vote_reactions';
    #         $this->_aDataList = [];
    # 
    #         $this->_sDefault = 'default';
    # 
    #         $this->_bQuickMode = getParam('sys_vote_reactions_quick_mode') == 'on';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP init

  ## Parametros
    - iId

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function init($iId)
    #     {
    #         if(!parent::init($iId))
    #             return false;
    # 
    #         $aReactions = BxDolFormQuery::getDataItems($this->_sDataList, false, BX_DATA_VALUES_ALL);
    # 
    #         $sDefault = '';
    #         foreach($aReactions as $sReaction => $aReaction) {
    #             $aData = !empty($aReaction['Data']) ? unserialize($aReaction['Data']) : array();
    # 
    #             if(!empty($aData['default']))
    #                 $sDefault = $sReaction;
    # 
    #             $this->_aDataList[$sReaction] = array(
    #                 'name' => $sReaction,
    #                 'title' => $aReaction['LKey'],
    #                 'title_aux' => $aReaction['LKey2'],
    #                 'use' => isset($aData['use']) ? $aData['use'] : 'emoji',
    #                 'icon' => isset($aData['icon']) ? $aData['icon'] : '',
    #                 'emoji' => isset($aData['emoji']) ? $aData['emoji'] : '',
    #                 'image' => isset($aData['image']) ? $aData['image'] : '',
    #                 'color' => isset($aData['color']) ? $aData['color'] : '',
    #                 'weight' => isset($aData['weight']) ? $aData['weight'] : 1,
    #                 'default' => isset($aData['default']) ? $aData['default'] : '',
    #             );
    #         }
    # 
    #         $this->_bSingleMode = count($this->_aDataList) == 1;
    # 
    #         if(empty($sDefault) && !empty($this->_aDataList))
    #             $sDefault = current(array_keys($this->_aDataList));
    # 
    #         if(!empty($sDefault)) {
    #             $aDefault = $this->_aDataList[$sDefault];
    #             if(((!$this->_bQuickMode && !$this->_bSingleMode) || $this->_bApi) && isset($aDefault['default'])) {
    #                 if(is_array($aDefault['default']))
    #                     $aDefault = array_merge ($aDefault, $aDefault['default']);
    #                 else
    #                     $aDefault['icon'] = $aDefault['default'];
    #             }
    # 
    #             $this->_aDataList[$this->_sDefault] = $aDefault;
    #         }
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getValue

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getValue(%{}) do
    # TODO: Implementacao futura
        # public function getValue()
    #     {
    #         return (int)$this->_aSystem['min_value'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getDefault

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getDefault(%{}) do
    # TODO: Implementacao futura
        # public function getDefault()
    #     {
    #         return $this->_sDefault;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getReaction

  ## Parametros
    - sName

  ## Retorno
    - any
  """
  def getReaction(%{}) do
    # TODO: Implementacao futura
        # public function getReaction($sName)
    #     {
    #         if(empty($this->_aDataList))
    #             $this->getReactions();
    # 
    #         return !empty($this->_aDataList[$sName]) ? $this->_aDataList[$sName] : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getReactions

  ## Parametros
    - bFullInfo=false

  ## Retorno
    - any
  """
  def getReactions(%{}) do
    # TODO: Implementacao futura
        # public function getReactions($bFullInfo = false)
    #     {
    #         return $bFullInfo ? $this->_aDataList : array_keys($this->_aDataList);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getTrackBy

  ## Parametros
    - aParams

  ## Retorno
    - any
  """
  def getTrackBy(%{}) do
    # TODO: Implementacao futura
        # public function getTrackBy($aParams)
    #     {
    #         return $this->_oQuery->getTrackBy($aParams);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getIcon

  ## Parametros
    - sReaction,bWithColor=true

  ## Retorno
    - any
  """
  def getIcon(%{}) do
    # TODO: Implementacao futura
        # public function getIcon($sReaction, $bWithColor = true)
    #     {
    #         $aReaction = isset($this->_aDataList[$sReaction]) ? $this->_aDataList[$sReaction] : $this->_aDataList[$this->_sDefault];
    # 
    #     	return $aReaction['icon'] . ($bWithColor && !empty($aReaction['color']) ? ' ' . $aReaction['color'] : '');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getEmoji

  ## Parametros
    - sReaction,bWithColor=true

  ## Retorno
    - any
  """
  def getEmoji(%{}) do
    # TODO: Implementacao futura
        # public function getEmoji($sReaction, $bWithColor = true)
    #     {
    #         $aReaction = isset($this->_aDataList[$sReaction]) ? $this->_aDataList[$sReaction] : $this->_aDataList[$this->_sDefault];
    # 
    #     	return $aReaction['emoji'];
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getImage

  ## Parametros
    - sReaction,bWithColor=true

  ## Retorno
    - any
  """
  def getImage(%{}) do
    # TODO: Implementacao futura
        # public function getImage($sReaction, $bWithColor = true)
    #     {
    #         $aReaction = isset($this->_aDataList[$sReaction]) ? $this->_aDataList[$sReaction] : $this->_aDataList[$this->_sDefault];
    # 
    #         list($sIconFont, $sIconUrl, $sIconA, $sIconHtml) = BxTemplFunctions::getInstanceWithTemplate($this->_oTemplate)->getIcon($aReaction['image']);
    #         if ($sIconUrl)
    #             return $this->_oTemplate->parseImage($sIconUrl, ['class' => 'sys-icon-image']);
    # 
    #     	return $sIconHtml;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP actionGetDoVotePopup

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def actionGetDoVotePopup(%{}) do
    # TODO: Implementacao futura
        # public function actionGetDoVotePopup()
    #     {
    #         if(!$this->isEnabled())
    #            return '';
    # 
    #         return $this->_getDoVotePopup((int)bx_get('value'));
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
    #         if(!$this->isEnabled())
    #            return '';
    # 
    #         $aParams = array();
    # 
    #         $sReaction = bx_get('reaction');
    #         if($sReaction !== false) {
    #             $sReaction = bx_process_input($sReaction);
    #             
    #             $aReactions = $this->getReactions();
    #             if(!in_array($sReaction, $aReactions))
    #                 $sReaction = $this->_sDefault;
    # 
    #             $aParams['reaction'] = $sReaction;
    #         }
    # 
    #         return $this->_getVotedBy($aParams);
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
    #         foreach($aVote as $sKey => $iValue)
    #             if(strpos($sKey, 'count_') !== false && !empty($iValue))
    #                 return true;
    # 
    #         return false;
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
    #         return $bVoted && !$this->isUndo();
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
    #         $aData = parent::_getVoteData();
    #         if($aData === false)
    #             return false;
    # 
    #         $sReaction = bx_get('reaction');
    #         if($sReaction === false)
    #             return false;
    # 
    #         $aData['reaction'] = bx_process_input($sReaction);
    #         return $aData;
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
    #         $aReactions = $this->getReactions(true);
    #         $sReaction = $aData['reaction'];
    # 
    #         $bUndo = $this->isUndo();
    #         $bDisabled = $bVoted && !$bUndo;
    # 
    #         $aVote = $this->_getVote($iObjectId, true);
    #         $aTrack = $bVoted ? $this->_getTrack($iObjectId, $iAuthorId) : [];
    # 
    #         $sSwitchTo = $bVoted ? $sReaction : $this->_sDefault;
    # 
    #         $sLabelUse = !empty($aReactions[$sSwitchTo]['use']) ? $aReactions[$sSwitchTo]['use'] : 'emoji';
    #         $sLabelIcon = $this->_getIconDoWithTrack($bVoted, $aTrack);
    #         if(!$bVoted && $sLabelUse != 'icon') {
    #             $sLabelUse = 'icon';
    #             $sLabelIcon = $this->_oTemplate->parseIcon($sLabelIcon);
    #         }
    # 
    #         $sJsClick = '';
    #         if(!$bDisabled)
    #             $sJsClick = $bVoted && $bUndo ? $this->getJsClickDo($sReaction) : $this->getJsClick();
    # 
    #         $iTotalC = $iTotalS = 0;
    #         foreach(array_keys($aReactions) as $sName) {
    #             $iTotalC += (int)$aVote['count_' . $sName];
    #             $iTotalS += (int)$aVote['sum_' . $sName];
    #         }
    #         $fTotalR = $iTotalC != 0 ? round($iTotalS / $iTotalC, 2) : 0;
    # 
    #         $iCount = (int)$aVote['count_' . $sReaction];
    #         $aResult = [
    #             'code' => 0,
    #             'reaction' => $this->_bApi ? $aReactions[$sSwitchTo]['name'] : $sReaction,
    #             'rate' => $aVote['rate_' . $sReaction],
    #             'count' => $iCount,
    #             'countf' => $iCount > 0 ? $this->_getCounterLabel($iCount, array('reaction' => $sReaction)) : '',
    #             'label_use' => $sLabelUse,
    #             'label_icon' => $sLabelIcon,
    #             'label_emoji' => $this->_getEmojiDoWithTrack($bVoted, $aTrack),
    #             'label_image' => $this->_getImageDoWithTrack($bVoted, $aTrack),
    #             'label_title' => _t($this->_getTitleDoWithTrack($bVoted, $aTrack)),
    #             'label_click' => $sJsClick,
    #             'voted' => $bVoted,
    #             'disabled' => $bVoted && !$this->isUndo(),
    #             'total' => [
    #                 'rate' => $fTotalR,
    #                 'count' => $iTotalC,
    #                 'countf' => $iTotalC > 0 ? $this->_getCounterLabel($iTotalC, ['show_counter_label_icon' => false, 'reaction' => '']) : '',
    #             ]
    #         ];
    # 
    #         $sDefault = $this->getDefault();
    #         $aDefault = $this->getReaction($sDefault);
    #         $aDefaultInfo = $this->getReaction($aDefault['name']);
    # 
    #         $aResult['api'] = [
    #             'performer_id' => $iAuthorId,
    #             'is_voted' => $aResult['voted'],
    #             'is_disabled' => $aResult['disabled'],
    #             'reaction' => $aResult['voted'] ? $aResult['reaction'] : $sDefault,
    #             'icon' => !empty($aResult['label_emoji']) ? $aResult['label_emoji'] : $aDefaultInfo['emoji'],
    #             'title' => !empty($aResult['label_title']) ? $aResult['label_title'] : '',
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
    #         return parent::_returnVoteDataForSocket($aData, ['code', 'reaction', 'rate', 'count', 'countf', 'total', 'api']);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getIconDoWithTrack

  ## Parametros
    - bVoted,aTrack=[]

  ## Retorno
    - any
  """
  def _getIconDoWithTrack(%{}) do
    # TODO: Implementacao futura
        # protected function _getIconDoWithTrack($bVoted, $aTrack = [])
    #     {
    #         $sReaction = $bVoted ? $aTrack['reaction'] : $this->_sDefault;
    # 
    #     	return $this->getIcon($sReaction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getEmojiDoWithTrack

  ## Parametros
    - bVoted,aTrack=[]

  ## Retorno
    - any
  """
  def _getEmojiDoWithTrack(%{}) do
    # TODO: Implementacao futura
        # protected function _getEmojiDoWithTrack($bVoted, $aTrack = [])
    #     {
    #         $sReaction = $bVoted ? $aTrack['reaction'] : $this->_sDefault;
    # 
    #     	return $this->getEmoji($sReaction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getImageDoWithTrack

  ## Parametros
    - bVoted,aTrack=[]

  ## Retorno
    - any
  """
  def _getImageDoWithTrack(%{}) do
    # TODO: Implementacao futura
        # protected function _getImageDoWithTrack($bVoted, $aTrack = [])
    #     {
    #         $sReaction = $bVoted ? $aTrack['reaction'] : $this->_sDefault;
    # 
    #     	return $this->getImage($sReaction);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getTitleDoWithTrack

  ## Parametros
    - bVoted,aTrack=[]

  ## Retorno
    - any
  """
  def _getTitleDoWithTrack(%{}) do
    # TODO: Implementacao futura
        # protected function _getTitleDoWithTrack($bVoted, $aTrack = [])
    #     {
    #         $sReaction = $bVoted ? $aTrack['reaction'] : $this->_sDefault;
    # 
    #     	return $this->_aDataList[$sReaction]['title'];
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
    #         if(isset($aParams['show_counter_style']) && $aParams['show_counter_style'] == self::$_sCounterStyleCompound)
    #             return _t('_vote_do_by_reactions');
    # 
    #         $sReaction = !empty($aParams['reaction']) ? $aParams['reaction'] : $this->_sDefault;
    #     	return _t('_vote_do_by_x_reaction', _t($this->_aDataList[$sReaction]['title']));
    #     }
    :ok
  end

end
