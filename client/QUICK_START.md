# 🚀 Quick Start - DeeperHub CMS Admin

## ⚡ Teste Imediato (Modo Mock)

O cliente está configurado para funcionar **imediatamente** com dados simulados.

### 1. Servir os Arquivos

```bash
# Opção 1: Python
cd client
python -m http.server 8080

# Opção 2: Node.js
cd client
npx http-server -p 8080

# Opção 3: VS Code Live Server
# Use a extensão Live Server
```

### 2. Acessar o Admin

Abra: `http://localhost:8080`

### 3. Login

- **Email**: `admin@example.com`
- **Password**: `password123`

## ✅ Funcionalidades Testáveis

### 📊 Dashboard
- ✅ Estatísticas em tempo real
- ✅ Atividades recentes
- ✅ Ações rápidas

### 📄 Pages
- ✅ Listar páginas
- ✅ Criar nova página
- ✅ Editar página existente
- ✅ Excluir página
- ✅ Buscar páginas
- ✅ Preview de página

### 📝 Forms
- ✅ Listar formulários
- ✅ Criar formulário
- ✅ Gerenciar campos
- ✅ Adicionar campos dinâmicos
- ✅ Preview de formulário

### 🧩 Widgets
- ✅ Listar widgets
- ✅ Criar widget
- ✅ Configurar widget
- ✅ Preview de widget

### 🖼️ Media
- ✅ Upload drag & drop
- ✅ Organizar em pastas
- ✅ Visualizar arquivos
- ✅ Copiar URLs
- ✅ Excluir arquivos

### 🧭 Menus
- ✅ Criar menu sets
- ✅ Adicionar itens de menu
- ✅ Estrutura hierárquica
- ✅ Preview de menu

### 👥 Users
- ✅ Gerenciar usuários
- ✅ Definir permissões
- ✅ Reset de senhas
- ✅ Validação de senha forte

### ⚙️ Settings
- ✅ Configurações do sistema
- ✅ Gerenciar temas
- ✅ Export/import configurações

### 📋 Audit
- ✅ Logs de auditoria
- ✅ Filtros avançados
- ✅ Export para CSV
- ✅ Detalhes de mudanças

## 🔧 Configuração

### Alternar para API Real

Edite `js/config.js`:

```javascript
window.CMS_CONFIG = {
    // Mude para false quando o backend estiver pronto
    USE_MOCK_DATA: false,
    
    // Configure a URL da API
    API_BASE_URL: '/api/cms',
    
    // ... outras configurações
};
```

### Credenciais Mock

```javascript
MOCK_CREDENTIALS: {
    email: 'admin@example.com',
    password: 'password123'
}
```

## 🎯 Cenários de Teste

### 1. Teste Básico de CRUD

1. **Login** com as credenciais mock
2. **Criar** uma nova página
3. **Editar** a página criada
4. **Buscar** por páginas
5. **Excluir** a página

### 2. Teste de Upload

1. Ir para **Media**
2. **Arrastar** um arquivo para a área de upload
3. **Visualizar** o arquivo enviado
4. **Copiar** a URL do arquivo

### 3. Teste de Formulários

1. Ir para **Forms**
2. **Criar** um novo formulário
3. **Adicionar** campos ao formulário
4. **Preview** do formulário

### 4. Teste de Usuários

1. Ir para **Users**
2. **Criar** um novo usuário
3. **Definir** permissões
4. **Reset** de senha

## 🐛 Troubleshooting

### Erro CORS
- ✅ **Solução**: Servir via servidor web (não abrir arquivo diretamente)

### Não carrega dados
- ✅ **Verificar**: Console do navegador para erros
- ✅ **Verificar**: Se `USE_MOCK_DATA: true` em config.js

### Login não funciona
- ✅ **Verificar**: Credenciais corretas (admin@example.com / password123)
- ✅ **Verificar**: Modo mock ativado

### Interface quebrada
- ✅ **Verificar**: Se todos os arquivos JS estão carregando
- ✅ **Verificar**: Console para erros JavaScript

## 📱 Teste Responsivo

### Desktop
- ✅ Sidebar fixa
- ✅ Tabelas completas
- ✅ Modais centralizados

### Tablet
- ✅ Sidebar colapsável
- ✅ Formulários adaptados

### Mobile
- ✅ Navegação touch-friendly
- ✅ Tabelas com scroll
- ✅ Botões maiores

## 🎨 Personalização

### Cores
Edite `js/config.js`:

```javascript
THEME: {
    PRIMARY_COLOR: '#007bff',
    SUCCESS_COLOR: '#28a745',
    DANGER_COLOR: '#dc3545'
}
```

### Features
```javascript
FEATURES: {
    DRAG_DROP_UPLOAD: true,
    ADVANCED_SEARCH: true,
    BULK_OPERATIONS: false
}
```

## 📊 Dados Mock Inclusos

- **2 usuários** (admin, editor)
- **2 páginas** (home, about)
- **2 formulários** (contact, newsletter)
- **2 widgets** (news, social)
- **1 menu set** (main navigation)
- **2 arquivos de mídia** (logo, banner)
- **Logs de auditoria** (sample activities)
- **Configurações** (site settings)
- **2 temas** (default, modern)

## 🚀 Próximos Passos

1. **Testar** todas as funcionalidades
2. **Personalizar** conforme necessário
3. **Conectar** ao backend real
4. **Deploy** em produção

---

**🎉 Pronto para testar!**

O cliente está 100% funcional em modo mock. Todas as operações CRUD funcionam perfeitamente!
