defmodule DeeperHub.Core.Data.Migrations.CreateCmsSettingsSystem do
  @moduledoc """
  Migration para criar o sistema de configurações do CMS.
  Baseado na análise das tabelas sys_options do UNA.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria as tabelas do sistema de configurações.
  """
  def up do
    Logger.info("Criando sistema de configurações do CMS...", module: __MODULE__)

    with :ok <- create_setting_categories(),
         :ok <- create_setting_types(),
         :ok <- create_settings(),
         :ok <- create_themes(),
         :ok <- create_theme_settings() do
      
      create_indexes()
      Logger.info("Sistema de configurações criado com sucesso!", module: __MODULE__)
      :ok
    else
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Remove as tabelas do sistema de configurações.
  """
  def down do
    Logger.info("Removendo sistema de configurações...", module: __MODULE__)

    tables = [
      "cms_theme_settings",
      "cms_themes",
      "cms_settings", 
      "cms_setting_types",
      "cms_setting_categories"
    ]

    Enum.each(tables, fn table ->
      case Repo.execute("DROP TABLE IF EXISTS #{table}") do
        {:ok, _} -> Logger.info("Tabela #{table} removida.", module: __MODULE__)
        {:error, reason} -> Logger.error("Erro ao remover #{table}: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end

  # Criar categorias de configuração
  defp create_setting_categories do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_setting_categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      icon VARCHAR(255) DEFAULT '',
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      order_index INTEGER DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_setting_categories criada.", module: __MODULE__)
        insert_default_categories()
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_setting_categories: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar tipos de configuração
  defp create_setting_types do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_setting_types (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      
      -- Configurações do tipo
      input_type VARCHAR(32) NOT NULL, -- text, textarea, select, radio, checkbox, file, color, etc.
      validation_rules TEXT DEFAULT '', -- JSON
      default_options TEXT DEFAULT '', -- JSON
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      order_index INTEGER DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_setting_types criada.", module: __MODULE__)
        insert_default_setting_types()
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_setting_types: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar configurações
  defp create_settings do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_settings (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      category_id INTEGER NOT NULL,
      setting_type_id INTEGER NOT NULL,
      
      -- Identificação
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      
      -- Valor
      value TEXT DEFAULT '',
      default_value TEXT DEFAULT '',
      
      -- Configurações específicas
      options TEXT DEFAULT '', -- JSON para select, radio, etc.
      validation_rules TEXT DEFAULT '', -- JSON
      
      -- Aparência
      placeholder VARCHAR(255) DEFAULT '',
      help_text TEXT DEFAULT '',
      css_class VARCHAR(255) DEFAULT '',
      
      -- Comportamento
      is_required BOOLEAN DEFAULT 0,
      is_readonly BOOLEAN DEFAULT 0,
      is_translatable BOOLEAN DEFAULT 0,
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      order_index INTEGER DEFAULT 0,
      
      FOREIGN KEY (category_id) REFERENCES cms_setting_categories(id),
      FOREIGN KEY (setting_type_id) REFERENCES cms_setting_types(id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_settings criada.", module: __MODULE__)
        insert_default_settings()
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_settings: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar temas
  defp create_themes do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_themes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      
      -- Arquivos do tema
      template_path VARCHAR(255) NOT NULL,
      css_file VARCHAR(255) DEFAULT '',
      js_file VARCHAR(255) DEFAULT '',
      preview_image VARCHAR(255) DEFAULT '',
      
      -- Metadados
      version VARCHAR(32) DEFAULT '1.0.0',
      author VARCHAR(255) DEFAULT '',
      author_url VARCHAR(255) DEFAULT '',
      
      -- Configurações
      supports_dark_mode BOOLEAN DEFAULT 0,
      is_responsive BOOLEAN DEFAULT 1,
      min_width INTEGER DEFAULT 320,
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_default BOOLEAN DEFAULT 0,
      is_system BOOLEAN DEFAULT 0,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      order_index INTEGER DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_themes criada.", module: __MODULE__)
        insert_default_themes()
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_themes: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar configurações por tema
  defp create_theme_settings do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_theme_settings (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      theme_id INTEGER NOT NULL,
      setting_id INTEGER NOT NULL,
      value TEXT DEFAULT '',
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      
      FOREIGN KEY (theme_id) REFERENCES cms_themes(id) ON DELETE CASCADE,
      FOREIGN KEY (setting_id) REFERENCES cms_settings(id) ON DELETE CASCADE,
      CONSTRAINT unique_theme_setting UNIQUE (theme_id, setting_id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_theme_settings criada.", module: __MODULE__)
        :ok
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_theme_settings: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Inserir categorias padrão
  defp insert_default_categories do
    categories = [
      {1, "general", "Geral", "Configurações gerais do site", "cog"},
      {2, "appearance", "Aparência", "Configurações de aparência e tema", "palette"},
      {3, "content", "Conteúdo", "Configurações de conteúdo", "file-text"},
      {4, "users", "Usuários", "Configurações de usuários", "users"},
      {5, "email", "Email", "Configurações de email", "mail"},
      {6, "social", "Redes Sociais", "Configurações de redes sociais", "share"},
      {7, "seo", "SEO", "Configurações de SEO", "search"},
      {8, "security", "Segurança", "Configurações de segurança", "shield"},
      {9, "performance", "Performance", "Configurações de performance", "zap"},
      {10, "advanced", "Avançado", "Configurações avançadas", "settings"}
    ]

    Enum.each(categories, fn {id, name, title, description, icon} ->
      sql = """
      INSERT OR REPLACE INTO cms_setting_categories 
      (id, name, title, description, icon, is_system, order_index) 
      VALUES (?, ?, ?, ?, ?, 1, ?)
      """
      Repo.execute(sql, [id, name, title, description, icon, id])
    end)
    
    :ok
  end

  # Inserir tipos de configuração padrão
  defp insert_default_setting_types do
    types = [
      {1, "text", "Texto", "Campo de texto simples", "text", ~s({"maxlength": 255}), "{}"},
      {2, "textarea", "Área de Texto", "Campo de texto longo", "textarea", ~s({"rows": 4}), "{}"},
      {3, "number", "Número", "Campo numérico", "number", "{}", "{}"},
      {4, "email", "Email", "Campo de email", "email", ~s({"pattern": "email"}), "{}"},
      {5, "url", "URL", "Campo de URL", "url", ~s({"pattern": "url"}), "{}"},
      {6, "password", "Senha", "Campo de senha", "password", ~s({"minlength": 6}), "{}"},
      {7, "select", "Lista Suspensa", "Campo de seleção", "select", "{}", "{}"},
      {8, "radio", "Botões de Rádio", "Seleção única", "radio", "{}", "{}"},
      {9, "checkbox", "Caixa de Seleção", "Verdadeiro/Falso", "checkbox", "{}", "{}"},
      {10, "color", "Cor", "Seletor de cor", "color", "{}", "{}"},
      {11, "file", "Arquivo", "Upload de arquivo", "file", "{}", "{}"},
      {12, "image", "Imagem", "Upload de imagem", "file", ~s({"accept": "image/*"}), "{}"},
      {13, "date", "Data", "Campo de data", "date", "{}", "{}"},
      {14, "time", "Hora", "Campo de hora", "time", "{}", "{}"},
      {15, "range", "Intervalo", "Campo de intervalo", "range", ~s({"min": 0, "max": 100}), "{}"}
    ]

    Enum.each(types, fn {id, name, title, description, input_type, validation, options} ->
      sql = """
      INSERT OR REPLACE INTO cms_setting_types 
      (id, name, title, description, input_type, validation_rules, default_options, is_system, order_index) 
      VALUES (?, ?, ?, ?, ?, ?, ?, 1, ?)
      """
      Repo.execute(sql, [id, name, title, description, input_type, validation, options, id])
    end)
    
    :ok
  end

  # Inserir configurações padrão
  defp insert_default_settings do
    settings = [
      {1, 1, 1, "site_name", "Nome do Site", "Nome principal do site", "Meu Site CMS", "Meu Site CMS", "", "", "", "", 0, 0, 0, 1},
      {2, 1, 1, "site_tagline", "Slogan do Site", "Slogan ou descrição curta", "Um site incrível", "Um site incrível", "", "", "", "", 0, 0, 0, 1},
      {3, 1, 4, "admin_email", "Email do Administrador", "Email principal do administrador", "admin@site.com", "admin@site.com", "", "", "", "", 1, 0, 0, 1},
      {4, 1, 5, "site_url", "URL do Site", "URL principal do site", "https://meusite.com", "https://meusite.com", "", "", "", "", 1, 0, 0, 1},
      {5, 2, 7, "theme", "Tema", "Tema ativo do site", "default", "default", ~s([{"value": "default", "label": "Padrão"}, {"value": "dark", "label": "Escuro"}]), "", "", "", 1, 0, 0, 1},
      {6, 2, 10, "primary_color", "Cor Primária", "Cor principal do tema", "#007bff", "#007bff", "", "", "", "", 0, 0, 0, 1},
      {7, 2, 10, "secondary_color", "Cor Secundária", "Cor secundária do tema", "#6c757d", "#6c757d", "", "", "", "", 0, 0, 0, 1},
      {8, 3, 3, "posts_per_page", "Posts por Página", "Número de posts por página", "10", "10", "", ~s({"min": 1, "max": 100}), "", "", 0, 0, 0, 1},
      {9, 3, 9, "allow_comments", "Permitir Comentários", "Permitir comentários nos posts", "1", "1", "", "", "", "", 0, 0, 0, 1},
      {10, 7, 1, "meta_title", "Título SEO", "Título padrão para SEO", "", "", "", "", "", "", 0, 0, 1, 1},
      {11, 7, 2, "meta_description", "Descrição SEO", "Descrição padrão para SEO", "", "", "", "", "", "", 0, 0, 1, 1},
      {12, 7, 1, "meta_keywords", "Palavras-chave SEO", "Palavras-chave padrão", "", "", "", "", "", "", 0, 0, 1, 1}
    ]

    Enum.each(settings, fn {id, category_id, type_id, name, title, description, value, default_value, options, validation, placeholder, help_text, is_required, is_readonly, is_translatable, order_index} ->
      sql = """
      INSERT OR REPLACE INTO cms_settings 
      (id, category_id, setting_type_id, name, title, description, value, default_value, options, validation_rules, placeholder, help_text, is_required, is_readonly, is_translatable, is_system, order_index) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, ?)
      """
      Repo.execute(sql, [id, category_id, type_id, name, title, description, value, default_value, options, validation, placeholder, help_text, is_required, is_readonly, is_translatable, order_index])
    end)
    
    :ok
  end

  # Inserir temas padrão
  defp insert_default_themes do
    themes = [
      {1, "default", "Tema Padrão", "Tema padrão do sistema", "/themes/default", "default.css", "default.js", "default_preview.jpg", "1.0.0", "Sistema", "", 0, 1, 320, 1, 1, 0},
      {2, "dark", "Tema Escuro", "Tema escuro moderno", "/themes/dark", "dark.css", "dark.js", "dark_preview.jpg", "1.0.0", "Sistema", "", 1, 1, 320, 1, 0, 0},
      {3, "minimal", "Tema Minimalista", "Tema limpo e minimalista", "/themes/minimal", "minimal.css", "minimal.js", "minimal_preview.jpg", "1.0.0", "Sistema", "", 0, 1, 320, 1, 0, 0}
    ]

    Enum.each(themes, fn {id, name, title, description, template_path, css_file, js_file, preview_image, version, author, author_url, supports_dark, is_responsive, min_width, is_active, is_default, is_system} ->
      sql = """
      INSERT OR REPLACE INTO cms_themes 
      (id, name, title, description, template_path, css_file, js_file, preview_image, version, author, author_url, supports_dark_mode, is_responsive, min_width, is_active, is_default, is_system, order_index) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      """
      Repo.execute(sql, [id, name, title, description, template_path, css_file, js_file, preview_image, version, author, author_url, supports_dark, is_responsive, min_width, is_active, is_default, is_system, id])
    end)
    
    :ok
  end

  # Criar índices para performance
  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_cms_setting_categories_name ON cms_setting_categories(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_setting_categories_active ON cms_setting_categories(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_setting_types_name ON cms_setting_types(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_setting_types_active ON cms_setting_types(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_settings_name ON cms_settings(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_settings_category ON cms_settings(category_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_settings_type ON cms_settings(setting_type_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_settings_active ON cms_settings(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_settings_order ON cms_settings(category_id, order_index)",
      "CREATE INDEX IF NOT EXISTS idx_cms_themes_name ON cms_themes(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_themes_active ON cms_themes(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_themes_default ON cms_themes(is_default) WHERE is_default = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_theme_settings_theme ON cms_theme_settings(theme_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_theme_settings_setting ON cms_theme_settings(setting_id)"
    ]

    Enum.each(indexes, fn sql ->
      case Repo.execute(sql) do
        {:ok, _} -> :ok
        {:error, reason} -> 
          Logger.warning("Falha ao criar índice: #{sql}, erro: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end
end
