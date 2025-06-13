#!/usr/bin/env python3
"""
Script de teste para a API de formulários do CMS.
Testa todos os endpoints do sistema de formulários.
"""

import requests
import json
import sys
from datetime import datetime

# Configuração da API
BASE_URL = "http://localhost:4000"
API_BASE = f"{BASE_URL}/api/cms/forms"

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

def test_list_forms():
    """Testa listagem de todos os formulários."""
    print_separator("TESTE: Listar todos os formulários")
    
    try:
        response = requests.get(f"{API_BASE}/")
        print_response(response, "Lista de formulários")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar formulários: {e}")
        return False

def test_list_active_forms():
    """Testa listagem de formulários ativos."""
    print_separator("TESTE: Listar formulários ativos")
    
    try:
        response = requests.get(f"{API_BASE}/active")
        print_response(response, "Formulários ativos")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar formulários ativos: {e}")
        return False

def test_list_field_types():
    """Testa listagem de tipos de campo."""
    print_separator("TESTE: Listar tipos de campo")
    
    try:
        response = requests.get(f"{API_BASE}/field-types")
        print_response(response, "Tipos de campo")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar tipos de campo: {e}")
        return False

def test_create_form():
    """Testa criação de um novo formulário."""
    print_separator("TESTE: Criar novo formulário")
    
    form_data = {
        "name": "test_contact_form",
        "title": "Formulário de Contato de Teste",
        "description": "Um formulário de contato criado para testes da API",
        "module": "cms",
        "submit_name": "Enviar Mensagem",
        "method": "POST",
        "enctype": "multipart/form-data",
        "css_class": "contact-form",
        "template": "contact_form.html",
        "success_message": "Sua mensagem foi enviada com sucesso! Entraremos em contato em breve.",
        "error_message": "Erro ao enviar mensagem. Tente novamente.",
        "email_to": "contato@exemplo.com",
        "email_subject": "Nova mensagem do site",
        "ajax_mode": True,
        "captcha_enabled": True,
        "honeypot_enabled": True,
        "rate_limit": 5,
        "is_active": True
    }
    
    try:
        response = requests.post(
            f"{API_BASE}/",
            json=form_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Criação de formulário")
        
        if response.status_code == 201:
            # Extrair ID do formulário criado para testes posteriores
            data = response.json()
            if "data" in data and "id" in data["data"]:
                return data["data"]["id"]
        
        return None
    except Exception as e:
        print(f"Erro ao criar formulário: {e}")
        return None

def test_get_form(form_id):
    """Testa busca de formulário por ID."""
    print_separator(f"TESTE: Buscar formulário por ID ({form_id})")
    
    try:
        response = requests.get(f"{API_BASE}/{form_id}")
        print_response(response, f"Formulário ID {form_id}")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao buscar formulário {form_id}: {e}")
        return False

def test_get_form_by_name():
    """Testa busca de formulário por nome."""
    print_separator("TESTE: Buscar formulário por nome")
    
    try:
        response = requests.get(f"{API_BASE}/name/test_contact_form")
        print_response(response, "Formulário por nome")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar formulário por nome: {e}")
        return False

def test_update_form(form_id):
    """Testa atualização de formulário."""
    print_separator(f"TESTE: Atualizar formulário ({form_id})")
    
    update_data = {
        "title": "Formulário de Contato de Teste - Atualizado",
        "description": "Descrição atualizada do formulário de contato",
        "success_message": "Mensagem atualizada: Obrigado pelo contato!",
        "email_subject": "Nova mensagem do site - Atualizado",
        "captcha_enabled": False,
        "rate_limit": 10,
        "css_class": "contact-form updated-form"
    }
    
    try:
        response = requests.put(
            f"{API_BASE}/{form_id}",
            json=update_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Atualização de formulário")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao atualizar formulário {form_id}: {e}")
        return False

def test_delete_form(form_id):
    """Testa remoção de formulário."""
    print_separator(f"TESTE: Remover formulário ({form_id})")
    
    try:
        response = requests.delete(f"{API_BASE}/{form_id}")
        print_response(response, "Remoção de formulário")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao remover formulário {form_id}: {e}")
        return False

def test_invalid_endpoints():
    """Testa endpoints inválidos."""
    print_separator("TESTE: Endpoints inválidos")
    
    tests = [
        ("GET formulário inexistente", f"{API_BASE}/99999"),
        ("GET nome inexistente", f"{API_BASE}/name/formulario-inexistente"),
        ("POST dados inválidos", f"{API_BASE}/", {"invalid": "data"}),
        ("PUT formulário inexistente", f"{API_BASE}/99999", {"title": "Test"}),
        ("DELETE formulário inexistente", f"{API_BASE}/99999", None)
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
    print_separator("INICIANDO TESTES DA API DE FORMULÁRIOS")
    print(f"URL Base: {API_BASE}")
    print(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    results = []
    created_form_id = None
    
    # Testes de leitura
    results.append(("Listar formulários", test_list_forms()))
    results.append(("Listar formulários ativos", test_list_active_forms()))
    results.append(("Listar tipos de campo", test_list_field_types()))
    
    # Teste de criação
    created_form_id = test_create_form()
    results.append(("Criar formulário", created_form_id is not None))
    
    # Testes com formulário criado
    if created_form_id:
        results.append(("Buscar formulário por ID", test_get_form(created_form_id)))
        results.append(("Buscar formulário por nome", test_get_form_by_name()))
        results.append(("Atualizar formulário", test_update_form(created_form_id)))
        results.append(("Remover formulário", test_delete_form(created_form_id)))
    
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
        print("\n🎉 Todos os testes passaram! A API de formulários está funcionando corretamente.")
        sys.exit(0)
    else:
        print(f"\n⚠️  {total-passed} teste(s) falharam. Verifique os logs acima.")
        sys.exit(1)

if __name__ == "__main__":
    main()
