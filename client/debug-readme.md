# DeeperHub CMS Debug System

Sistema completo de debug e logging para o DeeperHub CMS que permite rastrear todas as operações do sistema em tempo real.

## 🚀 Características

- **Debug Visual**: Painel flutuante com logs em tempo real
- **Logging Automático**: Intercepta automaticamente APIs, formulários, validações e erros
- **Filtros Avançados**: Filtragem por categoria e nível de log
- **Persistência**: Salva logs no localStorage
- **Download**: Exporta logs como arquivo JSON
- **Performance**: Monitora tempo de execução das operações
- **Sanitização**: Remove dados sensíveis automaticamente

## 📋 Configuração

### Habilitando/Desabilitando Debug

No arquivo `client/js/config.js`:

```javascript
DEBUG: {
    ENABLED: true,                    // Master debug flag
    SHOW_API_REQUESTS: true,         // Log API requests/responses
    SHOW_FORM_DATA: true,            // Log form data before submission
    SHOW_VALIDATION: true,           // Log validation results
    SHOW_STATE_CHANGES: true,        // Log state changes in modules
    SHOW_PERFORMANCE: true,          // Log performance metrics
    SHOW_ERRORS_DETAILED: true,      // Show detailed error information
    CONSOLE_LEVEL: 'info',           // 'debug', 'info', 'warn', 'error'
    VISUAL_DEBUGGER: true,           // Show visual debug panel
    PERSIST_LOGS: true,              // Keep logs in localStorage
    MAX_LOGS: 1000                   // Maximum number of logs to keep
}
```

## 🎯 Categorias de Log

### 1. **API** - Requisições HTTP
- Logs automáticos de todas as chamadas para o backend
- Inclui método, URL, dados enviados e resposta
- Monitora tempo de resposta

### 2. **FORM** - Dados de Formulários
- Captura dados antes do envio
- Sanitiza campos sensíveis (passwords, tokens)
- Mostra contagem de campos

### 3. **VALIDATION** - Validações
- Resultado das validações de formulários
- Lista de erros encontrados
- Status de sucesso/falha

### 4. **STATE** - Mudanças de Estado
- Alterações em propriedades dos módulos
- Navegação entre abas
- Carregamento de dados

### 5. **PERFORMANCE** - Performance
- Tempo de execução de operações
- Alertas para operações lentas (>1s)
- Métricas detalhadas

### 6. **ERROR** - Erros
- Erros JavaScript capturados
- Stack traces completos
- Contexto do erro

### 7. **SYSTEM** - Sistema
- Inicialização do CMS
- Operações do debug
- Estados do sistema

## 🛠️ Uso Programático

### Logging Manual

```javascript
// Log básico
window.CMSDebug.log('custom', 'Minha mensagem', { dados: 'exemplo' }, 'info');

// Log de API (automático, mas pode ser manual)
window.CMSDebug.logApiRequest('POST', '/api/pages', { title: 'Test' });
window.CMSDebug.logApiResponse('POST', '/api/pages', 201, { id: 1 });

// Log de formulário
window.CMSDebug.logFormData('#myForm', formData, 'create');

// Log de validação
window.CMSDebug.logValidation('#myForm', true, []);

// Log de performance
window.CMSDebug.logPerformance('Operação complexa', 1500, { detalhes: 'info' });

// Log de erro
window.CMSDebug.logError(new Error('Algo deu errado'), { contexto: 'info' });

// Log de mudança de estado
window.CMSDebug.logStateChange('ModuleName', 'property', 'oldValue', 'newValue');
```

### Controle do Debug

```javascript
// Habilitar/desabilitar
window.CMSDebug.toggle(true);  // habilita
window.CMSDebug.toggle(false); // desabilita
window.CMSDebug.toggle();      // alterna

// Limpar logs
window.CMSDebug.clearLogs();

// Baixar logs
window.CMSDebug.downloadLogs();

// Estatísticas
const stats = window.CMSDebug.getStats();
console.log(stats);
```

## 🎨 Interface Visual

### Painel de Debug
- **Posição**: Canto superior direito
- **Redimensionável**: Pode ser minimizado
- **Filtros**: Por categoria e nível
- **Contadores**: Total de logs e sessão atual

### Controles do Painel
- **🗑️ Clear**: Limpa todos os logs
- **💾 Download**: Baixa logs como JSON
- **📋 Toggle**: Minimiza/maximiza painel
- **✖️ Close**: Fecha o painel

### Cores dos Logs
- **🔵 Info**: Azul - Informações gerais
- **🟡 Warning**: Amarelo - Avisos
- **🔴 Error**: Vermelho - Erros
- **⚫ Debug**: Cinza - Debug detalhado

## 📊 Exemplos de Logs

### Log de API Request
```
🔄 API Request: POST http://localhost:4000/api/cms/pages
Data: { title: "Test Page", name: "test_page", ... }
```

### Log de API Response
```
✅ POST /api/cms/pages - 201 Created
Data: { id: 1, title: "Test Page", ... }
Performance: 245ms
```

### Log de Formulário
```
📋 Form submit: #recordForm
Data: { title: "Test", name: "test", ... }
Field Count: 8
```

### Log de Validação
```
❌ Validation #recordForm: FAILED
Errors: ["name é obrigatório", "uri deve começar com /"]
```

### Log de Performance
```
⚡ Load pages data: 156ms
Details: { recordCount: 25, params: {...} }
```

## 🔧 Integração Automática

O sistema de debug está integrado automaticamente em **TODOS OS MÓDULOS**:

### 📋 Módulos Cobertos:
- **✅ Pages**: Páginas, layouts, tipos, design boxes, blocos, placeholders
- **✅ Forms**: Formulários, campos, displays, submissões
- **✅ Widgets**: Widgets, tipos, instâncias, configurações, bookmarks
- **✅ Users**: Usuários e permissões
- **✅ Media**: Storage, pastas, arquivos, transformações
- **✅ Menus**: Menu sets, templates, itens
- **✅ Settings**: Configurações, categorias, tipos, temas
- **✅ Entities**: Sistema dinâmico EAV
- **✅ Audit**: Logs de auditoria
- **✅ Dashboard**: Painel principal

### 🤖 Interceptação Automática:
- **CMS Client**: Todas as requisições HTTP
- **Load Methods**: `loadTabData()`, `loadData()`, `loadCurrentTab()`, `init()`
- **Save Methods**: `saveRecord()`, `save()`, `create()`, `update()`
- **Utils**: `validateForm()`, `serializeForm()`
- **jQuery AJAX**: Todas as requisições AJAX
- **Global Errors**: Erros JavaScript e promises rejeitadas
- **State Changes**: Mudanças em `currentTab`, `currentPage`

### 🔄 Debug Integration Script:
O arquivo `debug-integration.js` adiciona automaticamente debug a todos os módulos sem necessidade de modificar código individual.

## 📱 Responsividade

O painel de debug é responsivo e se adapta a diferentes tamanhos de tela:
- **Desktop**: Painel completo no canto direito
- **Tablet**: Painel reduzido
- **Mobile**: Painel minimizado por padrão

## 🔒 Segurança

### Sanitização Automática
- Remove campos sensíveis: `password`, `token`, `secret`, `key`, `auth`
- Substitui por `[HIDDEN]` nos logs
- Não afeta os dados originais

### Dados Persistidos
- Apenas últimos 100 logs são salvos no localStorage
- Logs são específicos da sessão
- Podem ser limpos a qualquer momento

## 🚀 Performance

- **Overhead mínimo**: Apenas quando debug está habilitado
- **Lazy loading**: Painel criado apenas quando necessário
- **Throttling**: Logs limitados para evitar spam
- **Memory management**: Logs antigos são removidos automaticamente

## 🎛️ Configurações Avançadas

### Níveis de Console
- `debug`: Mostra tudo
- `info`: Informações e acima
- `warn`: Avisos e erros
- `error`: Apenas erros

### Filtros Personalizados
```javascript
// Filtrar apenas erros de API
window.CMSDebug.logs.filter(log => 
    log.category === 'api' && log.level === 'error'
);
```

## 📝 Troubleshooting

### Debug não aparece
1. Verifique se `DEBUG.ENABLED: true` no config.js
2. Verifique se debug.js está carregado
3. Verifique console por erros JavaScript

### Painel não atualiza
1. Verifique se `VISUAL_DEBUGGER: true`
2. Recarregue a página
3. Limpe cache do navegador

### Performance lenta
1. Reduza `MAX_LOGS` no config
2. Desabilite `PERSIST_LOGS`
3. Use nível `warn` ou `error` apenas

## 🧪 Testando o Sistema

### Página de Teste
Acesse `client/debug-test.html` para testar todas as funcionalidades:

```bash
# Abrir no navegador
open client/debug-test.html
```

### Testes Disponíveis:
- **🔧 Sistema de Debug**: Verificar se está funcionando
- **🔄 API Debug**: Testar logs de requisições
- **📋 Form Debug**: Testar logs de formulários
- **⚡ Performance Debug**: Testar métricas de tempo
- **💥 Error Debug**: Testar captura de erros
- **🔄 State Debug**: Testar mudanças de estado
- **📊 Debug Stats**: Visualizar estatísticas

### Comandos de Console:
```javascript
// Verificar se debug está ativo
console.log(window.CMSDebug ? 'Debug ativo' : 'Debug inativo');

// Ver estatísticas
window.CMSDebug.getStats();

// Alternar debug
window.CMSDebug.toggle();

// Limpar logs
window.CMSDebug.clearLogs();

// Baixar logs
window.CMSDebug.downloadLogs();

// Log manual
window.CMSDebug.log('test', 'Meu teste', { data: 'exemplo' });
```

---

**Desenvolvido para DeeperHub CMS** 🚀
