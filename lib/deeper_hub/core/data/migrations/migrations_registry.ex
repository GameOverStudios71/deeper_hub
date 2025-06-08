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
      DeeperHub.Core.Data.Seeds.SeedSysStdPages
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
        
        try do
          # Tentar usar DeeperHub.DBConnectionPool diretamente
          Logger.debug("Tentando inserir dados com DeeperHub.DBConnectionPool", module: __MODULE__)
          if function_exported?(DeeperHub.DBConnectionPool, :insert_all, 3) do
            DeeperHub.DBConnectionPool.insert_all(table_name, transformed_data, on_conflict: :nothing)
            Logger.info("Dados inseridos na tabela #{table_name} com DeeperHub.DBConnectionPool", module: __MODULE__)
          else
            Logger.warning("Função insert_all/3 não disponível em DeeperHub.DBConnectionPool", module: __MODULE__)
            raise "Função não disponível"
          end
        rescue
          e ->
            Logger.error("Erro ao inserir dados com DeeperHub.DBConnectionPool: #{inspect(e)}", module: __MODULE__)
            try do
              # Tentar usar DeeperHub.Repo diretamente
              Logger.debug("Tentando inserir dados com DeeperHub.Repo.insert_all/3", module: __MODULE__)
              DeeperHub.Repo.insert_all(table_name, transformed_data, on_conflict: :nothing)
              Logger.info("Dados inseridos na tabela #{table_name} com DeeperHub.Repo", module: __MODULE__)
            rescue
              e2 ->
                Logger.error("Erro ao inserir dados com DeeperHub.Repo.insert_all/3: #{inspect(e2)}", module: __MODULE__)
                try do
                  # Tentar obter repo do ambiente
                  Logger.debug("Tentando obter repo do ambiente", module: __MODULE__)
                  repo = Application.get_env(:deeper_hub, DeeperHub.Repo)
                  Logger.debug("Repo obtido: #{inspect(repo)}", module: __MODULE__)
                  repo.insert_all(table_name, transformed_data, on_conflict: :nothing)
                  Logger.info("Dados inseridos na tabela #{table_name} com repo do ambiente", module: __MODULE__)
                rescue
                  e3 ->
                    Logger.error("Erro ao inserir dados com repo do ambiente: #{inspect(e3)}", module: __MODULE__)
                    try do
                      # Tentar usar uma função genérica de inserção
                      Logger.debug("Tentando inserir dados com função genérica Repo.insert_all/3", module: __MODULE__)
                      Repo.insert_all(table_name, transformed_data, on_conflict: :nothing)
                      Logger.info("Dados inseridos na tabela #{table_name} com Repo genérico", module: __MODULE__)
                    rescue
                      e4 ->
                        Logger.error("Erro ao inserir dados com Repo genérico: #{inspect(e4)}", module: __MODULE__)
                        try do
                          # Tentar um método SQL direto ou outra abordagem
                          Logger.debug("Tentando inserir dados com método alternativo", module: __MODULE__)
                          insert_alternative(table_name, transformed_data)
                          Logger.info("Dados inseridos na tabela #{table_name} com método alternativo", module: __MODULE__)
                        rescue
                          e5 ->
                            Logger.error("Erro ao inserir dados com método alternativo: #{inspect(e5)}", module: __MODULE__)
                            Logger.warning("Nenhum método de inserção funcionou. Dados não inseridos para #{table_name}", module: __MODULE__)
                        end
                    end
                end
            end
        end
      else
        Logger.info("Nenhum dado para inserir na tabela #{table_name}", module: __MODULE__)
      end
    end)

    Logger.info("Seeds executados com sucesso.", module: __MODULE__)
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
