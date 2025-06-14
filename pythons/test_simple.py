#!/usr/bin/env python3
"""
Teste simples e rápido da API de Temas.
"""

import requests
import json
import time

# Configuração
BASE_URL = "http://localhost:4000"
API_URL = f"{BASE_URL}/api/cms/themes"

def test_api():
    print("🚀 Testando API de Temas do DeeperHub")
    print("=" * 40)
    
    # 1. Teste de conexão
    print("\n1. 🔌 Testando conexão...")
    try:
        response = requests.get(BASE_URL, timeout=5)
        print(f"   ✅ Servidor respondeu: {response.status_code}")
    except Exception as e:
        print(f"   ❌ Erro de conexão: {e}")
        print("   💡 Certifique-se de que o servidor está rodando: mix run --no-halt")
        return
    
    # 2. Listar temas
    print("\n2. 📋 Listando temas...")
    try:
        response = requests.get(API_URL)
        print(f"   Status: {response.status_code}")
        if response.status_code == 200:
            data = response.json()
            print(f"   ✅ Resposta: {json.dumps(data, indent=2)}")
        else:
            print(f"   ❌ Erro: {response.text}")
    except Exception as e:
        print(f"   ❌ Erro: {e}")
    
    # 3. Criar tema
    print("\n3. ➕ Criando tema de teste...")
    timestamp = int(time.time())
    theme_data = {
        "theme": {
            "name": f"teste2_python_{timestamp}",
            "title": f"Tema2 Teste Python {timestamp}",
            "description": "Tema criado pelo script Python para teste da API",
            "template_path": f"/templates/teste_python_{timestamp}",
            "css_file": "style.css",
            "js_file": "script.js",
            "preview_image": "preview.jpg",
            "version": "1.0.0",
            "author": "Python Script Tester",
            "author_url": "https://github.com/python-tester",
            "supports_dark_mode": True,
            "is_responsive": True,
            "min_width": 320,
            "is_active": True,
            "is_default": False,
            "is_system": False,
            "order_index": 100
        }
    }
    
    try:
        response = requests.post(API_URL, json=theme_data)
        print(f"   Status: {response.status_code}")
        if response.status_code == 201:
            data = response.json()
            theme_id = data.get('data', {}).get('theme', {}).get('id')
            print(f"   ✅ Tema criado com ID: {theme_id}")
            
            # 4. Buscar tema criado
            if theme_id:
                print(f"\n4. 🔍 Buscando tema {theme_id}...")
                response = requests.get(f"{API_URL}/{theme_id}")
                print(f"   Status: {response.status_code}")
                if response.status_code == 200:
                    data = response.json()
                    theme = data.get('data', {}).get('theme', {})
                    print(f"   ✅ Tema encontrado: {theme.get('name')} - {theme.get('title')}")
                else:
                    print(f"   ❌ Erro ao buscar: {response.text}")
                
                # 5. Atualizar tema
                print(f"\n5. ✏️ Atualizando tema {theme_id}...")
                update_data = {
                    "theme": {
                        "name": f"teste_python_{timestamp}_updated",
                        "title": f"Tema Teste Python {timestamp} ATUALIZADO",
                        "description": f"Tema atualizado pelo script Python para teste da API - {timestamp}",
                        "template_path": f"/templates/teste_python_{timestamp}_updated",
                        "css_file": "style_updated.css",
                        "js_file": "script_updated.js",
                        "version": "1.1.0",
                        "author": "Python Script Tester Updated",
                        "supports_dark_mode": True,
                        "is_responsive": True,
                        "min_width": 320,
                        "is_active": True,
                        "is_default": False,
                        "is_system": False,
                        "order_index": 101
                    }
                }
                response = requests.put(f"{API_URL}/{theme_id}", json=update_data)
                print(f"   Status: {response.status_code}")
                if response.status_code == 200:
                    print("   ✅ Tema atualizado com sucesso")
                else:
                    print(f"   ❌ Erro ao atualizar: {response.text}")
                
                # 6. Deletar tema
                print(f"\n6. 🗑️ Deletando tema {theme_id}...")
                response = requests.delete(f"{API_URL}/{theme_id}")
                print(f"   Status: {response.status_code}")
                if response.status_code == 200:
                    print("   ✅ Tema deletado com sucesso")
                else:
                    print(f"   ❌ Erro ao deletar: {response.text}")
        else:
            print(f"   ❌ Erro ao criar: {response.text}")
    except Exception as e:
        print(f"   ❌ Erro: {e}")
    
    # 7. Testar rotas especiais
    print("\n7. 🎯 Testando rotas especiais...")
    
    # Tema padrão
    try:
        response = requests.get(f"{API_URL}/default")
        print(f"   Tema padrão - Status: {response.status_code}")
        if response.status_code == 200:
            data = response.json()
            theme = data.get('data', {}).get('theme', {})
            print(f"   ✅ Tema padrão: {theme.get('name', 'N/A')}")
        elif response.status_code == 404:
            print("   ℹ️ Nenhum tema padrão configurado")
    except Exception as e:
        print(f"   ❌ Erro ao buscar tema padrão: {e}")
    
    # Busca por nome
    try:
        response = requests.get(f"{API_URL}/by-name/teste_inexistente")
        print(f"   Busca por nome inexistente - Status: {response.status_code}")
        if response.status_code == 404:
            print("   ✅ 404 para nome inexistente (correto)")
    except Exception as e:
        print(f"   ❌ Erro ao buscar por nome: {e}")
    
    # Temas ativos
    try:
        response = requests.get(f"{API_URL}?active=true")
        print(f"   Temas ativos - Status: {response.status_code}")
        if response.status_code == 200:
            data = response.json()
            total = data.get('data', {}).get('total', 0)
            print(f"   ✅ {total} temas ativos encontrados")
    except Exception as e:
        print(f"   ❌ Erro ao listar temas ativos: {e}")
    
    print("\n" + "=" * 40)
    print("🎉 Teste concluído!")
    print("💡 Para testes mais detalhados, use: python test_themes_api.py")

if __name__ == "__main__":
    test_api()
