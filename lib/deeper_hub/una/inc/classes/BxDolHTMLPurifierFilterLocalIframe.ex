
defmodule DeeperHub.Inc.Classes.BxDolHTMLPurifierFilterLocalIframe do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolHTMLPurifierFilterLocalIframe.php
  """

  @doc """
  Funcao correspondente ao metodo PHP preFilter

  ## Parametros
    - sHtml,config,context

  ## Retorno
    - any
  """
  def preFilter(%{}) do
    # TODO: Implementacao futura
        # public function preFilter($sHtml, $config, $context)
    #     {
    #         if (strstr($sHtml, '<iframe')) {
    #             $sHtml = str_ireplace("</iframe>", "", $sHtml);
    #             if (preg_match_all("/<iframe(.*?)>/si", $sHtml, $aResult)) {
    #                 foreach ($aResult[1] as $key => $sItem) {
    #                     preg_match('/width="([0-9]+)"/', $sItem, $width);
    #                     $iWidth = $width[1];
    #                     preg_match('/height="([0-9]+)"/', $sItem, $height);
    #                     $iHeight = $height[1];
    #                     $sDolUrl = preg_quote(BX_DOL_URL_ROOT);
    #                     $sIframeUrl = '';
    #                     if (preg_match("#({$sDolUrl}[a-zA-Z0-9_=\-\?\&\/]+)#", $sItem, $aMatches))
    #                         $sIframeUrl = $aMatches[1];
    #                     if (preg_match("#src=\"(((?!//)(?![a-z]+://)(?![a-z]+://))[a-zA-Z0-9_=\-\?\&\/]+)#", $sItem, $aMatches))
    #                         $sIframeUrl = $aMatches[1];
    #                     if ($sIframeUrl)
    #                         $sHtml = str_replace($aResult[0][$key], '<img class="LocalIframe" width="' . $iWidth . '" height="' . $iHeight . '" src="' . $sIframeUrl . '">', $sHtml);                    
    #                 }
    #             }
    #         }
    #         return $sHtml;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP postFilter

  ## Parametros
    - sHtml,config,context

  ## Retorno
    - any
  """
  def postFilter(%{}) do
    # TODO: Implementacao futura
        # public function postFilter($sHtml, $config, $context)
    #     {
    #         $sPostRegex = '#<img class="LocalIframe" ([^>]+)>#';
    #         $sHtml = preg_replace_callback($sPostRegex, array($this, 'postFilterCallback'), $sHtml);
    #         return $sHtml;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP postFilterCallback

  ## Parametros
    - aMatches

  ## Retorno
    - any
  """
  def postFilterCallback(%{}) do
    # TODO: Implementacao futura
        # protected function postFilterCallback($aMatches)
    #     {
    #         return '<iframe frameborder="0" allowfullscreen ' . $aMatches[1] . '></iframe>';
    #     }
    :ok
  end

end
