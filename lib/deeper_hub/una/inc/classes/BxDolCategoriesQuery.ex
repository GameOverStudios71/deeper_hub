
defmodule DeeperHub.Inc.Classes.BxDolCategoriesQuery do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP C://Users//Admin//deeper_hub//una//inc/classes/BxDolCategoriesQuery.php
  """

  @doc """
  Funcao correspondente ao metodo PHP __construct

  ## Parametros
    - nenhum

  ## Retorno
    - any
  """
  def init(%{}) do
    # TODO: Implementacao futura
        # public function __construct()
    #     {
    #     	parent::__construct();
    # 
    #         $this->_sTableCategories = 'sys_categories';
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP delete

  ## Parametros
    - sModule,iObject

  ## Retorno
    - any
  """
  def delete(%{}) do
    # TODO: Implementacao futura
        # public function delete($sModule, $iObject)
    #     {
    #         $sQuery = "DELETE FROM `sys_categories2objects` WHERE `module` = :module AND `object_id` = :object_id";
    #         $aBindings = array(
    #            'module' => $sModule,
    #            'object_id' => $iObject,
    #         );
    #         $this->query($sQuery, $aBindings);
    #     }
    :ok
  end

  @doc """
  Funcao correspondente ao metodo PHP add

  ## Parametros
    - sModule,iProfileId,sValue,iObject,bAutoActivation

  ## Retorno
    - any
  """
  def add(%{}) do
    # TODO: Implementacao futura
        # public function add($sModule, $iProfileId, $sValue, $iObject, $bAutoActivation)
    #     {
    #         $sStatus = $bAutoActivation ? 'active' : 'hidden';
    #         $aBindings = array(
    #             'value' => $sValue,
    #             'module' => $sModule,
    #             'author' => $iProfileId 
    #         );
    #         $sQuery = "SELECT id FROM `sys_categories` WHERE `value` = :value AND `module` = :module AND (`author` = 0 OR `author` = :author)";
    #         $iCategoryId = (int)$this->getOne($sQuery, $aBindings);
    #         
    #         if($iCategoryId == 0){   
    #             $aBindings['status'] = $sStatus;
    #             $aBindings['added'] = time();
    #             $sQuery = "INSERT INTO `sys_categories` (`value`, `module`, `status`, `added`, `author`) VALUES(:value, :module, :status, :added, :author)";
    #             $this->query($sQuery, $aBindings);
    #             $iCategoryId = $this->lastId();
    #         }
    # 
    #         $sQuery = "INSERT INTO `sys_categories2objects` (`module`, `object_id`, `category_id`) VALUES(:module, :object_id, :category_id)";
    #         $aBindings = array(
    #            'module' => $sModule,
    #            'object_id' => $iObject,
    #            'category_id' => $iCategoryId,
    #         );
    #         $this->query($sQuery, $aBindings);
    #         
    #         return $iCategoryId;
    #     }
    :ok
  end

end
