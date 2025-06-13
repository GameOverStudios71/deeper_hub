#!/usr/bin/env python3
"""
Script para testar todas as rotas da API de Temas do DeeperHub.
Testa CRUD completo e todas as funcionalidades.
"""

import requests
import json
import sys
from datetime import datetime
from typing import Dict, Any, Optional

class ThemeAPITester:
    def __init__(self, base_url: str = "http://localhost:4000"):
        self.base_url = base_url.rstrip('/')
        self.api_url = f"{self.base_url}/api/cms/themes"
        self.session = requests.Session()
        self.session.headers.update({
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        })
        
        # Dados de teste
        self.test_theme = {
            "name": "test_theme_python",
            "title": "Tema de Teste Python",
            "description": "Tema criado pelo script de teste Python",
            "template_path": "/templates/test",
            "css_file": "style.css",
            "js_file": "script.js",
            "preview_image": "preview.jpg",
            "version": "1.0.0",
            "author": "Python Tester",
            "author_url": "https://github.com/tester",
            "supports_dark_mode": True,
            "is_responsive": True,
            "min_width": 320,
            "is_active": True,
            "is_default": False,
            "is_system": False,
            "order_index": 10
        }
        
        self.created_theme_id = None
        self.test_results = []

    def log_test(self, test_name: str, success: bool, details: str = ""):
        """Registra resultado de um teste."""
        status = "✅ PASS" if success else "❌ FAIL"
        timestamp = datetime.now().strftime("%H:%M:%S")
        result = f"[{timestamp}] {status} {test_name}"
        if details:
            result += f" - {details}"
        
        print(result)
        self.test_results.append({
            'test': test_name,
            'success': success,
            'details': details,
            'timestamp': timestamp
        })

    def make_request(self, method: str, url: str, **kwargs) -> Optional[requests.Response]:
        """Faz uma requisição HTTP com tratamento de erro."""
        try:
            response = self.session.request(method, url, **kwargs)
            return response
        except requests.exceptions.RequestException as e:
            self.log_test(f"{method} {url}", False, f"Erro de conexão: {e}")
            return None

    def test_server_connection(self) -> bool:
        """Testa se o servidor está rodando."""
        print("🔌 Testando conexão com o servidor...")
        
        response = self.make_request('GET', self.base_url)
        if response is None:
            self.log_test("Conexão com servidor", False, "Servidor não está rodando")
            return False
        
        if response.status_code == 200:
            self.log_test("Conexão com servidor", True, f"Status: {response.status_code}")
            return True
        else:
            self.log_test("Conexão com servidor", False, f"Status: {response.status_code}")
            return False

    def test_list_themes(self) -> bool:
        """Testa GET /api/cms/themes - Lista todos os temas."""
        print("\n📋 Testando listagem de temas...")
        
        response = self.make_request('GET', self.api_url)
        if response is None:
            return False
        
        success = response.status_code == 200
        try:
            data = response.json()
            details = f"Status: {response.status_code}, Temas: {data.get('data', {}).get('total', 0)}"
        except:
            details = f"Status: {response.status_code}, Resposta inválida"
        
        self.log_test("GET /api/cms/themes", success, details)
        return success

    def test_list_active_themes(self) -> bool:
        """Testa GET /api/cms/themes?active=true - Lista temas ativos."""
        print("\n📋 Testando listagem de temas ativos...")
        
        response = self.make_request('GET', f"{self.api_url}?active=true")
        if response is None:
            return False
        
        success = response.status_code == 200
        try:
            data = response.json()
            details = f"Status: {response.status_code}, Temas ativos: {data.get('data', {}).get('total', 0)}"
        except:
            details = f"Status: {response.status_code}, Resposta inválida"
        
        self.log_test("GET /api/cms/themes?active=true", success, details)
        return success

    def test_create_theme(self) -> bool:
        """Testa POST /api/cms/themes - Cria um novo tema."""
        print("\n➕ Testando criação de tema...")
        
        payload = {"theme": self.test_theme}
        response = self.make_request('POST', self.api_url, json=payload)
        if response is None:
            return False
        
        success = response.status_code == 201
        try:
            data = response.json()
            if success and 'data' in data and 'theme' in data['data']:
                self.created_theme_id = data['data']['theme']['id']
                details = f"Status: {response.status_code}, ID: {self.created_theme_id}"
            else:
                details = f"Status: {response.status_code}, Erro: {data.get('error', {}).get('message', 'Desconhecido')}"
        except:
            details = f"Status: {response.status_code}, Resposta inválida"
        
        self.log_test("POST /api/cms/themes", success, details)
        return success

    def test_get_theme_by_id(self) -> bool:
        """Testa GET /api/cms/themes/:id - Busca tema por ID."""
        if not self.created_theme_id:
            self.log_test("GET /api/cms/themes/:id", False, "Nenhum tema criado para testar")
            return False
        
        print(f"\n🔍 Testando busca de tema por ID ({self.created_theme_id})...")
        
        response = self.make_request('GET', f"{self.api_url}/{self.created_theme_id}")
        if response is None:
            return False
        
        success = response.status_code == 200
        try:
            data = response.json()
            if success:
                theme = data.get('data', {}).get('theme', {})
                details = f"Status: {response.status_code}, Nome: {theme.get('name', 'N/A')}"
            else:
                details = f"Status: {response.status_code}, Erro: {data.get('error', {}).get('message', 'Desconhecido')}"
        except:
            details = f"Status: {response.status_code}, Resposta inválida"
        
        self.log_test(f"GET /api/cms/themes/{self.created_theme_id}", success, details)
        return success

    def test_get_theme_by_name(self) -> bool:
        """Testa GET /api/cms/themes/by-name/:name - Busca tema por nome."""
        print(f"\n🔍 Testando busca de tema por nome ({self.test_theme['name']})...")
        
        response = self.make_request('GET', f"{self.api_url}/by-name/{self.test_theme['name']}")
        if response is None:
            return False
        
        success = response.status_code == 200
        try:
            data = response.json()
            if success:
                theme = data.get('data', {}).get('theme', {})
                details = f"Status: {response.status_code}, ID: {theme.get('id', 'N/A')}"
            else:
                details = f"Status: {response.status_code}, Erro: {data.get('error', {}).get('message', 'Desconhecido')}"
        except:
            details = f"Status: {response.status_code}, Resposta inválida"
        
        self.log_test(f"GET /api/cms/themes/by-name/{self.test_theme['name']}", success, details)
        return success

    def test_get_default_theme(self) -> bool:
        """Testa GET /api/cms/themes/default - Busca tema padrão."""
        print("\n🎯 Testando busca de tema padrão...")
        
        response = self.make_request('GET', f"{self.api_url}/default")
        if response is None:
            return False
        
        # Pode retornar 200 (encontrou) ou 404 (não encontrou) - ambos são válidos
        success = response.status_code in [200, 404]
        try:
            data = response.json()
            if response.status_code == 200:
                theme = data.get('data', {}).get('theme', {})
                details = f"Status: {response.status_code}, Tema: {theme.get('name', 'N/A')}"
            else:
                details = f"Status: {response.status_code}, Nenhum tema padrão configurado"
        except:
            details = f"Status: {response.status_code}, Resposta inválida"
        
        self.log_test("GET /api/cms/themes/default", success, details)
        return success

    def test_update_theme(self) -> bool:
        """Testa PUT /api/cms/themes/:id - Atualiza um tema."""
        if not self.created_theme_id:
            self.log_test("PUT /api/cms/themes/:id", False, "Nenhum tema criado para testar")
            return False
        
        print(f"\n✏️ Testando atualização de tema ({self.created_theme_id})...")
        
        updated_data = self.test_theme.copy()
        updated_data['title'] = "Tema Atualizado pelo Python"
        updated_data['version'] = "1.1.0"
        
        payload = {"theme": updated_data}
        response = self.make_request('PUT', f"{self.api_url}/{self.created_theme_id}", json=payload)
        if response is None:
            return False
        
        success = response.status_code == 200
        try:
            data = response.json()
            if success:
                theme = data.get('data', {}).get('theme', {})
                details = f"Status: {response.status_code}, Nova versão: {theme.get('version', 'N/A')}"
            else:
                details = f"Status: {response.status_code}, Erro: {data.get('error', {}).get('message', 'Desconhecido')}"
        except:
            details = f"Status: {response.status_code}, Resposta inválida"
        
        self.log_test(f"PUT /api/cms/themes/{self.created_theme_id}", success, details)
        return success

    def test_delete_theme(self) -> bool:
        """Testa DELETE /api/cms/themes/:id - Deleta um tema."""
        if not self.created_theme_id:
            self.log_test("DELETE /api/cms/themes/:id", False, "Nenhum tema criado para testar")
            return False
        
        print(f"\n🗑️ Testando deleção de tema ({self.created_theme_id})...")
        
        response = self.make_request('DELETE', f"{self.api_url}/{self.created_theme_id}")
        if response is None:
            return False
        
        success = response.status_code == 200
        try:
            data = response.json()
            if success:
                details = f"Status: {response.status_code}, Tema deletado com sucesso"
            else:
                details = f"Status: {response.status_code}, Erro: {data.get('error', {}).get('message', 'Desconhecido')}"
        except:
            details = f"Status: {response.status_code}, Resposta inválida"
        
        self.log_test(f"DELETE /api/cms/themes/{self.created_theme_id}", success, details)
        
        # Limpar ID após deleção
        if success:
            self.created_theme_id = None
        
        return success

    def test_invalid_requests(self) -> bool:
        """Testa requisições inválidas."""
        print("\n🚫 Testando requisições inválidas...")
        
        tests_passed = 0
        total_tests = 0
        
        # Teste 1: GET tema com ID inválido
        total_tests += 1
        response = self.make_request('GET', f"{self.api_url}/999999")
        if response and response.status_code == 404:
            self.log_test("GET /api/cms/themes/999999 (ID inválido)", True, "404 como esperado")
            tests_passed += 1
        else:
            self.log_test("GET /api/cms/themes/999999 (ID inválido)", False, f"Status: {response.status_code if response else 'Erro'}")
        
        # Teste 2: POST sem dados obrigatórios
        total_tests += 1
        payload = {"theme": {"name": ""}}  # Nome vazio
        response = self.make_request('POST', self.api_url, json=payload)
        if response and response.status_code in [400, 422]:
            self.log_test("POST com dados inválidos", True, f"Status {response.status_code} como esperado")
            tests_passed += 1
        else:
            self.log_test("POST com dados inválidos", False, f"Status: {response.status_code if response else 'Erro'}")
        
        # Teste 3: PUT sem parâmetros theme
        total_tests += 1
        response = self.make_request('PUT', f"{self.api_url}/1", json={"invalid": "data"})
        if response and response.status_code == 400:
            self.log_test("PUT sem parâmetros 'theme'", True, "400 como esperado")
            tests_passed += 1
        else:
            self.log_test("PUT sem parâmetros 'theme'", False, f"Status: {response.status_code if response else 'Erro'}")
        
        return tests_passed == total_tests

    def run_all_tests(self):
        """Executa todos os testes."""
        print("🚀 INICIANDO TESTES DA API DE TEMAS")
        print("=" * 50)
        
        # Teste de conexão
        if not self.test_server_connection():
            print("\n❌ ERRO: Servidor não está rodando. Certifique-se de que o DeeperHub está ativo.")
            print("Execute: mix run --no-halt")
            return False
        
        # Testes principais
        tests = [
            self.test_list_themes,
            self.test_list_active_themes,
            self.test_create_theme,
            self.test_get_theme_by_id,
            self.test_get_theme_by_name,
            self.test_get_default_theme,
            self.test_update_theme,
            self.test_delete_theme,
            self.test_invalid_requests
        ]
        
        passed = 0
        total = len(tests)
        
        for test in tests:
            try:
                if test():
                    passed += 1
            except Exception as e:
                self.log_test(test.__name__, False, f"Exceção: {e}")
        
        # Relatório final
        print("\n" + "=" * 50)
        print("📊 RELATÓRIO FINAL DOS TESTES")
        print("=" * 50)
        
        success_rate = (passed / total) * 100
        status_emoji = "🎉" if passed == total else "⚠️" if passed > total * 0.7 else "❌"
        
        print(f"{status_emoji} Testes passaram: {passed}/{total} ({success_rate:.1f}%)")
        
        if passed == total:
            print("✅ TODOS OS TESTES PASSARAM! API está funcionando perfeitamente.")
        elif passed > total * 0.7:
            print("⚠️ Maioria dos testes passou, mas há alguns problemas.")
        else:
            print("❌ Muitos testes falharam. Verifique a implementação da API.")
        
        # Detalhes dos testes que falharam
        failed_tests = [r for r in self.test_results if not r['success']]
        if failed_tests:
            print(f"\n❌ Testes que falharam ({len(failed_tests)}):")
            for test in failed_tests:
                print(f"  • {test['test']}: {test['details']}")
        
        return passed == total


def main():
    """Função principal."""
    import argparse
    
    parser = argparse.ArgumentParser(description='Testa a API de Temas do DeeperHub')
    parser.add_argument('--url', default='http://localhost:4000', 
                       help='URL base do servidor (padrão: http://localhost:4000)')
    
    args = parser.parse_args()
    
    tester = ThemeAPITester(args.url)
    success = tester.run_all_tests()
    
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
