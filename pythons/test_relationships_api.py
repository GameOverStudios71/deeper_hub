#!/usr/bin/env python3
"""
Script de teste para a API de relacionamentos do CMS.
Testa todos os endpoints do sistema de relacionamentos.
"""

import requests
import json
import sys
from datetime import datetime

# Configuração da API
BASE_URL = "http://localhost:4000"
API_BASE = f"{BASE_URL}/api/cms/relationships"

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

def test_list_relationships():
    """Testa listagem de todos os relacionamentos."""
    print_separator("TESTE: Listar todos os relacionamentos")
    
    try:
        response = requests.get(f"{API_BASE}/")
        print_response(response, "Lista de relacionamentos")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar relacionamentos: {e}")
        return False

def test_list_active_relationships():
    """Testa listagem de relacionamentos ativos."""
    print_separator("TESTE: Listar relacionamentos ativos")
    
    try:
        response = requests.get(f"{API_BASE}/active")
        print_response(response, "Relacionamentos ativos")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar relacionamentos ativos: {e}")
        return False

def test_list_relationships_by_type():
    """Testa listagem de relacionamentos por tipo."""
    print_separator("TESTE: Listar relacionamentos por tipo")
    
    types_to_test = ["one_to_one", "one_to_many", "many_to_many"]
    results = []
    
    for rel_type in types_to_test:
        try:
            response = requests.get(f"{API_BASE}/type/{rel_type}")
            print_response(response, f"Relacionamentos do tipo {rel_type}")
            results.append(response.status_code == 200)
        except Exception as e:
            print(f"Erro ao listar relacionamentos do tipo {rel_type}: {e}")
            results.append(False)
    
    return all(results)

def test_list_relationships_from_entity():
    """Testa listagem de relacionamentos de uma entidade."""
    print_separator("TESTE: Listar relacionamentos de uma entidade")
    
    try:
        # Usar entidade ID 1
        response = requests.get(f"{API_BASE}/from/1")
        print_response(response, "Relacionamentos da entidade")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar relacionamentos da entidade: {e}")
        return False

def test_list_relationships_to_entity():
    """Testa listagem de relacionamentos para uma entidade."""
    print_separator("TESTE: Listar relacionamentos para uma entidade")
    
    try:
        # Usar entidade ID 1
        response = requests.get(f"{API_BASE}/to/1")
        print_response(response, "Relacionamentos para a entidade")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar relacionamentos para a entidade: {e}")
        return False

def test_list_record_relationships():
    """Testa listagem de relacionamentos de um registro."""
    print_separator("TESTE: Listar relacionamentos de um registro")
    
    try:
        # Usar registro ID de teste
        response = requests.get(f"{API_BASE}/record/test-record-1")
        print_response(response, "Relacionamentos do registro")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar relacionamentos do registro: {e}")
        return False

def test_create_relationship():
    """Testa criação de um novo relacionamento."""
    print_separator("TESTE: Criar novo relacionamento")
    
    relationship_data = {
        "name": "test_relationship",
        "from_entity_id": 1,
        "to_entity_id": 2,
        "relationship_type": "one_to_many",
        "is_active": True
    }
    
    try:
        response = requests.post(
            f"{API_BASE}/",
            json=relationship_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Criação de relacionamento")
        
        if response.status_code == 201:
            # Extrair ID do relacionamento criado para testes posteriores
            data = response.json()
            if "data" in data and "id" in data["data"]:
                return data["data"]["id"]
        
        return None
    except Exception as e:
        print(f"Erro ao criar relacionamento: {e}")
        return None

def test_get_relationship(relationship_id):
    """Testa busca de relacionamento por ID."""
    print_separator(f"TESTE: Buscar relacionamento por ID ({relationship_id})")
    
    try:
        response = requests.get(f"{API_BASE}/{relationship_id}")
        print_response(response, f"Relacionamento ID {relationship_id}")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao buscar relacionamento {relationship_id}: {e}")
        return False

def test_list_entity_relationships(relationship_id):
    """Testa listagem de relacionamentos de entidade."""
    print_separator(f"TESTE: Listar relacionamentos de entidade ({relationship_id})")
    
    try:
        response = requests.get(f"{API_BASE}/{relationship_id}/entities")
        print_response(response, "Relacionamentos de entidade")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar relacionamentos de entidade: {e}")
        return False

def test_create_entity_relationship(relationship_id):
    """Testa criação de relacionamento entre registros."""
    print_separator(f"TESTE: Criar relacionamento entre registros ({relationship_id})")
    
    entity_relationship_data = {
        "from_record_id": "record-1",
        "to_record_id": "record-2",
        "order_index": 1
    }
    
    try:
        response = requests.post(
            f"{API_BASE}/{relationship_id}/entities",
            json=entity_relationship_data,
            headers={"Content-Type": "application/json"}
        )
        print_response(response, "Criação de relacionamento entre registros")
        return response.status_code == 201
    except Exception as e:
        print(f"Erro ao criar relacionamento entre registros: {e}")
        return False

def test_invalid_endpoints():
    """Testa endpoints inválidos."""
    print_separator("TESTE: Endpoints inválidos")
    
    tests = [
        ("GET relacionamento inexistente", f"{API_BASE}/99999"),
        ("GET tipo inexistente", f"{API_BASE}/type/invalid-type"),
        ("GET entidade inexistente", f"{API_BASE}/from/99999"),
        ("GET registro inexistente", f"{API_BASE}/record/inexistent-record"),
        ("POST dados inválidos", f"{API_BASE}/", {"invalid": "data"}),
        ("POST relacionamento entre registros inválido", f"{API_BASE}/99999/entities", {"invalid": "data"}),
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

def test_relationship_structure():
    """Testa estrutura dos relacionamentos."""
    print_separator("TESTE: Estrutura dos relacionamentos")
    
    try:
        response = requests.get(f"{API_BASE}/")
        if response.status_code == 200:
            data = response.json()
            relationships = data.get("data", [])
            
            print(f"\nTotal de relacionamentos encontrados: {len(relationships)}")
            
            # Agrupar por tipo
            types = {}
            for rel in relationships:
                rel_type = rel.get("relationship_type", "unknown")
                types[rel_type] = types.get(rel_type, 0) + 1
            
            print("Relacionamentos por tipo:")
            for rel_type, count in types.items():
                print(f"  {rel_type}: {count}")
            
            # Contar ativos vs inativos
            active_rels = [r for r in relationships if r.get("is_active")]
            inactive_rels = [r for r in relationships if not r.get("is_active")]
            
            print(f"Relacionamentos ativos: {len(active_rels)}")
            print(f"Relacionamentos inativos: {len(inactive_rels)}")
            
            return True
        
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao testar estrutura: {e}")
        return False

def test_relationship_types():
    """Testa tipos específicos de relacionamento."""
    print_separator("TESTE: Tipos específicos de relacionamento")
    
    types_info = {
        "one_to_one": "Um para Um",
        "one_to_many": "Um para Muitos", 
        "many_to_many": "Muitos para Muitos"
    }
    
    results = []
    for rel_type, description in types_info.items():
        try:
            response = requests.get(f"{API_BASE}/type/{rel_type}")
            if response.status_code == 200:
                data = response.json()
                count = data.get("count", 0)
                print(f"\n{description} ({rel_type}): {count} relacionamentos")
                results.append(True)
            else:
                print(f"\n{description} ({rel_type}): Erro {response.status_code}")
                results.append(False)
        except Exception as e:
            print(f"Erro ao testar tipo {rel_type}: {e}")
            results.append(False)
    
    return all(results)

def main():
    """Executa todos os testes."""
    print_separator("INICIANDO TESTES DA API DE RELACIONAMENTOS")
    print(f"URL Base: {API_BASE}")
    print(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    results = []
    created_relationship_id = None
    
    # Testes de leitura
    results.append(("Listar relacionamentos", test_list_relationships()))
    results.append(("Listar relacionamentos ativos", test_list_active_relationships()))
    results.append(("Listar por tipo", test_list_relationships_by_type()))
    results.append(("Listar de entidade", test_list_relationships_from_entity()))
    results.append(("Listar para entidade", test_list_relationships_to_entity()))
    results.append(("Listar de registro", test_list_record_relationships()))
    
    # Teste de criação
    created_relationship_id = test_create_relationship()
    results.append(("Criar relacionamento", created_relationship_id is not None))
    
    # Testes com relacionamento criado
    if created_relationship_id:
        results.append(("Buscar relacionamento por ID", test_get_relationship(created_relationship_id)))
        results.append(("Listar relacionamentos de entidade", test_list_entity_relationships(created_relationship_id)))
        results.append(("Criar relacionamento entre registros", test_create_entity_relationship(created_relationship_id)))
    
    # Testes de estrutura
    results.append(("Estrutura dos relacionamentos", test_relationship_structure()))
    results.append(("Tipos específicos", test_relationship_types()))
    
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
        print("\n🎉 Todos os testes passaram! A API de relacionamentos está funcionando corretamente.")
        sys.exit(0)
    else:
        print(f"\n⚠️  {total-passed} teste(s) falharam. Verifique os logs acima.")
        sys.exit(1)

if __name__ == "__main__":
    main()
