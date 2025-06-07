
defprotocol DeeperHub.Inc.Protocols.iBxDolContentInfoService do
  @moduledoc """
  Protocolo gerado automaticamente a partir da interface PHP C:\\Users\\Admin\\deeper_hub\\una\\inc\classes\BxDol.php
  """

  @doc """
  Funcao correspondente ao metodo PHP serviceGetAuthor

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetAuthor(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetDateAdded

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetDateAdded(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetDateChanged

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetDateChanged(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetLink

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetLink(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetTitle

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetTitle(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetText

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetText(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetThumb

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetThumb(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetInfo

  ## Parametros
    - $iContentId
    -  $bSearchableFieldsOnly = true

  ## Retorno
    - any
  """
  def serviceGetInfo(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetSearchResultUnit

  ## Parametros
    - $iContentId
    -  $sUnitTemplate = ''

  ## Retorno
    - any
  """
  def serviceGetSearchResultUnit(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetSearchResultExtended

  ## Parametros
    - $aParams
    -  $iStart = 0
    -  $iPerPage = 0
    -  $bFilterMode = false

  ## Retorno
    - any
  """
  def serviceGetSearchResultExtended(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetCalendarEntries

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceGetCalendarEntries(params)
end
