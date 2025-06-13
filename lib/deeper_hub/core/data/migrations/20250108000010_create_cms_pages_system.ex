defmodule DeeperHub.Core.Data.Migrations.CreateCmsPagesSystem do
  @moduledoc """
  Migration para criar o sistema de páginas do CMS.
  Baseado na análise das tabelas sys_pages do UNA.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria as tabelas do sistema de páginas.
  """
  def up do
    Logger.info("Criando sistema de páginas do CMS...", module: __MODULE__)

    with :ok <- create_page_layouts(),
         :ok <- create_page_types(),
         :ok <- create_design_boxes(),
         :ok <- create_pages(),
         :ok <- create_page_blocks(),
         :ok <- create_page_block_data(),
         :ok <- create_content_placeholders() do

      create_indexes()
      Logger.info("Sistema de páginas criado com sucesso!", module: __MODULE__)
      :ok
    else
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Remove as tabelas do sistema de páginas.
  """
  def down do
    Logger.info("Removendo sistema de páginas...", module: __MODULE__)

    tables = [
      "cms_content_placeholders",
      "cms_page_block_data",
      "cms_page_blocks",
      "cms_pages",
      "cms_design_boxes",
      "cms_page_types",
      "cms_page_layouts"
    ]

    Enum.each(tables, fn table ->
      case Repo.execute("DROP TABLE IF EXISTS #{table}") do
        {:ok, _} -> Logger.info("Tabela #{table} removida.", module: __MODULE__)
        {:error, reason} -> Logger.error("Erro ao remover #{table}: #{inspect(reason)}", module: __MODULE__)
      end
    end)

    :ok
  end

  # Criar layouts de página
  defp create_page_layouts do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_page_layouts (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      template VARCHAR(255) NOT NULL,
      icon VARCHAR(255) DEFAULT '',
      cells_number INTEGER NOT NULL DEFAULT 1,
      cells_config TEXT, -- JSON com configuração das células
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      order_index INTEGER DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_page_layouts criada.", module: __MODULE__)
        insert_default_layouts()
      {:error, reason} ->
        Logger.error("Erro ao criar cms_page_layouts: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar tipos de página
  defp create_page_types do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_page_types (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      template VARCHAR(255) NOT NULL,
      icon VARCHAR(255) DEFAULT '',
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      order_index INTEGER DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_page_types criada.", module: __MODULE__)
        insert_default_page_types()
      {:error, reason} ->
        Logger.error("Erro ao criar cms_page_types: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar caixas de design
  defp create_design_boxes do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_design_boxes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      template VARCHAR(255) NOT NULL,
      css_class VARCHAR(255) DEFAULT '',
      icon VARCHAR(255) DEFAULT '',
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      order_index INTEGER DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_design_boxes criada.", module: __MODULE__)
        insert_default_design_boxes()
      {:error, reason} ->
        Logger.error("Erro ao criar cms_design_boxes: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar páginas
  defp create_pages do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_pages (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      uri VARCHAR(255) NOT NULL UNIQUE,
      title_system VARCHAR(255) NOT NULL,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      module VARCHAR(32) DEFAULT 'cms',
      page_type_id INTEGER NOT NULL DEFAULT 1,
      layout_id INTEGER NOT NULL DEFAULT 1,

      -- SEO e Meta
      meta_title VARCHAR(255) DEFAULT '',
      meta_description TEXT DEFAULT '',
      meta_keywords TEXT DEFAULT '',
      meta_robots VARCHAR(255) DEFAULT 'index,follow',

      -- Configurações
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      is_home BOOLEAN DEFAULT 0,
      sticky_columns BOOLEAN DEFAULT 0,

      -- Cache
      cache_lifetime INTEGER DEFAULT 0,
      cache_editable BOOLEAN DEFAULT 1,

      -- Permissões
      visible_for_levels INTEGER DEFAULT 2147483647,
      visible_for_levels_editable BOOLEAN DEFAULT 1,

      -- Injeções de código
      inject_head TEXT DEFAULT '',
      inject_footer TEXT DEFAULT '',

      -- Configurações avançadas
      config_api TEXT DEFAULT '', -- JSON
      custom_css TEXT DEFAULT '',
      custom_js TEXT DEFAULT '',

      -- Controle
      author_id INTEGER,
      is_deletable BOOLEAN DEFAULT 1,
      is_editable BOOLEAN DEFAULT 1,

      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      published_at DATETIME,

      FOREIGN KEY (page_type_id) REFERENCES cms_page_types(id),
      FOREIGN KEY (layout_id) REFERENCES cms_page_layouts(id),
      FOREIGN KEY (author_id) REFERENCES users(id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_pages criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_pages: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar blocos de página
  defp create_page_blocks do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_page_blocks (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      page_id INTEGER NOT NULL,
      cell_id INTEGER NOT NULL DEFAULT 1,
      module VARCHAR(32) NOT NULL DEFAULT 'cms',

      -- Identificação
      name VARCHAR(64) NOT NULL,
      title_system VARCHAR(255) NOT NULL,
      title VARCHAR(255) NOT NULL,
      description TEXT DEFAULT '',

      -- Tipo e conteúdo
      type VARCHAR(32) NOT NULL DEFAULT 'html', -- html, widget, service, menu, form, etc.
      content MEDIUMTEXT DEFAULT '',
      content_empty VARCHAR(255) DEFAULT '',

      -- Design
      design_box_id INTEGER DEFAULT 1,
      css_class VARCHAR(255) DEFAULT '',
      custom_css TEXT DEFAULT '',

      -- Configurações
      is_active BOOLEAN DEFAULT 1,
      is_async BOOLEAN DEFAULT 0,
      tabs BOOLEAN DEFAULT 0,

      -- Permissões e visibilidade
      visible_for_levels INTEGER DEFAULT 2147483647,
      hidden_on VARCHAR(255) DEFAULT '', -- mobile, tablet, desktop

      -- Cache
      cache_lifetime INTEGER DEFAULT 0,

      -- Configurações avançadas
      config_api TEXT DEFAULT '', -- JSON
      help TEXT DEFAULT '',

      -- Controle
      is_deletable BOOLEAN DEFAULT 1,
      is_copyable BOOLEAN DEFAULT 1,
      is_editable BOOLEAN DEFAULT 1,

      -- Ordenação
      order_index INTEGER DEFAULT 0,

      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (page_id) REFERENCES cms_pages(id) ON DELETE CASCADE,
      FOREIGN KEY (design_box_id) REFERENCES cms_design_boxes(id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_page_blocks criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_page_blocks: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar dados dos blocos
  defp create_page_block_data do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_page_block_data (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      block_id INTEGER NOT NULL,
      content_id INTEGER DEFAULT 0,
      content_module VARCHAR(32) DEFAULT '',
      data_key VARCHAR(255) NOT NULL,
      data_value TEXT DEFAULT '',
      data_type VARCHAR(32) DEFAULT 'text', -- text, json, html, number, boolean
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (block_id) REFERENCES cms_page_blocks(id) ON DELETE CASCADE,
      CONSTRAINT unique_block_key UNIQUE (block_id, data_key)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_page_block_data criada.", module: __MODULE__)
        :ok
      {:error, reason} ->
        Logger.error("Erro ao criar cms_page_block_data: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar placeholders de conteúdo
  defp create_content_placeholders do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_content_placeholders (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      module VARCHAR(32) NOT NULL DEFAULT 'cms',
      template VARCHAR(255) NOT NULL,
      placeholder_type VARCHAR(32) DEFAULT 'content', -- content, widget, menu, form
      default_content TEXT DEFAULT '',
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      order_index INTEGER DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} ->
        Logger.info("Tabela cms_content_placeholders criada.", module: __MODULE__)
        insert_default_placeholders()
      {:error, reason} ->
        Logger.error("Erro ao criar cms_content_placeholders: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Inserir layouts padrão
  defp insert_default_layouts do
    layouts = [
      {1, "single_column", "Uma Coluna", "Layout com uma única coluna central", "single_column.html", "layout", 1, ~s({"cells": [{"id": 1, "class": "col-12"}]})},
      {2, "two_columns", "Duas Colunas", "Layout com duas colunas (70/30)", "two_columns.html", "layout", 2, ~s({"cells": [{"id": 1, "class": "col-8"}, {"id": 2, "class": "col-4"}]})},
      {3, "three_columns", "Três Colunas", "Layout com três colunas iguais", "three_columns.html", "layout", 3, ~s({"cells": [{"id": 1, "class": "col-4"}, {"id": 2, "class": "col-4"}, {"id": 3, "class": "col-4"}]})},
      {4, "sidebar_left", "Sidebar Esquerda", "Layout com sidebar à esquerda (30/70)", "sidebar_left.html", "layout", 2, ~s({"cells": [{"id": 1, "class": "col-4"}, {"id": 2, "class": "col-8"}]})},
      {5, "full_width", "Largura Total", "Layout de largura total sem margens", "full_width.html", "layout", 1, ~s({"cells": [{"id": 1, "class": "col-12 p-0"}]})}
    ]

    Enum.each(layouts, fn {id, name, title, description, template, icon, cells, config} ->
      sql = """
      INSERT OR REPLACE INTO cms_page_layouts
      (id, name, title, description, template, icon, cells_number, cells_config, is_system, order_index)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1, ?)
      """
      Repo.execute(sql, [id, name, title, description, template, icon, cells, config, id])
    end)

    :ok
  end

  # Inserir tipos de página padrão
  defp insert_default_page_types do
    types = [
      {1, "standard", "Página Padrão", "Página padrão do sistema", "page.html", "file-text"},
      {2, "home", "Página Inicial", "Página inicial do site", "home.html", "home"},
      {3, "landing", "Landing Page", "Página de destino para campanhas", "landing.html", "target"},
      {4, "blog", "Blog", "Página de blog com posts", "blog.html", "edit"},
      {5, "contact", "Contato", "Página de contato", "contact.html", "mail"},
      {6, "about", "Sobre", "Página sobre a empresa", "about.html", "info"}
    ]

    Enum.each(types, fn {id, name, title, description, template, icon} ->
      sql = """
      INSERT OR REPLACE INTO cms_page_types
      (id, name, title, description, template, icon, is_system, order_index)
      VALUES (?, ?, ?, ?, ?, ?, 1, ?)
      """
      Repo.execute(sql, [id, name, title, description, template, icon, id])
    end)

    :ok
  end

  # Inserir caixas de design padrão
  defp insert_default_design_boxes do
    boxes = [
      {1, "none", "Sem Caixa", "Sem decoração", "none.html", "", ""},
      {2, "card", "Card", "Caixa com bordas e sombra", "card.html", "card", "card"},
      {3, "panel", "Painel", "Painel com cabeçalho", "panel.html", "card panel-default", "square"},
      {4, "well", "Well", "Caixa com fundo cinza", "well.html", "well", "square"},
      {5, "alert_info", "Alerta Info", "Caixa de informação", "alert.html", "alert alert-info", "info"},
      {6, "alert_success", "Alerta Sucesso", "Caixa de sucesso", "alert.html", "alert alert-success", "check"},
      {7, "alert_warning", "Alerta Aviso", "Caixa de aviso", "alert.html", "alert alert-warning", "warning"},
      {8, "alert_danger", "Alerta Erro", "Caixa de erro", "alert.html", "alert alert-danger", "times"}
    ]

    Enum.each(boxes, fn {id, name, title, description, template, css_class, icon} ->
      sql = """
      INSERT OR REPLACE INTO cms_design_boxes
      (id, name, title, description, template, css_class, icon, is_system, order_index)
      VALUES (?, ?, ?, ?, ?, ?, ?, 1, ?)
      """
      Repo.execute(sql, [id, name, title, description, template, css_class, icon, id])
    end)

    :ok
  end

  # Inserir placeholders padrão
  defp insert_default_placeholders do
    placeholders = [
      {1, "main_content", "Conteúdo Principal", "Área principal de conteúdo", "cms", "main_content.html", "content"},
      {2, "sidebar", "Barra Lateral", "Barra lateral para widgets", "cms", "sidebar.html", "widget"},
      {3, "header", "Cabeçalho", "Área do cabeçalho", "cms", "header.html", "content"},
      {4, "footer", "Rodapé", "Área do rodapé", "cms", "footer.html", "content"},
      {5, "navigation", "Navegação", "Menu de navegação", "cms", "navigation.html", "menu"}
    ]

    Enum.each(placeholders, fn {id, name, title, description, module, template, type} ->
      sql = """
      INSERT OR REPLACE INTO cms_content_placeholders
      (id, name, title, description, module, template, placeholder_type, is_system, order_index)
      VALUES (?, ?, ?, ?, ?, ?, ?, 1, ?)
      """
      Repo.execute(sql, [id, name, title, description, module, template, type, id])
    end)

    :ok
  end

  # Criar índices para performance
  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_cms_pages_uri ON cms_pages(uri)",
      "CREATE INDEX IF NOT EXISTS idx_cms_pages_active ON cms_pages(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_pages_home ON cms_pages(is_home) WHERE is_home = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_pages_type ON cms_pages(page_type_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_pages_layout ON cms_pages(layout_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_page_blocks_page ON cms_page_blocks(page_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_page_blocks_cell ON cms_page_blocks(page_id, cell_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_page_blocks_order ON cms_page_blocks(page_id, order_index)",
      "CREATE INDEX IF NOT EXISTS idx_cms_page_blocks_active ON cms_page_blocks(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_page_block_data_block ON cms_page_block_data(block_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_page_block_data_key ON cms_page_block_data(data_key)"
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
