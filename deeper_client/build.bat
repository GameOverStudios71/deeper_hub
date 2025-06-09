@echo off
if not exist build mkdir build
cd build
del deeper_client.exe
cmake -G "MinGW Makefiles" -DCMAKE_MAKE_PROGRAM="C:/mingw64/bin/make.exe" -DCMAKE_C_COMPILER="C:/mingw64/bin/gcc.exe" -DCMAKE_CXX_COMPILER="C:/mingw64/bin/g++.exe" ..
cmake --build . --config Release
deeper_client.exe
cd ..