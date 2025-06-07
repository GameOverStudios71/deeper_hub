
defmodule DeeperHub.Inc.Classes.BxCnvDb do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//modules/boonex/convos/classes/BxCnvDb.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - &oConfig

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct(&$oConfig)
    #     {
    #         parent::__construct($oConfig);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP conversationToFolder

  ## Parametros
    - iConversationId,iFolderId,iProfileCollaborator,iReadCommentsNum=-1

  ## Retorno
    - any
  """
  def conversationToFolder(%{}) do
    # TODO: Implementacao futura
        # public function conversationToFolder($iConversationId, $iFolderId, $iProfileCollaborator, $iReadCommentsNum = -1)
    #     {
    #         $sQuery = $this->prepare("INSERT IGNORE INTO `" . $this->getPrefix() . "conv2folder` SET `conv_id` = ?, `folder_id` = ?, `collaborator` = ?, `read_comments` = ?", $iConversationId, $iFolderId, $iProfileCollaborator, $iReadCommentsNum);
    #         return $this->query($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getFolder

  ## Parametros
    - iFolderId

  ## Retorno
    - any
  """
  def getFolder(%{}) do
    # TODO: Implementacao futura
        # public function getFolder($iFolderId)
    #     {
    #         $sQuery = $this->prepare("SELECT `id`, `author`, `name` FROM `" . $this->getPrefix() . "folders` WHERE `id` = ?", $iFolderId);
    #         return $this->getRow($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getConversationFolder

  ## Parametros
    - iConversationId,iProfileCollaborator

  ## Retorno
    - any
  """
  def getConversationFolder(%{}) do
    # TODO: Implementacao futura
        # public function getConversationFolder($iConversationId, $iProfileCollaborator)
    #     {
    #         $sQuery = $this->prepare("SELECT `folder_id` FROM `" . $this->getPrefix() . "conv2folder` WHERE `conv_id` = ? AND `collaborator` = ?", $iConversationId, $iProfileCollaborator);
    #         return $this->getOne($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP removeCollaborator

  ## Parametros
    - iConversationId,iProfileId

  ## Retorno
    - any
  """
  def removeCollaborator(%{}) do
    # TODO: Implementacao futura
        # public function removeCollaborator($iConversationId, $iProfileId) 
    #     {
    #         $sQuery = $this->prepare("DELETE FROM `" . $this->getPrefix() . "conv2folder` WHERE `conv_id` = ? AND `collaborator` = ?", $iConversationId, $iProfileId);
    #         return $this->query($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP removeCollaboratorFromAllConversations

  ## Parametros
    - iProfileId

  ## Retorno
    - any
  """
  def removeCollaboratorFromAllConversations(%{}) do
    # TODO: Implementacao futura
        # public function removeCollaboratorFromAllConversations($iProfileId)
    #     {
    #         $aConvos = $this->getColumn("SELECT `conv_id` FROM `" . $this->getPrefix() . "conv2folder` WHERE `collaborator` = ?", array($iProfileId));
    #         if (!($iRet = $this->query("DELETE FROM `" . $this->getPrefix() . "conv2folder` WHERE `collaborator` = ?", array($iProfileId))))
    #             return 0;
    # 
    #         foreach ($aConvos as $iConversationId) {
    #             if (!$this->getCollaborators($iConversationId))
    #                 $this->deleteConvo($iConversationId);
    #         }
    #         return $iRet;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getCollaborators

  ## Parametros
    - iConversationId

  ## Retorno
    - any
  """
  def getCollaborators(%{}) do
    # TODO: Implementacao futura
        # public function getCollaborators($iConversationId)
    #     {
    #         $sQuery = $this->prepare("SELECT `collaborator`, `read_comments` FROM `" . $this->getPrefix() . "conv2folder` WHERE `conv_id` = ?", $iConversationId);
    #         return $this->getPairs($sQuery, 'collaborator', 'read_comments');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateReadComments

  ## Parametros
    - iProfileId,iConversationId,iReadComments

  ## Retorno
    - any
  """
  def updateReadComments(%{}) do
    # TODO: Implementacao futura
        # public function updateReadComments($iProfileId, $iConversationId, $iReadComments)
    #     {
    #         $sQuery = $this->prepare("UPDATE `" . $this->getPrefix() . "conv2folder` SET `read_comments` = ? WHERE `conv_id` = ? AND `collaborator` = ?", $iReadComments, $iConversationId, $iProfileId);
    #         return $this->query($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateLastCommentTimeProfile

  ## Parametros
    - iConversationId,iProfileId,iCommentId,iTimestamp

  ## Retorno
    - any
  """
  def updateLastCommentTimeProfile(%{}) do
    # TODO: Implementacao futura
        # public function updateLastCommentTimeProfile($iConversationId, $iProfileId, $iCommentId, $iTimestamp)
    #     {
    #         $sQuery = $this->prepare("UPDATE `" . $this->getPrefix() . "conversations` SET `last_reply_profile_id` = ?, `last_reply_timestamp` = ?, `last_reply_comment_id` = ? WHERE `id` = ?", $iProfileId, $iTimestamp, $iCommentId, $iConversationId);
    #         return $this->query($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP moveConvo

  ## Parametros
    - iConversationId,iProfileId,iFolderId

  ## Retorno
    - any
  """
  def moveConvo(%{}) do
    # TODO: Implementacao futura
        # public function moveConvo($iConversationId, $iProfileId, $iFolderId)
    #     {
    #         $sQuery = $this->prepare("SELECT `folder_id` FROM `" . $this->getPrefix() . "conv2folder` WHERE `conv_id` = ? AND `collaborator` = ?", $iConversationId, $iProfileId);
    #         $iFolderIdOld = $this->getOne($sQuery);
    #         if (BX_CNV_FOLDER_TRASH == $iFolderIdOld) // if convo is already in trash folder - delete it
    #             return '' === $this->deleteConvo($iConversationId, $iProfileId) ? true : false;
    # 
    #         $sQuery = $this->prepare("UPDATE `" . $this->getPrefix() . "conv2folder` SET `folder_id` = ? WHERE `conv_id` = ? AND `collaborator` = ?", $iFolderId, $iConversationId, $iProfileId);
    #         return $this->query($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteConvo

  ## Parametros
    - iConversationId,iProfileId=0

  ## Retorno
    - any
  """
  def deleteConvo(%{}) do
    # TODO: Implementacao futura
        # public function deleteConvo($iConversationId, $iProfileId = 0)
    #     {
    #         $aContentInfo = $this->getContentInfoById ($iConversationId);
    #         if (!$aContentInfo)
    #             return '';
    # 
    #         // delete convo
    #         $aBindings = array(
    #         	'conv_id' => $iConversationId
    #         );
    # 
    #         $sWhere = '';
    #         if ($iProfileId) {
    #         	$aBindings['collaborator'] = $iProfileId;
    # 
    #             $sWhere = " AND `collaborator` = :collaborator";
    #         }
    # 
    #         $sQuery = "DELETE FROM `" . $this->getPrefix() . "conv2folder` WHERE `conv_id` = :conv_id" . $sWhere;
    #         $this->query($sQuery, $aBindings);
    # 
    #         // delete whole conversation if there is no refencences to the conversation in conv2folder table
    #         if ($this->getCollaborators($iConversationId))
    #             return '';
    #             
    #         $sQuery = $this->prepare("SELECT `id` FROM `" . $this->getPrefix() . "conv2folder` WHERE `conv_id` = ?", $iConversationId);
    #         if (!$this->getOne($sQuery)) {
    #             $CNF = &$this->_oConfig->CNF;
    #             $oForm = BxDolForm::getObjectInstance($CNF['OBJECT_FORM_ENTRY'], $CNF['OBJECT_FORM_ENTRY_DISPLAY_ADD']);
    #             return $oForm->delete((int)$iConversationId, $aContentInfo) ? '' : _t('_sys_txt_error_occured');
    #         }
    # 
    #         return '';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getUnreadMessagesNum

  ## Parametros
    - iProfileId,iFolderId=BX_CNV_FOLDER_INBOX

  ## Retorno
    - any
  """
  def getUnreadMessagesNum(%{}) do
    # TODO: Implementacao futura
        # public function getUnreadMessagesNum ($iProfileId, $iFolderId = BX_CNV_FOLDER_INBOX)
    #     {
    #         $sQuery = $this->prepare("SELECT SUM(`c`.`comments` - `f`.`read_comments`)
    #             FROM `" . $this->getPrefix() . "conv2folder` as `f`
    #             INNER JOIN `" . $this->getPrefix() . "conversations` AS `c` ON (`c`.`id` = `f`.`conv_id`)
    #             WHERE `f`.`collaborator` = ? AND `f`.`folder_id` = ?", $iProfileId, $iFolderId);
    #         return $this->getOne($sQuery);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getMessagesPreviews

  ## Parametros
    - iProfileId,iStart=0,iLimit=4,iFolderId=BX_CNV_FOLDER_INBOX

  ## Retorno
    - any
  """
  def getMessagesPreviews(%{}) do
    # TODO: Implementacao futura
        # public function getMessagesPreviews ($iProfileId, $iStart = 0, $iLimit = 4, $iFolderId = BX_CNV_FOLDER_INBOX)
    #     {
    #         $sQuery = $this->prepare("SELECT `c`.`id`, `c`.`text`, `c`.`author`, `cmts`.`cmt_text`, `c`.`last_reply_profile_id`, `c`.`comments`, (`c`.`comments` - `f`.`read_comments`) AS `unread_messages`, `last_reply_timestamp`
    #             FROM `" . $this->getPrefix() . "conv2folder` as `f`
    #             INNER JOIN `" . $this->getPrefix() . "conversations` AS `c` ON (`c`.`id` = `f`.`conv_id`)
    #             LEFT JOIN `" . $this->getPrefix() . "cmts` AS `cmts` ON (`cmts`.`cmt_id` = `c`.`last_reply_comment_id`)
    #             WHERE `f`.`collaborator` = ? AND `f`.`folder_id` = ?
    #             ORDER BY `c`.`last_reply_timestamp` DESC
    #             LIMIT ?, ?", $iProfileId, $iFolderId, $iStart, $iLimit);
    #         return $this->getAll($sQuery);
    #     }
    :ok
  end

end
