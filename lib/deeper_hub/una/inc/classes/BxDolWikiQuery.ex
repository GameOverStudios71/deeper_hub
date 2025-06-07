
defmodule DeeperHub.Inc.Classes.BxDolWikiQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolWikiQuery.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - aObject

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct($aObject)
    #     {
    #         parent::__construct();
    #         $this->_aObject = $aObject;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getBlocks

  ## Parametros
    - sModule

  ## Retorno
    - any
  """
  def getBlocks(%{}) do
    # TODO: Implementacao futura
        # public function getBlocks ($sModule)
    #     {
    #         $oDb = BxDolDb::getInstance();
    #         return $oDb->getColumn("SELECT `id` FROM `sys_pages_blocks` WHERE `module` = :module", ['module' => $sModule]);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getWikiObjectByUri

  ## Parametros
    - sUri

  ## Retorno
    - any
  """
  def getWikiObjectByUri(%{}) do
    # TODO: Implementacao futura
        # public function getWikiObjectByUri ($sUri)
    #     {
    #         return self::getWikiObjectByField ('uri', $sUri);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getWikiObject

  ## Parametros
    - sObject

  ## Retorno
    - any
  """
  def getWikiObject(%{}) do
    # TODO: Implementacao futura
        # public function getWikiObject ($sObject)
    #     {
    #         return self::getWikiObjectByField ('object', $sObject);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getWikiObjectByField

  ## Parametros
    - sField,sValue

  ## Retorno
    - any
  """
  def getWikiObjectByField(%{}) do
    # TODO: Implementacao futura
        # public function getWikiObjectByField ($sField, $sValue)
    #     {
    #         $oDb = BxDolDb::getInstance();
    #         $sQuery = $oDb->prepare("SELECT * FROM `sys_objects_wiki` WHERE `$sField` = ?", $sValue);
    #         $aObject = $oDb->getRow($sQuery);
    #         if (!$aObject || !is_array($aObject))
    #             return false;
    # 
    #         return $aObject;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getAllPages

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def getAllPages(%{}) do
    # TODO: Implementacao futura
        # public function getAllPages ()
    #     {
    #         $sQuery = "SELECT LOWER(`uri`) as `uri`, `title`, `url` FROM `sys_objects_page` WHERE `url` != '' ORDER BY `uri`";
    #         return BxDolDb::getInstance()->getAllWithKey($sQuery, 'uri');
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getBlockContent

  ## Parametros
    - iBlockId,sLang,iRevision=false,bAutoMainLang=true

  ## Retorno
    - any
  """
  def getBlockContent(%{}) do
    # TODO: Implementacao futura
        # public function getBlockContent ($iBlockId, $sLang, $iRevision = false, $bAutoMainLang = true)
    #     {        
    #         $sWhere = '';
    #         $aRow = false;
    #         $aBind = array('block' => $iBlockId);
    #         if (false !== $sLang) {            
    #             $aBind['language'] = $sLang;
    #             if (false !== $iRevision) {
    #                 $sWhere = " AND `revision` = :rev";
    #                 $aBind['rev'] = $iRevision;
    #             }
    # 
    #             // get latest revision for specific language
    #             $aRow = $this->getRow("SELECT `block_id`, `revision`, `profile_id`, `language`, `main_lang`, `content`, `unsafe`, `notes`, `added` FROM `{$this->_sTableBlocksWithRevisions}` WHERE `block_id` = :block AND `language` = :language $sWhere ORDER BY `revision` DESC LIMIT 1", $aBind);
    #         }
    # 
    #         // if translation isn't found for specific language then get latest revision for main language 
    #         if ($bAutoMainLang && !$aRow) {
    #             unset($aBind['language']);
    #             $aRow = $this->getRow("SELECT `block_id`, `revision`, `profile_id`, `language`, `main_lang`, `content`, `unsafe`, `notes`, `added` FROM `{$this->_sTableBlocksWithRevisions}` WHERE `block_id` = :block AND `main_lang` = 1 $sWhere ORDER BY `revision` DESC LIMIT 1", $aBind);
    #         }
    # 
    #         return $aRow ? $aRow : false;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getBlockLangs

  ## Parametros
    - iBlockId

  ## Retorno
    - any
  """
  def getBlockLangs(%{}) do
    # TODO: Implementacao futura
        # public function getBlockLangs ($iBlockId)
    #     {
    #         return $this->getColumn("SELECT `language` FROM `{$this->_sTableBlocksWithRevisions}` WHERE `block_id` = :block GROUP BY `language`", array('block' => $iBlockId));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP updateBlockIndexingData

  ## Parametros
    - iBlockId,sText

  ## Retorno
    - any
  """
  def updateBlockIndexingData(%{}) do
    # TODO: Implementacao futura
        # public function updateBlockIndexingData ($iBlockId, $sText)
    #     {
    #         return $this->query("UPDATE `sys_pages_blocks` SET `text` = :text, `text_updated` = :updated WHERE `id` = :id", array('text' => $sText, 'updated' => time(), 'id' => $iBlockId));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getBlockHistory

  ## Parametros
    - iBlockId,sLang

  ## Retorno
    - any
  """
  def getBlockHistory(%{}) do
    # TODO: Implementacao futura
        # public function getBlockHistory ($iBlockId, $sLang)
    #     {
    #         $aBind = array('block' => $iBlockId, 'language' => $sLang);
    #         return $this->getAll("SELECT `block_id`, `language`, `revision`, `profile_id`, `notes`, `added` FROM `{$this->_sTableBlocksWithRevisions}` WHERE `block_id` = :block AND `language` = :language ORDER BY `revision` DESC", $aBind);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getBlocksWithMissingTranslations

  ## Parametros
    - sLang

  ## Retorno
    - any
  """
  def getBlocksWithMissingTranslations(%{}) do
    # TODO: Implementacao futura
        # public function getBlocksWithMissingTranslations ($sLang)
    #     {
    #         $aBind = array('lang' => $sLang, 'module' => $this->_aObject['module']);
    #         return $this->getColumn("
    #             SELECT `wo`.`block_id`
    #             FROM `{$this->_sTableBlocksWithRevisions}` AS `wo`
    #             INNER JOIN `sys_pages_blocks` AS `b` ON (`wo`.`block_id` = `b`.`id` AND `b`.`module` = :module)
    #             LEFT JOIN `{$this->_sTableBlocksWithRevisions}` AS `wt` ON (`wo`.`block_id` = `wt`.`block_id` AND `wt`.`language` = :lang AND `wt`.`main_lang` != 1)            
    #             WHERE `wo`.`main_lang` = 1 AND `wo`.`language` != :lang AND `wt`.`block_id` IS NULL
    #             GROUP BY `wo`.`block_id`", $aBind);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getBlocksWithOutdatedTranslations

  ## Parametros
    - sLang

  ## Retorno
    - any
  """
  def getBlocksWithOutdatedTranslations(%{}) do
    # TODO: Implementacao futura
        # public function getBlocksWithOutdatedTranslations ($sLang)
    #     {
    #         $aBind = array('lang' => $sLang, 'module' => $this->_aObject['module']);
    #         return $this->getColumn("
    #             SELECT `wo`.`block_id`
    #             FROM `{$this->_sTableBlocksWithRevisions}` AS `wo`
    #             INNER JOIN `sys_pages_blocks` AS `b` ON (`wo`.`block_id` = `b`.`id` AND `b`.`module` = :module)
    #             INNER JOIN `{$this->_sTableBlocksWithRevisions}` AS `wt` ON (`wo`.`block_id` = `wt`.`block_id` AND `wt`.`language` = :lang AND `wt`.`main_lang` != 1)
    #             WHERE `wo`.`main_lang` = 1 AND `wo`.`language` != :lang
    #             GROUP BY `wo`.`block_id`
    #             HAVING MAX(`wt`.`added`) < MAX(`wo`.`added`)", $aBind);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteRevisions

  ## Parametros
    - iBlockId,sLang,aRevisions

  ## Retorno
    - any
  """
  def deleteRevisions(%{}) do
    # TODO: Implementacao futura
        # public function deleteRevisions ($iBlockId, $sLang, $aRevisions)
    #     {
    #         $aBind = array('block' => $iBlockId, 'language' => $sLang);
    #         $i = $this->query("DELETE FROM `{$this->_sTableBlocksWithRevisions}` WHERE `block_id` = :block AND `language` = :language AND `revision` IN(" . $this->implode_escape($aRevisions) . ")", $aBind);
    #         if ($i) {
    #             // check if main language revisions was deleted
    #             $aRow = $this->getOne("SELECT `block_id` FROM `{$this->_sTableBlocksWithRevisions}` WHERE `block_id` = :block AND `main_lang` = 1 LIMIT 1", array('block' => $iBlockId));
    #             if (!$aRow) {
    #                 // if main lang was deleted then mark latest translation from any lang as main
    #                 $this->query("UPDATE `{$this->_sTableBlocksWithRevisions}` SET `main_lang` = 1 WHERE `block_id` = :block ORDER BY `added` DESC LIMIT 1", array('block' => $iBlockId));
    #             }
    #         }
    #         return $i;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP getPageByBlockId

  ## Parametros
    - iBlockId

  ## Retorno
    - any
  """
  def getPageByBlockId(%{}) do
    # TODO: Implementacao futura
        # public function getPageByBlockId ($iBlockId)
    #     {
    #         return $this->getRow("SELECT `p`.`title`, `p`.`uri` FROM `sys_objects_page` AS `p` INNER JOIN `sys_pages_blocks` AS `b` ON (`p`.`object` = `b`.`object` AND `b`.`id` = ? AND `p`.`module` = ?) LIMIT 1", array($iBlockId, $this->_aObject['module']));
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP insertPage

  ## Parametros
    - sUri,sUrl,sTitleLangKey,iType=1,iLayoutId=20,iVisibleForLevels=2147483647,sClass='BxTemplPageWiki'

  ## Retorno
    - any
  """
  def insertPage(%{}) do
    # TODO: Implementacao futura
        # public function insertPage ($sUri, $sUrl, $sTitleLangKey, $iType = 1, $iLayoutId = 20, $iVisibleForLevels = 2147483647, $sClass = 'BxTemplPageWiki')
    #     {
    #         $oQueryPageBuilder = new BxDolStudioBuilderPageQuery();
    #         $iPageId = $oQueryPageBuilder->insertPage($this->_aObject['module'] . '_' . str_replace('-', '_', $sUri), $this->_aObject['module'], $sUri, $sUrl, $sTitleLangKey, $iType, $iLayoutId, $iVisibleForLevels, $sClass);
    #         if ($iPageId)
    #             $oQueryPageBuilder->updatePage($iPageId, ['sticky_columns' => 1]);
    #         return $iPageId;
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP deleteAllRevisions

  ## Parametros
    - mixedBlockIds

  ## Retorno
    - any
  """
  def deleteAllRevisions(%{}) do
    # TODO: Implementacao futura
        # public static function deleteAllRevisions ($mixedBlockIds)
    #     {
    #         $oDb = BxDolDb::getInstance();
    #         if (!is_array($mixedBlockIds))
    #             $mixedBlockId = array($mixedBlockIds);
    # 
    #         // TODO: remake to use $this->_sTableBlocksWithRevisions
    #         return $oDb->query("DELETE FROM `sys_pages_wiki_blocks` WHERE `block_id` IN(" . $oDb->implode_escape($mixedBlockIds) . ")");
    #     }
    :ok
  end

end
