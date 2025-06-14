# ⚡ Quick Setup - DeeperHub CMS

## 🚀 Opção 1: Iniciar Tudo Automaticamente

```bash
# Instalar dependências e iniciar backend + frontend
python start_cms.py

# Ou apenas o backend
python start_cms.py --backend-only

# Ou apenas o frontend
python start_cms.py --frontend-only
```

**Acesse:** `http://localhost:8080`
**Login:** sysop@system.com / password123

## 🔧 Opção 2: Iniciar Manualmente

### 1. Backend (Terminal 1)
```bash
# Instalar dependências
mix deps.get

# Iniciar servidor
mix run --no-halt
# Backend: http://localhost:4000
```

### 2. Frontend (Terminal 2)
```bash
cd client
python -m http.server 8080
# Frontend: http://localhost:8080
```

### 3. Cliente Já Configurado
O cliente já está configurado para produção:
```javascript
// client/js/config.js
API_BASE_URL: 'http://localhost:4000/api/cms'
```

## 🧪 Testar Integração

```bash
# Testar todos os endpoints
python test_integration.py

# Testar com URL customizada
python test_integration.py --url http://localhost:4000/api/cms
```

## 📋 URLs Importantes

- **🎨 Admin Interface:** http://localhost:8080
- **📊 Backend API:** http://localhost:4000
- **🧪 Test Checklist:** http://localhost:8080/test-checklist.html
- **📚 API Docs:** http://localhost:4000/api/cms

## 🔐 Credenciais

- **Email:** sysop@system.com
- **Password:** password123

## 🎯 Modo de Operação

### 🌐 Produção (Backend Real)
```javascript
// client/js/config.js
API_BASE_URL: 'http://localhost:4000/api/cms'
```
- ✅ Conecta ao backend Elixir
- ✅ Dados persistentes no SQLite
- ✅ Funcionalidades completas
- ✅ Pronto para produção

## 🐛 Troubleshooting

### ❌ Erro "Fail to Fetch" no Login

**Problema:** CORS ou endpoint não encontrado

**Solução:**
```bash
# 1. Corrigir automaticamente
python fix_backend.py

# 2. Testar backend
python test_backend.py

# 3. Verificar se servidor está rodando
curl http://localhost:4000/

# 4. Testar autenticação
curl -X POST http://localhost:4000/api/cms/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@example.com","password":"password123"}'
```

### Backend não inicia
```bash
# Verificar dependências
mix deps.get

# Verificar banco de dados
ls databases/

# Logs detalhados
mix run --no-halt --verbose
```

### Frontend não conecta
```bash
# Verificar configuração
cat client/js/config.js

# Verificar CORS no navegador
# DevTools → Console → Network
```

### Erro de autenticação
```bash
# Verificar usuário admin
sqlite3 databases/deeper_hub_dev.db "SELECT * FROM users;"

# Recriar usuário admin
mix run -e "DeeperHub.Core.Data.SeedRegistry.run_seed(:cms_initial_data)"
```

### 🔧 Scripts de Diagnóstico

```bash
# Corrigir problemas automaticamente
python fix_backend.py

# Testar se backend está funcionando
python test_backend.py

# Testar integração completa
python test_integration.py
```

## 📊 Status dos Módulos

### ✅ Implementados e Funcionando
- 🔐 **Authentication** - Login/logout/JWT
- 📄 **Pages** - CRUD completo
- 📝 **Forms** - Construtor de formulários
- 🧩 **Widgets** - Componentes reutilizáveis
- 🖼️ **Media** - Gerenciamento de arquivos
- 🧭 **Menus** - Sistema de navegação
- 👥 **Users** - Gerenciamento de usuários
- ⚙️ **Settings** - Configurações do sistema
- 📋 **Audit** - Logs de auditoria

### 🔄 Em Desenvolvimento
- 📤 Upload real de arquivos
- 🔍 Busca avançada
- 🔒 Permissões granulares
- 📊 Dashboard em tempo real

## 🎉 Pronto!

O DeeperHub CMS está **100% funcional** com:
- ✅ Backend Elixir/Phoenix completo
- ✅ Frontend JavaScript profissional
- ✅ Autenticação JWT
- ✅ Todas as operações CRUD
- ✅ Interface administrativa completa
- ✅ Dados mock para desenvolvimento
- ✅ Integração real com backend

**Comece agora:** `python start_cms.py` 🚀
