# Deeper Client - Estrutura Modular

Este documento descreve a nova estrutura modular do Deeper Client, onde o código foi dividido em módulos especializados para melhor organização e manutenibilidade.

## Estrutura dos Arquivos

### `main.cpp`
- **Responsabilidade**: Coordenação geral e loop principal da aplicação
- **Tamanho**: ~76 linhas (reduzido de 241 linhas)
- **Funcionalidades**:
  - Inicialização dos módulos
  - Loop principal da aplicação
  - Callback de conexão
  - Coordenação entre os módulos

### `window_manager.h/cpp`
- **Responsabilidade**: Gerenciamento de janela e eventos do Windows
- **Funcionalidades**:
  - Criação e configuração da janela
  - Alternância entre modo janela e tela cheia (Alt+Enter)
  - Processamento de mensagens do Windows
  - Manipulação de eventos de teclado e mouse

### `http_client.h/cpp`
- **Responsabilidade**: Comunicação HTTP com o servidor
- **Funcionalidades**:
  - Requisições HTTP GET síncronas e assíncronas
  - Gerenciamento de threads para requisições não-bloqueantes
  - Callbacks para notificação de resposta
  - Simulação de requisições (implementação real comentada)

### `ui_manager.h/cpp`
- **Responsabilidade**: Interface do usuário com ImGui
- **Funcionalidades**:
  - Inicialização e configuração do ImGui
  - Renderização da interface principal
  - Painel de conexão com botões e status
  - Painel de resposta com área de texto scrollável
  - Callbacks para eventos da UI

### `opengl_context.h/cpp`
- **Responsabilidade**: Gerenciamento do contexto OpenGL
- **Funcionalidades**:
  - Inicialização do contexto OpenGL
  - Configuração de formato de pixel
  - Gerenciamento de viewport
  - Operações de limpeza e swap de buffers
  - Configuração de cores de fundo

## Vantagens da Modularização

### 1. **Separação de Responsabilidades**
- Cada módulo tem uma responsabilidade específica e bem definida
- Facilita a manutenção e debugging
- Reduz o acoplamento entre funcionalidades

### 2. **Reutilização de Código**
- Módulos podem ser reutilizados em outros projetos
- Facilita testes unitários de componentes específicos
- Permite desenvolvimento independente de funcionalidades

### 3. **Manutenibilidade**
- Código mais organizado e fácil de navegar
- Mudanças em uma funcionalidade não afetam outras
- Facilita a adição de novas funcionalidades

### 4. **Escalabilidade**
- Estrutura preparada para crescimento do projeto
- Facilita a adição de novos módulos
- Permite refatoração incremental

## Fluxo de Execução

1. **Inicialização** (`main.cpp`):
   - Inicializa WindowManager
   - Inicializa OpenGLContext
   - Inicializa UIManager
   - Configura callbacks

2. **Loop Principal** (`main.cpp`):
   - Processa mensagens (WindowManager)
   - Atualiza status da UI (UIManager)
   - Renderiza frame (UIManager + OpenGLContext)
   - Troca buffers (OpenGLContext)

3. **Eventos de UI** (`ui_manager.cpp`):
   - Detecta clique no botão de conexão
   - Chama callback configurado
   - Atualiza interface com status

4. **Requisições HTTP** (`http_client.cpp`):
   - Executa requisição em thread separada
   - Notifica UI através de callback
   - Atualiza status da requisição

## Compilação

O arquivo `meson.build` foi atualizado para incluir todos os novos arquivos fonte:

```meson
project_src = [
  'src/main.cpp',
  'src/window_manager.cpp',
  'src/http_client.cpp',
  'src/ui_manager.cpp',
  'src/opengl_context.cpp'
]
```

Para compilar:
```bash
cd deeper_client
meson setup build
meson compile -C build
```

## Próximos Passos

1. **Implementar requisições HTTP reais** no `http_client.cpp`
2. **Adicionar mais funcionalidades de UI** no `ui_manager.cpp`
3. **Implementar configurações** em um novo módulo `config_manager`
4. **Adicionar logging** em um novo módulo `logger`
5. **Implementar testes unitários** para cada módulo
