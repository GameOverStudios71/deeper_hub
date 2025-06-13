#!/usr/bin/env python3
"""
Script de teste para a API de páginas do CMS.
Testa todos os endpoints do sistema de páginas.
"""

import requests
import json
import sys
from datetime import datetime

# Configuração da API
BASE_URL = "http://localhost:4000"
API_BASE = f"{BASE_URL}/api/cms/pages"

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

def test_list_pages():
    """Testa listagem de todas as páginas."""
    print_separator("TESTE: Listar todas as páginas")
    
    try:
        response = requests.get(f"{API_BASE}/")
        print_response(response, "Lista de páginas")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar páginas: {e}")
        return False

def test_list_active_pages():
    """Testa listagem de páginas ativas."""
    print_separator("TESTE: Listar páginas ativas")
    
    try:
        response = requests.get(f"{API_BASE}/active")
        print_response(response, "Páginas ativas")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar páginas ativas: {e}")
        return False

def test_get_home_page():
    """Testa busca da página inicial."""
    print_separator("TESTE: Buscar página inicial")
    
    try:
        response = requests.get(f"{API_BASE}/home")
        print_response(response, "Página inicial")
        # Pode retornar 404 se não houver página inicial configurada
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar página inicial: {e}")
        return False

def test_create_page():
    """Testa criação de uma nova página."""
    print_separator("TESTE: Criar nova página")
    
    page_data = {
        "name": "test_page",
        "uri": "/test-page",
        "title_system": "Página de Teste",
        "title": "Página de Teste",
        "description": "Uma página criada para testes da API",
        "meta_title": "Página de Teste - Meta Title",
        "meta_description": "Descrição meta da página de teste",
        "meta_keywords": "teste, api, cms",
        "page_type_id": 1,
        "layout_id": 1,
        "is_active": True,
        "is_home": False,
        "cache_lifetime": 3600,
        "custom_css": ".test-page { background: #f0f0f0; }",
        "custom_js": "console.log('Página de teste carregada');"
    }
    
    try:
        response = requests.post(
            f"{API_BASE}/",
            json=page_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Criação de página")
        
        if response.status_code == 201:
            # Extrair ID da página criada para testes posteriores
            data = response.json()
            if "data" in data and "id" in data["data"]:
                return data["data"]["id"]
        
        return None
    except Exception as e:
        print(f"Erro ao criar página: {e}")
        return None

def test_get_page(page_id):
    """Testa busca de página por ID."""
    print_separator(f"TESTE: Buscar página por ID ({page_id})")
    
    try:
        response = requests.get(f"{API_BASE}/{page_id}")
        print_response(response, f"Página ID {page_id}")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao buscar página {page_id}: {e}")
        return False

def test_get_page_by_uri():
    """Testa busca de página por URI."""
    print_separator("TESTE: Buscar página por URI")
    
    try:
        response = requests.get(f"{API_BASE}/uri/test-page")
        print_response(response, "Página por URI")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar página por URI: {e}")
        return False

def test_update_page(page_id):
    """Testa atualização de página."""
    print_separator(f"TESTE: Atualizar página ({page_id})")
    
    update_data = {
        "title": "Página de Teste - Atualizada",
        "description": "Descrição atualizada da página de teste",
        "meta_description": "Meta descrição atualizada",
        "cache_lifetime": 7200,
        "custom_css": ".test-page { background: #e0e0e0; color: #333; }"
    }
    
    try:
        response = requests.put(
            f"{API_BASE}/{page_id}",
            json=update_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Atualização de página")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao atualizar página {page_id}: {e}")
        return False

def test_delete_page(page_id):
    """Testa remoção de página."""
    print_separator(f"TESTE: Remover página ({page_id})")
    
    try:
        response = requests.delete(f"{API_BASE}/{page_id}")
        print_response(response, "Remoção de página")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao remover página {page_id}: {e}")
        return False

def test_invalid_endpoints():
    """Testa endpoints inválidos."""
    print_separator("TESTE: Endpoints inválidos")
    
    tests = [
        ("GET página inexistente", f"{API_BASE}/99999"),
        ("GET URI inexistente", f"{API_BASE}/uri/pagina-inexistente"),
        ("POST dados inválidos", f"{API_BASE}/", {"invalid": "data"}),
        ("PUT página inexistente", f"{API_BASE}/99999", {"title": "Test"}),
        ("DELETE página inexistente", f"{API_BASE}/99999", None)
    ]
    
    results = []
    for test_name, url, data in tests:
        try:
            if "POST" in test_name:
                response = requests.post(url, json=data, headers={"Content-Type": "application/json"})
            elif "PUT" in test_name:
                response = requests.put(url, json=data, headers={"Content-Type": "application/json"})
            elif "DELETE" in test_name:
                response = requests.delete(url)
            else:
                response = requests.get(url)
            
            print(f"\n{test_name}: Status {response.status_code}")
            results.append(response.status_code in [400, 404, 422])
        except Exception as e:
            print(f"Erro em {test_name}: {e}")
            results.append(False)
    
    return all(results)

def main():
    """Executa todos os testes."""
    print_separator("INICIANDO TESTES DA API DE PÁGINAS")
    print(f"URL Base: {API_BASE}")
    print(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    results = []
    created_page_id = None
    
    # Testes de leitura
    results.append(("Listar páginas", test_list_pages()))
    results.append(("Listar páginas ativas", test_list_active_pages()))
    results.append(("Buscar página inicial", test_get_home_page()))
    
    # Teste de criação
    created_page_id = test_create_page()
    results.append(("Criar página", created_page_id is not None))
    
    # Testes com página criada
    if created_page_id:
        results.append(("Buscar página por ID", test_get_page(created_page_id)))
        results.append(("Buscar página por URI", test_get_page_by_uri()))
        results.append(("Atualizar página", test_update_page(created_page_id)))
        results.append(("Remover página", test_delete_page(created_page_id)))
    
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
        print("\n🎉 Todos os testes passaram! A API de páginas está funcionando corretamente.")
        sys.exit(0)
    else:
        print(f"\n⚠️  {total-passed} teste(s) falharam. Verifique os logs acima.")
        sys.exit(1)

if __name__ == "__main__":
    main()
