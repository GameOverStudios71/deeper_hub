@echo off

del build\deeper_client.exe

REM Certifique-se de que o MinGW está no PATH
set PATH=C:\mingw64\bin;%PATH%

REM Compile o projeto
cd build & ninja

echo "+++++[ Compilação concluída ]+++++"

deeper_client.exe
cd ..