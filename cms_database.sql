-- =====================================================
-- CMS DINÂMICO - SISTEMA QUE CRIA SISTEMAS
-- SQLite Database Schema & Queries
-- Pronto para Produção com Performance Otimizada
-- =====================================================

-- Habilitar Foreign Keys no SQLite
PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;
PRAGMA synchronous = NORMAL;
PRAGMA cache_size = 10000;
PRAGMA temp_store = memory;

-- =====================================================
-- 1. CRIAÇÃO DAS TABELAS PRINCIPAIS
-- =====================================================

-- Tabela de Entidades (Tipos de Conteúdo)
CREATE TABLE entities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    display_name VARCHAR(200) NOT NULL,
    description TEXT,
    icon VARCHAR(50),
    is_active BOOLEAN DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    
    -- Índices para performance
    CONSTRAINT entities_name_unique UNIQUE (name)
);

-- Tabela de Campos (Definição de Estrutura)
CREATE TABLE fields (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    entity_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    display_name VARCHAR(200) NOT NULL,
    field_type VARCHAR(50) NOT NULL, -- text, number, date, boolean, file, relation, json, email, url
    is_required BOOLEAN DEFAULT 0,
    is_unique BOOLEAN DEFAULT 0,
    is_searchable BOOLEAN DEFAULT 1,
    default_value TEXT,
    validation_rules TEXT, -- JSON com regras de validação
    field_options TEXT, -- JSON com opções (para select, radio, etc)
    order_index INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE,
    CONSTRAINT fields_entity_name_unique UNIQUE (entity_id, name)
);

-- Tabela de Dados Genérica (Armazenamento EAV)
CREATE TABLE entity_data (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    entity_id INTEGER NOT NULL,
    field_id INTEGER NOT NULL,
    record_id VARCHAR(36) NOT NULL, -- UUID para agrupar campos do mesmo registro
    value TEXT, -- Valor armazenado como texto
    value_numeric REAL, -- Valor numérico para ordenação/filtros
    value_date DATETIME, -- Valor de data para ordenação/filtros
    is_active BOOLEAN DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    
    FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE,
    FOREIGN KEY (field_id) REFERENCES fields(id) ON DELETE CASCADE
);

-- Tabela de Relacionamentos
CREATE TABLE relationships (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    from_entity_id INTEGER NOT NULL,
    to_entity_id INTEGER NOT NULL,
    relationship_type VARCHAR(20) NOT NULL, -- one_to_one, one_to_many, many_to_many
    from_field_id INTEGER,
    to_field_id INTEGER,
    is_active BOOLEAN DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (from_entity_id) REFERENCES entities(id) ON DELETE CASCADE,
    FOREIGN KEY (to_entity_id) REFERENCES entities(id) ON DELETE CASCADE,
    FOREIGN KEY (from_field_id) REFERENCES fields(id) ON DELETE SET NULL,
    FOREIGN KEY (to_field_id) REFERENCES fields(id) ON DELETE SET NULL
);

-- Tabela para Relacionamentos Many-to-Many
CREATE TABLE entity_relationships (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    relationship_id INTEGER NOT NULL,
    from_record_id VARCHAR(36) NOT NULL,
    to_record_id VARCHAR(36) NOT NULL,
    order_index INTEGER DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (relationship_id) REFERENCES relationships(id) ON DELETE CASCADE,
    CONSTRAINT unique_relationship UNIQUE (relationship_id, from_record_id, to_record_id)
);

-- Tabela de Usuários (Sistema de Permissões)
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(200),
    is_active BOOLEAN DEFAULT 1,
    is_admin BOOLEAN DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME
);

-- Tabela de Permissões
CREATE TABLE permissions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    entity_id INTEGER,
    permission_type VARCHAR(20) NOT NULL, -- create, read, update, delete, admin
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE,
    CONSTRAINT unique_permission UNIQUE (user_id, entity_id, permission_type)
);

-- Tabela de Auditoria
CREATE TABLE audit_log (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    table_name VARCHAR(100) NOT NULL,
    record_id VARCHAR(36) NOT NULL,
    action VARCHAR(20) NOT NULL, -- INSERT, UPDATE, DELETE
    old_values TEXT, -- JSON
    new_values TEXT, -- JSON
    user_id INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- =====================================================
-- 2. ÍNDICES PARA PERFORMANCE MÁXIMA
-- =====================================================

-- Índices principais para entity_data (tabela mais crítica)
CREATE INDEX idx_entity_data_entity_record ON entity_data(entity_id, record_id);
CREATE INDEX idx_entity_data_field_value ON entity_data(field_id, value);
CREATE INDEX idx_entity_data_numeric ON entity_data(value_numeric) WHERE value_numeric IS NOT NULL;
CREATE INDEX idx_entity_data_date ON entity_data(value_date) WHERE value_date IS NOT NULL;
CREATE INDEX idx_entity_data_search ON entity_data(entity_id, value) WHERE is_active = 1;
CREATE INDEX idx_entity_data_created ON entity_data(created_at);

-- Índices para fields
CREATE INDEX idx_fields_entity ON fields(entity_id) WHERE is_active = 1;
CREATE INDEX idx_fields_type ON fields(field_type);
CREATE INDEX idx_fields_searchable ON fields(is_searchable) WHERE is_searchable = 1;

-- Índices para relationships
CREATE INDEX idx_relationships_from ON relationships(from_entity_id);
CREATE INDEX idx_relationships_to ON relationships(to_entity_id);
CREATE INDEX idx_entity_relationships_from ON entity_relationships(from_record_id);
CREATE INDEX idx_entity_relationships_to ON entity_relationships(to_record_id);

-- Índices para usuários e permissões
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_permissions_user ON permissions(user_id);
CREATE INDEX idx_permissions_entity ON permissions(entity_id);

-- Índice para auditoria
CREATE INDEX idx_audit_table_record ON audit_log(table_name, record_id);
CREATE INDEX idx_audit_created ON audit_log(created_at);

-- =====================================================
-- 3. TRIGGERS PARA AUDITORIA E INTEGRIDADE
-- =====================================================

-- Trigger para atualizar updated_at automaticamente
CREATE TRIGGER update_entities_timestamp 
    AFTER UPDATE ON entities
BEGIN
    UPDATE entities SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

CREATE TRIGGER update_fields_timestamp 
    AFTER UPDATE ON fields
BEGIN
    UPDATE fields SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

CREATE TRIGGER update_entity_data_timestamp 
    AFTER UPDATE ON entity_data
BEGIN
    UPDATE entity_data SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Trigger para popular campos value_numeric e value_date automaticamente
CREATE TRIGGER populate_typed_values
    AFTER INSERT ON entity_data
BEGIN
    UPDATE entity_data
    SET
        value_numeric = CASE
            WHEN (SELECT field_type FROM fields WHERE id = NEW.field_id) IN ('number', 'integer', 'decimal')
            THEN CAST(NEW.value AS REAL)
            ELSE NULL
        END,
        value_date = CASE
            WHEN (SELECT field_type FROM fields WHERE id = NEW.field_id) IN ('date', 'datetime', 'timestamp')
            THEN datetime(NEW.value)
            ELSE NULL
        END
    WHERE id = NEW.id;
END;

-- Trigger para auditoria em entity_data
CREATE TRIGGER audit_entity_data_insert
    AFTER INSERT ON entity_data
BEGIN
    INSERT INTO audit_log (table_name, record_id, action, new_values, user_id)
    VALUES ('entity_data', NEW.record_id, 'INSERT',
            json_object('field_id', NEW.field_id, 'value', NEW.value), NEW.created_by);
END;

CREATE TRIGGER audit_entity_data_update
    AFTER UPDATE ON entity_data
BEGIN
    INSERT INTO audit_log (table_name, record_id, action, old_values, new_values, user_id)
    VALUES ('entity_data', NEW.record_id, 'UPDATE',
            json_object('field_id', OLD.field_id, 'value', OLD.value),
            json_object('field_id', NEW.field_id, 'value', NEW.value), NEW.created_by);
END;

-- =====================================================
-- 4. VIEWS PARA FACILITAR CONSULTAS
-- =====================================================

-- View para listar todos os registros com metadados
CREATE VIEW v_entity_records AS
SELECT DISTINCT
    ed.entity_id,
    e.name as entity_name,
    e.display_name as entity_display_name,
    ed.record_id,
    ed.created_at,
    ed.updated_at,
    ed.created_by
FROM entity_data ed
JOIN entities e ON ed.entity_id = e.id
WHERE ed.is_active = 1 AND e.is_active = 1;

-- View para estrutura de campos por entidade
CREATE VIEW v_entity_structure AS
SELECT
    e.id as entity_id,
    e.name as entity_name,
    e.display_name as entity_display_name,
    f.id as field_id,
    f.name as field_name,
    f.display_name as field_display_name,
    f.field_type,
    f.is_required,
    f.is_unique,
    f.is_searchable,
    f.default_value,
    f.validation_rules,
    f.field_options,
    f.order_index
FROM entities e
JOIN fields f ON e.id = f.entity_id
WHERE e.is_active = 1 AND f.is_active = 1
ORDER BY e.name, f.order_index, f.name;

-- =====================================================
-- 5. FUNÇÕES AUXILIARES (STORED PROCEDURES SIMULADAS)
-- =====================================================

-- Não há stored procedures no SQLite, mas podemos criar views complexas

-- View para busca full-text em todos os campos de texto
CREATE VIEW v_searchable_content AS
SELECT
    ed.entity_id,
    e.name as entity_name,
    ed.record_id,
    ed.field_id,
    f.name as field_name,
    f.display_name as field_display_name,
    ed.value,
    ed.created_at
FROM entity_data ed
JOIN entities e ON ed.entity_id = e.id
JOIN fields f ON ed.field_id = f.id
WHERE ed.is_active = 1
    AND e.is_active = 1
    AND f.is_active = 1
    AND f.is_searchable = 1
    AND f.field_type IN ('text', 'textarea', 'email', 'url');

-- =====================================================
-- 6. DADOS DE EXEMPLO E CONFIGURAÇÃO INICIAL
-- =====================================================

-- Inserir usuário administrador padrão
INSERT INTO users (username, email, password_hash, full_name, is_admin)
VALUES ('admin', 'admin@cms.local', '$2b$12$hash_aqui', 'Administrador', 1);

-- Criar entidade de exemplo: Blog Posts
INSERT INTO entities (name, display_name, description, icon)
VALUES ('blog_posts', 'Posts do Blog', 'Artigos e posts do blog', 'article');

-- Campos para Blog Posts
INSERT INTO fields (entity_id, name, display_name, field_type, is_required, is_searchable, order_index) VALUES
((SELECT id FROM entities WHERE name = 'blog_posts'), 'title', 'Título', 'text', 1, 1, 1),
((SELECT id FROM entities WHERE name = 'blog_posts'), 'slug', 'URL Amigável', 'text', 1, 1, 2),
((SELECT id FROM entities WHERE name = 'blog_posts'), 'content', 'Conteúdo', 'textarea', 1, 1, 3),
((SELECT id FROM entities WHERE name = 'blog_posts'), 'excerpt', 'Resumo', 'textarea', 0, 1, 4),
((SELECT id FROM entities WHERE name = 'blog_posts'), 'featured_image', 'Imagem Destacada', 'file', 0, 0, 5),
((SELECT id FROM entities WHERE name = 'blog_posts'), 'published_at', 'Data de Publicação', 'datetime', 0, 0, 6),
((SELECT id FROM entities WHERE name = 'blog_posts'), 'is_published', 'Publicado', 'boolean', 0, 0, 7),
((SELECT id FROM entities WHERE name = 'blog_posts'), 'view_count', 'Visualizações', 'number', 0, 0, 8);

-- Criar entidade de exemplo: Produtos
INSERT INTO entities (name, display_name, description, icon)
VALUES ('products', 'Produtos', 'Catálogo de produtos', 'shopping-cart');

-- Campos para Produtos
INSERT INTO fields (entity_id, name, display_name, field_type, is_required, is_searchable, order_index, validation_rules) VALUES
((SELECT id FROM entities WHERE name = 'products'), 'name', 'Nome do Produto', 'text', 1, 1, 1, '{"min_length": 3, "max_length": 200}'),
((SELECT id FROM entities WHERE name = 'products'), 'sku', 'Código SKU', 'text', 1, 1, 2, '{"pattern": "^[A-Z0-9-]+$"}'),
((SELECT id FROM entities WHERE name = 'products'), 'description', 'Descrição', 'textarea', 1, 1, 3, NULL),
((SELECT id FROM entities WHERE name = 'products'), 'price', 'Preço', 'decimal', 1, 0, 4, '{"min": 0}'),
((SELECT id FROM entities WHERE name = 'products'), 'stock_quantity', 'Estoque', 'integer', 1, 0, 5, '{"min": 0}'),
((SELECT id FROM entities WHERE name = 'products'), 'is_active', 'Ativo', 'boolean', 0, 0, 6, NULL),
((SELECT id FROM entities WHERE name = 'products'), 'category', 'Categoria', 'text', 0, 1, 7, NULL),
((SELECT id FROM entities WHERE name = 'products'), 'tags', 'Tags', 'text', 0, 1, 8, NULL);

-- =====================================================
-- 7. QUERIES BÁSICAS - CRUD OPERATIONS
-- =====================================================

-- 7.1 CRIAR UM NOVO REGISTRO
-- Exemplo: Criar um novo post de blog
-- Primeiro, gerar um UUID para o record_id (em aplicação real, usar UUID library)
-- Para SQLite, vamos usar um timestamp + random como ID único

-- Inserir dados de um post de blog
WITH new_record AS (
    SELECT
        datetime('now') || '-' || abs(random()) as record_id,
        (SELECT id FROM entities WHERE name = 'blog_posts') as entity_id
)
INSERT INTO entity_data (entity_id, field_id, record_id, value, created_by)
SELECT
    nr.entity_id,
    f.id as field_id,
    nr.record_id,
    CASE f.name
        WHEN 'title' THEN 'Meu Primeiro Post'
        WHEN 'slug' THEN 'meu-primeiro-post'
        WHEN 'content' THEN 'Este é o conteúdo do meu primeiro post...'
        WHEN 'excerpt' THEN 'Resumo do primeiro post'
        WHEN 'is_published' THEN '1'
        WHEN 'published_at' THEN datetime('now')
        WHEN 'view_count' THEN '0'
    END as value,
    1 as created_by
FROM new_record nr
CROSS JOIN fields f
WHERE f.entity_id = nr.entity_id
    AND f.name IN ('title', 'slug', 'content', 'excerpt', 'is_published', 'published_at', 'view_count');

-- 7.2 LISTAR TODOS OS REGISTROS DE UMA ENTIDADE
-- Exemplo: Listar todos os posts do blog
SELECT
    ed.record_id,
    GROUP_CONCAT(
        f.name || ':' || COALESCE(ed.value, ''),
        '|'
    ) as fields_data,
    ed.created_at
FROM entity_data ed
JOIN fields f ON ed.field_id = f.id
JOIN entities e ON ed.entity_id = e.id
WHERE e.name = 'blog_posts'
    AND ed.is_active = 1
GROUP BY ed.record_id, ed.created_at
ORDER BY ed.created_at DESC;

-- 7.3 BUSCAR UM REGISTRO ESPECÍFICO
-- Exemplo: Buscar post por slug
SELECT
    f.name as field_name,
    f.display_name,
    ed.value,
    f.field_type
FROM entity_data ed
JOIN fields f ON ed.field_id = f.id
JOIN entities e ON ed.entity_id = e.id
WHERE e.name = 'blog_posts'
    AND ed.record_id = (
        SELECT ed2.record_id
        FROM entity_data ed2
        JOIN fields f2 ON ed2.field_id = f2.id
        WHERE f2.name = 'slug'
            AND ed2.value = 'meu-primeiro-post'
        LIMIT 1
    )
    AND ed.is_active = 1
ORDER BY f.order_index;

-- 7.4 ATUALIZAR UM REGISTRO
-- Exemplo: Atualizar título de um post
UPDATE entity_data
SET value = 'Título Atualizado do Post',
    updated_at = CURRENT_TIMESTAMP
WHERE record_id = (
    SELECT ed.record_id
    FROM entity_data ed
    JOIN fields f ON ed.field_id = f.id
    WHERE f.name = 'slug'
        AND ed.value = 'meu-primeiro-post'
    LIMIT 1
)
AND field_id = (
    SELECT f.id FROM fields f
    JOIN entities e ON f.entity_id = e.id
    WHERE e.name = 'blog_posts' AND f.name = 'title'
);

-- 7.5 DELETAR UM REGISTRO (Soft Delete)
-- Exemplo: Desativar um post
UPDATE entity_data
SET is_active = 0,
    updated_at = CURRENT_TIMESTAMP
WHERE record_id = (
    SELECT ed.record_id
    FROM entity_data ed
    JOIN fields f ON ed.field_id = f.id
    WHERE f.name = 'slug'
        AND ed.value = 'meu-primeiro-post'
    LIMIT 1
);

-- =====================================================
-- 8. QUERIES INTERMEDIÁRIAS - FILTROS E ORDENAÇÃO
-- =====================================================

-- 8.1 BUSCA POR TEXTO EM MÚLTIPLOS CAMPOS
-- Exemplo: Buscar posts que contenham "primeiro" no título ou conteúdo
SELECT DISTINCT
    ed.record_id,
    e.display_name as entity_type,
    GROUP_CONCAT(
        f.display_name || ': ' || ed.value,
        ' | '
    ) as matched_fields
FROM entity_data ed
JOIN fields f ON ed.field_id = f.id
JOIN entities e ON ed.entity_id = e.id
WHERE e.name = 'blog_posts'
    AND f.is_searchable = 1
    AND ed.value LIKE '%primeiro%'
    AND ed.is_active = 1
GROUP BY ed.record_id, e.display_name;

-- 8.2 FILTRAR POR CAMPO ESPECÍFICO COM OPERADORES
-- Exemplo: Produtos com preço entre 100 e 500
SELECT
    ed.record_id,
    GROUP_CONCAT(
        f.name || ':' || ed.value,
        '|'
    ) as product_data
FROM entity_data ed
JOIN fields f ON ed.field_id = f.id
JOIN entities e ON ed.entity_id = e.id
WHERE e.name = 'products'
    AND ed.record_id IN (
        SELECT ed2.record_id
        FROM entity_data ed2
        JOIN fields f2 ON ed2.field_id = f2.id
        WHERE f2.name = 'price'
            AND ed2.value_numeric BETWEEN 100 AND 500
    )
    AND ed.is_active = 1
GROUP BY ed.record_id;

-- 8.3 ORDENAÇÃO POR CAMPO ESPECÍFICO
-- Exemplo: Posts ordenados por data de publicação (mais recentes primeiro)
SELECT
    ed.record_id,
    MAX(CASE WHEN f.name = 'title' THEN ed.value END) as title,
    MAX(CASE WHEN f.name = 'published_at' THEN ed.value_date END) as published_at,
    MAX(CASE WHEN f.name = 'view_count' THEN ed.value_numeric END) as views
FROM entity_data ed
JOIN fields f ON ed.field_id = f.id
JOIN entities e ON ed.entity_id = e.id
WHERE e.name = 'blog_posts'
    AND ed.is_active = 1
    AND f.name IN ('title', 'published_at', 'view_count')
GROUP BY ed.record_id
ORDER BY published_at DESC NULLS LAST;

-- 8.4 PAGINAÇÃO EFICIENTE
-- Exemplo: Página 2, 10 registros por página
SELECT
    ed.record_id,
    MAX(CASE WHEN f.name = 'title' THEN ed.value END) as title,
    MAX(CASE WHEN f.name = 'excerpt' THEN ed.value END) as excerpt,
    ed.created_at
FROM entity_data ed
JOIN fields f ON ed.field_id = f.id
JOIN entities e ON ed.entity_id = e.id
WHERE e.name = 'blog_posts'
    AND ed.is_active = 1
GROUP BY ed.record_id, ed.created_at
ORDER BY ed.created_at DESC
LIMIT 10 OFFSET 10;

-- =====================================================
-- 9. QUERIES AVANÇADAS - RELACIONAMENTOS E JOINS
-- =====================================================

-- 9.1 CRIAR RELACIONAMENTO ENTRE ENTIDADES
-- Exemplo: Relacionar Posts com Categorias
INSERT INTO entities (name, display_name, description, icon)
VALUES ('categories', 'Categorias', 'Categorias para organização', 'folder');

INSERT INTO fields (entity_id, name, display_name, field_type, is_required, order_index) VALUES
((SELECT id FROM entities WHERE name = 'categories'), 'name', 'Nome da Categoria', 'text', 1, 1),
((SELECT id FROM entities WHERE name = 'categories'), 'description', 'Descrição', 'textarea', 0, 2),
((SELECT id FROM entities WHERE name = 'categories'), 'color', 'Cor', 'text', 0, 3);

-- Criar relacionamento
INSERT INTO relationships (name, from_entity_id, to_entity_id, relationship_type)
VALUES (
    'post_category',
    (SELECT id FROM entities WHERE name = 'blog_posts'),
    (SELECT id FROM entities WHERE name = 'categories'),
    'many_to_one'
);

-- Adicionar campo de categoria aos posts
INSERT INTO fields (entity_id, name, display_name, field_type, is_required, order_index)
VALUES (
    (SELECT id FROM entities WHERE name = 'blog_posts'),
    'category_id',
    'Categoria',
    'relation',
    0,
    9
);

-- 9.2 QUERY COM JOIN ENTRE ENTIDADES RELACIONADAS
-- Exemplo: Posts com suas categorias
SELECT
    p.record_id as post_id,
    MAX(CASE WHEN pf.name = 'title' THEN pd.value END) as post_title,
    MAX(CASE WHEN pf.name = 'published_at' THEN pd.value_date END) as published_at,
    MAX(CASE WHEN cf.name = 'name' THEN cd.value END) as category_name,
    MAX(CASE WHEN cf.name = 'color' THEN cd.value END) as category_color
FROM entity_data pd
JOIN fields pf ON pd.field_id = pf.id
JOIN entities pe ON pd.entity_id = pe.id
LEFT JOIN entity_data category_link ON (
    category_link.record_id = pd.record_id
    AND category_link.field_id = (
        SELECT id FROM fields
        WHERE entity_id = pe.id AND name = 'category_id'
    )
)
LEFT JOIN entity_data cd ON (
    cd.record_id = category_link.value
    AND cd.entity_id = (SELECT id FROM entities WHERE name = 'categories')
)
LEFT JOIN fields cf ON cd.field_id = cf.id
WHERE pe.name = 'blog_posts'
    AND pd.is_active = 1
    AND pf.name IN ('title', 'published_at')
GROUP BY p.record_id
ORDER BY published_at DESC;

-- 9.3 QUERY PARA RELACIONAMENTOS MANY-TO-MANY
-- Exemplo: Posts com múltiplas tags
CREATE TABLE IF NOT EXISTS tags (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS post_tags (
    post_record_id VARCHAR(36) NOT NULL,
    tag_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (post_record_id, tag_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Inserir algumas tags
INSERT OR IGNORE INTO tags (name) VALUES ('tecnologia'), ('programação'), ('web'), ('tutorial');

-- Query para posts com suas tags
SELECT
    pd.record_id as post_id,
    MAX(CASE WHEN f.name = 'title' THEN pd.value END) as title,
    GROUP_CONCAT(t.name, ', ') as tags
FROM entity_data pd
JOIN fields f ON pd.field_id = f.id
JOIN entities e ON pd.entity_id = e.id
LEFT JOIN post_tags pt ON pd.record_id = pt.post_record_id
LEFT JOIN tags t ON pt.tag_id = t.id
WHERE e.name = 'blog_posts'
    AND pd.is_active = 1
GROUP BY pd.record_id
ORDER BY pd.created_at DESC;

-- =====================================================
-- 10. QUERIES COMPLEXAS - ANALYTICS E RELATÓRIOS
-- =====================================================

-- 10.1 ESTATÍSTICAS POR ENTIDADE
SELECT
    e.name as entity_name,
    e.display_name,
    COUNT(DISTINCT ed.record_id) as total_records,
    COUNT(ed.id) as total_fields_filled,
    MIN(ed.created_at) as first_record,
    MAX(ed.created_at) as last_record,
    AVG(
        CASE WHEN f.field_type = 'number'
        THEN ed.value_numeric
        ELSE NULL END
    ) as avg_numeric_value
FROM entities e
LEFT JOIN entity_data ed ON e.id = ed.entity_id AND ed.is_active = 1
LEFT JOIN fields f ON ed.field_id = f.id
WHERE e.is_active = 1
GROUP BY e.id, e.name, e.display_name
ORDER BY total_records DESC;

-- 10.2 ANÁLISE DE CAMPOS MAIS UTILIZADOS
SELECT
    e.name as entity_name,
    f.name as field_name,
    f.display_name,
    f.field_type,
    COUNT(ed.id) as usage_count,
    COUNT(CASE WHEN ed.value IS NOT NULL AND ed.value != '' THEN 1 END) as filled_count,
    ROUND(
        COUNT(CASE WHEN ed.value IS NOT NULL AND ed.value != '' THEN 1 END) * 100.0 / COUNT(ed.id),
        2
    ) as fill_percentage
FROM entities e
JOIN fields f ON e.id = f.entity_id
LEFT JOIN entity_data ed ON f.id = ed.field_id AND ed.is_active = 1
WHERE e.is_active = 1 AND f.is_active = 1
GROUP BY e.id, f.id
HAVING usage_count > 0
ORDER BY e.name, fill_percentage DESC;

-- 10.3 BUSCA FULL-TEXT AVANÇADA COM RANKING
-- Simulação de busca com score de relevância
WITH search_results AS (
    SELECT
        ed.record_id,
        e.name as entity_name,
        f.name as field_name,
        f.display_name as field_display_name,
        ed.value,
        CASE
            WHEN f.name = 'title' THEN 10
            WHEN f.name = 'name' THEN 8
            WHEN f.field_type = 'text' THEN 5
            WHEN f.field_type = 'textarea' THEN 3
            ELSE 1
        END as field_weight,
        LENGTH(ed.value) - LENGTH(REPLACE(LOWER(ed.value), LOWER('tecnologia'), '')) as match_count
    FROM entity_data ed
    JOIN fields f ON ed.field_id = f.id
    JOIN entities e ON ed.entity_id = e.id
    WHERE ed.is_active = 1
        AND f.is_searchable = 1
        AND LOWER(ed.value) LIKE '%tecnologia%'
)
SELECT
    record_id,
    entity_name,
    GROUP_CONCAT(field_display_name || ': ' || value, ' | ') as matched_content,
    SUM(field_weight * match_count) as relevance_score
FROM search_results
GROUP BY record_id, entity_name
ORDER BY relevance_score DESC, entity_name
LIMIT 20;

-- =====================================================
-- 11. QUERIES DE PERFORMANCE E OTIMIZAÇÃO
-- =====================================================

-- 11.1 ANÁLISE DE PERFORMANCE - Identificar queries lentas
-- Query para verificar uso de índices
EXPLAIN QUERY PLAN
SELECT ed.record_id, ed.value
FROM entity_data ed
JOIN fields f ON ed.field_id = f.id
WHERE f.entity_id = 1 AND ed.value LIKE '%test%';

-- 11.2 LIMPEZA DE DADOS ÓRFÃOS
-- Remover dados de campos que não existem mais
DELETE FROM entity_data
WHERE field_id NOT IN (SELECT id FROM fields WHERE is_active = 1);

-- Remover dados de entidades que não existem mais
DELETE FROM entity_data
WHERE entity_id NOT IN (SELECT id FROM entities WHERE is_active = 1);

-- 11.3 COMPACTAÇÃO E MANUTENÇÃO
-- Recriar índices para otimização
REINDEX;

-- Analisar estatísticas para otimização do query planner
ANALYZE;

-- Vacuum para recuperar espaço
VACUUM;

-- =====================================================
-- 12. QUERIES DE BACKUP E MIGRAÇÃO
-- =====================================================

-- 12.1 EXPORT DE ESTRUTURA DE ENTIDADE
-- Query para exportar definição completa de uma entidade
SELECT
    'Entity: ' || e.name as export_data
FROM entities e WHERE e.name = 'blog_posts'
UNION ALL
SELECT
    'Field: ' || f.name || ' (' || f.field_type || ')' ||
    CASE WHEN f.is_required THEN ' REQUIRED' ELSE '' END ||
    CASE WHEN f.is_unique THEN ' UNIQUE' ELSE '' END
FROM fields f
JOIN entities e ON f.entity_id = e.id
WHERE e.name = 'blog_posts' AND f.is_active = 1
ORDER BY export_data;

-- 12.2 CLONE DE ESTRUTURA DE ENTIDADE
-- Duplicar uma entidade existente com nova nomenclatura
INSERT INTO entities (name, display_name, description, icon)
SELECT
    'blog_posts_copy' as name,
    display_name || ' (Cópia)' as display_name,
    description,
    icon
FROM entities
WHERE name = 'blog_posts';

-- Copiar campos da entidade original
INSERT INTO fields (entity_id, name, display_name, field_type, is_required, is_unique,
                   is_searchable, default_value, validation_rules, field_options, order_index)
SELECT
    (SELECT id FROM entities WHERE name = 'blog_posts_copy') as entity_id,
    name,
    display_name,
    field_type,
    is_required,
    is_unique,
    is_searchable,
    default_value,
    validation_rules,
    field_options,
    order_index
FROM fields
WHERE entity_id = (SELECT id FROM entities WHERE name = 'blog_posts')
    AND is_active = 1;

-- =====================================================
-- 13. QUERIES DE SEGURANÇA E AUDITORIA
-- =====================================================

-- 13.1 LOG DE ATIVIDADES POR USUÁRIO
SELECT
    u.username,
    u.full_name,
    al.table_name,
    al.action,
    COUNT(*) as action_count,
    MIN(al.created_at) as first_action,
    MAX(al.created_at) as last_action
FROM audit_log al
JOIN users u ON al.user_id = u.id
WHERE al.created_at >= datetime('now', '-30 days')
GROUP BY u.id, al.table_name, al.action
ORDER BY u.username, action_count DESC;

-- 13.2 VERIFICAÇÃO DE INTEGRIDADE DE DADOS
-- Verificar registros sem todos os campos obrigatórios
WITH required_fields AS (
    SELECT
        e.id as entity_id,
        e.name as entity_name,
        f.id as field_id,
        f.name as field_name
    FROM entities e
    JOIN fields f ON e.id = f.entity_id
    WHERE f.is_required = 1 AND f.is_active = 1 AND e.is_active = 1
),
record_fields AS (
    SELECT DISTINCT
        ed.entity_id,
        ed.record_id,
        ed.field_id
    FROM entity_data ed
    WHERE ed.is_active = 1
        AND ed.value IS NOT NULL
        AND ed.value != ''
)
SELECT
    rf.entity_name,
    rf.field_name,
    COUNT(*) as missing_count
FROM required_fields rf
LEFT JOIN record_fields rec ON (
    rf.entity_id = rec.entity_id
    AND rf.field_id = rec.field_id
)
WHERE rec.field_id IS NULL
GROUP BY rf.entity_id, rf.field_id
HAVING missing_count > 0
ORDER BY rf.entity_name, missing_count DESC;

-- 13.3 MONITORAMENTO DE CRESCIMENTO DE DADOS
SELECT
    DATE(created_at) as date,
    COUNT(*) as records_created,
    COUNT(DISTINCT record_id) as unique_records,
    COUNT(DISTINCT entity_id) as entities_used
FROM entity_data
WHERE created_at >= datetime('now', '-30 days')
GROUP BY DATE(created_at)
ORDER BY date DESC;

-- =====================================================
-- 14. PROCEDURES DE MANUTENÇÃO AUTOMATIZADA
-- =====================================================

-- 14.1 Limpeza automática de dados antigos (soft delete há mais de 1 ano)
UPDATE entity_data
SET is_active = 0
WHERE is_active = 0
    AND updated_at < datetime('now', '-1 year');

-- 14.2 Atualização de estatísticas de uso
CREATE TABLE IF NOT EXISTS entity_stats (
    entity_id INTEGER PRIMARY KEY,
    total_records INTEGER DEFAULT 0,
    total_fields INTEGER DEFAULT 0,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (entity_id) REFERENCES entities(id)
);

-- Atualizar estatísticas
INSERT OR REPLACE INTO entity_stats (entity_id, total_records, total_fields, last_updated)
SELECT
    e.id,
    COUNT(DISTINCT ed.record_id) as total_records,
    COUNT(ed.id) as total_fields,
    CURRENT_TIMESTAMP
FROM entities e
LEFT JOIN entity_data ed ON e.id = ed.entity_id AND ed.is_active = 1
WHERE e.is_active = 1
GROUP BY e.id;

-- =====================================================
-- 15. QUERIES PARA INTERFACE ADMINISTRATIVA
-- =====================================================

-- 15.1 Dashboard - Resumo geral do sistema
SELECT
    'Total de Entidades' as metric,
    COUNT(*) as value
FROM entities WHERE is_active = 1
UNION ALL
SELECT
    'Total de Registros',
    COUNT(DISTINCT record_id)
FROM entity_data WHERE is_active = 1
UNION ALL
SELECT
    'Total de Campos Definidos',
    COUNT(*)
FROM fields WHERE is_active = 1
UNION ALL
SELECT
    'Usuários Ativos',
    COUNT(*)
FROM users WHERE is_active = 1;

-- 15.2 Lista de entidades com estatísticas para admin
SELECT
    e.id,
    e.name,
    e.display_name,
    e.description,
    COUNT(DISTINCT ed.record_id) as record_count,
    COUNT(f.id) as field_count,
    e.created_at,
    MAX(ed.created_at) as last_activity
FROM entities e
LEFT JOIN fields f ON e.id = f.entity_id AND f.is_active = 1
LEFT JOIN entity_data ed ON e.id = ed.entity_id AND ed.is_active = 1
WHERE e.is_active = 1
GROUP BY e.id
ORDER BY record_count DESC, e.name;

-- =====================================================
-- FIM DO ARQUIVO
-- Sistema CMS Dinâmico completo com todas as queries
-- necessárias para produção, desde básicas até complexas
-- =====================================================
