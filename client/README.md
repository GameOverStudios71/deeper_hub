# DeeperHub CMS - Admin Client

Um cliente administrativo completo e profissional para o DeeperHub CMS, construído com jQuery, HTML5 e CSS3.

## 🚀 Características

### ✅ Funcionalidades Implementadas

- **Autenticação Completa**: Login/logout com JWT tokens
- **Dashboard**: Estatísticas, atividades recentes e ações rápidas
- **Gerenciamento de Páginas**: CRUD completo com SEO
- **Construtor de Formulários**: Criação dinâmica de formulários e campos
- **Gerenciamento de Widgets**: Componentes reutilizáveis
- **Biblioteca de Mídia**: Upload, organização e gerenciamento de arquivos
- **Sistema de Menus**: Navegação hierárquica
- **Gerenciamento de Usuários**: Usuários, permissões e senhas
- **Configurações**: Settings do sistema e temas
- **Logs de Auditoria**: Rastreamento completo de atividades

### 🎯 Operações CRUD

Cada módulo suporta todas as operações:
- **Create** (Criar)
- **Read** (Listar/Visualizar)
- **Update** (Editar)
- **Delete** (Excluir)
- **Search** (Buscar)
- **Filter** (Filtrar)
- **Paginate** (Paginar)

## 📁 Estrutura do Projeto

```
client/
├── index.html              # Página principal
├── css/
│   └── admin.css           # Estilos do admin
├── js/
│   ├── cms-client.js       # Cliente da API
│   ├── utils.js            # Utilitários
│   ├── auth.js             # Autenticação
│   ├── app.js              # Controlador principal
│   ├── dashboard.js        # Dashboard
│   ├── pages.js            # Gerenciamento de páginas
│   ├── forms.js            # Construtor de formulários
│   ├── widgets.js          # Gerenciamento de widgets
│   ├── media.js            # Biblioteca de mídia
│   ├── menus.js            # Sistema de menus
│   ├── users.js            # Gerenciamento de usuários
│   ├── settings.js         # Configurações
│   └── audit.js            # Logs de auditoria
└── README.md               # Este arquivo
```

## 🛠️ Instalação e Configuração

### 1. Configurar o Servidor

Certifique-se de que o backend DeeperHub CMS está rodando e acessível.

### 2. Configurar a API

Edite o arquivo `js/config.js`:

#### **Para usar dados mock (desenvolvimento):**
```javascript
window.CMS_CONFIG = {
    API_BASE_URL: '/api/cms',
    USE_MOCK_DATA: true,  // Usar dados simulados
    // ...
};
```

#### **Para conectar ao backend real:**
```javascript
window.CMS_CONFIG = {
    API_BASE_URL: 'http://localhost:4000/api/cms',
    USE_MOCK_DATA: false,  // Usar API real
    // ...
};
```

### 3. Servir os Arquivos

Sirva os arquivos através de um servidor web. **Não abra diretamente no navegador** devido às políticas CORS.

#### Opção 1: Servidor Python
```bash
cd client
python -m http.server 8080
```

#### Opção 2: Servidor Node.js
```bash
cd client
npx http-server -p 8080
```

#### Opção 3: Live Server (VS Code)
Use a extensão Live Server do VS Code.

### 4. Acessar o Admin

Abra `http://localhost:8080` no navegador.

## 🔐 Autenticação

### Login Padrão
- **Email**: sysop@system.com
- **Senha**: password123

### Recursos de Autenticação
- Validação de formulário
- Indicador de força da senha
- Sessões persistentes
- Logout automático em caso de token expirado
- Verificação de permissões

## 🔗 Backend Integration

### Configuração de Produção
O cliente está configurado para conectar diretamente ao backend DeeperHub:

1. **Iniciar o backend:**
   ```bash
   # No diretório raiz do projeto
   mix deps.get
   mix run --no-halt
   # Backend rodará em http://localhost:4000
   ```

2. **Iniciar o cliente:**
   ```bash
   cd client
   python -m http.server 8080
   # Cliente rodará em http://localhost:8080
   ```

3. **Credenciais do sistema:**
   - Email: sysop@system.com
   - Senha: password123

### API Configuration
```javascript
// Em js/config.js
API_BASE_URL: 'http://localhost:4000/api/cms'
```

Veja `BACKEND_INTEGRATION.md` para instruções detalhadas.

## 📋 Módulos Detalhados

### 1. Dashboard
- Estatísticas em tempo real
- Atividades recentes
- Ações rápidas
- Informações do sistema

### 2. Páginas
- Criação/edição de páginas
- Configurações de SEO
- Tipos de página e layouts
- Preview de páginas
- Gerenciamento de URI

### 3. Formulários
- Construtor visual de formulários
- Tipos de campo dinâmicos
- Validações customizadas
- Configurações de email
- Preview de formulários

### 4. Widgets
- Componentes reutilizáveis
- Configurações JSON
- Templates customizados
- API endpoints
- Preview de widgets

### 5. Mídia
- Upload drag & drop
- Organização em pastas
- Preview de arquivos
- Informações detalhadas
- Cópia de URLs

### 6. Menus
- Estrutura hierárquica
- Tipos de link (página, URL, separador)
- Templates de menu
- Ícones e badges
- Preview de navegação

### 7. Usuários
- Gerenciamento de contas
- Sistema de permissões
- Reset de senhas
- Indicador de força da senha
- Controle de acesso

### 8. Configurações
- Settings do sistema
- Gerenciamento de temas
- Informações do sistema
- Export/import de configurações
- Limpeza de cache

### 9. Auditoria
- Logs de todas as ações
- Filtros avançados
- Detalhes de mudanças
- Export para CSV
- Estatísticas de uso

## 🎨 Interface

### Design
- Interface limpa e profissional
- Responsivo (mobile-first)
- Ícones Font Awesome
- Cores consistentes
- Feedback visual

### Componentes
- Modais para formulários
- Alertas de sucesso/erro
- Confirmações de ações perigosas
- Paginação automática
- Busca em tempo real

### UX/UI
- Navegação intuitiva
- Breadcrumbs
- Loading states
- Tooltips informativos
- Atalhos de teclado

## 🔧 Personalização

### Temas
O CSS é modular e pode ser facilmente customizado:

```css
/* Cores principais */
:root {
    --primary-color: #007bff;
    --secondary-color: #6c757d;
    --success-color: #28a745;
    --danger-color: #dc3545;
    --warning-color: #ffc107;
}
```

### API Client
O cliente da API é extensível:

```javascript
// Adicionar novos endpoints
cms.customEndpoint = async function(data) {
    return this.post('/custom-endpoint', data);
};
```

## 🐛 Tratamento de Erros

### Tipos de Erro
- **401**: Redirecionamento para login
- **403**: Mensagem de permissão negada
- **404**: Recurso não encontrado
- **422**: Erros de validação
- **500**: Erro interno do servidor

### Logs
Todos os erros são logados no console para debugging.

## 🧪 Testes

### Checklist de Testes
Abra `test-checklist.html` para uma lista completa de funcionalidades para testar:

```
http://localhost:8080/test-checklist.html
```

### Correções Recentes
- ✅ **Menu Sets**: Corrigidos endpoints de edição e exclusão
- ✅ **Users**: Corrigida validação de formulário para edição
- ✅ **Form Fields**: Adicionados handlers para CRUD de campos
- ✅ **Settings**: Corrigidos endpoints de configurações e temas
- ✅ **Permissions**: Adicionados handlers para permissões de usuário
- ✅ **Menu Items**: Implementados endpoints para itens de menu

## 📱 Responsividade

### Breakpoints
- **Desktop**: > 768px
- **Tablet**: 768px - 1024px
- **Mobile**: < 768px

### Adaptações Mobile
- Sidebar colapsável
- Formulários em coluna única
- Tabelas com scroll horizontal
- Botões maiores para touch

## 🚀 Performance

### Otimizações
- Debounce em buscas
- Paginação automática
- Cache de dados
- Lazy loading de imagens
- Minificação de requests

### Carregamento
- Loading states visuais
- Feedback de progresso
- Tratamento de timeouts
- Retry automático

## 🔒 Segurança

### Medidas Implementadas
- Sanitização de HTML
- Validação client-side
- Tokens JWT
- CSRF protection
- Escape de dados

### Boas Práticas
- Não armazenar senhas
- Logout automático
- Validação de permissões
- Logs de auditoria

## 🧪 Testing

### Testes Recomendados
1. **Funcionalidade**: Testar todos os CRUDs
2. **Responsividade**: Testar em diferentes dispositivos
3. **Performance**: Testar com grandes volumes de dados
4. **Segurança**: Testar validações e permissões

### Ferramentas
- Browser DevTools
- Lighthouse
- WAVE (acessibilidade)
- Postman (API testing)

## 📞 Suporte

### Problemas Comuns

**Erro de CORS**
- Certifique-se de servir via servidor web
- Configure CORS no backend

**Token Expirado**
- Faça login novamente
- Verifique configurações de sessão

**Upload Falha**
- Verifique tamanho do arquivo
- Confirme tipos permitidos

### Debug
Ative o console do navegador para ver logs detalhados.

## 🎯 Próximos Passos

Para implementar em produção:

1. **Minificar** CSS e JavaScript
2. **Configurar** HTTPS
3. **Implementar** cache de assets
4. **Adicionar** analytics
5. **Configurar** monitoramento

---

**Desenvolvido para DeeperHub CMS**  
Cliente administrativo profissional e completo.
