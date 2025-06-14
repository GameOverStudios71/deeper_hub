#!/usr/bin/env python3
"""
Script simples para testar se o backend DeeperHub está funcionando.
"""

import requests
import json
import sys

def test_backend():
    base_url = "http://localhost:4000"
    
    print("🧪 Testando Backend DeeperHub...")
    print("=" * 50)
    
    # Test 1: Verificar se o servidor está rodando
    print("1. Testando conexão com o servidor...")
    try:
        response = requests.get(f"{base_url}/", timeout=5)
        if response.status_code == 200:
            data = response.json()
            if data.get('status') == 'ok':
                print("✅ Servidor está rodando")
            else:
                print(f"⚠️ Servidor respondeu mas status não é 'ok': {data}")
        else:
            print(f"❌ Servidor respondeu com status {response.status_code}")
            return False
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro de conexão: {e}")
        print("💡 Certifique-se de que o backend está rodando com: mix run --no-halt")
        return False
    
    # Test 2: Verificar rota de autenticação
    print("\n2. Testando rota de autenticação...")
    try:
        # Primeiro, testar OPTIONS (CORS preflight)
        options_response = requests.options(f"{base_url}/api/cms/auth/login", timeout=5)
        print(f"   OPTIONS /api/cms/auth/login: {options_response.status_code}")
        
        # Depois, testar POST
        login_data = {
            "email": "admin@example.com",
            "password": "password123"
        }
        
        headers = {
            "Content-Type": "application/json",
            "Accept": "application/json"
        }
        
        response = requests.post(
            f"{base_url}/api/cms/auth/login", 
            json=login_data,
            headers=headers,
            timeout=5
        )
        
        print(f"   POST /api/cms/auth/login: {response.status_code}")
        
        if response.status_code == 200:
            data = response.json()
            if data.get('status') == 'success':
                print("✅ Autenticação funcionando")
                token = data.get('data', {}).get('token')
                if token:
                    print(f"   Token recebido: {token[:20]}...")
                    return True
                else:
                    print("⚠️ Token não encontrado na resposta")
            else:
                print(f"⚠️ Resposta de autenticação: {data}")
        else:
            print(f"❌ Erro na autenticação: {response.status_code}")
            try:
                error_data = response.json()
                print(f"   Erro: {error_data}")
            except:
                print(f"   Resposta: {response.text}")
            
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro na requisição de autenticação: {e}")
        return False
    
    return False

def test_database():
    """Testa se o banco de dados tem o usuário admin"""
    print("\n3. Verificando banco de dados...")
    
    import sqlite3
    import os
    
    db_path = "databases/deeper_hub_dev.db"
    
    if not os.path.exists(db_path):
        print(f"❌ Banco de dados não encontrado: {db_path}")
        print("💡 Execute: mix run para criar o banco e executar seeds")
        return False
    
    try:
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        
        # Verificar se a tabela users existe
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='users'")
        if not cursor.fetchone():
            print("❌ Tabela 'users' não encontrada")
            return False
        
        # Verificar se o usuário admin existe
        cursor.execute("SELECT id, username, email, is_admin, is_active FROM users WHERE email = ?", ("admin@example.com",))
        user = cursor.fetchone()
        
        if user:
            print(f"✅ Usuário admin encontrado: ID={user[0]}, Username={user[1]}, Email={user[2]}, Admin={user[3]}, Ativo={user[4]}")
            return True
        else:
            print("❌ Usuário admin não encontrado")
            print("💡 Execute o seed: mix run -e \"DeeperHub.Core.Data.SeedRegistry.run_seed(:cms_initial_data)\"")
            return False
            
    except Exception as e:
        print(f"❌ Erro ao acessar banco de dados: {e}")
        return False
    finally:
        if 'conn' in locals():
            conn.close()

def main():
    print("🚀 Diagnóstico do Backend DeeperHub")
    print("=" * 50)
    
    # Verificar banco de dados primeiro
    db_ok = test_database()
    
    # Testar backend
    backend_ok = test_backend()
    
    print("\n" + "=" * 50)
    print("📊 Resultado do Diagnóstico:")
    print(f"   Banco de dados: {'✅ OK' if db_ok else '❌ ERRO'}")
    print(f"   Backend API:    {'✅ OK' if backend_ok else '❌ ERRO'}")
    
    if db_ok and backend_ok:
        print("\n🎉 Backend está funcionando corretamente!")
        print("🚀 Você pode usar o cliente em: http://localhost:8080")
        print("🔐 Login: admin@example.com / password123")
        return True
    else:
        print("\n❌ Problemas encontrados no backend")
        print("\n🔧 Passos para corrigir:")
        
        if not db_ok:
            print("1. Executar migrações e seeds:")
            print("   mix deps.get")
            print("   mix run")
        
        if not backend_ok:
            print("2. Iniciar o servidor:")
            print("   mix run --no-halt")
            print("3. Verificar logs de erro no terminal")
        
        return False

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
