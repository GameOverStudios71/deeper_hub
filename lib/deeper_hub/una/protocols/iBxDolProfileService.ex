
defprotocol DeeperHub.Inc.Protocols.iBxDolProfileService do
  @moduledoc """
  Protocolo gerado automaticamente a partir da interface PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDol.php
  """

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceProfileUnit

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceProfileUnit(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceProfilePicture

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceProfilePicture(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceProfileAvatar

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceProfileAvatar(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceProfileCover

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceProfileCover(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceProfileThumb

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceProfileThumb(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceProfileIcon

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceProfileIcon(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceProfileName

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceProfileName(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceProfileUrl

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceProfileUrl(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceProfileEditUrl

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceProfileEditUrl(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceCheckAllowedProfileView

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceCheckAllowedProfileView(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceCheckAllowedProfileContact

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceCheckAllowedProfileContact(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceCheckAllowedPostInProfile

  ## Parametros
    - iContentId,sPostModule=''

  ## Retorno
    - any
  """
  def serviceCheckAllowedPostInProfile(struct, iContentId,sPostModule='')

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceCheckAllowedModuleActionInProfile

  ## Parametros
    - iContentId,sModule,sActionName

  ## Retorno
    - any
  """
  def serviceCheckAllowedModuleActionInProfile(struct, iContentId,sModule,sActionName)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetParticipatingProfiles

  ## Parametros
    - iProfileId,aConnectionObject=false

  ## Retorno
    - any
  """
  def serviceGetParticipatingProfiles(struct, iProfileId,aConnectionObject=false)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceGetSpaceTitle

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def serviceGetSpaceTitle(struct)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceCheckSpacePrivacy

  ## Parametros
    - iContentId

  ## Retorno
    - any
  """
  def serviceCheckSpacePrivacy(struct, iContentId)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceProfilesSearch

  ## Parametros
    - sTerm,iLimit

  ## Retorno
    - any
  """
  def serviceProfilesSearch(struct, sTerm,iLimit)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceFormsHelper

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def serviceFormsHelper(struct)

  @doc """
  Funcao correspondente ao metodo da interface PHP serviceActAsProfile

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def serviceActAsProfile(struct)

  @doc """
  Funcao correspondente ao metodo da interface PHP servicePrepareFields

  ## Parametros
    - aFieldsProfile

  ## Retorno
    - any
  """
  def servicePrepareFields(struct, aFieldsProfile)

end
