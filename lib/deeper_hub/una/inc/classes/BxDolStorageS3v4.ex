
defmodule DeeperHub.Inc.Classes.BxDolStorageS3v4 do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolStorageS3v4.php
  """

  @doc """
  Funcao correspondente ao metodo PHP init

  ## Parametros
    - aObject

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # protected function init ($aObject)
    #     {
    #         require_once(BX_DIRECTORY_PATH_PLUGINS . 'unaio/amazon-s3-php-class-hmac-v2/S3.php');
    #         require_once(BX_DIRECTORY_PATH_PLUGINS . 'tpyo/amazon-s3-php-class/S3.php'); // HMAC v4
    #         $this->_s3 = new S3v4\S3(
    #             getParam('sys_storage_s3_access_key'), 
    #             getParam('sys_storage_s3_secret_key'), 
    #             $this->_bSSL, 
    #             $this->_sEndpoint ? $this->_sEndpoint : 's3.amazonaws.com',
    #             getParam('sys_storage_s3_region')
    #         );
    #         if ($this->_bSSL && getParam('sys_curl_ssl_allow_untrusted'))
    #              $this->_s3->setSSL($this->_bSSL, false);
    #         $this->_s3->setExceptions(true);
    #     }
    :ok
  end

end
