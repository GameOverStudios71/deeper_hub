
defprotocol DeeperHub.Inc.Protocols.iBxBaseModPaymentProvider do
  @moduledoc """
  Protocolo gerado automaticamente a partir da interface PHP C:\\Users\\Admin\\deeper_hub\\una\\modules\base\payment\classes\BxBaseModPaymentProvider.php
  """

  @doc """
  Funcao correspondente ao metodo PHP initializeCheckout

  ## Parametros
    - $iPendingId
    -  $aCartInfo

  ## Retorno
    - any
  """
  def initializeCheckout(params)

  @doc """
  Funcao correspondente ao metodo PHP finalizeCheckout

  ## Parametros
    - &$aData

  ## Retorno
    - any
  """
  def finalizeCheckout(params)

  @doc """
  Funcao correspondente ao metodo PHP finalizedCheckout

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def finalizedCheckout(params)

  @doc """
  Funcao correspondente ao metodo PHP construct

  ## Parametros
    - $aConfig

  ## Retorno
    - any
  """
  def construct(params)

  @doc """
  Funcao correspondente ao metodo PHP initOptions

  ## Parametros
    - $aOptions

  ## Retorno
    - any
  """
  def initOptions(params)

  @doc """
  Funcao correspondente ao metodo PHP initOptionsByVendor

  ## Parametros
    - $iVendorId

  ## Retorno
    - any
  """
  def initOptionsByVendor(params)

  @doc """
  Funcao correspondente ao metodo PHP isActive

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isActive(params)

  @doc """
  Funcao correspondente ao metodo PHP isHidden

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isHidden(params)

  @doc """
  Funcao correspondente ao metodo PHP getOption

  ## Parametros
    - $sName

  ## Retorno
    - any
  """
  def getOption(params)

  @doc """
  Funcao correspondente ao metodo PHP setOption

  ## Parametros
    - $sName
    -  $mixedValue
    -  $bSave = false

  ## Retorno
    - any
  """
  def setOption(params)

  @doc """
  Funcao correspondente ao metodo PHP needRedirect

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def needRedirect(params)

  @doc """
  Funcao correspondente ao metodo PHP addJsCss

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def addJsCss(params)

  @doc """
  Funcao correspondente ao metodo PHP getJsObject

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getJsObject(params)

  @doc """
  Funcao correspondente ao metodo PHP finalizedCheckout

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def finalizedCheckout(params)

  @doc """
  Funcao correspondente ao metodo PHP isSubscriptionStatus

  ## Parametros
    - $sStatus
    -  $aSubscription
    -  $sStatusKey = 'status'

  ## Retorno
    - any
  """
  def isSubscriptionStatus(params)

  @doc """
  Funcao correspondente ao metodo PHP getSubscription

  ## Parametros
    - $iPendingId
    -  $sCustomerId
    -  $sSubscriptionId

  ## Retorno
    - any
  """
  def getSubscription(params)

  @doc """
  Funcao correspondente ao metodo PHP getOptionsByPending

  ## Parametros
    - $iPendingId

  ## Retorno
    - any
  """
  def getOptionsByPending(params)

  @doc """
  Funcao correspondente ao metodo PHP getOptionsByVendor

  ## Parametros
    - $iVendorId

  ## Retorno
    - any
  """
  def getOptionsByVendor(params)

  @doc """
  Funcao correspondente ao metodo PHP log

  ## Parametros
    - $mixedContents
    -  $sTitle = ''

  ## Retorno
    - any
  """
  def log(params)
end
