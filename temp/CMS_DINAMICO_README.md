# CMS Dinâmico - Sistema que Cria Sistemas

## 🚀 Visão Geral

Este é um **CMS Dinâmico** completo que permite criar qualquer tipo de sistema através de uma interface REST API, sem necessidade de alterar código ou banco de dados. O sistema utiliza o padrão **EAV (Entity-Attribute-Value)** para armazenar dados de forma flexível.

## 🏗️ Arquitetura

### Tabelas Principais

1. **entities** - Define tipos de conteúdo (ex: produtos, posts, usuários)
2. **fields** - Define campos para cada entidade (ex: nome, preço, descrição)
3. **entity_data** - Armazena os dados reais usando padrão EAV
4. **relationships** - Define relacionamentos entre entidades
5. **users** - Sistema de usuários e permissões
6. **audit_log** - Log completo de auditoria

### Recursos Implementados

- ✅ **CRUD Completo** para entidades, campos e registros
- ✅ **Sistema de Permissões** granular
- ✅ **Auditoria Completa** de todas as operações
- ✅ **Performance Otimizada** com índices estratégicos
- ✅ **Busca Avançada** com filtros e paginação
- ✅ **Dashboard Administrativo** com estatísticas
- ✅ **Validação de Dados** dinâmica
- ✅ **Relacionamentos** entre entidades
- ✅ **Soft Delete** para recuperação de dados

## 📡 API Endpoints

### Entidades (Tipos de Conteúdo)

```http
GET    /api/entities              # Lista todas as entidades
GET    /api/entities/:id          # Obtém uma entidade específica
POST   /api/entities              # Cria nova entidade
PUT    /api/entities/:id          # Atualiza entidade
DELETE /api/entities/:id          # Remove entidade (soft delete)
POST   /api/entities/search       # Busca avançada
GET    /api/entities/:id/fields   # Lista campos de uma entidade
```

### Campos (Estrutura das Entidades)

```http
GET    /api/fields                # Lista todos os campos
GET    /api/fields/:id            # Obtém um campo específico
POST   /api/fields                # Cria novo campo
PUT    /api/fields/:id            # Atualiza campo
DELETE /api/fields/:id            # Remove campo (soft delete)
POST   /api/fields/search         # Busca avançada
POST   /api/fields/reorder        # Reordena campos
GET    /api/fields/types          # Lista tipos de campo disponíveis
```

### Registros (Dados das Entidades)

```http
GET    /api/records/:entity_name              # Lista registros de uma entidade
GET    /api/records/:entity_name/:record_id   # Obtém um registro específico
POST   /api/records/:entity_name              # Cria novo registro
PUT    /api/records/:entity_name/:record_id   # Atualiza registro
DELETE /api/records/:entity_name/:record_id   # Remove registro
POST   /api/records/:entity_name/search       # Busca avançada em registros
```

### Administração

```http
GET    /api/cms/dashboard         # Dashboard com estatísticas
GET    /api/cms/stats             # Estatísticas detalhadas
GET    /api/cms/audit             # Log de auditoria
GET    /api/cms/health            # Status de saúde do sistema
POST   /api/cms/maintenance       # Operações de manutenção
```

## 🎯 Exemplos de Uso

### 1. Criando um Sistema de Blog

#### Passo 1: Criar a Entidade "Posts"
```json
POST /api/entities
{
  "name": "blog_posts",
  "display_name": "Posts do Blog",
  "description": "Artigos e posts do blog",
  "icon": "article"
}
```

#### Passo 2: Criar Campos para Posts
```json
POST /api/fields
{
  "entity_id": 1,
  "name": "title",
  "display_name": "Título",
  "field_type": "text",
  "is_required": true,
  "is_searchable": true,
  "order_index": 1
}

POST /api/fields
{
  "entity_id": 1,
  "name": "content",
  "display_name": "Conteúdo",
  "field_type": "textarea",
  "is_required": true,
  "is_searchable": true,
  "order_index": 2
}

POST /api/fields
{
  "entity_id": 1,
  "name": "published_at",
  "display_name": "Data de Publicação",
  "field_type": "datetime",
  "order_index": 3
}
```

#### Passo 3: Criar um Post
```json
POST /api/records/blog_posts
{
  "title": "Meu Primeiro Post",
  "content": "Este é o conteúdo do meu primeiro post...",
  "published_at": "2025-01-08T10:00:00Z",
  "user_id": 1
}
```

### 2. Criando um Sistema de E-commerce

#### Passo 1: Criar Entidade "Produtos"
```json
POST /api/entities
{
  "name": "products",
  "display_name": "Produtos",
  "description": "Catálogo de produtos",
  "icon": "shopping-cart"
}
```

#### Passo 2: Criar Campos para Produtos
```json
POST /api/fields
{
  "entity_id": 2,
  "name": "name",
  "display_name": "Nome do Produto",
  "field_type": "text",
  "is_required": true,
  "validation_rules": "{\"min_length\": 3, \"max_length\": 200}"
}

POST /api/fields
{
  "entity_id": 2,
  "name": "price",
  "display_name": "Preço",
  "field_type": "decimal",
  "is_required": true,
  "validation_rules": "{\"min\": 0}"
}

POST /api/fields
{
  "entity_id": 2,
  "name": "stock_quantity",
  "display_name": "Estoque",
  "field_type": "integer",
  "default_value": "0",
  "validation_rules": "{\"min\": 0}"
}
```

## 🔧 Tipos de Campo Suportados

- **text** - Texto simples
- **textarea** - Texto longo
- **number** - Número decimal
- **integer** - Número inteiro
- **boolean** - Verdadeiro/Falso
- **date** - Data
- **datetime** - Data e hora
- **email** - Email
- **url** - URL
- **file** - Arquivo
- **image** - Imagem
- **json** - Dados JSON
- **relation** - Relacionamento com outra entidade
- **select** - Lista de opções
- **radio** - Opção única
- **checkbox** - Múltiplas opções

## 🔍 Busca Avançada

### Buscar Posts por Título
```json
POST /api/records/blog_posts/search
{
  "filters": {
    "title": "primeiro"
  },
  "options": {
    "page": 1,
    "page_size": 10,
    "order_by": "created_at",
    "order_direction": "desc"
  }
}
```

### Buscar Produtos por Faixa de Preço
```json
POST /api/records/products/search
{
  "filters": {
    "price_min": 100,
    "price_max": 500
  }
}
```

## 📊 Dashboard e Estatísticas

### Obter Dashboard Completo
```http
GET /api/cms/dashboard
```

Retorna:
- Estatísticas gerais (entidades, registros, campos, usuários)
- Atividade recente
- Status do sistema

### Verificar Saúde do Sistema
```http
GET /api/cms/health
```

Retorna:
- Status do banco de dados
- Verificação de tabelas
- Uso de memória e disco
- Status geral do sistema

## 🛠️ Manutenção

### Operações de Manutenção Disponíveis
```json
POST /api/cms/maintenance
{
  "operation": "vacuum"    // Otimiza banco de dados
}

POST /api/cms/maintenance
{
  "operation": "reindex"   // Reconstrói índices
}

POST /api/cms/maintenance
{
  "operation": "analyze"   // Atualiza estatísticas
}

POST /api/cms/maintenance
{
  "operation": "cleanup_audit"  // Remove logs antigos
}
```

## 🚀 Como Executar

1. **Instalar dependências:**
   ```bash
   mix deps.get
   ```

2. **Executar migrações:**
   ```bash
   mix run -e "DeeperHub.Core.Data.Migrations.run_all()"
   ```

3. **Executar seeds:**
   ```bash
   mix run -e "DeeperHub.Core.Data.Migrations.MigrationRegistry.run_seeds()"
   ```

4. **Iniciar servidor:**
   ```bash
   mix run --no-halt
   ```

5. **Acessar API:**
   ```
   http://localhost:4000/api/
   ```

## 🔐 Autenticação

O sistema inclui:
- Usuário administrador padrão (admin/admin123)
- Sistema de permissões por entidade
- Controle de acesso granular (create, read, update, delete, admin)

## 📈 Performance

- **Índices otimizados** para todas as consultas frequentes
- **Paginação eficiente** em todas as listagens
- **Cache de metadados** para melhor performance
- **Soft delete** para recuperação rápida
- **Triggers automáticos** para auditoria

## 🎯 Casos de Uso

Este sistema pode ser usado para criar:

- **Blog/CMS** - Posts, páginas, categorias
- **E-commerce** - Produtos, pedidos, clientes
- **CRM** - Clientes, leads, oportunidades
- **ERP** - Funcionários, projetos, tarefas
- **Inventário** - Itens, locais, movimentações
- **Eventos** - Eventos, participantes, ingressos
- **Qualquer sistema** que precise de estrutura flexível

## 🔄 Próximos Passos

- [ ] Interface web administrativa
- [ ] Sistema de templates
- [ ] API GraphQL
- [ ] Webhooks
- [ ] Importação/Exportação de dados
- [ ] Backup automático
- [ ] Replicação de dados

---

**Desenvolvido com Elixir + SQLite para máxima performance e flexibilidade!** 🚀
