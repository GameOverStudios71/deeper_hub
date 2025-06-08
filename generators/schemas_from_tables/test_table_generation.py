#!/usr/bin/env python3
"""
Script de teste para verificar a geração de SQL com constraints UNIQUE.
"""

import mysql.connector
import sys
import os

# Adicionar o diretório atual ao path para importar o generator
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from generator import (
    conectar_mysql, 
    obter_campos, 
    obter_chave_primaria, 
    obter_constraints_unique,
    obter_relacoes,
    gerar_create_table_sql
)

def testar_geracao_sql(nome_tabela=None):
    """Testa a geração de SQL CREATE TABLE com constraints UNIQUE."""
    
    try:
        # Conectar ao MySQL
        conexao = conectar_mysql()
        print("✅ Conexão com MySQL estabelecida com sucesso.")
        
        # Se não especificou tabela, pegar a primeira que tem constraints UNIQUE
        if not nome_tabela:
            cursor = conexao.cursor()
            cursor.execute("SHOW TABLES")
            tabelas = [tabela[0] for tabela in cursor.fetchall()]
            
            # Procurar uma tabela com constraints UNIQUE
            for tabela in tabelas:
                constraints = obter_constraints_unique(conexao, tabela)
                if constraints:
                    nome_tabela = tabela
                    print(f"🎯 Usando tabela '{nome_tabela}' que possui constraints UNIQUE.")
                    break
            
            if not nome_tabela:
                nome_tabela = tabelas[0] if tabelas else None
                print(f"⚠️  Nenhuma tabela com UNIQUE encontrada. Usando '{nome_tabela}'.")
        
        if not nome_tabela:
            print("❌ Nenhuma tabela disponível para teste.")
            return
        
        print(f"\n🔍 Analisando tabela: {nome_tabela}")
        print("=" * 60)
        
        # Obter informações da tabela
        campos = obter_campos(conexao, nome_tabela)
        chaves_primarias = obter_chave_primaria(conexao, nome_tabela)
        constraints_unique = obter_constraints_unique(conexao, nome_tabela)
        relacoes = obter_relacoes(conexao)
        
        print(f"📊 Campos da tabela:")
        for campo in campos:
            nome, tipo, nulo, chave, default, extra = campo
            print(f"   - {nome}: {tipo} {nulo} {chave} {default} {extra}")
        
        print(f"\n🔑 Chaves primárias: {chaves_primarias}")
        
        if constraints_unique:
            print(f"\n🔒 Constraints UNIQUE:")
            for constraint_name, colunas in constraints_unique:
                print(f"   - {constraint_name}: {colunas}")
        else:
            print(f"\n🔒 Nenhuma constraint UNIQUE encontrada.")
        
        # Gerar SQL CREATE TABLE
        print(f"\n🛠️  Gerando SQL CREATE TABLE...")
        sql = gerar_create_table_sql(nome_tabela, campos, relacoes, chaves_primarias, constraints_unique)
        
        print(f"\n📝 SQL Gerado:")
        print("-" * 60)
        print(sql)
        print("-" * 60)
        
        # Verificar se as constraints UNIQUE estão no SQL
        if constraints_unique:
            print(f"\n✅ Verificação de constraints UNIQUE no SQL:")
            for constraint_name, colunas in constraints_unique:
                colunas_str = ', '.join(colunas)
                if f"UNIQUE ({colunas_str})" in sql:
                    print(f"   ✅ {constraint_name}: {colunas} - ENCONTRADA")
                else:
                    print(f"   ❌ {constraint_name}: {colunas} - NÃO ENCONTRADA")
        
        print(f"\n✅ Teste de geração concluído!")
        
    except mysql.connector.Error as err:
        print(f"❌ Erro ao conectar ao MySQL: {err}")
    except Exception as e:
        print(f"❌ Erro durante o teste: {e}")
        import traceback
        traceback.print_exc()
    finally:
        if 'conexao' in locals() and conexao.is_connected():
            conexao.close()
            print("🔌 Conexão com MySQL encerrada.")

if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description='Testa geração de SQL com constraints UNIQUE')
    parser.add_argument('--table', type=str, help='Nome da tabela para testar (opcional)')
    args = parser.parse_args()
    
    print("🧪 Testando geração de SQL CREATE TABLE com constraints UNIQUE...")
    testar_geracao_sql(args.table)
