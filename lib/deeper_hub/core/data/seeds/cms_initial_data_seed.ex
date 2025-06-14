defmodule DeeperHub.Core.Data.Seeds.CmsInitialDataSeed do
  @moduledoc """
  Seed para dados iniciais do CMS dinâmico.
  Cria usuário administrador padrão e entidades de exemplo.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Data.SeedRegistry
  alias DeeperHub.Core.Logger
  alias DeeperHub.Core.Auth.SimpleHash
  require DeeperHub.Core.Logger

  @seed_name "cms_initial_data_seed"

  @doc """
  Executa o seed com controle de execução.
  """
  def run do
    if SeedRegistry.seed_executed?(@seed_name) do
      Logger.info("Seed CMS inicial já foi executado anteriormente. Pulando...", module: __MODULE__)
      :already_executed
    else
      Logger.info("Executando seed inicial do CMS dinâmico...", module: __MODULE__)

      try do
        # Criar usuário administrador
        create_admin_user()

        # Criar entidades de exemplo
        create_sample_entities()

        # Marcar como executado
        SeedRegistry.mark_seed_executed(@seed_name)
        Logger.info("Seed inicial do CMS executado com sucesso!", module: __MODULE__)
        :ok
      rescue
        error ->
          error_message = Exception.message(error)
          Logger.error("Erro ao executar seed inicial do CMS: #{error_message}", module: __MODULE__)
          SeedRegistry.mark_seed_failed(@seed_name, error_message)
          {:error, error}
      end
    end
  end

  @doc """
  Força a re-execução do seed.
  """
  def reset do
    Logger.info("Resetando seed inicial do CMS...", module: __MODULE__)
    SeedRegistry.reset_seed(@seed_name)
    Logger.info("Seed inicial do CMS será re-executado na próxima inicialização.", module: __MODULE__)
  end

  # Funções privadas
  defp create_admin_user do
    Logger.info("Criando usuário administrador padrão...", module: __MODULE__)

    # Hash da senha "password123" usando SimpleHash
    password_hash = SimpleHash.hash_password("password123")

    sql = """
    INSERT OR REPLACE INTO users (id, username, email, password_hash, full_name, is_admin, is_active, created_at, updated_at)
    VALUES (1, 'sysop', 'sysop@system.com', ?, 'System Operator', 1, 1, datetime('now'), datetime('now'))
    """

    case Repo.execute(sql, [password_hash]) do
      {:ok, _} ->
        Logger.info("Usuário administrador criado com sucesso.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Falha ao criar usuário administrador: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  defp create_sample_entities do
    Logger.info("Criando entidades de exemplo...", module: __MODULE__)

    # Criar entidade Blog Posts
    create_blog_posts_entity()

    # Criar entidade Products
    create_products_entity()

    # Criar entidade Categories
    create_categories_entity()
  end

  defp create_blog_posts_entity do
    # Criar entidade
    entity_sql = """
    INSERT OR REPLACE INTO entities (id, name, display_name, description, icon, is_active, created_at, updated_at, created_by)
    VALUES (1, 'blog_posts', 'Posts do Blog', 'Artigos e posts do blog', 'article', 1, datetime('now'), datetime('now'), 1)
    """

    case Repo.execute(entity_sql) do
      {:ok, _} ->
        Logger.info("Entidade blog_posts criada.", module: __MODULE__)
        create_blog_posts_fields()
      {:error, reason} ->
        Logger.error("Falha ao criar entidade blog_posts: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  defp create_blog_posts_fields do
    fields = [
      {1, 1, "title", "Título", "text", 1, 0, 1, nil, nil, nil, 1},
      {2, 1, "slug", "URL Amigável", "text", 1, 1, 1, nil, nil, nil, 2},
      {3, 1, "content", "Conteúdo", "textarea", 1, 0, 1, nil, nil, nil, 3},
      {4, 1, "excerpt", "Resumo", "textarea", 0, 0, 1, nil, nil, nil, 4},
      {5, 1, "featured_image", "Imagem Destacada", "file", 0, 0, 0, nil, nil, nil, 5},
      {6, 1, "published_at", "Data de Publicação", "datetime", 0, 0, 0, nil, nil, nil, 6},
      {7, 1, "is_published", "Publicado", "boolean", 0, 0, 0, "0", nil, nil, 7},
      {8, 1, "view_count", "Visualizações", "number", 0, 0, 0, "0", nil, nil, 8}
    ]

    Enum.each(fields, fn {id, entity_id, name, display_name, field_type, is_required, is_unique, is_searchable, default_value, validation_rules, field_options, order_index} ->
      sql = """
      INSERT OR REPLACE INTO fields (id, entity_id, name, display_name, field_type, is_required, is_unique, is_searchable, default_value, validation_rules, field_options, order_index, is_active, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, datetime('now'), datetime('now'))
      """

      Repo.execute(sql, [id, entity_id, name, display_name, field_type, is_required, is_unique, is_searchable, default_value, validation_rules, field_options, order_index])
    end)

    Logger.info("Campos da entidade blog_posts criados.", module: __MODULE__)
  end

  defp create_products_entity do
    # Criar entidade
    entity_sql = """
    INSERT OR REPLACE INTO entities (id, name, display_name, description, icon, is_active, created_at, updated_at, created_by)
    VALUES (2, 'products', 'Produtos', 'Catálogo de produtos', 'shopping-cart', 1, datetime('now'), datetime('now'), 1)
    """

    case Repo.execute(entity_sql) do
      {:ok, _} ->
        Logger.info("Entidade products criada.", module: __MODULE__)
        create_products_fields()
      {:error, reason} ->
        Logger.error("Falha ao criar entidade products: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  defp create_products_fields do
    fields = [
      {9, 2, "name", "Nome do Produto", "text", 1, 0, 1, nil, ~s({"min_length": 3, "max_length": 200}), nil, 1},
      {10, 2, "sku", "Código SKU", "text", 1, 1, 1, nil, ~s({"pattern": "^[A-Z0-9-]+$"}), nil, 2},
      {11, 2, "description", "Descrição", "textarea", 1, 0, 1, nil, nil, nil, 3},
      {12, 2, "price", "Preço", "decimal", 1, 0, 0, nil, ~s({"min": 0}), nil, 4},
      {13, 2, "stock_quantity", "Estoque", "integer", 1, 0, 0, "0", ~s({"min": 0}), nil, 5},
      {14, 2, "is_active", "Ativo", "boolean", 0, 0, 0, "1", nil, nil, 6},
      {15, 2, "category", "Categoria", "text", 0, 0, 1, nil, nil, nil, 7},
      {16, 2, "tags", "Tags", "text", 0, 0, 1, nil, nil, nil, 8}
    ]

    Enum.each(fields, fn {id, entity_id, name, display_name, field_type, is_required, is_unique, is_searchable, default_value, validation_rules, field_options, order_index} ->
      sql = """
      INSERT OR REPLACE INTO fields (id, entity_id, name, display_name, field_type, is_required, is_unique, is_searchable, default_value, validation_rules, field_options, order_index, is_active, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, datetime('now'), datetime('now'))
      """

      Repo.execute(sql, [id, entity_id, name, display_name, field_type, is_required, is_unique, is_searchable, default_value, validation_rules, field_options, order_index])
    end)

    Logger.info("Campos da entidade products criados.", module: __MODULE__)
  end

  defp create_categories_entity do
    # Criar entidade
    entity_sql = """
    INSERT OR REPLACE INTO entities (id, name, display_name, description, icon, is_active, created_at, updated_at, created_by)
    VALUES (3, 'categories', 'Categorias', 'Categorias para organização de conteúdo', 'folder', 1, datetime('now'), datetime('now'), 1)
    """

    case Repo.execute(entity_sql) do
      {:ok, _} ->
        Logger.info("Entidade categories criada.", module: __MODULE__)
        create_categories_fields()
      {:error, reason} ->
        Logger.error("Falha ao criar entidade categories: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  defp create_categories_fields do
    fields = [
      {17, 3, "name", "Nome da Categoria", "text", 1, 1, 1, nil, ~s({"min_length": 2, "max_length": 100}), nil, 1},
      {18, 3, "description", "Descrição", "textarea", 0, 0, 1, nil, nil, nil, 2},
      {19, 3, "color", "Cor", "text", 0, 0, 0, "#007bff", ~s({"pattern": "^#[0-9A-Fa-f]{6}$"}), nil, 3},
      {20, 3, "parent_id", "Categoria Pai", "relation", 0, 0, 0, nil, nil, ~s({"entity": "categories", "display_field": "name"}), 4}
    ]

    Enum.each(fields, fn {id, entity_id, name, display_name, field_type, is_required, is_unique, is_searchable, default_value, validation_rules, field_options, order_index} ->
      sql = """
      INSERT OR REPLACE INTO fields (id, entity_id, name, display_name, field_type, is_required, is_unique, is_searchable, default_value, validation_rules, field_options, order_index, is_active, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, datetime('now'), datetime('now'))
      """

      Repo.execute(sql, [id, entity_id, name, display_name, field_type, is_required, is_unique, is_searchable, default_value, validation_rules, field_options, order_index])
    end)

    Logger.info("Campos da entidade categories criados.", module: __MODULE__)
  end
end
