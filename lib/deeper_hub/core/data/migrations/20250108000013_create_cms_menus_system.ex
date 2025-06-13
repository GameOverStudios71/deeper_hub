defmodule DeeperHub.Core.Data.Migrations.CreateCmsMenusSystem do
  @moduledoc """
  Migration para criar o sistema de menus do CMS.
  Baseado na análise das tabelas sys_menu do UNA.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria as tabelas do sistema de menus.
  """
  def up do
    Logger.info("Criando sistema de menus do CMS...", module: __MODULE__)

    with :ok <- create_menu_sets(),
         :ok <- create_menu_templates(),
         :ok <- create_menu_items() do
      
      create_indexes()
      Logger.info("Sistema de menus criado com sucesso!", module: __MODULE__)
      :ok
    else
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Remove as tabelas do sistema de menus.
  """
  def down do
    Logger.info("Removendo sistema de menus...", module: __MODULE__)

    tables = [
      "cms_menu_items",
      "cms_menu_templates", 
      "cms_menu_sets"
    ]

    Enum.each(tables, fn table ->
      case Repo.execute("DROP TABLE IF EXISTS #{table}") do
        {:ok, _} -> Logger.info("Tabela #{table} removida.", module: __MODULE__)
        {:error, reason} -> Logger.error("Erro ao remover #{table}: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end

  # Criar conjuntos de menu
  defp create_menu_sets do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_menu_sets (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      
      -- Configurações
      template_id INTEGER DEFAULT 1,
      css_class VARCHAR(255) DEFAULT '',
      custom_css TEXT DEFAULT '',
      
      -- Comportamento
      max_depth INTEGER DEFAULT 3,
      show_icons BOOLEAN DEFAULT 1,
      show_badges BOOLEAN DEFAULT 1,
      responsive BOOLEAN DEFAULT 1,
      
      -- Permissões
      visible_for_levels INTEGER DEFAULT 2147483647,
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      created_by INTEGER,
      
      FOREIGN KEY (created_by) REFERENCES users(id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_menu_sets criada.", module: __MODULE__)
        insert_default_menu_sets()
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_menu_sets: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar templates de menu
  defp create_menu_templates do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_menu_templates (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      
      -- Configurações do template
      template_file VARCHAR(255) NOT NULL,
      css_class VARCHAR(255) DEFAULT '',
      js_file VARCHAR(255) DEFAULT '',
      
      -- Características
      supports_icons BOOLEAN DEFAULT 1,
      supports_badges BOOLEAN DEFAULT 1,
      supports_dropdown BOOLEAN DEFAULT 1,
      supports_mega_menu BOOLEAN DEFAULT 0,
      max_levels INTEGER DEFAULT 3,
      
      -- Responsividade
      is_responsive BOOLEAN DEFAULT 1,
      mobile_breakpoint INTEGER DEFAULT 768,
      
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
        Logger.info("Tabela cms_menu_templates criada.", module: __MODULE__)
        insert_default_menu_templates()
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_menu_templates: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar itens de menu
  defp create_menu_items do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_menu_items (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      menu_set_id INTEGER NOT NULL,
      parent_id INTEGER DEFAULT NULL,
      
      -- Identificação
      name VARCHAR(64) NOT NULL,
      title VARCHAR(255) NOT NULL,
      description TEXT DEFAULT '',
      
      -- Link
      link_type VARCHAR(32) DEFAULT 'url', -- url, page, entity, action, separator
      link_url VARCHAR(255) DEFAULT '',
      page_id INTEGER DEFAULT NULL,
      entity_name VARCHAR(64) DEFAULT '',
      
      -- Aparência
      icon VARCHAR(255) DEFAULT '',
      image VARCHAR(255) DEFAULT '',
      css_class VARCHAR(255) DEFAULT '',
      
      -- Badge/Contador
      badge_text VARCHAR(32) DEFAULT '',
      badge_color VARCHAR(32) DEFAULT '',
      badge_query TEXT DEFAULT '', -- SQL para contar dinamicamente
      
      -- Comportamento
      target VARCHAR(32) DEFAULT '_self', -- _self, _blank, _parent, _top
      onclick VARCHAR(255) DEFAULT '',
      
      -- Permissões
      visible_for_levels INTEGER DEFAULT 2147483647,
      
      -- Configurações avançadas
      submenu_template VARCHAR(255) DEFAULT '',
      mega_menu_content TEXT DEFAULT '', -- HTML para mega menu
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_separator BOOLEAN DEFAULT 0,
      order_index INTEGER DEFAULT 0,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      
      FOREIGN KEY (menu_set_id) REFERENCES cms_menu_sets(id) ON DELETE CASCADE,
      FOREIGN KEY (parent_id) REFERENCES cms_menu_items(id) ON DELETE CASCADE,
      FOREIGN KEY (page_id) REFERENCES cms_pages(id) ON DELETE SET NULL
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_menu_items criada.", module: __MODULE__)
        :ok
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_menu_items: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Inserir conjuntos de menu padrão
  defp insert_default_menu_sets do
    sets = [
      {1, "main_menu", "Menu Principal", "Menu principal de navegação do site", 1, "navbar-nav", "", 3, 1, 1, 1},
      {2, "footer_menu", "Menu do Rodapé", "Menu de links no rodapé", 2, "footer-links", "", 2, 0, 0, 1},
      {3, "sidebar_menu", "Menu Lateral", "Menu de navegação lateral", 3, "nav-pills nav-stacked", "", 4, 1, 1, 1},
      {4, "admin_menu", "Menu Administrativo", "Menu para área administrativa", 4, "admin-nav", "", 3, 1, 1, 1},
      {5, "user_menu", "Menu do Usuário", "Menu de opções do usuário logado", 5, "user-menu", "", 2, 1, 0, 1}
    ]

    Enum.each(sets, fn {id, name, title, description, template_id, css_class, custom_css, max_depth, show_icons, show_badges, responsive} ->
      sql = """
      INSERT OR REPLACE INTO cms_menu_sets 
      (id, name, title, description, template_id, css_class, custom_css, max_depth, show_icons, show_badges, responsive, is_system) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)
      """
      Repo.execute(sql, [id, name, title, description, template_id, css_class, custom_css, max_depth, show_icons, show_badges, responsive])
    end)
    
    :ok
  end

  # Inserir templates de menu padrão
  defp insert_default_menu_templates do
    templates = [
      {1, "horizontal", "Menu Horizontal", "Menu horizontal padrão", "horizontal.html", "navbar", "navbar.js", 1, 1, 1, 0, 3, 1, 768},
      {2, "vertical", "Menu Vertical", "Menu vertical para sidebar", "vertical.html", "nav-pills", "", 1, 1, 0, 0, 4, 1, 768},
      {3, "dropdown", "Menu Dropdown", "Menu com dropdown", "dropdown.html", "dropdown-menu", "dropdown.js", 1, 1, 1, 0, 3, 1, 768},
      {4, "mega_menu", "Mega Menu", "Menu com mega menu", "mega_menu.html", "mega-menu", "mega_menu.js", 1, 1, 1, 1, 2, 1, 992},
      {5, "breadcrumb", "Breadcrumb", "Navegação breadcrumb", "breadcrumb.html", "breadcrumb", "", 0, 0, 0, 0, 10, 1, 0},
      {6, "tabs", "Abas", "Menu em formato de abas", "tabs.html", "nav-tabs", "tabs.js", 1, 0, 0, 0, 1, 1, 768},
      {7, "accordion", "Accordion", "Menu em accordion", "accordion.html", "accordion", "accordion.js", 1, 1, 0, 0, 5, 1, 768},
      {8, "footer_links", "Links do Rodapé", "Links simples para rodapé", "footer_links.html", "footer-links", "", 0, 0, 0, 0, 2, 1, 768}
    ]

    Enum.each(templates, fn {id, name, title, description, template_file, css_class, js_file, supports_icons, supports_badges, supports_dropdown, supports_mega, max_levels, is_responsive, mobile_breakpoint} ->
      sql = """
      INSERT OR REPLACE INTO cms_menu_templates 
      (id, name, title, description, template_file, css_class, js_file, supports_icons, supports_badges, supports_dropdown, supports_mega_menu, max_levels, is_responsive, mobile_breakpoint, is_system, order_index) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, ?)
      """
      Repo.execute(sql, [id, name, title, description, template_file, css_class, js_file, supports_icons, supports_badges, supports_dropdown, supports_mega, max_levels, is_responsive, mobile_breakpoint, id])
    end)
    
    :ok
  end

  # Criar índices para performance
  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_sets_name ON cms_menu_sets(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_sets_active ON cms_menu_sets(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_sets_template ON cms_menu_sets(template_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_templates_name ON cms_menu_templates(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_templates_active ON cms_menu_templates(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_items_set ON cms_menu_items(menu_set_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_items_parent ON cms_menu_items(parent_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_items_order ON cms_menu_items(menu_set_id, parent_id, order_index)",
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_items_active ON cms_menu_items(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_items_page ON cms_menu_items(page_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_menu_items_type ON cms_menu_items(link_type)"
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
