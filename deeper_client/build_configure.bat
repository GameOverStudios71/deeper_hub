@echo off

del build\deeper_client.exe

REM Certifique-se de que o MinGW está no PATH
set PATH=C:\mingw64\bin;%PATH%

REM Configure o projeto com Meson
meson setup build --backend=ninja

REM Compile o projeto
build\ninja

echo "+++++[ Compilação concluída ]+++++"

build\deeper_client.exe