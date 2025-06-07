
defprotocol DeeperHub.Inc.Protocols.iBxDolContentInfoService do
  @moduledoc """
  Protocolo gerado automaticamente a partir da interface PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDol.php
  """

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetAuthor

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetAuthor(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetDateAdded

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetDateAdded(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetDateChanged

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetDateChanged(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetLink

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetLink(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetTitle

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetTitle(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetText

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetText(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetThumb

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceGetThumb(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetInfo

  ## Parametros
    - iContentId,bSearchableFieldsOnly=true

  ## Retorno
    - any
  """
  def serviceGetInfo(struct, iContentId,bSearchableFieldsOnly=true)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetSearchResultUnit

  ## Parametros
    - iContentId,sUnitTemplate=''

  ## Retorno
    - any
  """
  def serviceGetSearchResultUnit(struct, iContentId,sUnitTemplate='')

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetSearchResultExtended

  ## Parametros
    - aParams,iStart=0,iPerPage=0,bFilterMode=false

  ## Retorno
    - any
  """
  def serviceGetSearchResultExtended(struct, aParams,iStart=0,iPerPage=0,bFilterMode=false)

end
