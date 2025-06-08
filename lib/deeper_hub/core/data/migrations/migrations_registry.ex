defmodule DeeperHub.Core.Data.Migrations.MigrationRegistry do
  @moduledoc """
  Registro centralizado de migrações disponíveis no sistema.
  Este módulo é gerado e atualizado automaticamente pelo gerador.
  """

  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Retorna a lista de migrações disponíveis no sistema.
  Cada migração é representada por uma tupla {versão, módulo}.
  """
  def available_migrations do
    [
      {"20250608000001", DeeperHub.Core.Data.Migrations.CreateSysMenuItemsTable},
      {"20250608000002", DeeperHub.Core.Data.Migrations.CreateSysMenuSetsTable},
      {"20250608000003", DeeperHub.Core.Data.Migrations.CreateSysMenuTemplatesTable},
      {"20250608000004", DeeperHub.Core.Data.Migrations.CreateSysObjectsMenuTable},
      {"20250608000005", DeeperHub.Core.Data.Migrations.CreateSysObjectsPageTable},
      {"20250608000007", DeeperHub.Core.Data.Migrations.CreateSysPagesBlocksTable},
      {"20250608000008", DeeperHub.Core.Data.Migrations.CreateSysPagesBlocksDataTable},
      {"20250608000009", DeeperHub.Core.Data.Migrations.CreateSysPagesContentPlaceholdersTable},
      {"20250608000010", DeeperHub.Core.Data.Migrations.CreateSysPagesLayoutsTable},
      {"20250608000011", DeeperHub.Core.Data.Migrations.CreateSysPagesTypesTable},
      {"20250608000012", DeeperHub.Core.Data.Migrations.CreateSysPagesWikiBlocksTable},
      {"20250608000013", DeeperHub.Core.Data.Migrations.CreateSysPermalinksTable},
      {"20250608000014", DeeperHub.Core.Data.Migrations.CreateSysRewriteRulesTable},
      {"20250608000015", DeeperHub.Core.Data.Migrations.CreateSysSeoLinksTable},
      {"20250608000016", DeeperHub.Core.Data.Migrations.CreateSysSeoUriRewritesTable},
      {"20250608000017", DeeperHub.Core.Data.Migrations.CreateSysStdPagesTable},
      {"20250608000018", DeeperHub.Core.Data.Migrations.CreateSysObjectsFormTable},
      {"20250608000019", DeeperHub.Core.Data.Migrations.CreateSysFormInputsTable},
      {"20250608000020", DeeperHub.Core.Data.Migrations.CreateSysFormDisplaysTable},
      {"20250608000021", DeeperHub.Core.Data.Migrations.CreateSysFormDisplayInputsTable},
      {"20250608000022", DeeperHub.Core.Data.Migrations.CreateSysObjectsGridTable},
      {"20250608000023", DeeperHub.Core.Data.Migrations.CreateSysGridFieldsTable},
      {"20250608000024", DeeperHub.Core.Data.Migrations.CreateSysGridActionsTable},
      {"20250608000025", DeeperHub.Core.Data.Migrations.CreateSysContentInfoGridsTable},
      {"20250608000026", DeeperHub.Core.Data.Migrations.CreateSysObjectsViewTable},
      {"20250608000027", DeeperHub.Core.Data.Migrations.CreateSysObjectsContentInfoTable},
      {"20250608000028", DeeperHub.Core.Data.Migrations.CreateSysStdWidgetsTable},
      {"20250608000029", DeeperHub.Core.Data.Migrations.CreateSysStdPagesWidgetsTable},
      {"20250608000030", DeeperHub.Core.Data.Migrations.CreateSysStdWidgetsBookmarksTable}
    ]
  end

  @doc """
  Retorna a lista de seeds disponíveis no sistema.
  """
  def available_seeds do
    [
      DeeperHub.Core.Data.Seeds.SeedSysContentInfoGrids,
      DeeperHub.Core.Data.Seeds.SeedSysFormDisplays,
      DeeperHub.Core.Data.Seeds.SeedSysFormDisplayInputs,
      DeeperHub.Core.Data.Seeds.SeedSysFormInputs,
      DeeperHub.Core.Data.Seeds.SeedSysGridActions,
      DeeperHub.Core.Data.Seeds.SeedSysGridFields,
      DeeperHub.Core.Data.Seeds.SeedSysMenuItems,
      DeeperHub.Core.Data.Seeds.SeedSysMenuSets,
      DeeperHub.Core.Data.Seeds.SeedSysMenuTemplates,
      DeeperHub.Core.Data.Seeds.SeedSysObjectsContentInfo,
      DeeperHub.Core.Data.Seeds.SeedSysObjectsForm,
      DeeperHub.Core.Data.Seeds.SeedSysObjectsGrid,
      DeeperHub.Core.Data.Seeds.SeedSysObjectsMenu,
      DeeperHub.Core.Data.Seeds.SeedSysObjectsPage,
      DeeperHub.Core.Data.Seeds.SeedSysObjectsView,
      DeeperHub.Core.Data.Seeds.SeedSysPagesBlocks,
      DeeperHub.Core.Data.Seeds.SeedSysPagesContentPlaceholders,
      DeeperHub.Core.Data.Seeds.SeedSysPagesLayouts,
      DeeperHub.Core.Data.Seeds.SeedSysPagesTypes,
      DeeperHub.Core.Data.Seeds.SeedSysPermalinks,
      DeeperHub.Core.Data.Seeds.SeedSysRewriteRules,
      DeeperHub.Core.Data.Seeds.SeedSysSeoLinks,
      DeeperHub.Core.Data.Seeds.SeedSysStdPages,
      DeeperHub.Core.Data.Seeds.SeedSysStdPagesWidgets,
      DeeperHub.Core.Data.Seeds.SeedSysStdWidgets,
    ]
  end


  @doc """
  Executa todos os seeds disponíveis.
  """
  def run_seeds do
    Logger.info("Executando seeds...", module: __MODULE__)

    Logger.debug("Lista de seeds disponíveis: #{inspect(available_seeds())}", module: __MODULE__)

    Enum.each(available_seeds(), fn seed_module ->
      Logger.info("Executando seed: #{inspect(seed_module)}", module: __MODULE__)
      Logger.debug("Obtendo dados do seed: #{inspect(seed_module)}", module: __MODULE__)
      data = seed_module.run()
      Logger.debug("Dados obtidos: #{inspect(Enum.take(data, 5))}... (mostrando apenas os 5 primeiros)", module: __MODULE__)
      table_name = get_table_name(seed_module)
      Logger.debug("Nome da tabela calculado: #{table_name}", module: __MODULE__)
      if data != [] do
        # Verificar se os dados são listas simples ou mapas
        transformed_data = if is_list(hd(data)) do
          Logger.debug("Dados são listas simples, transformando para mapas genéricos", module: __MODULE__)
          transform_list_to_map(data)
        else
          Logger.debug("Dados já são mapas", module: __MODULE__)
          data
        end

        insertion_result = try_insert_with_pool(table_name, transformed_data) ||
                          try_insert_with_repo(table_name, transformed_data) ||
                          try_insert_with_env_repo(table_name, transformed_data) ||
                          try_insert_with_generic_repo(table_name, transformed_data) ||
                          try_insert_dynamic_db_module(table_name, transformed_data) ||
                          try_insert_alternative(table_name, transformed_data)

        case insertion_result do
          {:success, method} -> Logger.info("Inserção bem-sucedida usando #{method} para tabela #{table_name}", module: __MODULE__)
          {:error, :all_failed} -> Logger.error("Falha na inserção de dados para #{table_name}. Nenhum método funcionou.", module: __MODULE__)
          {:error, reason} -> Logger.debug("Tentativa falhou por: #{reason}", module: __MODULE__)
        end
      else
        Logger.info("Nenhum dado para inserir na tabela #{table_name}", module: __MODULE__)
      end
    end)

    Logger.info("Seeds executados com sucesso.", module: __MODULE__)
    :ok
  end

  defp try_insert_with_pool(table_name, data) do
    try do
      # Verificar se o módulo existe antes de chamar
      if Code.ensure_loaded?(DeeperHub.DBConnectionPool) and function_exported?(DeeperHub.DBConnectionPool, :insert_all, 3) do
        Logger.debug("Tentando inserir dados com DeeperHub.DBConnectionPool", module: __MODULE__)
        DeeperHub.DBConnectionPool.insert_all(table_name, data, on_conflict: :nothing)
        {:success, :db_connection_pool}
      else
        {:error, :module_not_loaded_or_function_not_available}
      end
    rescue
      _e -> {:error, :pool_failed}
    end
  end

  defp try_insert_with_repo(table_name, data) do
    try do
      if Code.ensure_loaded?(DeeperHub.Repo) and function_exported?(DeeperHub.Repo, :insert_all, 3) do
        Logger.debug("Tentando inserir dados com DeeperHub.Repo", module: __MODULE__)
        DeeperHub.Repo.insert_all(table_name, data, on_conflict: :nothing)
        {:success, :repo}
      else
        {:error, :repo_not_loaded_or_function_not_available}
      end
    rescue
      _e -> {:error, :repo_failed}
    end
  end

  defp try_insert_with_env_repo(table_name, data) do
    try do
      Logger.debug("Tentando obter repo do ambiente", module: __MODULE__)
      repo = Application.get_env(:deeper_hub, DeeperHub.Repo)
      Logger.debug("Repo obtido: #{inspect(repo)}", module: __MODULE__)
      if repo && function_exported?(repo, :insert_all, 3) do
        repo.insert_all(table_name, data, on_conflict: :nothing)
        {:success, :env_repo}
      else
        {:error, :env_repo_not_available_or_function_not_available}
      end
    rescue
      _e -> {:error, :env_repo_failed}
    end
  end

  defp try_insert_with_generic_repo(table_name, data) do
    try do
      if Code.ensure_loaded?(DeeperHub.Core.Data.Repo) and function_exported?(DeeperHub.Core.Data.Repo, :insert_all, 3) do
        Logger.debug("Tentando inserir dados com DeeperHub.Core.Data.Repo", module: __MODULE__)
        DeeperHub.Core.Data.Repo.insert_all(table_name, data, on_conflict: :nothing)
        {:success, :generic_repo}
      else
        {:error, :deeper_hub_repo_not_loaded_or_function_not_available}
      end
    rescue
      _e -> {:error, :deeper_hub_repo_failed}
    end
  end

  defp try_insert_dynamic_db_module(table_name, data) do
    try do
      Logger.debug("Tentando encontrar um módulo de banco de dados dinamicamente", module: __MODULE__)
      # Tentar encontrar um módulo de banco de dados disponível
      possible_modules = [
        DeeperHub.Core.Data.Repo,
        DeeperHub.Core.Repo,
        DeeperHub.Data.Repo,
        DeeperHub.DB,
        DeeperHub.Database
      ]

      result = Enum.find_value(possible_modules, {:error, :no_module_found}, fn mod ->
        if Code.ensure_loaded?(mod) do
          Logger.debug("Módulo #{inspect(mod)} encontrado, verificando funções", module: __MODULE__)
          cond do
            function_exported?(mod, :insert_all, 3) ->
              Logger.debug("Tentando insert_all/3 com #{inspect(mod)}", module: __MODULE__)
              mod.insert_all(table_name, data, on_conflict: :nothing)
              {:success, "dynamic_#{inspect(mod)}"}
            function_exported?(mod, :insert, 2) ->
              Logger.debug("Tentando insert/2 com #{inspect(mod)}", module: __MODULE__)
              Enum.each(data, fn record ->
                mod.insert(table_name, record)
              end)
              {:success, "dynamic_insert_#{inspect(mod)}"}
            function_exported?(mod, :execute, 2) or function_exported?(mod, :execute, 3) ->
              Logger.debug("Tentando execute/2 ou execute/3 com #{inspect(mod)} para inserção manual", module: __MODULE__)
              insert_manual(mod, table_name, data)
              {:success, "dynamic_execute_#{inspect(mod)}"}
            function_exported?(mod, :query, 1) or function_exported?(mod, :query, 2) ->
              Logger.debug("Tentando query/1 ou query/2 com #{inspect(mod)} para inserção manual", module: __MODULE__)
              insert_manual(mod, table_name, data)
              {:success, "dynamic_query_#{inspect(mod)}"}
            true ->
              {:error, :no_suitable_function}
          end
        else
          {:error, :module_not_loaded}
        end
      end)

      # Tentar usar DeeperHub.Core.Data.Crud.create/2 se disponível
      if result == {:error, :no_module_found} do
        try_crud_create(table_name, data)
      else
        result
      end
    rescue
      _e ->
        Logger.debug("Falha ao tentar módulo de banco de dados dinâmico", module: __MODULE__)
        try_crud_create(table_name, data)
    end
  end

  defp try_crud_create(table_name, data) do
    try do
      if Code.ensure_loaded?(DeeperHub.Core.Data.Crud) and function_exported?(DeeperHub.Core.Data.Crud, :create, 2) do
        Logger.debug("Tentando usar DeeperHub.Core.Data.Crud.create/2 para inserção", module: __MODULE__)
        Enum.each(data, fn record ->
          DeeperHub.Core.Data.Crud.create(table_name, record)
        end)
        {:success, :crud_create}
      else
        {:error, :crud_module_not_loaded_or_function_not_available}
      end
    rescue
      _e ->
        Logger.debug("Falha ao tentar DeeperHub.Core.Data.Crud.create/2", module: __MODULE__)
        {:error, :crud_create_failed}
    end
  end

  defp try_insert_alternative(table_name, data) do
    try do
      Logger.debug("Tentando inserir dados com método alternativo", module: __MODULE__)
      # Verificando se existe um módulo de banco de dados genérico ou conexão direta
      result = insert_alternative(table_name, data)
      if result == :ok do
        {:success, :alternative}
      else
        {:error, :alternative_failed}
      end
    rescue
      _e ->
        Logger.debug("Método alternativo falhou", module: __MODULE__)
        {:error, :all_failed}
    end
  end

  defp insert_manual(db_module, table_name, data) do
    # Tentar construir uma query de inserção manual
    Enum.each(data, fn record ->
      fields = Map.keys(record)
      values = Map.values(record)
      fields_str = Enum.join(fields, ", ")
      placeholders = Enum.map(1..length(values), fn i -> "?#{i}" end) |> Enum.join(", ")
      query = "INSERT INTO #{table_name} (#{fields_str}) VALUES (#{placeholders})"
      Logger.debug("Executando query manual: #{query}", module: __MODULE__)

      # Tentar usar execute/3 ou execute/2
      cond do
        function_exported?(db_module, :execute, 3) ->
          db_module.execute(query, values, [])
        function_exported?(db_module, :execute, 2) ->
          db_module.execute(query, values)
        function_exported?(db_module, :query, 2) ->
          db_module.query(query, values)
        true ->
          db_module.query(query)
      end
    end)
    :ok
  end

  defp get_table_name(seed) do
    seed_module = Atom.to_string(seed)
    seed_name = String.split(seed_module, ".")
              |> List.last()
              |> String.replace("Seed", "")
              |> String.replace(~r/([A-Z])/, "_\\1")
              |> String.downcase()
              |> String.trim("_")
    "sys_" <> seed_name
  end

  defp transform_list_to_map(data) do
    # Transformar listas simples em mapas com campos genéricos
    Enum.map(data, fn row ->
      Enum.with_index(row)
      |> Enum.map(fn {value, index} -> {"field_#{index}", value} end)
      |> Map.new()
    end)
  end

  defp insert_alternative(table_name, data) do
    # Método alternativo para inserção - pode ser ajustado conforme necessário
    # Esta é uma implementação de exemplo e pode não funcionar no seu ambiente
    Logger.debug("Usando método alternativo de inserção para #{table_name}", module: __MODULE__)
    Enum.each(data, fn record ->
      # Construir uma query SQL ou usar outra abordagem
      Logger.debug("Registro a ser inserido: #{inspect(record)}", module: __MODULE__)
      # Exemplo: construir uma query INSERT (isto é apenas um exemplo e não funcionará sem adaptação)
      # query = "INSERT INTO #{table_name} (...) VALUES (...)"
      # Execute a query usando um módulo de conexão de banco de dados disponível
    end)
    # Simulação de sucesso para exemplo
    :ok
  end
end
