#!/usr/bin/env python3
"""
Script para iniciar o servidor e executar os testes automaticamente.
"""

import subprocess
import time
import requests
import sys
import os
from threading import Thread

def check_server(url="http://localhost:4000", timeout=30):
    """Verifica se o servidor está rodando."""
    print(f"🔍 Verificando se servidor está rodando em {url}...")
    
    start_time = time.time()
    while time.time() - start_time < timeout:
        try:
            response = requests.get(url, timeout=2)
            if response.status_code == 200:
                print(f"✅ Servidor está rodando!")
                return True
        except:
            pass
        time.sleep(1)
    
    print(f"❌ Servidor não respondeu em {timeout} segundos")
    return False

def start_server():
    """Inicia o servidor Elixir."""
    print("🚀 Iniciando servidor DeeperHub...")
    
    try:
        # Verifica se já está rodando
        if check_server(timeout=2):
            print("ℹ️ Servidor já está rodando")
            return None
        
        # Inicia o servidor
        process = subprocess.Popen(
            ["mix", "run", "--no-halt"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            cwd=os.getcwd()
        )
        
        print("⏳ Aguardando servidor inicializar...")
        
        # Aguarda o servidor ficar disponível
        if check_server(timeout=30):
            return process
        else:
            print("❌ Falha ao iniciar servidor")
            process.terminate()
            return None
            
    except Exception as e:
        print(f"❌ Erro ao iniciar servidor: {e}")
        return None

def run_tests():
    """Executa os testes."""
    print("\n" + "="*50)
    print("🧪 EXECUTANDO TESTES DA API")
    print("="*50)
    
    # Executa teste simples
    print("\n📋 Executando teste simples...")
    try:
        result = subprocess.run([sys.executable, "test_simple.py"], 
                              capture_output=True, text=True, timeout=60)
        print(result.stdout)
        if result.stderr:
            print("STDERR:", result.stderr)
        
        if result.returncode == 0:
            print("✅ Teste simples passou!")
        else:
            print("❌ Teste simples falhou!")
            
    except subprocess.TimeoutExpired:
        print("⏰ Teste simples expirou (timeout)")
    except Exception as e:
        print(f"❌ Erro ao executar teste simples: {e}")
    
    # Pergunta se quer executar teste completo
    print("\n" + "="*50)
    response = input("🤔 Executar teste completo? (y/N): ").strip().lower()
    
    if response in ['y', 'yes', 's', 'sim']:
        print("\n📋 Executando teste completo...")
        try:
            result = subprocess.run([sys.executable, "test_themes_api.py"], 
                                  capture_output=True, text=True, timeout=120)
            print(result.stdout)
            if result.stderr:
                print("STDERR:", result.stderr)
            
            if result.returncode == 0:
                print("✅ Teste completo passou!")
            else:
                print("❌ Teste completo falhou!")
                
        except subprocess.TimeoutExpired:
            print("⏰ Teste completo expirou (timeout)")
        except Exception as e:
            print(f"❌ Erro ao executar teste completo: {e}")

def main():
    """Função principal."""
    print("🎯 TESTADOR AUTOMÁTICO DA API DE TEMAS")
    print("="*50)
    
    # Verifica se os arquivos de teste existem
    if not os.path.exists("test_simple.py"):
        print("❌ Arquivo test_simple.py não encontrado!")
        return
    
    if not os.path.exists("test_themes_api.py"):
        print("❌ Arquivo test_themes_api.py não encontrado!")
        return
    
    server_process = None
    
    try:
        # Inicia o servidor se necessário
        server_process = start_server()
        
        if not check_server():
            print("❌ Não foi possível conectar ao servidor")
            return
        
        # Executa os testes
        run_tests()
        
    except KeyboardInterrupt:
        print("\n⏹️ Interrompido pelo usuário")
    
    finally:
        # Para o servidor se foi iniciado por este script
        if server_process:
            print("\n🛑 Parando servidor...")
            server_process.terminate()
            try:
                server_process.wait(timeout=5)
                print("✅ Servidor parado")
            except subprocess.TimeoutExpired:
                print("⚠️ Forçando parada do servidor...")
                server_process.kill()
    
    print("\n🏁 Testes finalizados!")

if __name__ == "__main__":
    main()
