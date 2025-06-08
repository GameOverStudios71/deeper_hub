# Correções para Preservar Constraints UNIQUE do MySQL

## 🎯 Problema Identificado

O gerador estava criando tabelas SQLite sem preservar as constraints UNIQUE que existiam no MySQL original, causando erros de `UNIQUE CONSTRAINT` durante a inserção de seeds.

## 🔧 Correções Implementadas

### 1. Nova Função: `obter_constraints_unique()`

Adicionada função para extrair constraints UNIQUE do MySQL:

```python
def obter_constraints_unique(conexao, tabela):
    """
    Obtém as constraints UNIQUE de uma tabela no MySQL.
    Retorna uma lista de tuplas (constraint_name, [colunas]).
    """
```

**Características:**
- Consulta `INFORMATION_SCHEMA.TABLE_CONSTRAINTS` e `KEY_COLUMN_USAGE`
- Agrupa colunas por constraint name
- Retorna lista de tuplas `(nome_constraint, [lista_colunas])`
- Trata erros de conexão graciosamente

### 2. Atualização da Função `criar_migration()`

Modificada para obter e passar constraints UNIQUE:

```python
# Obter informações sobre constraints
chaves_primarias = obter_chave_primaria(conexao, tabela)
constraints_unique = obter_constraints_unique(conexao, tabela)

# Passar para geração do SQL
sql_create_table = gerar_create_table_sql(tabela, campos, relacoes, chaves_primarias, constraints_unique)
```

### 3. Atualização da Função `gerar_create_table_sql()`

Adicionado parâmetro e lógica para processar constraints UNIQUE:

```python
def gerar_create_table_sql(tabela, campos, relacoes=None, chaves_primarias=None, constraints_unique=None):
    # ... código existente ...
    
    # Adicionar constraints UNIQUE se existirem
    if constraints_unique:
        for constraint_name, colunas_unique in constraints_unique:
            # Formatar nomes das colunas para SQLite (tratar palavras reservadas)
            colunas_unique_formatadas = []
            for col_nome in colunas_unique:
                if col_nome.lower() in palavras_reservadas:
                    colunas_unique_formatadas.append(f'"{col_nome}"')
                else:
                    colunas_unique_formatadas.append(col_nome)
            
            # Adicionar constraint UNIQUE
            unique_constraint = f"  UNIQUE ({', '.join(colunas_unique_formatadas)})"
            colunas.append(unique_constraint)
```

## 🧪 Scripts de Teste

### 1. Teste de Detecção de Constraints

```bash
cd generators/schemas_from_tables
python test_unique_constraints.py
```

**Funcionalidade:**
- Conecta ao MySQL
- Lista primeiras 5 tabelas
- Mostra chaves primárias e constraints UNIQUE
- Compara com estrutura da tabela (`DESCRIBE`)

### 2. Teste de Geração de SQL

```bash
cd generators/schemas_from_tables
python test_table_generation.py
python test_table_generation.py --table nome_da_tabela
```

**Funcionalidade:**
- Gera SQL CREATE TABLE completo
- Verifica se constraints UNIQUE estão presentes
- Mostra SQL formatado para inspeção

## 📋 Exemplo de Output

### Antes (Problema):
```sql
CREATE TABLE IF NOT EXISTS sys_accounts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT NOT NULL,
  username TEXT NOT NULL
);
```

### Depois (Corrigido):
```sql
CREATE TABLE IF NOT EXISTS sys_accounts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT NOT NULL,
  username TEXT NOT NULL,
  UNIQUE (email),
  UNIQUE (username)
);
```

## 🚀 Como Usar

### Gerar Todas as Tabelas:
```bash
cd generators/schemas_from_tables
python generator.py
```

### Gerar Tabela Específica:
```bash
cd generators/schemas_from_tables
python generator.py --table sys_accounts
```

## ✅ Benefícios

1. **Elimina erros de UNIQUE CONSTRAINT** durante inserção de seeds
2. **Preserva integridade dos dados** do MySQL original
3. **Mantém consistência** entre MySQL e SQLite
4. **Detecta automaticamente** todas as constraints UNIQUE
5. **Trata palavras reservadas** do SQLite corretamente
6. **Logging detalhado** para debugging

## 🔍 Verificação

Após executar o gerador, verifique:

1. **Logs do gerador** mostram constraints detectadas
2. **Arquivos de migration** contêm constraints UNIQUE
3. **Seeds executam sem erros** de UNIQUE CONSTRAINT
4. **Tabelas SQLite** têm mesmas constraints do MySQL

## 📝 Notas Técnicas

- Constraints UNIQUE são adicionadas como cláusulas de tabela no SQLite
- Nomes de colunas com palavras reservadas são escapados com aspas duplas
- Constraints compostas (múltiplas colunas) são suportadas
- Ordem das constraints é preservada do MySQL original
