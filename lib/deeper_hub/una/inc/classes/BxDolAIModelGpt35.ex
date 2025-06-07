
defmodule DeeperHub.Inc.Classes.BxDolAIModelGpt35 do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolAIModelGpt35.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aModel

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($aModel)
    #     {
    #         $this->_sName = self::$NAME;
    # 
    #         parent::__construct($aModel);
    # 
    #         $this->_sEndpoint = "https://api.openai.com/v1/chat/completions";
    #         $this->_sPathInst = BX_DIRECTORY_PATH_ROOT . 'ai/instructions/';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getResponseText

  ## Parametros
    - sPrompt,sMessage

  ## Retorno
    - any
  """
  def getResponseText(%{}) do
    # TODO: Implementacao futura
        # public function getResponseText($sPrompt, $sMessage)
    #     {
    #         $aMessages = [
    #             ['role' => 'system', 'content' => $sPrompt],
    #             ['role' => 'user', 'content' => $sMessage]
    #         ];
    # 
    #         $sResponse = $this->call($aMessages);
    #         if($sResponse == 'false')
    #             return false;
    #         
    #         return $sResponse;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getResponseInit

  ## Parametros
    - sType,oMessage,aParams=[]

  ## Retorno
    - any
  """
  def getResponseInit(%{}) do
    # TODO: Implementacao futura
        # public function getResponseInit($sType, $oMessage, $aParams = [])
    #     {
    #         if(!is_a($oMessage, 'BxDolAIMessage'))
    #             return false;
    # 
    #         $aMessages = [
    #             ['role' => 'system', 'content' => $this->_getInstructions($sType . '_init')],
    #             ['role' => 'user', 'content' => $oMessage->getContent()]
    #         ];
    # 
    #         $sResponse = $this->call($aMessages);
    #         if($sResponse == 'false')
    #             return false;
    # 
    #         $mixedResult = [];
    #         switch($sType) {
    #             case BX_DOL_AI_AUTOMATOR_EVENT:
    #                 $aResponse = json_decode($sResponse, true);
    # 
    #                 $mixedResult = [
    #                     'alert_unit' => $aResponse['alert_unit'],
    #                     'alert_action' => $aResponse['alert_action'],
    #                     'params' => [
    #                         'trigger' => $aResponse['trigger']
    #                     ]
    #                 ];
    #                 break;
    # 
    #             case BX_DOL_AI_AUTOMATOR_SCHEDULER:
    #                 $mixedResult = [
    #                     'params' => [
    #                         'scheduler_time' => $sResponse
    #                     ]
    #                 ];
    #                 break;
    # 
    #             case BX_DOL_AI_AUTOMATOR_WEBHOOK:
    #                 break;
    #         }
    #         
    # 
    #         return $mixedResult;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getResponse

  ## Parametros
    - sType,mixedMessage,aParams=[]

  ## Retorno
    - any
  """
  def getResponse(%{}) do
    # TODO: Implementacao futura
        # public function getResponse($sType, $mixedMessage, $aParams = [])
    #     {
    #         $bMessage = is_a($mixedMessage, 'BxDolAIMessageString');
    #         $bMessages = is_a($mixedMessage, 'BxDolAIMessages');
    #         if(!$bMessage && !$bMessages)
    #             return false;
    # 
    #         $aCall = [
    #             ['role' => 'system', 'content' => $this->_getInstructions($sType, true)]
    #         ];
    # 
    #         if($bMessages && ($aMessages = $mixedMessage->getAll()))
    #             foreach($aMessages as $oMessage)
    #                 $aCall[] = [
    #                     'role' => $oMessage->isAi() ? 'assistant' : 'user',
    #                     'content' => $oMessage->getContent() . (!$oMessage->isAi() ? ' return only function, without explanation or false if you havn`t enougth data' : '')
    #                 ];
    #         else if($bMessage)
    #             $aCall[] = [
    #                 'role' => $oMessage->isAi() ? 'assistant' : 'user', 
    #                 'content' => $mixedMessage->getContent()
    #             ];
    # 
    #         $sResponse = $this->call($aCall);
    #         if($sResponse == 'false')
    #             return false;
    # 
    #         return $sResponse;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP call

  ## Parametros
    - aMessages,aParams=[]

  ## Retorno
    - any
  """
  def call(%{}) do
    # TODO: Implementacao futura
        # public function call($aMessages, $aParams = [])
    #     {
    #         $aData = [
    #             'model' => $this->_sName,
    #             'messages' => $aMessages
    #         ];
    # 
    #         if(!empty($this->_aParams['call']) && is_array($this->_aParams['call']))
    #             $aData = array_merge($aData, $this->_aParams['call']);
    #         if(!empty($aParams) && is_array($aParams))
    #             $aData = array_merge($aData, $aParams);
    # 
    #         $sResponse = bx_file_get_contents($this->_sEndpoint, $aData, "post-json", [
    #             "Authorization: Bearer " . $this->_sKey, 
    #             'Content-Type: application/json', 
    #             'OpenAI-Beta: assistants=v1'
    #         ]);
    # 
    #         $aResponse = json_decode($sResponse, true);
    #         if(isset($aResponse['error'])) {
    #             $this->_log($aResponse['error']);
    #             return 'false';
    #         }
    # 
    #         return trim(str_replace(['```json', '```php', '```'], '', $aResponse['choices'][0]['message']['content']));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP _getInstructions

  ## Parametros
    - sType,bIncludeCommon=false

  ## Retorno
    - any
  """
  def _getInstructions(%{}) do
    # TODO: Implementacao futura
        # protected function _getInstructions($sType, $bIncludeCommon = false)
    #     {
    #         $sResult = file_get_contents($this->_sPathInst . $sType . '.html');
    #         if($bIncludeCommon)
    #             $sResult .= file_get_contents($this->_sPathInst. 'common.html');
    # 
    #         return $sResult;
    #     }
    :ok
  end

end
