#!/usr/bin/env python3
"""
Script de teste para a API de menus do CMS.
Testa todos os endpoints do sistema de menus.
"""

import requests
import json
import sys
from datetime import datetime

# Configuração da API
BASE_URL = "http://localhost:4000"
API_BASE = f"{BASE_URL}/api/cms/menus"

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

def test_list_menu_sets():
    """Testa listagem de todos os conjuntos de menu."""
    print_separator("TESTE: Listar todos os conjuntos de menu")
    
    try:
        response = requests.get(f"{API_BASE}/")
        print_response(response, "Lista de conjuntos de menu")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar conjuntos: {e}")
        return False

def test_list_active_menu_sets():
    """Testa listagem de conjuntos ativos."""
    print_separator("TESTE: Listar conjuntos ativos")
    
    try:
        response = requests.get(f"{API_BASE}/active")
        print_response(response, "Conjuntos ativos")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar conjuntos ativos: {e}")
        return False

def test_list_menu_templates():
    """Testa listagem de templates de menu."""
    print_separator("TESTE: Listar templates de menu")
    
    try:
        response = requests.get(f"{API_BASE}/templates")
        print_response(response, "Templates de menu")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar templates: {e}")
        return False

def test_create_menu_set():
    """Testa criação de um novo conjunto de menu."""
    print_separator("TESTE: Criar novo conjunto de menu")
    
    menu_data = {
        "name": "test_main_menu",
        "title": "Menu Principal de Teste",
        "description": "Um menu principal criado para testes da API",
        "template_id": 1,
        "css_class": "navbar navbar-expand-lg",
        "custom_css": ".test-menu { background: #f8f9fa; }",
        "max_depth": 3,
        "show_icons": True,
        "show_badges": True,
        "responsive": True,
        "visible_for_levels": 0,
        "is_active": True
    }
    
    try:
        response = requests.post(
            f"{API_BASE}/",
            json=menu_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Criação de conjunto")
        
        if response.status_code == 201:
            # Extrair ID do conjunto criado para testes posteriores
            data = response.json()
            if "data" in data and "id" in data["data"]:
                return data["data"]["id"]
        
        return None
    except Exception as e:
        print(f"Erro ao criar conjunto: {e}")
        return None

def test_get_menu_set(menu_set_id):
    """Testa busca de conjunto por ID."""
    print_separator(f"TESTE: Buscar conjunto por ID ({menu_set_id})")
    
    try:
        response = requests.get(f"{API_BASE}/{menu_set_id}")
        print_response(response, f"Conjunto ID {menu_set_id}")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao buscar conjunto {menu_set_id}: {e}")
        return False

def test_get_menu_set_by_name():
    """Testa busca de conjunto por nome."""
    print_separator("TESTE: Buscar conjunto por nome")
    
    try:
        response = requests.get(f"{API_BASE}/name/test_main_menu")
        print_response(response, "Conjunto por nome")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar conjunto por nome: {e}")
        return False

def test_list_menu_items(menu_set_id):
    """Testa listagem de itens de um conjunto."""
    print_separator(f"TESTE: Listar itens do conjunto ({menu_set_id})")
    
    try:
        response = requests.get(f"{API_BASE}/{menu_set_id}/items")
        print_response(response, "Itens do conjunto")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar itens: {e}")
        return False

def test_update_menu_set(menu_set_id):
    """Testa atualização de conjunto."""
    print_separator(f"TESTE: Atualizar conjunto ({menu_set_id})")
    
    update_data = {
        "title": "Menu Principal de Teste - Atualizado",
        "description": "Descrição atualizada do menu principal",
        "max_depth": 4,
        "show_badges": False,
        "css_class": "navbar navbar-expand-lg navbar-dark",
        "custom_css": ".test-menu { background: #343a40; color: white; }"
    }
    
    try:
        response = requests.put(
            f"{API_BASE}/{menu_set_id}",
            json=update_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Atualização de conjunto")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao atualizar conjunto {menu_set_id}: {e}")
        return False

def test_delete_menu_set(menu_set_id):
    """Testa remoção de conjunto."""
    print_separator(f"TESTE: Remover conjunto ({menu_set_id})")
    
    try:
        response = requests.delete(f"{API_BASE}/{menu_set_id}")
        print_response(response, "Remoção de conjunto")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao remover conjunto {menu_set_id}: {e}")
        return False

def test_invalid_endpoints():
    """Testa endpoints inválidos."""
    print_separator("TESTE: Endpoints inválidos")
    
    tests = [
        ("GET conjunto inexistente", f"{API_BASE}/99999"),
        ("GET nome inexistente", f"{API_BASE}/name/menu-inexistente"),
        ("GET itens de conjunto inexistente", f"{API_BASE}/99999/items"),
        ("POST dados inválidos", f"{API_BASE}/", {"invalid": "data"}),
        ("PUT conjunto inexistente", f"{API_BASE}/99999", {"title": "Test"}),
        ("DELETE conjunto inexistente", f"{API_BASE}/99999", None)
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
    print_separator("INICIANDO TESTES DA API DE MENUS")
    print(f"URL Base: {API_BASE}")
    print(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    results = []
    created_menu_set_id = None
    
    # Testes de leitura
    results.append(("Listar conjuntos", test_list_menu_sets()))
    results.append(("Listar conjuntos ativos", test_list_active_menu_sets()))
    results.append(("Listar templates", test_list_menu_templates()))
    
    # Teste de criação
    created_menu_set_id = test_create_menu_set()
    results.append(("Criar conjunto", created_menu_set_id is not None))
    
    # Testes com conjunto criado
    if created_menu_set_id:
        results.append(("Buscar conjunto por ID", test_get_menu_set(created_menu_set_id)))
        results.append(("Buscar conjunto por nome", test_get_menu_set_by_name()))
        results.append(("Listar itens do conjunto", test_list_menu_items(created_menu_set_id)))
        results.append(("Atualizar conjunto", test_update_menu_set(created_menu_set_id)))
        results.append(("Remover conjunto", test_delete_menu_set(created_menu_set_id)))
    
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
        print("\n🎉 Todos os testes passaram! A API de menus está funcionando corretamente.")
        sys.exit(0)
    else:
        print(f"\n⚠️  {total-passed} teste(s) falharam. Verifique os logs acima.")
        sys.exit(1)

if __name__ == "__main__":
    main()
