#!/usr/bin/env python3
"""
Script de teste para a API de mídia do CMS.
Testa todos os endpoints do sistema de mídia.
"""

import requests
import json
import sys
from datetime import datetime

# Configuração da API
BASE_URL = "http://localhost:4000"
API_BASE = f"{BASE_URL}/api/cms/media"

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

def test_list_storages():
    """Testa listagem de todos os storages."""
    print_separator("TESTE: Listar todos os storages")
    
    try:
        response = requests.get(f"{API_BASE}/storages")
        print_response(response, "Lista de storages")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar storages: {e}")
        return False

def test_list_active_storages():
    """Testa listagem de storages ativos."""
    print_separator("TESTE: Listar storages ativos")
    
    try:
        response = requests.get(f"{API_BASE}/storages/active")
        print_response(response, "Storages ativos")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar storages ativos: {e}")
        return False

def test_get_default_storage():
    """Testa busca do storage padrão."""
    print_separator("TESTE: Buscar storage padrão")
    
    try:
        response = requests.get(f"{API_BASE}/storages/default")
        print_response(response, "Storage padrão")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar storage padrão: {e}")
        return False

def test_get_storage_by_id():
    """Testa busca de storage por ID."""
    print_separator("TESTE: Buscar storage por ID")
    
    try:
        # Usar ID 1 que deve existir
        response = requests.get(f"{API_BASE}/storages/1")
        print_response(response, "Storage por ID")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar storage por ID: {e}")
        return False

def test_list_folders():
    """Testa listagem de todas as pastas."""
    print_separator("TESTE: Listar todas as pastas")
    
    try:
        response = requests.get(f"{API_BASE}/folders")
        print_response(response, "Lista de pastas")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar pastas: {e}")
        return False

def test_list_folders_by_storage():
    """Testa listagem de pastas por storage."""
    print_separator("TESTE: Listar pastas por storage")
    
    try:
        # Usar storage ID 1
        response = requests.get(f"{API_BASE}/folders/storage/1")
        print_response(response, "Pastas por storage")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar pastas por storage: {e}")
        return False

def test_list_files():
    """Testa listagem de todos os arquivos."""
    print_separator("TESTE: Listar todos os arquivos")
    
    try:
        response = requests.get(f"{API_BASE}/files")
        print_response(response, "Lista de arquivos")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar arquivos: {e}")
        return False

def test_list_files_by_folder():
    """Testa listagem de arquivos por pasta."""
    print_separator("TESTE: Listar arquivos por pasta")
    
    try:
        # Usar pasta ID 1
        response = requests.get(f"{API_BASE}/files/folder/1")
        print_response(response, "Arquivos por pasta")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar arquivos por pasta: {e}")
        return False

def test_get_file_by_id():
    """Testa busca de arquivo por ID."""
    print_separator("TESTE: Buscar arquivo por ID")
    
    try:
        # Usar arquivo ID 1
        response = requests.get(f"{API_BASE}/files/1")
        print_response(response, "Arquivo por ID")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar arquivo por ID: {e}")
        return False

def test_list_transformations():
    """Testa listagem de transformações."""
    print_separator("TESTE: Listar transformações")
    
    try:
        response = requests.get(f"{API_BASE}/transformations")
        print_response(response, "Lista de transformações")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar transformações: {e}")
        return False

def test_invalid_endpoints():
    """Testa endpoints inválidos."""
    print_separator("TESTE: Endpoints inválidos")
    
    tests = [
        ("GET storage inexistente", f"{API_BASE}/storages/99999"),
        ("GET pasta de storage inexistente", f"{API_BASE}/folders/storage/99999"),
        ("GET arquivo inexistente", f"{API_BASE}/files/99999"),
        ("GET arquivos de pasta inexistente", f"{API_BASE}/files/folder/99999"),
        ("GET rota inexistente", f"{API_BASE}/invalid-route")
    ]
    
    results = []
    for test_name, url in tests:
        try:
            response = requests.get(url)
            print(f"\n{test_name}: Status {response.status_code}")
            results.append(response.status_code in [404, 500])
        except Exception as e:
            print(f"Erro em {test_name}: {e}")
            results.append(False)
    
    return all(results)

def test_storage_info():
    """Testa informações detalhadas de storage."""
    print_separator("TESTE: Informações de storage")
    
    try:
        # Primeiro listar storages para pegar um ID válido
        response = requests.get(f"{API_BASE}/storages")
        if response.status_code == 200:
            data = response.json()
            if data.get("data") and len(data["data"]) > 0:
                storage_id = data["data"][0]["id"]
                
                # Buscar detalhes do storage
                detail_response = requests.get(f"{API_BASE}/storages/{storage_id}")
                print_response(detail_response, f"Detalhes do storage {storage_id}")
                
                return detail_response.status_code == 200
        
        return True  # Se não há storages, considera sucesso
    except Exception as e:
        print(f"Erro ao testar informações de storage: {e}")
        return False

def test_folder_hierarchy():
    """Testa hierarquia de pastas."""
    print_separator("TESTE: Hierarquia de pastas")
    
    try:
        # Listar todas as pastas
        response = requests.get(f"{API_BASE}/folders")
        if response.status_code == 200:
            data = response.json()
            folders = data.get("data", [])
            
            print(f"\nTotal de pastas encontradas: {len(folders)}")
            
            # Contar pastas raiz e subpastas
            root_folders = [f for f in folders if f.get("parent_id") is None]
            sub_folders = [f for f in folders if f.get("parent_id") is not None]
            
            print(f"Pastas raiz: {len(root_folders)}")
            print(f"Subpastas: {len(sub_folders)}")
            
            return True
        
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao testar hierarquia de pastas: {e}")
        return False

def test_file_types():
    """Testa tipos de arquivo."""
    print_separator("TESTE: Tipos de arquivo")
    
    try:
        response = requests.get(f"{API_BASE}/files")
        if response.status_code == 200:
            data = response.json()
            files = data.get("data", [])
            
            print(f"\nTotal de arquivos encontrados: {len(files)}")
            
            # Contar por tipo MIME
            mime_types = {}
            for file in files:
                mime_type = file.get("mime_type", "unknown")
                mime_types[mime_type] = mime_types.get(mime_type, 0) + 1
            
            print("Tipos de arquivo encontrados:")
            for mime_type, count in mime_types.items():
                print(f"  {mime_type}: {count}")
            
            return True
        
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao testar tipos de arquivo: {e}")
        return False

def main():
    """Executa todos os testes."""
    print_separator("INICIANDO TESTES DA API DE MÍDIA")
    print(f"URL Base: {API_BASE}")
    print(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    results = []
    
    # Testes de storages
    results.append(("Listar storages", test_list_storages()))
    results.append(("Listar storages ativos", test_list_active_storages()))
    results.append(("Buscar storage padrão", test_get_default_storage()))
    results.append(("Buscar storage por ID", test_get_storage_by_id()))
    results.append(("Informações de storage", test_storage_info()))
    
    # Testes de pastas
    results.append(("Listar pastas", test_list_folders()))
    results.append(("Listar pastas por storage", test_list_folders_by_storage()))
    results.append(("Hierarquia de pastas", test_folder_hierarchy()))
    
    # Testes de arquivos
    results.append(("Listar arquivos", test_list_files()))
    results.append(("Listar arquivos por pasta", test_list_files_by_folder()))
    results.append(("Buscar arquivo por ID", test_get_file_by_id()))
    results.append(("Tipos de arquivo", test_file_types()))
    
    # Testes de transformações
    results.append(("Listar transformações", test_list_transformations()))
    
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
        print("\n🎉 Todos os testes passaram! A API de mídia está funcionando corretamente.")
        sys.exit(0)
    else:
        print(f"\n⚠️  {total-passed} teste(s) falharam. Verifique os logs acima.")
        sys.exit(1)

if __name__ == "__main__":
    main()
