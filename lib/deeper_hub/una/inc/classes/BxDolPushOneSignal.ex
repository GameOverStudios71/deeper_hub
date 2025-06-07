
defmodule DeeperHub.Inc.Classes.BxDolPushOneSignal do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolPushOneSignal.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aObject,oTemplate=null,sDbClassName=''

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # protected function __construct($aObject, $oTemplate = null, $sDbClassName = '')
    #     {
    #         parent::__construct($aObject, $oTemplate, $sDbClassName);
    # 
    #         $this->_sEndpoint = 'https://onesignal.com/api/v1/notifications';
    # 
    #         $this->_sAppId = getParam('sys_push_onesignal_app_id');
    #         $this->_sRestApi = getParam('sys_push_onesignal_rest_api');
    # 
    #         $this->_sShortName = getParam('sys_push_onesignal_short_name');
    #         $this->_sSafariWebId = getParam('sys_push_onesignal_safari_id');
    # 
    #         $this->_bCodeAdded = false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP send

  ## Parametros
    - iProfileId,aMessage,bAddToQueue=false

  ## Retorno
    - any
  """
  def send(%{}) do
    # TODO: Implementacao futura
        # public function send($iProfileId, $aMessage, $bAddToQueue = false)
    #     {
    #         if(empty($this->_sAppId) || empty($this->_sRestApi))
    #             return false;
    # 
    #         if($bAddToQueue && BxDolQueuePush::getInstance()->add($iProfileId, $aMessage))
    #             return true;
    # 
    #         $sUrlWeb = $sUrlApp = !empty($aMessage['url']) ? $aMessage['url'] : '';
    # 
    #         if($this->_sApiUrlRootEmail !== false) {
    #             if($sUrlWeb)
    #                 $sUrlWeb = str_replace(BX_DOL_URL_ROOT, $this->_sApiUrlRootEmail, $sUrlWeb);
    # 
    #             if(!empty($aMessage['contents']) && is_array($aMessage['contents']))
    #                 foreach($aMessage['contents'] as $sKey => $sValue)
    #                     $aMessage['contents'][$sKey] = str_replace(BX_DOL_URL_ROOT, $this->_sApiUrlRootEmail, $sValue);
    #         }
    # 
    #         if($this->_sApiUrlRootPush !== false) {
    #             if($sUrlApp)
    #                 $sUrlApp = str_replace(BX_DOL_URL_ROOT, $this->_sApiUrlRootPush, $sUrlApp);
    #         }
    #         else
    #             $sUrlApp = $sUrlWeb;
    # 
    #         $aFields = [
    #             'app_id' => $this->_sAppId,
    #             'filters' => [
    #                 ['field' => 'tag', 'key' => 'user_hash', 'relation' => '=', 'value' => encryptUserId($iProfileId)]
    #             ],
    #             'contents' => !empty($aMessage['contents']) && is_array($aMessage['contents']) ? $aMessage['contents'] : [],
    #             'headings' => !empty($aMessage['headings']) && is_array($aMessage['headings']) ? $aMessage['headings'] : [],
    #             'web_url' => $sUrlWeb,
    #             'app_url' => $sUrlApp,
    #             'data' => [
    #                 'url' => $sUrlWeb
    #             ],
    #         ];
    #         
    #         if(empty($aMessage['icon']))
    #             $aMessage['icon'] = BxTemplFunctions::getInstance()->getMainLogoUrl();
    # 
    #         if(!empty($aMessage['icon'])){
    #             $aFields['chrome_web_icon'] = $aMessage['icon'];
    #             $aFields['large_icon'] = $aMessage['icon'];
    #             $aFields['ios_attachments'] = ['id'=> $aMessage['icon']];
    #         }
    # 
    #         if('on' == getParam('bx_nexus_option_push_notifications_count')) {
    #             $iBadgeCount = $this->getNotificationsCount($iProfileId);
    #             $aFields['ios_badgeType'] = 'SetTo';
    #             $aFields['ios_badgeCount'] = $iBadgeCount;
    #         }
    # 
    #         $oChannel = curl_init();
    #         curl_setopt($oChannel, CURLOPT_URL, $this->_sEndpoint);
    #         curl_setopt($oChannel, CURLOPT_HTTPHEADER, [
    #             'Content-Type: application/json; charset=utf-8',
    #             'Authorization: Basic ' . $this->_sRestApi
    #         ]);
    #         curl_setopt($oChannel, CURLOPT_RETURNTRANSFER, true);
    #         curl_setopt($oChannel, CURLOPT_HEADER, false);
    #         curl_setopt($oChannel, CURLOPT_POST, true);
    #         curl_setopt($oChannel, CURLOPT_POSTFIELDS, json_encode($aFields));
    #         if (getParam('sys_curl_ssl_allow_untrusted') == 'on')
    #             curl_setopt($oChannel, CURLOPT_SSL_VERIFYPEER, false);
    # 
    #         $sResult = curl_exec($oChannel);
    #         curl_close($oChannel);
    # 
    #         $oResult = @json_decode($sResult, true);
    #         if(isset($oResult['errors']))
    #             foreach($oResult['errors'] as $sError) {  
    #                 bx_log('sys_push', $sError . " Message:" . json_encode($aMessage));
    #             }
    # 
    #         return $sResult;
    #     }
    :ok
  end

end
