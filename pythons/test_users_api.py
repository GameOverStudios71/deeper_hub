#!/usr/bin/env python3
"""
Script de teste para a API de usuários do CMS.
Testa todos os endpoints do sistema de usuários e permissões.
"""

import requests
import json
import sys
from datetime import datetime
import hashlib

# Configuração da API
BASE_URL = "http://localhost:4000"
API_BASE = f"{BASE_URL}/api/cms/users"

def print_separator(title):
    """Imprime um separador visual com título."""
    print("\n" + "="*60)
    print(f" {title}")
    print("="*60)

def print_response(response, title="Response"):
    """Imprime a resposta da API de forma formatada."""
    print(f"\n{title}:")
    print(f"Status Code: {response.status_code}")
    try:
        data = response.json()
        print(f"Response: {json.dumps(data, indent=2, ensure_ascii=False)}")
    except:
        print(f"Response Text: {response.text}")

def test_list_users():
    """Testa listagem de todos os usuários."""
    print_separator("TESTE: Listar todos os usuários")
    
    try:
        response = requests.get(f"{API_BASE}/")
        print_response(response, "Lista de usuários")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar usuários: {e}")
        return False

def test_list_active_users():
    """Testa listagem de usuários ativos."""
    print_separator("TESTE: Listar usuários ativos")
    
    try:
        response = requests.get(f"{API_BASE}/active")
        print_response(response, "Usuários ativos")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar usuários ativos: {e}")
        return False

def test_list_admin_users():
    """Testa listagem de usuários administradores."""
    print_separator("TESTE: Listar usuários administradores")
    
    try:
        response = requests.get(f"{API_BASE}/admins")
        print_response(response, "Usuários administradores")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar administradores: {e}")
        return False

def test_list_permissions():
    """Testa listagem de todas as permissões."""
    print_separator("TESTE: Listar todas as permissões")
    
    try:
        response = requests.get(f"{API_BASE}/permissions")
        print_response(response, "Lista de permissões")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar permissões: {e}")
        return False

def test_create_user():
    """Testa criação de um novo usuário."""
    print_separator("TESTE: Criar novo usuário")
    
    # Gerar hash de senha simples para teste
    password = "senha123"
    password_hash = hashlib.sha256(password.encode()).hexdigest()
    
    user_data = {
        "username": "usuario_teste",
        "email": "teste@exemplo.com",
        "password_hash": password_hash,
        "full_name": "Usuário de Teste",
        "is_active": True,
        "is_admin": False
    }
    
    try:
        response = requests.post(
            f"{API_BASE}/",
            json=user_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Criação de usuário")
        
        if response.status_code == 201:
            # Extrair ID do usuário criado para testes posteriores
            data = response.json()
            if "data" in data and "id" in data["data"]:
                return data["data"]["id"]
        
        return None
    except Exception as e:
        print(f"Erro ao criar usuário: {e}")
        return None

def test_get_user(user_id):
    """Testa busca de usuário por ID."""
    print_separator(f"TESTE: Buscar usuário por ID ({user_id})")
    
    try:
        response = requests.get(f"{API_BASE}/{user_id}")
        print_response(response, f"Usuário ID {user_id}")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao buscar usuário {user_id}: {e}")
        return False

def test_get_user_by_email():
    """Testa busca de usuário por email."""
    print_separator("TESTE: Buscar usuário por email")
    
    try:
        response = requests.get(f"{API_BASE}/email/teste@exemplo.com")
        print_response(response, "Usuário por email")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar usuário por email: {e}")
        return False

def test_get_user_by_username():
    """Testa busca de usuário por username."""
    print_separator("TESTE: Buscar usuário por username")
    
    try:
        response = requests.get(f"{API_BASE}/username/usuario_teste")
        print_response(response, "Usuário por username")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar usuário por username: {e}")
        return False

def test_get_user_permissions(user_id):
    """Testa listagem de permissões de um usuário."""
    print_separator(f"TESTE: Listar permissões do usuário ({user_id})")
    
    try:
        response = requests.get(f"{API_BASE}/{user_id}/permissions")
        print_response(response, "Permissões do usuário")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar permissões do usuário: {e}")
        return False

def test_invalid_endpoints():
    """Testa endpoints inválidos."""
    print_separator("TESTE: Endpoints inválidos")
    
    tests = [
        ("GET usuário inexistente", f"{API_BASE}/99999"),
        ("GET email inexistente", f"{API_BASE}/email/inexistente@exemplo.com"),
        ("GET username inexistente", f"{API_BASE}/username/usuario-inexistente"),
        ("GET permissões de usuário inexistente", f"{API_BASE}/99999/permissions"),
        ("POST dados inválidos", f"{API_BASE}/", {"invalid": "data"}),
        ("GET rota inexistente", f"{API_BASE}/invalid-route")
    ]
    
    results = []
    for test_name, url, *data in tests:
        try:
            if "POST" in test_name:
                response = requests.post(url, json=data[0] if data else {}, headers={"Content-Type": "application/json"})
            else:
                response = requests.get(url)
            
            print(f"\n{test_name}: Status {response.status_code}")
            results.append(response.status_code in [400, 404, 500])
        except Exception as e:
            print(f"Erro em {test_name}: {e}")
            results.append(False)
    
    return all(results)

def test_user_structure():
    """Testa estrutura dos usuários."""
    print_separator("TESTE: Estrutura dos usuários")
    
    try:
        response = requests.get(f"{API_BASE}/")
        if response.status_code == 200:
            data = response.json()
            users = data.get("data", [])
            
            print(f"\nTotal de usuários encontrados: {len(users)}")
            
            # Contar por status
            active_users = [u for u in users if u.get("is_active")]
            admin_users = [u for u in users if u.get("is_admin")]
            users_with_login = [u for u in users if u.get("last_login")]
            
            print(f"Usuários ativos: {len(active_users)}")
            print(f"Usuários administradores: {len(admin_users)}")
            print(f"Usuários que já fizeram login: {len(users_with_login)}")
            
            # Verificar se password_hash não está sendo retornado
            users_with_password = [u for u in users if "password_hash" in u]
            print(f"Usuários com password_hash exposto: {len(users_with_password)}")
            
            if len(users_with_password) > 0:
                print("⚠️  AVISO: Password hash está sendo exposto na API!")
                return False
            
            return True
        
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao testar estrutura: {e}")
        return False

def test_permissions_structure():
    """Testa estrutura das permissões."""
    print_separator("TESTE: Estrutura das permissões")
    
    try:
        response = requests.get(f"{API_BASE}/permissions")
        if response.status_code == 200:
            data = response.json()
            permissions = data.get("data", [])
            
            print(f"\nTotal de permissões encontradas: {len(permissions)}")
            
            # Agrupar por tipo
            permission_types = {}
            for perm in permissions:
                ptype = perm.get("permission_type", "unknown")
                permission_types[ptype] = permission_types.get(ptype, 0) + 1
            
            print("Permissões por tipo:")
            for ptype, count in permission_types.items():
                print(f"  {ptype}: {count}")
            
            # Contar globais vs específicas
            global_perms = [p for p in permissions if p.get("entity_id") is None]
            specific_perms = [p for p in permissions if p.get("entity_id") is not None]
            
            print(f"Permissões globais: {len(global_perms)}")
            print(f"Permissões específicas: {len(specific_perms)}")
            
            return True
        
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao testar estrutura de permissões: {e}")
        return False

def test_security_features():
    """Testa recursos de segurança."""
    print_separator("TESTE: Recursos de segurança")
    
    try:
        # Testar se dados sensíveis não são expostos
        response = requests.get(f"{API_BASE}/")
        if response.status_code == 200:
            data = response.json()
            users = data.get("data", [])
            
            security_issues = []
            
            for user in users:
                if "password_hash" in user:
                    security_issues.append("Password hash exposto")
                
                # Verificar se email está sendo sanitizado adequadamente
                if user.get("email") and "@" not in user.get("email", ""):
                    security_issues.append("Email com formato inválido")
            
            if security_issues:
                print("Problemas de segurança encontrados:")
                for issue in security_issues:
                    print(f"  - {issue}")
                return False
            else:
                print("✅ Nenhum problema de segurança encontrado")
                return True
        
        return True
    except Exception as e:
        print(f"Erro ao testar segurança: {e}")
        return False

def main():
    """Executa todos os testes."""
    print_separator("INICIANDO TESTES DA API DE USUÁRIOS")
    print(f"URL Base: {API_BASE}")
    print(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    results = []
    created_user_id = None
    
    # Testes de leitura
    results.append(("Listar usuários", test_list_users()))
    results.append(("Listar usuários ativos", test_list_active_users()))
    results.append(("Listar administradores", test_list_admin_users()))
    results.append(("Listar permissões", test_list_permissions()))
    
    # Teste de criação
    created_user_id = test_create_user()
    results.append(("Criar usuário", created_user_id is not None))
    
    # Testes com usuário criado
    if created_user_id:
        results.append(("Buscar usuário por ID", test_get_user(created_user_id)))
        results.append(("Buscar usuário por email", test_get_user_by_email()))
        results.append(("Buscar usuário por username", test_get_user_by_username()))
        results.append(("Listar permissões do usuário", test_get_user_permissions(created_user_id)))
    
    # Testes de estrutura e segurança
    results.append(("Estrutura dos usuários", test_user_structure()))
    results.append(("Estrutura das permissões", test_permissions_structure()))
    results.append(("Recursos de segurança", test_security_features()))
    
    # Testes de casos inválidos
    results.append(("Endpoints inválidos", test_invalid_endpoints()))
    
    # Resumo dos resultados
    print_separator("RESUMO DOS TESTES")
    passed = 0
    total = len(results)
    
    for test_name, result in results:
        status = "✅ PASSOU" if result else "❌ FALHOU"
        print(f"{test_name}: {status}")
        if result:
            passed += 1
    
    print(f"\nResultado final: {passed}/{total} testes passaram")
    print(f"Taxa de sucesso: {(passed/total)*100:.1f}%")
    
    if passed == total:
        print("\n🎉 Todos os testes passaram! A API de usuários está funcionando corretamente.")
        sys.exit(0)
    else:
        print(f"\n⚠️  {total-passed} teste(s) falharam. Verifique os logs acima.")
        sys.exit(1)

if __name__ == "__main__":
    main()
