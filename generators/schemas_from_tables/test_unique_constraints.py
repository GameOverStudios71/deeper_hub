#!/usr/bin/env python3
"""
Script de teste para verificar se as constraints UNIQUE estão sendo detectadas corretamente.
"""

import mysql.connector
import sys
import os

# Adicionar o diretório atual ao path para importar o generator
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from generator import conectar_mysql, obter_constraints_unique, obter_chave_primaria

def testar_constraints():
    """Testa a detecção de constraints UNIQUE em algumas tabelas."""
    
    try:
        # Conectar ao MySQL
        conexao = conectar_mysql()
        print("✅ Conexão com MySQL estabelecida com sucesso.")
        
        # Obter lista de tabelas para teste
        cursor = conexao.cursor()
        cursor.execute("SHOW TABLES")
        tabelas = [tabela[0] for tabela in cursor.fetchall()]
        
        print(f"\n📋 Encontradas {len(tabelas)} tabelas no banco de dados.")
        
        # Testar algumas tabelas (primeiras 5)
        tabelas_teste = tabelas[:5]
        
        for tabela in tabelas_teste:
            print(f"\n🔍 Analisando tabela: {tabela}")
            print("-" * 50)
            
            # Obter chaves primárias
            chaves_primarias = obter_chave_primaria(conexao, tabela)
            print(f"🔑 Chaves primárias: {chaves_primarias}")
            
            # Obter constraints UNIQUE
            constraints_unique = obter_constraints_unique(conexao, tabela)
            if constraints_unique:
                print(f"🔒 Constraints UNIQUE encontradas:")
                for constraint_name, colunas in constraints_unique:
                    print(f"   - {constraint_name}: {colunas}")
            else:
                print("🔒 Nenhuma constraint UNIQUE encontrada.")
            
            # Mostrar estrutura da tabela para comparação
            cursor.execute(f"DESCRIBE {tabela}")
            campos = cursor.fetchall()
            print(f"📊 Estrutura da tabela:")
            for campo in campos:
                nome, tipo, nulo, chave, default, extra = campo
                print(f"   - {nome}: {tipo} {'(PK)' if chave == 'PRI' else ''} {'(UNI)' if chave == 'UNI' else ''}")
        
        print(f"\n✅ Teste concluído com sucesso!")
        
    except mysql.connector.Error as err:
        print(f"❌ Erro ao conectar ao MySQL: {err}")
    except Exception as e:
        print(f"❌ Erro durante o teste: {e}")
    finally:
        if 'conexao' in locals() and conexao.is_connected():
            conexao.close()
            print("🔌 Conexão com MySQL encerrada.")

if __name__ == "__main__":
    print("🧪 Testando detecção de constraints UNIQUE...")
    testar_constraints()
