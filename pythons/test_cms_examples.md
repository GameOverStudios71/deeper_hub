# Exemplos de Teste do CMS Dinâmico

## 🧪 Como Testar o Sistema

### 1. Verificar Status da API

```bash
curl -X GET http://localhost:4000/
```

**Resposta esperada:**
```json
{
  "status": "ok",
  "api": "DeeperHub API v1"
}
```

### 2. Verificar Dashboard

```bash
curl -X GET http://localhost:4000/api/cms/dashboard
```

### 3. Listar Entidades Existentes

```bash
curl -X GET http://localhost:4000/api/entities
```

## 📝 Exemplo Completo: Sistema de Biblioteca

### Passo 1: Criar Entidade "Livros"

```bash
curl -X POST http://localhost:4000/api/entities \
  -H "Content-Type: application/json" \
  -d '{
    "name": "books",
    "display_name": "Livros",
    "description": "Catálogo de livros da biblioteca",
    "icon": "book"
  }'
```

### Passo 2: Criar Campos para Livros

**Campo: Título**
```bash
curl -X POST http://localhost:4000/api/fields \
  -H "Content-Type: application/json" \
  -d '{
    "entity_id": 4,
    "name": "title",
    "display_name": "Título",
    "field_type": "text",
    "is_required": true,
    "is_searchable": true,
    "order_index": 1,
    "validation_rules": "{\"min_length\": 2, \"max_length\": 200}"
  }'
```

**Campo: Autor**
```bash
curl -X POST http://localhost:4000/api/fields \
  -H "Content-Type: application/json" \
  -d '{
    "entity_id": 4,
    "name": "author",
    "display_name": "Autor",
    "field_type": "text",
    "is_required": true,
    "is_searchable": true,
    "order_index": 2
  }'
```

**Campo: ISBN**
```bash
curl -X POST http://localhost:4000/api/fields \
  -H "Content-Type: application/json" \
  -d '{
    "entity_id": 4,
    "name": "isbn",
    "display_name": "ISBN",
    "field_type": "text",
    "is_unique": true,
    "order_index": 3,
    "validation_rules": "{\"pattern\": \"^[0-9-]+$\"}"
  }'
```

**Campo: Ano de Publicação**
```bash
curl -X POST http://localhost:4000/api/fields \
  -H "Content-Type: application/json" \
  -d '{
    "entity_id": 4,
    "name": "publication_year",
    "display_name": "Ano de Publicação",
    "field_type": "integer",
    "order_index": 4,
    "validation_rules": "{\"min\": 1000, \"max\": 2030}"
  }'
```

**Campo: Disponível**
```bash
curl -X POST http://localhost:4000/api/fields \
  -H "Content-Type: application/json" \
  -d '{
    "entity_id": 4,
    "name": "available",
    "display_name": "Disponível",
    "field_type": "boolean",
    "default_value": "true",
    "order_index": 5
  }'
```

**Campo: Descrição**
```bash
curl -X POST http://localhost:4000/api/fields \
  -H "Content-Type: application/json" \
  -d '{
    "entity_id": 4,
    "name": "description",
    "display_name": "Descrição",
    "field_type": "textarea",
    "is_searchable": true,
    "order_index": 6
  }'
```

### Passo 3: Criar Livros

**Livro 1: Dom Casmurro**
```bash
curl -X POST http://localhost:4000/api/records/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Dom Casmurro",
    "author": "Machado de Assis",
    "isbn": "978-85-359-0277-5",
    "publication_year": 1899,
    "available": true,
    "description": "Romance clássico da literatura brasileira que narra a história de Bentinho e Capitu.",
    "user_id": 1
  }'
```

**Livro 2: O Cortiço**
```bash
curl -X POST http://localhost:4000/api/records/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "O Cortiço",
    "author": "Aluísio Azevedo",
    "isbn": "978-85-359-0123-4",
    "publication_year": 1890,
    "available": true,
    "description": "Romance naturalista que retrata a vida em um cortiço no Rio de Janeiro.",
    "user_id": 1
  }'
```

**Livro 3: 1984**
```bash
curl -X POST http://localhost:4000/api/records/books \
  -H "Content-Type: application/json" \
  -d '{
    "title": "1984",
    "author": "George Orwell",
    "isbn": "978-0-452-28423-4",
    "publication_year": 1949,
    "available": false,
    "description": "Distopia sobre um regime totalitário que controla todos os aspectos da vida.",
    "user_id": 1
  }'
```

### Passo 4: Testar Consultas

**Listar todos os livros:**
```bash
curl -X GET http://localhost:4000/api/records/books
```

**Buscar livro específico por ID:**
```bash
curl -X GET http://localhost:4000/api/records/books/[RECORD_ID]
```

**Buscar livros por autor:**
```bash
curl -X POST http://localhost:4000/api/records/books/search \
  -H "Content-Type: application/json" \
  -d '{
    "filters": {
      "author": "Machado de Assis"
    }
  }'
```

**Buscar livros disponíveis:**
```bash
curl -X POST http://localhost:4000/api/records/books/search \
  -H "Content-Type: application/json" \
  -d '{
    "filters": {
      "available": true
    }
  }'
```

**Buscar livros por período:**
```bash
curl -X POST http://localhost:4000/api/records/books/search \
  -H "Content-Type: application/json" \
  -d '{
    "filters": {
      "publication_year_min": 1800,
      "publication_year_max": 1900
    }
  }'
```

### Passo 5: Atualizar um Livro

```bash
curl -X PUT http://localhost:4000/api/records/books/[RECORD_ID] \
  -H "Content-Type: application/json" \
  -d '{
    "available": false,
    "user_id": 1
  }'
```

### Passo 6: Verificar Estatísticas

```bash
curl -X GET http://localhost:4000/api/cms/stats
```

## 🏪 Exemplo: Sistema de E-commerce Simples

### Criar Entidade "Produtos"

```bash
curl -X POST http://localhost:4000/api/entities \
  -H "Content-Type: application/json" \
  -d '{
    "name": "ecommerce_products",
    "display_name": "Produtos E-commerce",
    "description": "Produtos para venda online",
    "icon": "shopping-bag"
  }'
```

### Criar Campos Essenciais

**Nome do Produto:**
```bash
curl -X POST http://localhost:4000/api/fields \
  -H "Content-Type: application/json" \
  -d '{
    "entity_id": 5,
    "name": "product_name",
    "display_name": "Nome do Produto",
    "field_type": "text",
    "is_required": true,
    "is_searchable": true,
    "order_index": 1
  }'
```

**Preço:**
```bash
curl -X POST http://localhost:4000/api/fields \
  -H "Content-Type: application/json" \
  -d '{
    "entity_id": 5,
    "name": "price",
    "display_name": "Preço (R$)",
    "field_type": "decimal",
    "is_required": true,
    "order_index": 2,
    "validation_rules": "{\"min\": 0.01}"
  }'
```

**Categoria:**
```bash
curl -X POST http://localhost:4000/api/fields \
  -H "Content-Type: application/json" \
  -d '{
    "entity_id": 5,
    "name": "category",
    "display_name": "Categoria",
    "field_type": "select",
    "is_searchable": true,
    "order_index": 3,
    "field_options": "{\"options\": [\"Eletrônicos\", \"Roupas\", \"Casa\", \"Livros\", \"Esportes\"]}"
  }'
```

**Em Estoque:**
```bash
curl -X POST http://localhost:4000/api/fields \
  -H "Content-Type: application/json" \
  -d '{
    "entity_id": 5,
    "name": "in_stock",
    "display_name": "Em Estoque",
    "field_type": "boolean",
    "default_value": "true",
    "order_index": 4
  }'
```

### Adicionar Produtos

**Smartphone:**
```bash
curl -X POST http://localhost:4000/api/records/ecommerce_products \
  -H "Content-Type: application/json" \
  -d '{
    "product_name": "Smartphone XYZ Pro",
    "price": 1299.99,
    "category": "Eletrônicos",
    "in_stock": true,
    "user_id": 1
  }'
```

**Camiseta:**
```bash
curl -X POST http://localhost:4000/api/records/ecommerce_products \
  -H "Content-Type: application/json" \
  -d '{
    "product_name": "Camiseta Básica Azul",
    "price": 29.90,
    "category": "Roupas",
    "in_stock": true,
    "user_id": 1
  }'
```

### Consultas de E-commerce

**Produtos por categoria:**
```bash
curl -X POST http://localhost:4000/api/records/ecommerce_products/search \
  -H "Content-Type: application/json" \
  -d '{
    "filters": {
      "category": "Eletrônicos"
    }
  }'
```

**Produtos em uma faixa de preço:**
```bash
curl -X POST http://localhost:4000/api/records/ecommerce_products/search \
  -H "Content-Type: application/json" \
  -d '{
    "filters": {
      "price_min": 20,
      "price_max": 100
    }
  }'
```

**Produtos em estoque:**
```bash
curl -X POST http://localhost:4000/api/records/ecommerce_products/search \
  -H "Content-Type: application/json" \
  -d '{
    "filters": {
      "in_stock": true
    },
    "options": {
      "order_by": "price",
      "order_direction": "asc"
    }
  }'
```

## 🔧 Operações de Manutenção

**Otimizar banco de dados:**
```bash
curl -X POST http://localhost:4000/api/cms/maintenance \
  -H "Content-Type: application/json" \
  -d '{
    "operation": "vacuum"
  }'
```

**Verificar saúde do sistema:**
```bash
curl -X GET http://localhost:4000/api/cms/health
```

**Ver log de auditoria:**
```bash
curl -X GET http://localhost:4000/api/cms/audit?page=1&page_size=20
```

## 📊 Verificar Resultados

Após executar os exemplos acima, você pode:

1. **Ver dashboard completo:**
   ```bash
   curl -X GET http://localhost:4000/api/cms/dashboard
   ```

2. **Listar todas as entidades criadas:**
   ```bash
   curl -X GET http://localhost:4000/api/entities
   ```

3. **Ver estatísticas detalhadas:**
   ```bash
   curl -X GET http://localhost:4000/api/cms/stats
   ```

4. **Verificar tipos de campo disponíveis:**
   ```bash
   curl -X GET http://localhost:4000/api/fields/types
   ```

## 🎯 Próximos Testes

Experimente criar:
- Sistema de tarefas (TODO list)
- Catálogo de filmes
- Agenda de contatos
- Sistema de eventos
- Inventário de equipamentos

O sistema é completamente flexível e pode ser adaptado para qualquer necessidade!
