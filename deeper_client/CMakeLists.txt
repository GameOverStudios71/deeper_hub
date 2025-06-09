cmake_minimum_required(VERSION 3.10)
project(deeper_client VERSION 0.1.0 LANGUAGES CXX)

# Definir C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Opções
option(GLFW_BUILD_DOCS OFF)
option(GLFW_BUILD_TESTS OFF)
option(GLFW_BUILD_EXAMPLES OFF)
option(GLFW_INSTALL OFF)

# Adicionar GLFW
add_subdirectory(external/glfw)

# Adicionar CPR
add_subdirectory(external/cpr)

# Adicionar nlohmann/json
add_subdirectory(external/nlohmann_json)




# Configurar ImGui
set(IMGUI_SOURCES
    external/imgui/imgui.cpp
    external/imgui/imgui_demo.cpp
    external/imgui/imgui_draw.cpp
    external/imgui/imgui_tables.cpp
    external/imgui/imgui_widgets.cpp
    external/imgui/backends/imgui_impl_glfw.cpp
    external/imgui/backends/imgui_impl_opengl3.cpp
)

# Adicionar OpenGL
find_package(OpenGL REQUIRED)

# Configurar executável
# Adicionar ao executável
add_executable(deeper_client
    src/main.cpp
    src/Application.cpp
    src/BackendConnector.cpp
    src/Shader.cpp
    ${IMGUI_SOURCES}
)

# Incluir diretórios
target_include_directories(deeper_client PRIVATE
    external/imgui
    external/imgui/backends
    external/glfw/include
    external/nlohmann_json/include
)

# Vincular Bibliotecas
target_link_libraries(deeper_client PRIVATE
    glfw
    ${OPENGL_LIBRARIES}
    cpr::cpr
    nlohmann_json::nlohmann_json
)

# Definições específicas de plataforma
if(WIN32)
    target_compile_definitions(deeper_client PRIVATE WINDOWS)
elseif(APPLE)
    target_compile_definitions(deeper_client PRIVATE APPLE)
elseif(UNIX AND NOT APPLE)
    target_compile_definitions(deeper_client PRIVATE LINUX)
endif()