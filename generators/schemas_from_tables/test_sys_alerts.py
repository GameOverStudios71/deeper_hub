#!/usr/bin/env python3
"""
Script de teste específico para a tabela sys_alerts que estava dando erro de UNIQUE CONSTRAINT.
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
    gerar_create_table_sql,
    criar_seeds
)

def analisar_sys_alerts():
    """Analisa especificamente a tabela sys_alerts."""
    
    try:
        # Conectar ao MySQL
        conexao = conectar_mysql()
        print("✅ Conexão com MySQL estabelecida com sucesso.")
        
        tabela = "sys_alerts"
        print(f"\n🔍 Analisando tabela: {tabela}")
        print("=" * 60)
        
        # Verificar se a tabela existe
        cursor = conexao.cursor()
        cursor.execute("SHOW TABLES LIKE 'sys_alerts'")
        if not cursor.fetchone():
            print("❌ Tabela sys_alerts não encontrada!")
            return
        
        # Obter informações da tabela
        campos = obter_campos(conexao, tabela)
        chaves_primarias = obter_chave_primaria(conexao, tabela)
        constraints_unique = obter_constraints_unique(conexao, tabela)
        relacoes = obter_relacoes(conexao)
        
        print(f"📊 Estrutura da tabela sys_alerts:")
        for i, campo in enumerate(campos):
            nome, tipo, nulo, chave, default, extra = campo
            print(f"   {i+1}. {nome}: {tipo} {nulo} {chave} {default} {extra}")
        
        print(f"\n🔑 Chaves primárias: {chaves_primarias}")
        
        if constraints_unique:
            print(f"\n🔒 Constraints UNIQUE:")
            for constraint_name, colunas in constraints_unique:
                print(f"   - {constraint_name}: {colunas}")
        else:
            print(f"\n🔒 Nenhuma constraint UNIQUE encontrada.")
        
        # Verificar dados existentes
        cursor.execute(f"SELECT COUNT(*) FROM {tabela}")
        count = cursor.fetchone()[0]
        print(f"\n📈 Registros na tabela: {count}")
        
        if count > 0:
            # Mostrar alguns registros para análise
            cursor.execute(f"SELECT * FROM {tabela} LIMIT 5")
            registros = cursor.fetchall()
            colunas = [desc[0] for desc in cursor.description]
            
            print(f"\n📋 Primeiros 5 registros:")
            print(f"   Colunas: {colunas}")
            for i, registro in enumerate(registros):
                print(f"   {i+1}. {registro}")
            
            # Verificar se há IDs duplicados
            cursor.execute(f"SELECT id, COUNT(*) as count FROM {tabela} GROUP BY id HAVING count > 1")
            duplicados = cursor.fetchall()
            if duplicados:
                print(f"\n⚠️  IDs duplicados encontrados:")
                for id_dup, count in duplicados:
                    print(f"   - ID {id_dup}: {count} ocorrências")
            else:
                print(f"\n✅ Nenhum ID duplicado encontrado.")
        
        # Gerar SQL CREATE TABLE
        print(f"\n🛠️  Gerando SQL CREATE TABLE...")
        sql = gerar_create_table_sql(tabela, campos, relacoes, chaves_primarias, constraints_unique)
        
        print(f"\n📝 SQL Gerado:")
        print("-" * 60)
        print(sql)
        print("-" * 60)
        
        # Verificar se PRIMARY KEY está correta
        if "PRIMARY KEY" in sql:
            print("✅ PRIMARY KEY encontrada no SQL")
        else:
            print("❌ PRIMARY KEY não encontrada no SQL")
        
        # Verificar se AUTOINCREMENT está presente
        if "AUTOINCREMENT" in sql:
            print("✅ AUTOINCREMENT encontrado no SQL")
        else:
            print("❌ AUTOINCREMENT não encontrado no SQL")
        
        print(f"\n✅ Análise da tabela sys_alerts concluída!")
        
    except mysql.connector.Error as err:
        print(f"❌ Erro ao conectar ao MySQL: {err}")
    except Exception as e:
        print(f"❌ Erro durante a análise: {e}")
        import traceback
        traceback.print_exc()
    finally:
        if 'conexao' in locals() and conexao.is_connected():
            conexao.close()
            print("🔌 Conexão com MySQL encerrada.")

def testar_seed_sys_alerts():
    """Testa a geração de seed para sys_alerts."""
    
    try:
        conexao = conectar_mysql()
        print("✅ Conexão estabelecida para teste de seed.")
        
        tabela = "sys_alerts"
        print(f"\n🌱 Testando geração de seed para: {tabela}")
        
        # Criar seed (vai gerar o arquivo)
        criar_seeds(conexao, tabela)
        
        print(f"✅ Seed gerado com sucesso!")
        
    except Exception as e:
        print(f"❌ Erro ao gerar seed: {e}")
        import traceback
        traceback.print_exc()
    finally:
        if 'conexao' in locals() and conexao.is_connected():
            conexao.close()

if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description='Analisa a tabela sys_alerts')
    parser.add_argument('--seed', action='store_true', help='Gerar seed para sys_alerts')
    args = parser.parse_args()
    
    if args.seed:
        print("🌱 Testando geração de seed para sys_alerts...")
        testar_seed_sys_alerts()
    else:
        print("🔍 Analisando estrutura da tabela sys_alerts...")
        analisar_sys_alerts()
