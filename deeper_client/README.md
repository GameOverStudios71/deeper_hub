# DeeperHub Client

Cliente GUI para o sistema DeeperHub desenvolvido em C++ com GLFW, ImGui e CPR.

## Dependências

- **GLFW**: Interface gráfica e gerenciamento de janelas
- **ImGui**: Interface de usuário imediata
- **CPR**: Cliente HTTP para comunicação com o backend
- **nlohmann/json**: Parsing JSON
- **OpenGL**: Renderização gráfica

## Compilação

### Windows com MinGW

1. Certifique-se de que o MinGW está instalado em `C:\mingw64\bin`
2. Execute o script de build:

```cmd
build.bat
```

Ou manualmente:

```cmd
cd build
cmake -G "MinGW Makefiles" -DCMAKE_MAKE_PROGRAM="C:/mingw64/bin/make.exe" -DCMAKE_C_COMPILER="C:/mingw64/bin/gcc.exe" -DCMAKE_CXX_COMPILER="C:/mingw64/bin/g++.exe" ..
cmake --build . --config Release
```

### Linux

```bash
./build_linux.sh
```

### macOS

```bash
./build_mac.sh
```

## Execução

Após a compilação, execute:

```cmd
cd build
deeper_client.exe
```

## Funcionalidades

- Interface gráfica para terminal interativo
- Conexão com backend DeeperHub via HTTP
- Execução de comandos remotos
- Histórico de comandos
- Interface responsiva com ImGui

## Configuração

O cliente se conecta por padrão ao backend em `http://localhost:4000`. 
Para alterar, modifique o construtor em `src/Application.cpp`.

## Troubleshooting

### "Falha ao criar janela GLFW"

Este erro pode ocorrer se:
- O OpenGL não estiver disponível no sistema
- Drivers gráficos estiverem desatualizados
- Executando em ambiente sem interface gráfica (SSH, etc.)

### Problemas de compilação

- Verifique se todas as dependências estão no diretório `external/`
- Certifique-se de que o MinGW está no PATH
- Verifique se o CMake está instalado e acessível
