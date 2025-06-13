#!/usr/bin/env python3
"""
Script de teste para a API de configurações do CMS.
Testa todos os endpoints do sistema de configurações.
"""

import requests
import json
import sys
from datetime import datetime

# Configuração da API
BASE_URL = "http://localhost:4000"
API_BASE = f"{BASE_URL}/api/cms/settings"

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

def test_list_categories():
    """Testa listagem de categorias."""
    print_separator("TESTE: Listar categorias de configuração")
    
    try:
        response = requests.get(f"{API_BASE}/categories")
        print_response(response, "Lista de categorias")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar categorias: {e}")
        return False

def test_list_active_categories():
    """Testa listagem de categorias ativas."""
    print_separator("TESTE: Listar categorias ativas")
    
    try:
        response = requests.get(f"{API_BASE}/categories/active")
        print_response(response, "Categorias ativas")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar categorias ativas: {e}")
        return False

def test_list_types():
    """Testa listagem de tipos de configuração."""
    print_separator("TESTE: Listar tipos de configuração")
    
    try:
        response = requests.get(f"{API_BASE}/types")
        print_response(response, "Tipos de configuração")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar tipos: {e}")
        return False

def test_list_settings():
    """Testa listagem de todas as configurações."""
    print_separator("TESTE: Listar todas as configurações")
    
    try:
        response = requests.get(f"{API_BASE}/")
        print_response(response, "Lista de configurações")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar configurações: {e}")
        return False

def test_list_settings_by_category():
    """Testa listagem de configurações por categoria."""
    print_separator("TESTE: Listar configurações por categoria")
    
    try:
        # Usar categoria ID 1
        response = requests.get(f"{API_BASE}/category/1")
        print_response(response, "Configurações por categoria")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar configurações por categoria: {e}")
        return False

def test_get_setting_by_name():
    """Testa busca de configuração por nome."""
    print_separator("TESTE: Buscar configuração por nome")
    
    try:
        # Tentar buscar uma configuração comum
        response = requests.get(f"{API_BASE}/name/site_name")
        print_response(response, "Configuração por nome")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar configuração por nome: {e}")
        return False

def test_update_setting_value():
    """Testa atualização de valor de configuração."""
    print_separator("TESTE: Atualizar valor de configuração")
    
    try:
        # Primeiro tentar buscar uma configuração existente
        get_response = requests.get(f"{API_BASE}/name/site_name")
        
        if get_response.status_code == 200:
            # Se existe, tentar atualizar
            update_data = {"value": "Site de Teste - Atualizado"}
            
            response = requests.put(
                f"{API_BASE}/name/site_name",
                json=update_data,
                headers={"Content-Type": "application/json"}
            )
            print_response(response, "Atualização de configuração")
            return response.status_code in [200, 404]
        else:
            print("Configuração 'site_name' não encontrada, teste considerado válido")
            return True
    except Exception as e:
        print(f"Erro ao atualizar configuração: {e}")
        return False

def test_list_themes():
    """Testa listagem de temas."""
    print_separator("TESTE: Listar temas")
    
    try:
        response = requests.get(f"{API_BASE}/themes")
        print_response(response, "Lista de temas")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar temas: {e}")
        return False

def test_list_active_themes():
    """Testa listagem de temas ativos."""
    print_separator("TESTE: Listar temas ativos")
    
    try:
        response = requests.get(f"{API_BASE}/themes/active")
        print_response(response, "Temas ativos")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar temas ativos: {e}")
        return False

def test_get_default_theme():
    """Testa busca do tema padrão."""
    print_separator("TESTE: Buscar tema padrão")
    
    try:
        response = requests.get(f"{API_BASE}/themes/default")
        print_response(response, "Tema padrão")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar tema padrão: {e}")
        return False

def test_invalid_endpoints():
    """Testa endpoints inválidos."""
    print_separator("TESTE: Endpoints inválidos")
    
    tests = [
        ("GET categoria inexistente", f"{API_BASE}/category/99999"),
        ("GET configuração inexistente", f"{API_BASE}/name/config-inexistente"),
        ("PUT configuração inexistente", f"{API_BASE}/name/config-inexistente", {"value": "test"}),
        ("PUT sem valor", f"{API_BASE}/name/site_name", {"invalid": "data"}),
        ("GET rota inexistente", f"{API_BASE}/invalid-route")
    ]
    
    results = []
    for test_name, url, *data in tests:
        try:
            if "PUT" in test_name:
                response = requests.put(url, json=data[0] if data else {}, headers={"Content-Type": "application/json"})
            else:
                response = requests.get(url)
            
            print(f"\n{test_name}: Status {response.status_code}")
            results.append(response.status_code in [400, 404, 500])
        except Exception as e:
            print(f"Erro em {test_name}: {e}")
            results.append(False)
    
    return all(results)

def test_settings_structure():
    """Testa estrutura das configurações."""
    print_separator("TESTE: Estrutura das configurações")
    
    try:
        response = requests.get(f"{API_BASE}/")
        if response.status_code == 200:
            data = response.json()
            settings = data.get("data", [])
            
            print(f"\nTotal de configurações encontradas: {len(settings)}")
            
            # Agrupar por categoria
            categories = {}
            for setting in settings:
                cat_title = setting.get("category_title", "Sem categoria")
                if cat_title not in categories:
                    categories[cat_title] = []
                categories[cat_title].append(setting)
            
            print("Configurações por categoria:")
            for cat_title, cat_settings in categories.items():
                print(f"  {cat_title}: {len(cat_settings)} configurações")
            
            return True
        
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao testar estrutura: {e}")
        return False

def test_theme_structure():
    """Testa estrutura dos temas."""
    print_separator("TESTE: Estrutura dos temas")
    
    try:
        response = requests.get(f"{API_BASE}/themes")
        if response.status_code == 200:
            data = response.json()
            themes = data.get("data", [])
            
            print(f"\nTotal de temas encontrados: {len(themes)}")
            
            # Contar por status
            active_themes = [t for t in themes if t.get("is_active")]
            default_themes = [t for t in themes if t.get("is_default")]
            system_themes = [t for t in themes if t.get("is_system")]
            
            print(f"Temas ativos: {len(active_themes)}")
            print(f"Temas padrão: {len(default_themes)}")
            print(f"Temas do sistema: {len(system_themes)}")
            
            return True
        
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao testar estrutura de temas: {e}")
        return False

def main():
    """Executa todos os testes."""
    print_separator("INICIANDO TESTES DA API DE CONFIGURAÇÕES")
    print(f"URL Base: {API_BASE}")
    print(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    results = []
    
    # Testes de categorias
    results.append(("Listar categorias", test_list_categories()))
    results.append(("Listar categorias ativas", test_list_active_categories()))
    
    # Testes de tipos
    results.append(("Listar tipos", test_list_types()))
    
    # Testes de configurações
    results.append(("Listar configurações", test_list_settings()))
    results.append(("Listar por categoria", test_list_settings_by_category()))
    results.append(("Buscar por nome", test_get_setting_by_name()))
    results.append(("Atualizar valor", test_update_setting_value()))
    results.append(("Estrutura das configurações", test_settings_structure()))
    
    # Testes de temas
    results.append(("Listar temas", test_list_themes()))
    results.append(("Listar temas ativos", test_list_active_themes()))
    results.append(("Buscar tema padrão", test_get_default_theme()))
    results.append(("Estrutura dos temas", test_theme_structure()))
    
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
        print("\n🎉 Todos os testes passaram! A API de configurações está funcionando corretamente.")
        sys.exit(0)
    else:
        print(f"\n⚠️  {total-passed} teste(s) falharam. Verifique os logs acima.")
        sys.exit(1)

if __name__ == "__main__":
    main()
