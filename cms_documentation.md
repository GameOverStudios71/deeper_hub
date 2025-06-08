# Documentação do CMS - Funcionalidades e Fluxo

Este documento descreve as funcionalidades do sistema de gerenciamento de conteúdo (CMS) com base nas tabelas definidas no arquivo `cms.sql`. Aqui, explico como essas funcionalidades operam, o fluxo de inicialização a partir de um arquivo `index`, e forneço exemplos práticos.

## 1. Visão Geral do CMS

O CMS é um sistema robusto para criação e gerenciamento de páginas dinâmicas, menus, formulários, grids, widgets e visualizações. Ele permite a personalização de layouts, a interação do usuário por meio de formulários, e a exibição de dados em formatos estruturados.

## 2. Funcionalidades Principais

### 2.1 Gerenciamento de Menus (`sys_menu_items`, `sys_menu_sets`, `sys_menu_templates`, `sys_objects_menu`)
- **Descrição**: Permite a criação de menus dinâmicos e hierárquicos para navegação no site.
- **Como Funciona**: Os itens de menu são armazenados em `sys_menu_items` com links, ícones e permissões de visibilidade. `sys_menu_sets` agrupa conjuntos de menus, enquanto `sys_menu_templates` define a aparência. `sys_objects_menu` associa menus a objetos específicos do sistema.
- **Exemplo**: Um menu de navegação superior pode ser criado com itens como "Home", "Sobre", e "Contato", cada um vinculado a URLs específicas ou ações JavaScript.

### 2.2 Construção de Páginas (`sys_pages_blocks`, `sys_pages_blocks_data`, `sys_pages_layouts`, `sys_pages_types`, `sys_pages_wiki_blocks`, `sys_objects_page`)
- **Descrição**: Ferramentas para estruturar páginas com blocos de conteúdo e layouts personalizados.
- **Como Funciona**: `sys_pages_layouts` define o esqueleto da página (número de células). `sys_pages_blocks` contém conteúdos específicos (texto, imagens) colocados em células. `sys_pages_types` categoriza páginas por tipo, e `sys_objects_page` associa páginas a módulos.
- **Exemplo**: Uma página de "Blog" pode ter um layout de duas colunas, com um bloco de postagens à esquerda e um bloco de widgets à direita.

### 2.3 Widgets e Componentes (`sys_std_widgets`, `sys_std_widgets_bookmarks`, `sys_objects_widget`, `sys_std_pages_widgets`)
- **Descrição**: Elementos reutilizáveis para adicionar funcionalidades ou conteúdos específicos às páginas.
- **Como Funciona**: `sys_std_widgets` armazena widgets padrão como carrosséis ou formulários de busca. `sys_objects_widget` define widgets personalizados por módulo. Widgets podem ser associados a páginas específicas via `sys_std_pages_widgets`.
- **Exemplo**: Um widget de "Últimas Notícias" pode ser adicionado a várias páginas para exibir notícias recentes.

### 2.4 Formulários Dinâmicos (`sys_objects_form`, `sys_form_displays`, `sys_form_inputs`, `sys_form_display_inputs`)
- **Descrição**: Criação de formulários interativos para coleta de dados ou interação do usuário.
- **Como Funciona**: `sys_objects_form` define o formulário com ações e atributos. `sys_form_inputs` especifica campos como texto ou seleção. `sys_form_displays` e `sys_form_display_inputs` controlam como e onde os campos são exibidos.
- **Exemplo**: Um formulário de contato com campos para nome, e-mail e mensagem, enviado para uma URL específica.

### 2.5 Grids de Dados (`sys_objects_grid`, `sys_grid_fields`, `sys_grid_actions`)
- **Descrição**: Exibição de dados em tabelas interativas com ações associadas.
- **Como Funciona**: `sys_objects_grid` define grids vinculados a tabelas de dados. `sys_grid_fields` especifica colunas a serem mostradas, e `sys_grid_actions` adiciona ações como "Editar" ou "Excluir".
- **Exemplo**: Um grid de usuários administrativos mostrando nome, e-mail e status, com botões para editar cada entrada.

### 2.6 Visualizações de Conteúdo (`sys_objects_view`, `sys_objects_content_info`)
- **Descrição**: Controle sobre como o conteúdo é renderizado para o usuário.
- **Como Funciona**: `sys_objects_view` define tipos de visualização (lista, detalhe). `sys_objects_content_info` fornece metadados sobre o conteúdo a ser exibido.
- **Exemplo**: Uma visualização de "Galeria" pode mostrar imagens em grade, enquanto uma visualização de "Detalhe" exibe uma imagem ampliada com descrição.

### 2.7 URLs e SEO (`sys_permalinks`, `sys_seo_links`, `sys_seo_uri_rewrites`, `sys_rewrite_rules`)
- **Descrição**: Gerenciamento de URLs amigáveis e otimização para motores de busca.
- **Como Funciona**: `sys_permalinks` mapeia URLs padrão para URLs amigáveis. `sys_seo_links` associa URIs a objetos para indexação. `sys_seo_uri_rewrites` e `sys_rewrite_rules` gerenciam redirecionamentos e reescritas de URLs.
- **Exemplo**: Transformar `/page.php?id=123` em `/sobre-nos` para melhor SEO e usabilidade.

### 2.8 Páginas Padrão (`sys_std_pages`)
- **Descrição**: Páginas predefinidas do sistema com configurações específicas.
- **Como Funciona**: `sys_std_pages` lista páginas padrão como "Home" ou "Erro 404", com metadados como ícones e imagens de capa.
- **Exemplo**: Uma página padrão de erro 404 personalizada com a marca do site.

## 3. Fluxo de Inicialização a Partir de um Arquivo `index`

O fluxo de renderização de uma página dinâmica no CMS a partir de um arquivo `index` (geralmente `index.php`) segue estas etapas:

1. **Entrada no Sistema**:
   - O arquivo `index.php` atua como ponto de entrada, recebendo todas as solicitações HTTP.
   - Ele inicializa o núcleo do CMS, carregando configurações e bibliotecas necessárias.
   - Exemplo de `index.php`:
     ```php
     <?php
     require_once('core/bootstrap.php');
     $requestUri = $_SERVER['REQUEST_URI'];
     $router = new Router();
     $router->route($requestUri);
     ?>
     ```

2. **Resolução de URL**:
   - O CMS consulta `sys_permalinks` e `sys_rewrite_rules` para mapear a URL solicitada (ex.: `/sobre-nos`) para um objeto ou página interna.
   - Exemplo: Uma solicitação para `/sobre-nos` pode ser mapeada para um objeto em `sys_seo_links` com `object_id=123` e `module='page'`.

3. **Identificação da Página**:
   - Com base na URL resolvida, o sistema identifica a página em `sys_std_pages` ou `sys_pages_types`.
   - O layout da página é obtido de `sys_pages_layouts` (ex.: layout de 2 colunas).

4. **Carregamento de Blocos e Widgets**:
   - Blocos de conteúdo são carregados de `sys_pages_blocks`, associados à página e posicionados nas células do layout.
   - Widgets são recuperados de `sys_std_widgets` e associados via `sys_std_pages_widgets`.
   - Exemplo: Um bloco de texto introdutório é renderizado na célula 1, enquanto um widget de busca aparece na célula 2.

5. **Renderização de Menus**:
   - Menus associados à página ou ao layout são carregados de `sys_menu_items` e estilizados com base em `sys_menu_templates`.
   - Exemplo: Um menu superior com links para "Home" e "Blog" é renderizado no cabeçalho.

6. **Exibição de Formulários e Grids**:
   - Se a página inclui formulários, eles são construídos com dados de `sys_objects_form` e `sys_form_inputs`.
   - Grids de dados são renderizados usando `sys_objects_grid` e `sys_grid_fields` para exibir informações tabuladas.
   - Exemplo: Um formulário de contato aparece no rodapé, enquanto um grid de produtos é mostrado no conteúdo principal.

7. **Visualização de Conteúdo**:
   - O tipo de visualização é determinado por `sys_objects_view` (ex.: lista ou detalhe), afetando como o conteúdo é apresentado.
   - Exemplo: Produtos são mostrados em grade na página inicial, mas em detalhe numa página específica.

8. **Otimização de SEO**:
   - Metadados e URLs otimizados são aplicados com base em `sys_seo_links` e `sys_seo_uri_rewrites` para melhorar a indexação.

9. **Renderização Final**:
   - O HTML final é gerado, combinando layout, blocos, widgets, menus, formulários e grids.
   - A resposta é enviada ao navegador do usuário.

## 4. Exemplo Completo de Fluxo

**Solicitação**: Usuário acessa `http://example.com/sobre-nos`.

1. **`index.php` Processa a Solicitação**:
   - Inicializa o CMS e identifica a rota `/sobre-nos`.

2. **Resolução de URL**:
   - Consulta `sys_permalinks` e encontra que `/sobre-nos` mapeia para uma página com `id=2` em `sys_std_pages`.

3. **Carregamento da Página**:
   - Obtém dados da página de `sys_std_pages` (título: "Sobre Nós", layout_id: 1).
   - Carrega layout de `sys_pages_layouts` (layout de 1 coluna).

4. **Blocos e Widgets**:
   - Carrega blocos de `sys_pages_blocks` associados ao `object='sobre-nos'` (ex.: bloco de texto sobre a empresa).
   - Adiciona widget de "Contato Rápido" de `sys_std_widgets`.

5. **Menus**:
   - Renderiza menu principal de `sys_menu_items` com itens "Home", "Sobre", "Contato".

6. **Renderização**:
   - Combina todos os elementos num template HTML, renderizando a página com o conteúdo de "Sobre Nós", o menu superior, e o widget de contato no rodapé.

## 5. Considerações Finais

O CMS construído com base nas tabelas do `cms.sql` oferece um sistema flexível e poderoso para criar páginas dinâmicas. Ele suporta personalização profunda por meio de layouts, widgets e formulários, enquanto mantém URLs amigáveis para SEO. Este fluxo, iniciado pelo `index.php`, garante que cada solicitação seja processada de forma estruturada, resultando numa experiência de usuário consistente e rica em funcionalidades.

Se precisar de mais detalhes sobre alguma funcionalidade específica ou exemplos adicionais, por favor, solicite!
