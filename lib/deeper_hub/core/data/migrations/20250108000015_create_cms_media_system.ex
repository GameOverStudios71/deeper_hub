defmodule DeeperHub.Core.Data.Migrations.CreateCmsMediaSystem do
  @moduledoc """
  Migration para criar o sistema de mídia/arquivos do CMS.
  Baseado na análise das tabelas sys_files e sys_images do UNA.
  """

  alias DeeperHub.Core.Data.Repo
  alias DeeperHub.Core.Logger
  require DeeperHub.Core.Logger

  @doc """
  Cria as tabelas do sistema de mídia.
  """
  def up do
    Logger.info("Criando sistema de mídia do CMS...", module: __MODULE__)

    with :ok <- create_media_storage(),
         :ok <- create_media_folders(),
         :ok <- create_media_files(),
         :ok <- create_media_transformations(),
         :ok <- create_media_file_transformations() do
      
      create_indexes()
      Logger.info("Sistema de mídia criado com sucesso!", module: __MODULE__)
      :ok
    else
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
  Remove as tabelas do sistema de mídia.
  """
  def down do
    Logger.info("Removendo sistema de mídia...", module: __MODULE__)

    tables = [
      "cms_media_file_transformations",
      "cms_media_transformations",
      "cms_media_files", 
      "cms_media_folders",
      "cms_media_storage"
    ]

    Enum.each(tables, fn table ->
      case Repo.execute("DROP TABLE IF EXISTS #{table}") do
        {:ok, _} -> Logger.info("Tabela #{table} removida.", module: __MODULE__)
        {:error, reason} -> Logger.error("Erro ao remover #{table}: #{inspect(reason)}", module: __MODULE__)
      end
    end)
    
    :ok
  end

  # Criar configurações de storage
  defp create_media_storage do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_media_storage (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      
      -- Tipo de storage
      storage_type VARCHAR(32) NOT NULL, -- local, s3, ftp, sftp, dropbox, etc.
      
      -- Configurações
      config TEXT NOT NULL, -- JSON com configurações específicas
      base_url VARCHAR(255) DEFAULT '',
      base_path VARCHAR(255) DEFAULT '',
      
      -- Limites
      max_file_size INTEGER DEFAULT 10485760, -- 10MB em bytes
      allowed_extensions TEXT DEFAULT '', -- JSON array
      quota_limit INTEGER DEFAULT 0, -- 0 = ilimitado
      quota_used INTEGER DEFAULT 0,
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_default BOOLEAN DEFAULT 0,
      is_public BOOLEAN DEFAULT 1,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_media_storage criada.", module: __MODULE__)
        insert_default_storage()
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_media_storage: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar pastas de mídia
  defp create_media_folders do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_media_folders (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      parent_id INTEGER DEFAULT NULL,
      storage_id INTEGER NOT NULL,
      
      -- Identificação
      name VARCHAR(255) NOT NULL,
      path VARCHAR(500) NOT NULL,
      full_path VARCHAR(1000) NOT NULL,
      
      -- Metadados
      description TEXT DEFAULT '',
      
      -- Permissões
      is_public BOOLEAN DEFAULT 1,
      visible_for_levels INTEGER DEFAULT 2147483647,
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_system BOOLEAN DEFAULT 0,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      created_by INTEGER,
      
      FOREIGN KEY (parent_id) REFERENCES cms_media_folders(id) ON DELETE CASCADE,
      FOREIGN KEY (storage_id) REFERENCES cms_media_storage(id),
      FOREIGN KEY (created_by) REFERENCES users(id),
      CONSTRAINT unique_folder_path UNIQUE (storage_id, full_path)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_media_folders criada.", module: __MODULE__)
        insert_default_folders()
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_media_folders: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar arquivos de mídia
  defp create_media_files do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_media_files (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      folder_id INTEGER DEFAULT NULL,
      storage_id INTEGER NOT NULL,
      
      -- Identificação
      original_name VARCHAR(255) NOT NULL,
      file_name VARCHAR(255) NOT NULL,
      file_path VARCHAR(500) NOT NULL,
      full_path VARCHAR(1000) NOT NULL,
      
      -- Metadados do arquivo
      file_size INTEGER NOT NULL,
      mime_type VARCHAR(100) NOT NULL,
      file_extension VARCHAR(10) NOT NULL,
      
      -- Hash para verificação
      file_hash VARCHAR(64) NOT NULL,
      
      -- Metadados específicos por tipo
      image_width INTEGER DEFAULT NULL,
      image_height INTEGER DEFAULT NULL,
      video_duration INTEGER DEFAULT NULL, -- segundos
      audio_duration INTEGER DEFAULT NULL, -- segundos
      
      -- Metadados adicionais
      title VARCHAR(255) DEFAULT '',
      description TEXT DEFAULT '',
      alt_text VARCHAR(255) DEFAULT '',
      caption TEXT DEFAULT '',
      
      -- SEO
      seo_title VARCHAR(255) DEFAULT '',
      seo_description TEXT DEFAULT '',
      
      -- Permissões
      is_public BOOLEAN DEFAULT 1,
      visible_for_levels INTEGER DEFAULT 2147483647,
      
      -- Estatísticas
      download_count INTEGER DEFAULT 0,
      view_count INTEGER DEFAULT 0,
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_featured BOOLEAN DEFAULT 0,
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      uploaded_by INTEGER,
      
      FOREIGN KEY (folder_id) REFERENCES cms_media_folders(id) ON DELETE SET NULL,
      FOREIGN KEY (storage_id) REFERENCES cms_media_storage(id),
      FOREIGN KEY (uploaded_by) REFERENCES users(id),
      CONSTRAINT unique_file_path UNIQUE (storage_id, full_path)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_media_files criada.", module: __MODULE__)
        :ok
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_media_files: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar transformações de mídia
  defp create_media_transformations do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_media_transformations (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64) NOT NULL UNIQUE,
      title VARCHAR(255) NOT NULL,
      description TEXT,
      
      -- Tipo de transformação
      transformation_type VARCHAR(32) NOT NULL, -- resize, crop, watermark, compress, convert
      
      -- Configurações
      config TEXT NOT NULL, -- JSON com parâmetros da transformação
      
      -- Aplicabilidade
      applicable_types TEXT NOT NULL, -- JSON array com tipos MIME
      
      -- Controle
      is_active BOOLEAN DEFAULT 1,
      is_automatic BOOLEAN DEFAULT 0, -- Aplicar automaticamente no upload
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      order_index INTEGER DEFAULT 0
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_media_transformations criada.", module: __MODULE__)
        insert_default_transformations()
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_media_transformations: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Criar arquivos transformados
  defp create_media_file_transformations do
    sql = """
    CREATE TABLE IF NOT EXISTS cms_media_file_transformations (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      original_file_id INTEGER NOT NULL,
      transformation_id INTEGER NOT NULL,
      
      -- Arquivo transformado
      file_name VARCHAR(255) NOT NULL,
      file_path VARCHAR(500) NOT NULL,
      full_path VARCHAR(1000) NOT NULL,
      file_size INTEGER NOT NULL,
      
      -- Metadados específicos
      image_width INTEGER DEFAULT NULL,
      image_height INTEGER DEFAULT NULL,
      
      -- Status
      status VARCHAR(32) DEFAULT 'pending', -- pending, processing, completed, failed
      error_message TEXT DEFAULT '',
      
      -- Timestamps
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      completed_at DATETIME DEFAULT NULL,
      
      FOREIGN KEY (original_file_id) REFERENCES cms_media_files(id) ON DELETE CASCADE,
      FOREIGN KEY (transformation_id) REFERENCES cms_media_transformations(id),
      CONSTRAINT unique_file_transformation UNIQUE (original_file_id, transformation_id)
    );
    """

    case Repo.execute(sql) do
      {:ok, _} -> 
        Logger.info("Tabela cms_media_file_transformations criada.", module: __MODULE__)
        :ok
      {:error, reason} -> 
        Logger.error("Erro ao criar cms_media_file_transformations: #{inspect(reason)}", module: __MODULE__)
        {:error, reason}
    end
  end

  # Inserir storage padrão
  defp insert_default_storage do
    storages = [
      {1, "local", "Armazenamento Local", "Armazenamento no servidor local", "local", ~s({"base_path": "/uploads", "create_folders": true}), "/uploads", "/var/www/uploads", 10485760, ~s(["jpg", "jpeg", "png", "gif", "pdf", "doc", "docx", "mp4", "mp3"]), 0, 0, 1, 1, 1},
      {2, "public", "Arquivos Públicos", "Arquivos acessíveis publicamente", "local", ~s({"base_path": "/public", "create_folders": true}), "/public", "/var/www/public", 5242880, ~s(["jpg", "jpeg", "png", "gif", "svg", "css", "js"]), 0, 0, 1, 0, 1}
    ]

    Enum.each(storages, fn {id, name, title, description, storage_type, config, base_url, base_path, max_file_size, allowed_extensions, quota_limit, quota_used, is_active, is_default, is_public} ->
      sql = """
      INSERT OR REPLACE INTO cms_media_storage 
      (id, name, title, description, storage_type, config, base_url, base_path, max_file_size, allowed_extensions, quota_limit, quota_used, is_active, is_default, is_public) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      """
      Repo.execute(sql, [id, name, title, description, storage_type, config, base_url, base_path, max_file_size, allowed_extensions, quota_limit, quota_used, is_active, is_default, is_public])
    end)
    
    :ok
  end

  # Inserir pastas padrão
  defp insert_default_folders do
    folders = [
      {1, nil, 1, "images", "images", "images", "Imagens", 1, 2147483647, 1, 0},
      {2, nil, 1, "documents", "documents", "documents", "Documentos", 1, 2147483647, 1, 0},
      {3, nil, 1, "videos", "videos", "videos", "Vídeos", 1, 2147483647, 1, 0},
      {4, nil, 1, "audio", "audio", "audio", "Áudios", 1, 2147483647, 1, 0},
      {5, 1, 1, "gallery", "images/gallery", "images/gallery", "Galeria de imagens", 1, 2147483647, 1, 0},
      {6, 1, 1, "thumbnails", "images/thumbnails", "images/thumbnails", "Miniaturas", 1, 2147483647, 1, 1}
    ]

    Enum.each(folders, fn {id, parent_id, storage_id, name, path, full_path, description, is_public, visible_for_levels, is_active, is_system} ->
      sql = """
      INSERT OR REPLACE INTO cms_media_folders 
      (id, parent_id, storage_id, name, path, full_path, description, is_public, visible_for_levels, is_active, is_system) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      """
      Repo.execute(sql, [id, parent_id, storage_id, name, path, full_path, description, is_public, visible_for_levels, is_active, is_system])
    end)
    
    :ok
  end

  # Inserir transformações padrão
  defp insert_default_transformations do
    transformations = [
      {1, "thumbnail", "Miniatura", "Redimensionar para miniatura 150x150", "resize", ~s({"width": 150, "height": 150, "mode": "crop", "quality": 85}), ~s(["image/jpeg", "image/png", "image/gif"]), 1, 1},
      {2, "medium", "Tamanho Médio", "Redimensionar para 300x300", "resize", ~s({"width": 300, "height": 300, "mode": "fit", "quality": 90}), ~s(["image/jpeg", "image/png", "image/gif"]), 1, 0},
      {3, "large", "Tamanho Grande", "Redimensionar para 800x600", "resize", ~s({"width": 800, "height": 600, "mode": "fit", "quality": 95}), ~s(["image/jpeg", "image/png", "image/gif"]), 1, 0},
      {4, "compress", "Compressão", "Comprimir imagem mantendo qualidade", "compress", ~s({"quality": 80, "progressive": true}), ~s(["image/jpeg", "image/png"]), 1, 1},
      {5, "watermark", "Marca d'água", "Adicionar marca d'água", "watermark", ~s({"text": "© Meu Site", "position": "bottom-right", "opacity": 0.7}), ~s(["image/jpeg", "image/png"]), 1, 0}
    ]

    Enum.each(transformations, fn {id, name, title, description, transformation_type, config, applicable_types, is_active, is_automatic} ->
      sql = """
      INSERT OR REPLACE INTO cms_media_transformations 
      (id, name, title, description, transformation_type, config, applicable_types, is_active, is_automatic, order_index) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      """
      Repo.execute(sql, [id, name, title, description, transformation_type, config, applicable_types, is_active, is_automatic, id])
    end)
    
    :ok
  end

  # Criar índices para performance
  defp create_indexes do
    indexes = [
      "CREATE INDEX IF NOT EXISTS idx_cms_media_storage_name ON cms_media_storage(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_storage_active ON cms_media_storage(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_storage_default ON cms_media_storage(is_default) WHERE is_default = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_folders_parent ON cms_media_folders(parent_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_folders_storage ON cms_media_folders(storage_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_folders_path ON cms_media_folders(full_path)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_folders_active ON cms_media_folders(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_folder ON cms_media_files(folder_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_storage ON cms_media_files(storage_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_name ON cms_media_files(file_name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_path ON cms_media_files(full_path)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_hash ON cms_media_files(file_hash)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_mime ON cms_media_files(mime_type)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_size ON cms_media_files(file_size)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_active ON cms_media_files(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_featured ON cms_media_files(is_featured) WHERE is_featured = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_uploaded ON cms_media_files(uploaded_by)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_files_created ON cms_media_files(created_at)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_transformations_name ON cms_media_transformations(name)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_transformations_type ON cms_media_transformations(transformation_type)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_transformations_active ON cms_media_transformations(is_active) WHERE is_active = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_transformations_auto ON cms_media_transformations(is_automatic) WHERE is_automatic = 1",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_file_transformations_original ON cms_media_file_transformations(original_file_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_file_transformations_transformation ON cms_media_file_transformations(transformation_id)",
      "CREATE INDEX IF NOT EXISTS idx_cms_media_file_transformations_status ON cms_media_file_transformations(status)"
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
