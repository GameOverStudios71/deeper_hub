defmodule DeeperHub.Core.Data.Migrations.CreateCmsWidgetsSystem do
  @moduledoc """
  Migration para criar o sistema de widgets do CMS.
  Baseado na análise das tabelas sys_std_widgets do UNA.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria as tabelas do sistema de widgets.
  """
  def up do
    Logger.info("Criando sistema de widgets do CMS...", module: __MODULE__)

    with :ok <- create_widget_types(),
         :ok <- create_widgets(),
         :ok <- create_widget_instances(),
         :ok <- create_widget_settings(),
         :ok <- create_widget_bookmarks() do
      
      create_indexes()
      Logger.info("Sistema de widgets criado com sucesso!", module: __MODULE__)
      :ok
    else
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Remove as tabelas do sistema de widgets.
  """
  def down do
    Logger.info("Removendo sistema de widgets...", module: __MODULE__)

    tables = [
      "cms_widget_bookmarks",
      "cms_widget_settings", 
      "cms_widget_instances",
      "cms_widgets",
      "cms_widget_types"
    ]

    Enum.each(tables, fn table ->
      case Repo.execute("DROP TABLE IF EXISTS #{table}") do
        {:ok, _} -> Logger.info("Tabela #{table} removida.", module: __MODULE__)
        {:error, reason} -> Logger.error("Erro ao remover #{table}: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end

  # Criar tipos de widget
  defp create_widget_types do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_widget_types (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      category VARCHAR(64) DEFAULT 'general',
      
      -- Configurações
      template VARCHAR(255) NOT NULL,
      icon VARCHAR(255) DEFAULT '',
      preview_image VARCHAR(255) DEFAULT '',
      
      -- Funcionalidades
      has_settings BOOLEAN DEFAULT 1,
      has_content BOOLEAN DEFAULT 1,
      is_cacheable BOOLEAN DEFAULT 1,
      cache_lifetime INTEGER DEFAULT 3600,
      
      -- Compatibilidade
      supported_positions TEXT DEFAULT '', -- JSON array
      min_width INTEGER DEFAULT 0,
      max_width INTEGER DEFAULT 0,
      
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
        Logger.info("Tabela cms_widget_types criada.", module: __MODULE__)
        insert_default_widget_types()
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_widget_types: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar widgets
  defp create_widgets do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_widgets (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      
      -- Tipo e módulo
      widget_type_id INTEGER NOT NULL,
      module VARCHAR(32) NOT NULL DEFAULT 'cms',
      
      -- Configurações
      template VARCHAR(255) DEFAULT '',
      css_class VARCHAR(255) DEFAULT '',
      custom_css TEXT DEFAULT '',
      
      -- Conteúdo
      content TEXT DEFAULT '',
      content_type VARCHAR(32) DEFAULT 'html', -- html, markdown, text
      
      -- Configurações avançadas
      config_data TEXT DEFAULT '', -- JSON
      api_endpoint VARCHAR(255) DEFAULT '',
      refresh_interval INTEGER DEFAULT 0, -- segundos
      
      -- Permissões
      visible_for_levels INTEGER DEFAULT 2147483647,
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_featured BOOLEAN DEFAULT 0,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      created_by INTEGER,
      
      FOREIGN KEY (widget_type_id) REFERENCES cms_widget_types(id),
      FOREIGN KEY (created_by) REFERENCES users(id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_widgets criada.", module: __MODULE__)
        :ok
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_widgets: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar instâncias de widget (widgets em páginas)
  defp create_widget_instances do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_widget_instances (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      widget_id INTEGER NOT NULL,
      page_id INTEGER DEFAULT NULL,
      
      -- Posicionamento
      position VARCHAR(64) NOT NULL DEFAULT 'sidebar', -- sidebar, header, footer, content, etc.
      cell_id INTEGER DEFAULT 1,
      order_index INTEGER DEFAULT 0,
      
      -- Configurações específicas da instância
      instance_title VARCHAR(255) DEFAULT '',
      instance_config TEXT DEFAULT '', -- JSON
      custom_css TEXT DEFAULT '',
      
      -- Aparência
      design_box_id INTEGER DEFAULT 1,
      show_title BOOLEAN DEFAULT 1,
      
      -- Comportamento
      is_active BOOLEAN DEFAULT 1,
      is_collapsed BOOLEAN DEFAULT 0,
      
      -- Permissões específicas
      visible_for_levels INTEGER DEFAULT NULL, -- NULL = herda do widget
      hidden_on VARCHAR(255) DEFAULT '', -- mobile, tablet, desktop
      
      -- Cache específico
      cache_lifetime INTEGER DEFAULT NULL, -- NULL = herda do widget
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      
      FOREIGN KEY (widget_id) REFERENCES cms_widgets(id) ON DELETE CASCADE,
      FOREIGN KEY (page_id) REFERENCES cms_pages(id) ON DELETE CASCADE,
      FOREIGN KEY (design_box_id) REFERENCES cms_design_boxes(id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_widget_instances criada.", module: __MODULE__)
        :ok
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_widget_instances: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar configurações de widget
  defp create_widget_settings do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_widget_settings (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      widget_id INTEGER DEFAULT NULL,
      instance_id INTEGER DEFAULT NULL,
      setting_key VARCHAR(255) NOT NULL,
      setting_value TEXT DEFAULT '',
      setting_type VARCHAR(32) DEFAULT 'text', -- text, number, boolean, json, array
      
      -- Metadados
      setting_group VARCHAR(64) DEFAULT 'general',
      setting_order INTEGER DEFAULT 0,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      
      FOREIGN KEY (widget_id) REFERENCES cms_widgets(id) ON DELETE CASCADE,
      FOREIGN KEY (instance_id) REFERENCES cms_widget_instances(id) ON DELETE CASCADE,
      
      -- Garantir que seja configuração de widget OU instância, não ambos
      CHECK ((widget_id IS NOT NULL AND instance_id IS NULL) OR (widget_id IS NULL AND instance_id IS NOT NULL)),
      CONSTRAINT unique_widget_setting UNIQUE (widget_id, setting_key),
      CONSTRAINT unique_instance_setting UNIQUE (instance_id, setting_key)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_widget_settings criada.", module: __MODULE__)
        :ok
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_widget_settings: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar favoritos de widget por usuário
  defp create_widget_bookmarks do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_widget_bookmarks (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      widget_id INTEGER NOT NULL,
      user_id INTEGER NOT NULL,
      is_bookmarked BOOLEAN DEFAULT 1,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      
      FOREIGN KEY (widget_id) REFERENCES cms_widgets(id) ON DELETE CASCADE,
      FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
      CONSTRAINT unique_user_widget_bookmark UNIQUE (widget_id, user_id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_widget_bookmarks criada.", module: __MODULE__)
        :ok
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_widget_bookmarks: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Inserir tipos de widget padrão
  defp insert_default_widget_types do
    types = [
      {1, "html", "HTML/Texto", "Widget de conteúdo HTML livre", "content", "html.html", "code", "", 1, 1, 1, 3600, ~s(["sidebar", "content", "header", "footer"])},
      {2, "menu", "Menu de Navegação", "Menu de navegação customizável", "navigation", "menu.html", "list", "", 1, 0, 1, 7200, ~s(["header", "sidebar", "footer"])},
      {3, "recent_posts", "Posts Recentes", "Lista dos posts mais recentes", "content", "recent_posts.html", "clock", "", 1, 0, 1, 1800, ~s(["sidebar", "content"])},
      {4, "search", "Busca", "Formulário de busca", "tools", "search.html", "search", "", 1, 0, 1, 86400, ~s(["sidebar", "header"])},
      {5, "social_links", "Links Sociais", "Links para redes sociais", "social", "social_links.html", "share", "", 1, 1, 1, 86400, ~s(["sidebar", "header", "footer"])},
      {6, "contact_info", "Informações de Contato", "Dados de contato da empresa", "contact", "contact_info.html", "phone", "", 1, 1, 1, 86400, ~s(["sidebar", "footer"])},
      {7, "newsletter", "Newsletter", "Formulário de inscrição newsletter", "forms", "newsletter.html", "mail", "", 1, 1, 0, 3600, ~s(["sidebar", "footer"])},
      {8, "gallery", "Galeria", "Galeria de imagens", "media", "gallery.html", "image", "", 1, 1, 1, 3600, ~s(["content", "sidebar"])},
      {9, "video", "Vídeo", "Player de vídeo", "media", "video.html", "play", "", 1, 1, 1, 3600, ~s(["content"])},
      {10, "calendar", "Calendário", "Widget de calendário", "tools", "calendar.html", "calendar", "", 1, 0, 1, 1800, ~s(["sidebar", "content"])},
      {11, "weather", "Clima", "Informações meteorológicas", "tools", "weather.html", "cloud", "", 1, 1, 1, 1800, ~s(["sidebar"])},
      {12, "counter", "Contador", "Contador de estatísticas", "stats", "counter.html", "bar-chart", "", 1, 1, 1, 3600, ~s(["content", "sidebar"])},
      {13, "testimonials", "Depoimentos", "Depoimentos de clientes", "content", "testimonials.html", "quote", "", 1, 1, 1, 7200, ~s(["content", "sidebar"])},
      {14, "faq", "FAQ", "Perguntas frequentes", "content", "faq.html", "question", "", 1, 1, 1, 86400, ~s(["content"])},
      {15, "map", "Mapa", "Mapa interativo", "tools", "map.html", "map", "", 1, 1, 1, 86400, ~s(["content", "sidebar"])}
    ]

    Enum.each(types, fn {id, name, title, description, category, template, icon, preview, has_settings, has_content, is_cacheable, cache_lifetime, positions} ->
      sql = """
      INSERT OR REPLACE INTO cms_widget_types 
      (id, name, title, description, category, template, icon, preview_image, has_settings, has_content, is_cacheable, cache_lifetime, supported_positions, is_system, order_index) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, ?)
      """
      Repo.execute(sql, [id, name, title, description, category, template, icon, preview, has_settings, has_content, is_cacheable, cache_lifetime, positions, id])
    end)
    
    :ok
  end

  # Criar índices para performance
  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_types_name ON cms_widget_types(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_types_active ON cms_widget_types(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_types_category ON cms_widget_types(category)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widgets_name ON cms_widgets(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widgets_type ON cms_widgets(widget_type_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widgets_module ON cms_widgets(module)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widgets_active ON cms_widgets(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_widgets_featured ON cms_widgets(is_featured) WHERE is_featured = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_instances_widget ON cms_widget_instances(widget_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_instances_page ON cms_widget_instances(page_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_instances_position ON cms_widget_instances(position)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_instances_order ON cms_widget_instances(page_id, position, order_index)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_instances_active ON cms_widget_instances(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_settings_widget ON cms_widget_settings(widget_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_settings_instance ON cms_widget_settings(instance_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_settings_key ON cms_widget_settings(setting_key)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_bookmarks_widget ON cms_widget_bookmarks(widget_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_bookmarks_user ON cms_widget_bookmarks(user_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_widget_bookmarks_active ON cms_widget_bookmarks(is_bookmarked) WHERE is_bookmarked = 1"
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
