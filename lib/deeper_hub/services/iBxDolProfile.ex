
defprotocol DeeperHub.Inc.Protocols.iBxDolProfile do
  @moduledoc """
  Protocolo gerado automaticamente a partir da interface PHP C:\\Users\\Admin\\deeper_hub\\una\\inc\classes\BxDol.php
  """

  @doc """
  Funcao correspondente ao metodo PHP id

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def id(params)

  @doc """
  Funcao correspondente ao metodo PHP getDisplayName

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getDisplayName(params)

  @doc """
  Funcao correspondente ao metodo PHP getUrl

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getUrl(params)

  @doc """
  Funcao correspondente ao metodo PHP getUnit

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getUnit(params)

  @doc """
  Funcao correspondente ao metodo PHP hasImage

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def hasImage(params)

  @doc """
  Funcao correspondente ao metodo PHP getPicture

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getPicture(params)

  @doc """
  Funcao correspondente ao metodo PHP getAvatar

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getAvatar(params)

  @doc """
  Funcao correspondente ao metodo PHP getCover

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getCover(params)

  @doc """
  Funcao correspondente ao metodo PHP getThumb

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getThumb(params)

  @doc """
  Funcao correspondente ao metodo PHP getIcon

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getIcon(params)

  @doc """
  Funcao correspondente ao metodo PHP getIconModule

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getIconModule(params)

  @doc """
  Funcao correspondente ao metodo PHP getEditUrl

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getEditUrl(params)

  @doc """
  Funcao correspondente ao metodo PHP isActive

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isActive(params)

  @doc """
  Funcao correspondente ao metodo PHP isOnline

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def isOnline(params)

  @doc """
  Funcao correspondente ao metodo PHP getStatus

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getStatus(params)

  @doc """
  Funcao correspondente ao metodo PHP getModule

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def getModule(params)

  @doc """
  Funcao correspondente ao metodo PHP checkAllowedProfileView

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def checkAllowedProfileView(params)

  @doc """
  Funcao correspondente ao metodo PHP checkAllowedProfileContact

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def checkAllowedProfileContact(params)

  @doc """
  Funcao correspondente ao metodo PHP checkAllowedPostInProfile

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def checkAllowedPostInProfile(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceProfileUnit

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceProfileUnit(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceProfilePicture

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceProfilePicture(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceProfileAvatar

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceProfileAvatar(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceProfileCover

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceProfileCover(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceProfileThumb

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceProfileThumb(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceProfileIcon

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceProfileIcon(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceProfileName

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceProfileName(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceProfileUrl

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceProfileUrl(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceProfileEditUrl

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceProfileEditUrl(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceCheckAllowedProfileView

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceCheckAllowedProfileView(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceCheckAllowedProfileContact

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceCheckAllowedProfileContact(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceCheckAllowedPostInProfile

  ## Parametros
    - $iContentId
    -  $sPostModule = ''

  ## Retorno
    - any
  """
  def serviceCheckAllowedPostInProfile(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceCheckAllowedModuleActionInProfile

  ## Parametros
    - $iContentId
    -  $sModule
    -  $sActionName

  ## Retorno
    - any
  """
  def serviceCheckAllowedModuleActionInProfile(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetParticipatingProfiles

  ## Parametros
    - $iProfileId
    -  $aConnectionObject = false

  ## Retorno
    - any
  """
  def serviceGetParticipatingProfiles(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceGetSpaceTitle

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def serviceGetSpaceTitle(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceCheckSpacePrivacy

  ## Parametros
    - $iContentId

  ## Retorno
    - any
  """
  def serviceCheckSpacePrivacy(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceProfilesSearch

  ## Parametros
    - $sTerm
    -  $iLimit

  ## Retorno
    - any
  """
  def serviceProfilesSearch(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceFormsHelper

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def serviceFormsHelper(params)

  @doc """
  Funcao correspondente ao metodo PHP serviceActAsProfile

  ## Parametros
    - 

  ## Retorno
    - any
  """
  def serviceActAsProfile(params)

  @doc """
  Funcao correspondente ao metodo PHP servicePrepareFields

  ## Parametros
    - $aFieldsProfile

  ## Retorno
    - any
  """
  def servicePrepareFields(params)

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
