#!/usr/bin/env python3
"""
Script de teste para a API de auditoria do CMS.
Testa todos os endpoints do sistema de auditoria.
"""

import requests
import json
import sys
from datetime import datetime, timedelta

# Configuração da API
BASE_URL = "http://localhost:4000"
API_BASE = f"{BASE_URL}/api/cms/audit"

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

def test_list_audit_logs():
    """Testa listagem de todos os logs de auditoria."""
    print_separator("TESTE: Listar todos os logs de auditoria")
    
    try:
        response = requests.get(f"{API_BASE}/logs")
        print_response(response, "Lista de logs")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar logs: {e}")
        return False

def test_list_logs_with_pagination():
    """Testa listagem com paginação."""
    print_separator("TESTE: Listar logs com paginação")
    
    try:
        response = requests.get(f"{API_BASE}/logs?limit=10&offset=0")
        print_response(response, "Logs com paginação")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar logs com paginação: {e}")
        return False

def test_list_logs_by_table():
    """Testa listagem de logs por tabela."""
    print_separator("TESTE: Listar logs por tabela")
    
    tables_to_test = ["users", "cms_pages", "cms_widgets"]
    results = []
    
    for table in tables_to_test:
        try:
            response = requests.get(f"{API_BASE}/logs/table/{table}")
            print_response(response, f"Logs da tabela {table}")
            results.append(response.status_code == 200)
        except Exception as e:
            print(f"Erro ao listar logs da tabela {table}: {e}")
            results.append(False)
    
    return all(results)

def test_list_logs_by_record():
    """Testa listagem de logs por registro."""
    print_separator("TESTE: Listar logs por registro")
    
    try:
        # Usar um registro de teste
        response = requests.get(f"{API_BASE}/logs/record/users/1")
        print_response(response, "Logs do registro")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar logs do registro: {e}")
        return False

def test_list_logs_by_user():
    """Testa listagem de logs por usuário."""
    print_separator("TESTE: Listar logs por usuário")
    
    try:
        # Usar usuário ID 1
        response = requests.get(f"{API_BASE}/logs/user/1")
        print_response(response, "Logs do usuário")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar logs do usuário: {e}")
        return False

def test_list_logs_by_action():
    """Testa listagem de logs por ação."""
    print_separator("TESTE: Listar logs por ação")
    
    actions_to_test = ["INSERT", "UPDATE", "DELETE"]
    results = []
    
    for action in actions_to_test:
        try:
            response = requests.get(f"{API_BASE}/logs/action/{action}")
            print_response(response, f"Logs da ação {action}")
            results.append(response.status_code == 200)
        except Exception as e:
            print(f"Erro ao listar logs da ação {action}: {e}")
            results.append(False)
    
    return all(results)

def test_list_logs_by_period():
    """Testa listagem de logs por período."""
    print_separator("TESTE: Listar logs por período")
    
    try:
        # Período dos últimos 7 dias
        end_date = datetime.now()
        start_date = end_date - timedelta(days=7)
        
        start_str = start_date.strftime("%Y-%m-%d")
        end_str = end_date.strftime("%Y-%m-%d")
        
        response = requests.get(f"{API_BASE}/logs/period?start_date={start_str}&end_date={end_str}")
        print_response(response, "Logs por período")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao listar logs por período: {e}")
        return False

def test_get_audit_log():
    """Testa busca de log específico."""
    print_separator("TESTE: Buscar log específico")
    
    try:
        # Usar log ID 1
        response = requests.get(f"{API_BASE}/logs/1")
        print_response(response, "Log específico")
        return response.status_code in [200, 404]
    except Exception as e:
        print(f"Erro ao buscar log específico: {e}")
        return False

def test_get_audit_statistics():
    """Testa obtenção de estatísticas gerais."""
    print_separator("TESTE: Obter estatísticas gerais")
    
    try:
        response = requests.get(f"{API_BASE}/statistics")
        print_response(response, "Estatísticas gerais")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao obter estatísticas: {e}")
        return False

def test_get_table_statistics():
    """Testa obtenção de estatísticas por tabela."""
    print_separator("TESTE: Obter estatísticas por tabela")
    
    try:
        response = requests.get(f"{API_BASE}/statistics/tables")
        print_response(response, "Estatísticas por tabela")
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao obter estatísticas por tabela: {e}")
        return False

def test_get_recent_activity():
    """Testa obtenção de atividade recente."""
    print_separator("TESTE: Obter atividade recente")
    
    try:
        response = requests.get(f"{API_BASE}/activity/recent")
        print_response(response, "Atividade recente (24h)")
        
        # Testar com período customizado
        response2 = requests.get(f"{API_BASE}/activity/recent?hours=48")
        print_response(response2, "Atividade recente (48h)")
        
        return response.status_code == 200 and response2.status_code == 200
    except Exception as e:
        print(f"Erro ao obter atividade recente: {e}")
        return False

def test_invalid_endpoints():
    """Testa endpoints inválidos."""
    print_separator("TESTE: Endpoints inválidos")
    
    tests = [
        ("GET log inexistente", f"{API_BASE}/logs/99999"),
        ("GET tabela inexistente", f"{API_BASE}/logs/table/tabela_inexistente"),
        ("GET usuário inexistente", f"{API_BASE}/logs/user/99999"),
        ("GET ação inválida", f"{API_BASE}/logs/action/INVALID_ACTION"),
        ("GET período sem parâmetros", f"{API_BASE}/logs/period"),
        ("GET rota inexistente", f"{API_BASE}/invalid-route")
    ]
    
    results = []
    for test_name, url in tests:
        try:
            response = requests.get(url)
            print(f"\n{test_name}: Status {response.status_code}")
            results.append(response.status_code in [400, 404, 500])
        except Exception as e:
            print(f"Erro em {test_name}: {e}")
            results.append(False)
    
    return all(results)

def test_audit_structure():
    """Testa estrutura dos logs de auditoria."""
    print_separator("TESTE: Estrutura dos logs")
    
    try:
        response = requests.get(f"{API_BASE}/logs?limit=10")
        if response.status_code == 200:
            data = response.json()
            logs = data.get("data", [])
            
            print(f"\nTotal de logs encontrados: {len(logs)}")
            
            if logs:
                # Analisar primeiro log
                first_log = logs[0]
                print("Estrutura do primeiro log:")
                for key, value in first_log.items():
                    print(f"  {key}: {type(value).__name__}")
                
                # Verificar campos obrigatórios
                required_fields = ["id", "table_name", "record_id", "action", "created_at"]
                missing_fields = [field for field in required_fields if field not in first_log]
                
                if missing_fields:
                    print(f"⚠️  Campos obrigatórios ausentes: {missing_fields}")
                    return False
                else:
                    print("✅ Todos os campos obrigatórios presentes")
            
            return True
        
        return response.status_code == 200
    except Exception as e:
        print(f"Erro ao testar estrutura: {e}")
        return False

def test_statistics_structure():
    """Testa estrutura das estatísticas."""
    print_separator("TESTE: Estrutura das estatísticas")
    
    try:
        # Testar estatísticas gerais
        response = requests.get(f"{API_BASE}/statistics")
        if response.status_code == 200:
            data = response.json()
            stats = data.get("data", {})
            
            print("Estatísticas gerais:")
            for key, value in stats.items():
                print(f"  {key}: {value}")
        
        # Testar estatísticas por tabela
        response2 = requests.get(f"{API_BASE}/statistics/tables")
        if response2.status_code == 200:
            data2 = response2.json()
            table_stats = data2.get("data", [])
            
            print(f"\nEstatísticas de {len(table_stats)} tabelas:")
            for table_stat in table_stats[:3]:  # Mostrar apenas as 3 primeiras
                print(f"  {table_stat.get('table_name')}: {table_stat.get('total_logs')} logs")
        
        return response.status_code == 200 and response2.status_code == 200
    except Exception as e:
        print(f"Erro ao testar estrutura de estatísticas: {e}")
        return False

def test_pagination_functionality():
    """Testa funcionalidade de paginação."""
    print_separator("TESTE: Funcionalidade de paginação")
    
    try:
        # Primeira página
        response1 = requests.get(f"{API_BASE}/logs?limit=5&offset=0")
        
        # Segunda página
        response2 = requests.get(f"{API_BASE}/logs?limit=5&offset=5")
        
        if response1.status_code == 200 and response2.status_code == 200:
            data1 = response1.json()
            data2 = response2.json()
            
            logs1 = data1.get("data", [])
            logs2 = data2.get("data", [])
            
            print(f"Primeira página: {len(logs1)} logs")
            print(f"Segunda página: {len(logs2)} logs")
            
            # Verificar se são logs diferentes
            if logs1 and logs2:
                ids1 = [log.get("id") for log in logs1]
                ids2 = [log.get("id") for log in logs2]
                overlap = set(ids1) & set(ids2)
                
                if overlap:
                    print(f"⚠️  Sobreposição de IDs entre páginas: {overlap}")
                    return False
                else:
                    print("✅ Paginação funcionando corretamente")
            
            return True
        
        return False
    except Exception as e:
        print(f"Erro ao testar paginação: {e}")
        return False

def main():
    """Executa todos os testes."""
    print_separator("INICIANDO TESTES DA API DE AUDITORIA")
    print(f"URL Base: {API_BASE}")
    print(f"Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    
    results = []
    
    # Testes básicos de listagem
    results.append(("Listar logs", test_list_audit_logs()))
    results.append(("Listar com paginação", test_list_logs_with_pagination()))
    results.append(("Listar por tabela", test_list_logs_by_table()))
    results.append(("Listar por registro", test_list_logs_by_record()))
    results.append(("Listar por usuário", test_list_logs_by_user()))
    results.append(("Listar por ação", test_list_logs_by_action()))
    results.append(("Listar por período", test_list_logs_by_period()))
    results.append(("Buscar log específico", test_get_audit_log()))
    
    # Testes de estatísticas
    results.append(("Estatísticas gerais", test_get_audit_statistics()))
    results.append(("Estatísticas por tabela", test_get_table_statistics()))
    results.append(("Atividade recente", test_get_recent_activity()))
    
    # Testes de estrutura e funcionalidade
    results.append(("Estrutura dos logs", test_audit_structure()))
    results.append(("Estrutura das estatísticas", test_statistics_structure()))
    results.append(("Funcionalidade de paginação", test_pagination_functionality()))
    
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
        print("\n🎉 Todos os testes passaram! A API de auditoria está funcionando corretamente.")
        sys.exit(0)
    else:
        print(f"\n⚠️  {total-passed} teste(s) falharam. Verifique os logs acima.")
        sys.exit(1)

if __name__ == "__main__":
    main()
