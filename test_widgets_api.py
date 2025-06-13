#!/usr/bin/env python3
"""
Script de teste para a API de widgets do CMS.
Testa todos os endpoints do sistema de widgets.
"""

import requests
import json
import sys
from datetime import datetime

# Configuração da API
BASE_URL = "http://localhost:4000"
API_BASE = f"{BASE_URL}/api/cms/widgets"

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

def test_list_widgets():
    """Testa listagem de todos os widgets."""
    print_separator("TESTE: Listar todos os widgets")
    
    try:
        response = requests.get(f"{API_BASE}/")
        print_response(response, "Lista de widgets")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar widgets: {e}")
        return False

def test_list_active_widgets():
    """Testa listagem de widgets ativos."""
    print_separator("TESTE: Listar widgets ativos")
    
    try:
        response = requests.get(f"{API_BASE}/active")
        print_response(response, "Widgets ativos")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar widgets ativos: {e}")
        return False

def test_list_featured_widgets():
    """Testa listagem de widgets em destaque."""
    print_separator("TESTE: Listar widgets em destaque")
    
    try:
        response = requests.get(f"{API_BASE}/featured")
        print_response(response, "Widgets em destaque")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar widgets em destaque: {e}")
        return False

def test_list_widget_types():
    """Testa listagem de tipos de widget."""
    print_separator("TESTE: Listar tipos de widget")
    
    try:
        response = requests.get(f"{API_BASE}/types")
        print_response(response, "Tipos de widget")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar tipos de widget: {e}")
        return False

def test_list_widgets_by_type():
    """Testa listagem de widgets por tipo."""
    print_separator("TESTE: Listar widgets por tipo")
    
    try:
        # Usar tipo 1 (HTML) que deve existir
        response = requests.get(f"{API_BASE}/by-type/1")
        print_response(response, "Widgets do tipo HTML")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar widgets por tipo: {e}")
        return False

def test_create_widget():
    """Testa criação de um novo widget."""
    print_separator("TESTE: Criar novo widget")
    
    widget_data = {
        "name": "test_html_widget",
        "title": "Widget HTML de Teste",
        "description": "Um widget HTML criado para testes da API",
        "widget_type_id": 1,  # Tipo HTML
        "module": "cms",
        "content": "<h3>Conteúdo de Teste</h3><p>Este é um widget de teste criado via API.</p>",
        "content_type": "html",
        "css_class": "test-widget",
        "custom_css": ".test-widget { border: 2px solid #007bff; padding: 15px; }",
        "is_active": True,
        "is_featured": False,
        "refresh_interval": 0,
        "config_data": json.dumps({
            "show_border": True,
            "background_color": "#f8f9fa",
            "text_color": "#333"
        })
    }
    
    try:
        response = requests.post(
            f"{API_BASE}/",
            json=widget_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Criação de widget")
        
        if response.status_code == 201:
            # Extrair ID do widget criado para testes posteriores
            data = response.json()
            if "data" in data and "id" in data["data"]:
                return data["data"]["id"]
        
        return None
    except Exception as e:
        print(f"Erro ao criar widget: {e}")
        return None

def test_get_widget(widget_id):
    """Testa busca de widget por ID."""
    print_separator(f"TESTE: Buscar widget por ID ({widget_id})")
    
    try:
        response = requests.get(f"{API_BASE}/{widget_id}")
        print_response(response, f"Widget ID {widget_id}")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao buscar widget {widget_id}: {e}")
        return False

def test_update_widget(widget_id):
    """Testa atualização de widget."""
    print_separator(f"TESTE: Atualizar widget ({widget_id})")
    
    update_data = {
        "title": "Widget HTML de Teste - Atualizado",
        "description": "Descrição atualizada do widget de teste",
        "content": "<h3>Conteúdo Atualizado</h3><p>Este widget foi atualizado via API.</p>",
        "is_featured": True,
        "custom_css": ".test-widget { border: 2px solid #28a745; padding: 20px; background: #f0f8f0; }",
        "config_data": json.dumps({
            "show_border": True,
            "background_color": "#f0f8f0",
            "text_color": "#155724",
            "updated": True
        })
    }
    
    try:
        response = requests.put(
            f"{API_BASE}/{widget_id}",
            json=update_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Atualização de widget")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao atualizar widget {widget_id}: {e}")
        return False

def test_delete_widget(widget_id):
    """Testa remoção de widget."""
    print_separator(f"TESTE: Remover widget ({widget_id})")
    
    try:
        response = requests.delete(f"{API_BASE}/{widget_id}")
        print_response(response, "Remoção de widget")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao remover widget {widget_id}: {e}")
        return False

def test_invalid_endpoints():
    """Testa endpoints inválidos."""
    print_separator("TESTE: Endpoints inválidos")
    
    tests = [
        ("GET widget inexistente", f"{API_BASE}/99999"),
        ("GET tipo inexistente", f"{API_BASE}/by-type/99999"),
        ("POST dados inválidos", f"{API_BASE}/", {"invalid": "data"}),
        ("PUT widget inexistente", f"{API_BASE}/99999", {"title": "Test"}),
        ("DELETE widget inexistente", f"{API_BASE}/99999", None)
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
    print_separator("INICIANDO TESTES DA API DE WIDGETS")
    print(f"URL Base: {API_BASE}")
    print(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    results = []
    created_widget_id = None
    
    # Testes de leitura
    results.append(("Listar widgets", test_list_widgets()))
    results.append(("Listar widgets ativos", test_list_active_widgets()))
    results.append(("Listar widgets em destaque", test_list_featured_widgets()))
    results.append(("Listar tipos de widget", test_list_widget_types()))
    results.append(("Listar widgets por tipo", test_list_widgets_by_type()))
    
    # Teste de criação
    created_widget_id = test_create_widget()
    results.append(("Criar widget", created_widget_id is not None))
    
    # Testes com widget criado
    if created_widget_id:
        results.append(("Buscar widget por ID", test_get_widget(created_widget_id)))
        results.append(("Atualizar widget", test_update_widget(created_widget_id)))
        results.append(("Remover widget", test_delete_widget(created_widget_id)))
    
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
        print("\n🎉 Todos os testes passaram! A API de widgets está funcionando corretamente.")
        sys.exit(0)
    else:
        print(f"\n⚠️  {total-passed} teste(s) falharam. Verifique os logs acima.")
        sys.exit(1)

if __name__ == "__main__":
    main()
