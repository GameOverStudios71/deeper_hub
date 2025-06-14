# 🔗 Integração Backend - DeeperHub CMS

## 📋 Status da Integração

### ✅ **Implementado:**

#### **🔧 Backend (Elixir/Phoenix):**
- ✅ **Router configurado** (`lib/deeper_hub/web_interface/router.ex`)
- ✅ **Contextos CMS** (Pages, Users, Forms, etc.)
- ✅ **Resources REST** para todos os módulos
- ✅ **Autenticação JWT** configurada
- ✅ **Banco SQLite** com migrações
- ✅ **Seeds com usuário admin**

#### **🎨 Frontend (JavaScript):**
- ✅ **Cliente API completo** com fallback mock
- ✅ **Configuração flexível** (mock/real API)
- ✅ **Transformação de respostas** backend → cliente
- ✅ **Tratamento de erros** e autenticação
- ✅ **Interface administrativa** completa

## 🚀 **Como Conectar ao Backend Real**

### **1. Instalar Dependências**

```bash
# Adicionar bcrypt para autenticação
mix deps.get
```

### **2. Iniciar o Backend**

```bash
# Executar migrações e seeds
mix run

# O servidor estará em http://localhost:4000
```

### **3. Configurar o Cliente**

Edite `client/js/config.js`:

```javascript
window.CMS_CONFIG = {
    // Conectar ao backend real
    API_BASE_URL: 'http://localhost:4000/api/cms',
    
    // Desabilitar dados mock
    USE_MOCK_DATA: false,
    
    // Credenciais do usuário admin criado pelo seed
    MOCK_CREDENTIALS: {
        email: 'admin@example.com',
        password: 'password123'
    }
};
```

### **4. Servir o Cliente**

```bash
cd client
python -m http.server 8080
# ou
npx http-server -p 8080
```

### **5. Testar a Integração**

1. **Acessar**: `http://localhost:8080`
2. **Login**: admin@example.com / password123
3. **Verificar**: Console do navegador para logs da API

## 🔧 **Endpoints Implementados**

### **🔐 Autenticação**
- `POST /api/cms/auth/login` - Login
- `POST /api/cms/auth/logout` - Logout  
- `GET /api/cms/auth/me` - Usuário atual
- `POST /api/cms/auth/refresh` - Renovar token

### **📄 Pages**
- `GET /api/cms/pages` - Listar páginas
- `GET /api/cms/pages/:id` - Obter página
- `POST /api/cms/pages` - Criar página
- `PUT /api/cms/pages/:id` - Atualizar página
- `DELETE /api/cms/pages/:id` - Excluir página

### **📝 Forms**
- `GET /api/cms/forms` - Listar formulários
- `GET /api/cms/forms/:id` - Obter formulário
- `POST /api/cms/forms` - Criar formulário
- `PUT /api/cms/forms/:id` - Atualizar formulário
- `DELETE /api/cms/forms/:id` - Excluir formulário

### **🧩 Widgets**
- `GET /api/cms/widgets` - Listar widgets
- `GET /api/cms/widgets/:id` - Obter widget
- `POST /api/cms/widgets` - Criar widget
- `PUT /api/cms/widgets/:id` - Atualizar widget
- `DELETE /api/cms/widgets/:id` - Excluir widget

### **🖼️ Media**
- `GET /api/cms/media/files` - Listar arquivos
- `GET /api/cms/media/files/:id` - Obter arquivo
- `POST /api/cms/media/upload` - Upload arquivo
- `GET /api/cms/media/folders` - Listar pastas

### **🧭 Menus**
- `GET /api/cms/menus/sets` - Listar menu sets
- `GET /api/cms/menus/sets/:id` - Obter menu set
- `POST /api/cms/menus/sets` - Criar menu set
- `PUT /api/cms/menus/sets/:id` - Atualizar menu set
- `DELETE /api/cms/menus/sets/:id` - Excluir menu set

### **👥 Users**
- `GET /api/cms/users` - Listar usuários
- `GET /api/cms/users/:id` - Obter usuário
- `POST /api/cms/users` - Criar usuário
- `PUT /api/cms/users/:id` - Atualizar usuário
- `DELETE /api/cms/users/:id` - Excluir usuário

### **⚙️ Settings**
- `GET /api/cms/settings` - Listar configurações
- `PUT /api/cms/settings/:name/value` - Atualizar configuração
- `GET /api/cms/themes` - Listar temas
- `POST /api/cms/themes` - Criar tema

### **📋 Audit**
- `GET /api/cms/audit/logs` - Listar logs
- `GET /api/cms/audit/logs/:id` - Obter log
- `GET /api/cms/audit/statistics` - Estatísticas

## 🔄 **Formato de Respostas**

### **✅ Sucesso:**
```json
{
  "status": "success",
  "data": [...],
  "count": 10,
  "message": "Operação realizada com sucesso"
}
```

### **❌ Erro:**
```json
{
  "status": "error",
  "message": "Descrição do erro",
  "details": "Detalhes técnicos"
}
```

### **🔐 Autenticação:**
```json
{
  "status": "success",
  "data": {
    "token": "jwt-token-here",
    "user": {
      "id": 1,
      "username": "admin",
      "email": "admin@example.com",
      "is_admin": true,
      "permissions": ["admin", "pages:read", ...]
    }
  }
}
```

## 🐛 **Troubleshooting**

### **CORS Errors**
Se houver erros de CORS, adicione ao router:

```elixir
plug CORSPlug, origin: ["http://localhost:8080"]
```

### **Database Errors**
```bash
# Resetar banco de dados
rm databases/deeper_hub_dev.db
mix run
```

### **Authentication Errors**
Verificar se:
- ✅ Bcrypt está instalado (`mix deps.get`)
- ✅ Seed foi executado (usuário admin criado)
- ✅ Token está sendo enviado no header

### **API Not Found (404)**
Verificar se:
- ✅ Backend está rodando na porta 4000
- ✅ Rotas estão configuradas no router
- ✅ URL da API está correta no cliente

## 📊 **Monitoramento**

### **Logs do Backend**
```bash
# Ver logs em tempo real
tail -f logs/deeper_hub.log
```

### **Logs do Cliente**
- Abrir **DevTools** → **Console**
- Verificar requests na aba **Network**

## 🔧 **Desenvolvimento**

### **Adicionar Novos Endpoints**

1. **Criar função no contexto** (ex: `lib/deeper_hub/cms/pages.ex`)
2. **Adicionar endpoint no resource** (ex: `lib/deeper_hub_web/resources/cms/page_resource.ex`)
3. **Testar no cliente**

### **Modificar Autenticação**

1. **Editar** `lib/deeper_hub_web/resources/cms/auth_resource.ex`
2. **Atualizar** lógica de tokens
3. **Testar** login/logout

### **Adicionar Validações**

1. **Editar schemas** (ex: `lib/deeper_hub/cms/pages/page.ex`)
2. **Atualizar** funções de validação
3. **Testar** criação/edição

## 🎯 **Próximos Passos**

### **Funcionalidades Pendentes:**
- [ ] Upload real de arquivos
- [ ] Paginação avançada
- [ ] Filtros e busca
- [ ] Permissões granulares
- [ ] Cache de respostas
- [ ] Rate limiting
- [ ] Logs de auditoria
- [ ] Backup/restore

### **Melhorias de Segurança:**
- [ ] Implementar Guardian JWT
- [ ] Validação de CSRF
- [ ] Rate limiting por IP
- [ ] Sanitização de inputs
- [ ] Logs de segurança

### **Performance:**
- [ ] Cache Redis
- [ ] Compressão de respostas
- [ ] CDN para assets
- [ ] Database indexing
- [ ] Query optimization

---

**🎉 A integração está pronta!** O cliente pode se conectar ao backend real e todas as funcionalidades administrativas estão operacionais.
