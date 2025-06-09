project('deeper_client', 'cpp',
  version : '0.1.0',
  default_options : ['warning_level=3', 'cpp_std=c++11'])

# Configuração específica para MinGW
add_global_arguments('-DUNICODE', '-D_UNICODE', language : 'cpp')

# Adicionar ImGui como arquivos de origem diretamente
imgui_src = [
  'includes/imgui/imgui.cpp',
  'includes/imgui/imgui_demo.cpp',
  'includes/imgui/imgui_draw.cpp',
  'includes/imgui/imgui_tables.cpp',
  'includes/imgui/imgui_widgets.cpp',
  # Usando o backend Win32 + OpenGL3 (bom para MinGW no Windows)
  'includes/imgui/backends/imgui_impl_win32.cpp',
  'includes/imgui/backends/imgui_impl_opengl3.cpp'
]

# Dependências para Windows com MinGW - usando find_library em vez de dependency()
compiler = meson.get_compiler('cpp')
opengl_lib = compiler.find_library('opengl32', required : true)
gdi32_lib = compiler.find_library('gdi32', required : true)
dwmapi_lib = compiler.find_library('dwmapi', required : false)

# Criar biblioteca ImGui
imgui_lib = static_library('imgui/',
  imgui_src,
  include_directories : include_directories('includes/imgui/', 'includes/imgui/backends'),
  dependencies : [])

# Criar um objeto de dependência para ImGui
imgui_dep = declare_dependency(
  link_with : imgui_lib,
  include_directories : include_directories('includes/imgui/', 'includes/imgui/backends'))

# Lista de dependências
deps = [imgui_dep, opengl_lib, gdi32_lib]
if dwmapi_lib.found()
  deps += dwmapi_lib
endif

# Arquivos fonte do projeto
project_src = [
  'src/main.cpp',
  'src/window_manager.cpp',
  'src/http_client.cpp',
  'src/ui_manager.cpp',
  'src/opengl_context.cpp'
]

# Executável principal
executable('deeper_client',
  project_src,
  dependencies : deps,
  install : true)

