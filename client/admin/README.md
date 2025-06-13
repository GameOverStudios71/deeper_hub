# DEEPER HUB CMS - Interface Administrativa

Interface administrativa com visual retrô inspirado no DOS/NCurses, construída com TuiCss e JavaScript vanilla.

## 🎨 Visual e Design

### Características Visuais
- **Tema:** DOS/NCurses clássico
- **Cores:** Paleta de 16 cores estilo DOS (azul, branco, vermelho, verde, etc.)
- **Fonte:** Lucida Console, monoespaçada
- **Elementos:** Bordas ASCII, ícones de texto, janelas estilo terminal

### Componentes Principais
- **Barra Superior:** Menu principal com File, Edit, View, Tools, Help
- **Menu Lateral:** Navegação por seções (Dashboard, Pages, Users, etc.)
- **Área de Conteúdo:** Tabs múltiplas com painéis de conteúdo
- **Barra de Status:** Atalhos F1-F10 e status da conexão

## 🏗️ Arquitetura

### Estrutura de Arquivos
```
client/admin/
├── index.html              # Página principal
├── css/
│   └── admin.css           # Estilos customizados
├── js/
│   ├── admin.js            # Aplicação principal
│   ├── api.js              # Cliente da API REST
│   ├── components.js       # Componentes reutilizáveis
│   └── utils.js            # Funções utilitárias
└── README.md               # Esta documentação
```

### Dependências
- **TuiCss:** Framework CSS com visual DOS/NCurses
- **Bootstrap Grid:** Sistema de grid responsivo
- **JavaScript Vanilla:** Sem frameworks, apenas JS puro

## 🚀 Funcionalidades

### Dashboard
- **Estatísticas em tempo real:** Cards com métricas do sistema
- **Atividade recente:** Log das últimas ações
- **Ações rápidas:** Botões para tarefas comuns
- **Visão geral:** Status do sistema e informações importantes

### Gerenciamento de Conteúdo
- **Páginas:** CRUD completo para páginas do site
- **Widgets:** Gerenciamento de componentes reutilizáveis
- **Formulários:** Construtor e gerenciador de formulários
- **Menus:** Editor de navegação do site
- **Mídia:** Upload e organização de arquivos

### Administração
- **Usuários:** Gerenciamento de contas e perfis
- **Permissões:** Sistema granular de controle de acesso
- **Auditoria:** Logs detalhados de todas as ações
- **Configurações:** Parâmetros globais do sistema
- **Temas:** Personalização visual

### Interface
- **Tabs múltiplas:** Trabalhe em várias seções simultaneamente
- **Atalhos de teclado:** Navegação rápida estilo DOS
- **Notificações:** Sistema de alertas e confirmações
- **Modais:** Diálogos para ações importantes
- **Busca:** Filtros e pesquisa em todas as seções

## ⌨️ Atalhos de Teclado

### Atalhos Principais
- **F1:** Ajuda e documentação
- **F2:** Salvar item atual
- **F3:** Abrir item
- **F5:** Atualizar visualização
- **F10:** Logout
- **F11:** Tela cheia

### Atalhos de Edição
- **Ctrl+N:** Novo item
- **Ctrl+O:** Abrir item
- **Ctrl+S:** Salvar
- **Ctrl+Z:** Desfazer
- **Ctrl+Y:** Refazer
- **Ctrl+C:** Copiar
- **Ctrl+V:** Colar

### Navegação
- **ESC:** Cancelar/Fechar
- **Alt+Letter:** Acesso aos menus (Alt+F para File, etc.)
- **Tab:** Navegar entre campos
- **Enter:** Confirmar ação

## 🔧 Configuração e Uso

### Pré-requisitos
1. Servidor web para servir arquivos estáticos
2. API REST do CMS rodando (backend Elixir)
3. Navegador moderno com suporte a ES6+

### Instalação
1. Clone o repositório
2. Certifique-se que os arquivos TuiCss estão em `../ui/TuiCss/`
3. Configure o servidor web para servir a pasta `client/`
4. Acesse `http://localhost/admin/`

### Teste Rápido
```bash
# Execute o script de teste
python test_admin_interface.py
```

## 🌐 Integração com API

### Cliente API
O arquivo `api.js` fornece um cliente completo para a API REST:

```javascript
// Exemplos de uso
const pages = await API.pages.list();
const user = await API.users.get(1);
await API.settings.update('site_title', { value: 'Novo Título' });
```

### Endpoints Suportados
- **Pages:** `/api/cms/pages`
- **Widgets:** `/api/cms/widgets`
- **Forms:** `/api/cms/forms`
- **Menus:** `/api/cms/menus`
- **Media:** `/api/cms/media`
- **Users:** `/api/cms/users`
- **Settings:** `/api/cms/settings`
- **Themes:** `/api/cms/themes`
- **Audit:** `/api/cms/audit`
- **Relationships:** `/api/cms/relationships`

### Autenticação
O sistema suporta autenticação via token JWT:
```javascript
// Token é automaticamente incluído nas requisições
Utils.storage.set('auth_token', 'seu_token_jwt');
```

## 🎯 Componentes Reutilizáveis

### Notificações
```javascript
AdminApp.showNotification('Mensagem', 'success', 5000);
```

### Modais
```javascript
Components.createModal('Título', 'Conteúdo', [
    { text: 'Cancelar', onclick: 'Components.closeModal()' },
    { text: 'Confirmar', class: 'primary', onclick: 'minhaFuncao()' }
]);
```

### Tabelas
```javascript
const columns = [
    { key: 'id', title: 'ID' },
    { key: 'name', title: 'Nome' },
    { key: 'actions', title: 'Ações', type: 'actions' }
];
Components.createTable(data, columns);
```

### Formulários
```javascript
const fields = [
    { name: 'title', label: 'Título', type: 'text', required: true },
    { name: 'content', label: 'Conteúdo', type: 'textarea' }
];
Components.createForm(fields, data);
```

## 🔒 Segurança

### Medidas Implementadas
- **Escape de HTML:** Prevenção contra XSS
- **Validação de entrada:** Sanitização de dados
- **Autenticação:** Sistema de tokens
- **Autorização:** Verificação de permissões
- **Auditoria:** Log de todas as ações

### Boas Práticas
- Sempre escape dados do usuário
- Valide permissões antes de ações
- Use HTTPS em produção
- Implemente rate limiting
- Monitore logs de auditoria

## 📱 Responsividade

### Breakpoints
- **Desktop:** > 768px (layout completo)
- **Tablet/Mobile:** ≤ 768px (menu colapsável)

### Adaptações Mobile
- Menu lateral colapsável
- Tabs horizontais com scroll
- Botões maiores para touch
- Formulários otimizados

## 🐛 Debugging

### Console do Navegador
```javascript
// Verificar estado da aplicação
console.log(AdminApp.currentSection);
console.log(AdminApp.openTabs);

// Testar API
API.pages.list().then(console.log);

// Verificar cache
console.log(API.cache);
```

### Logs de Rede
- Monitore requisições na aba Network
- Verifique headers de autenticação
- Analise tempos de resposta

## 🚧 Desenvolvimento

### Adicionando Nova Seção
1. Adicione item no menu lateral (`index.html`)
2. Implemente `load[Section]Section()` em `admin.js`
3. Crie endpoints correspondentes em `api.js`
4. Teste a funcionalidade

### Criando Componente
1. Adicione função em `components.js`
2. Documente parâmetros e uso
3. Teste em diferentes contextos
4. Adicione estilos se necessário

## 📋 TODO

### Funcionalidades Pendentes
- [ ] Editor WYSIWYG para conteúdo
- [ ] Sistema de drag-and-drop
- [ ] Gráficos e relatórios
- [ ] Backup/restore automático
- [ ] Modo offline
- [ ] Temas customizáveis
- [ ] Plugins/extensões

### Melhorias
- [ ] Otimização de performance
- [ ] Testes automatizados
- [ ] Documentação interativa
- [ ] Acessibilidade (ARIA)
- [ ] Internacionalização (i18n)

## 📞 Suporte

Para dúvidas ou problemas:
1. Verifique os logs do console
2. Teste com `test_admin_interface.py`
3. Consulte a documentação da API
4. Verifique conectividade com backend

---

**DEEPER HUB CMS** - Interface administrativa profissional com visual retrô! 🚀
