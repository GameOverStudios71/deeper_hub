#!/usr/bin/env python3
"""
Script de teste específico para a tabela sys_form_inputs que estava dando erro com a coluna 'values'.
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
    mapear_nome_coluna
)

def testar_sys_form_inputs():
    """Testa especificamente a tabela sys_form_inputs."""
    
    try:
        # Conectar ao MySQL
        conexao = conectar_mysql()
        print("✅ Conexão com MySQL estabelecida com sucesso.")
        
        tabela = "sys_form_inputs"
        print(f"\n🔍 Testando tabela: {tabela}")
        print("=" * 60)
        
        # Verificar se a tabela existe
        cursor = conexao.cursor()
        cursor.execute("SHOW TABLES LIKE 'sys_form_inputs'")
        if not cursor.fetchone():
            print("❌ Tabela sys_form_inputs não encontrada!")
            return
        
        # Obter informações da tabela
        campos = obter_campos(conexao, tabela)
        chaves_primarias = obter_chave_primaria(conexao, tabela)
        constraints_unique = obter_constraints_unique(conexao, tabela)
        relacoes = obter_relacoes(conexao)
        
        print(f"📊 Estrutura da tabela sys_form_inputs:")
        colunas_com_problema = []
        for i, campo in enumerate(campos):
            nome, tipo, nulo, chave, default, extra = campo
            nome_mapeado = mapear_nome_coluna(nome)
            if nome != nome_mapeado:
                colunas_com_problema.append((nome, nome_mapeado))
                print(f"   {i+1}. {nome} -> {nome_mapeado}: {tipo} {nulo} {chave} ⚠️  RENOMEADA")
            else:
                print(f"   {i+1}. {nome}: {tipo} {nulo} {chave}")
        
        if colunas_com_problema:
            print(f"\n⚠️  Colunas que serão renomeadas:")
            for original, mapeada in colunas_com_problema:
                print(f"   - '{original}' -> '{mapeada}'")
        else:
            print(f"\n✅ Nenhuma coluna precisa ser renomeada.")
        
        print(f"\n🔑 Chaves primárias: {chaves_primarias}")
        
        if constraints_unique:
            print(f"\n🔒 Constraints UNIQUE:")
            for constraint_name, colunas in constraints_unique:
                print(f"   - {constraint_name}: {colunas}")
        else:
            print(f"\n🔒 Nenhuma constraint UNIQUE encontrada.")
        
        # Gerar SQL CREATE TABLE
        print(f"\n🛠️  Gerando SQL CREATE TABLE...")
        sql = gerar_create_table_sql(tabela, campos, relacoes, chaves_primarias, constraints_unique)
        
        print(f"\n📝 SQL Gerado:")
        print("-" * 60)
        print(sql)
        print("-" * 60)
        
        # Verificar se a coluna 'values' foi renomeada no SQL
        if "col_values" in sql:
            print("✅ Coluna 'values' foi corretamente renomeada para 'col_values'")
        elif "values" in sql.lower():
            print("❌ Coluna 'values' ainda aparece no SQL sem renomeação")
        else:
            print("ℹ️  Coluna 'values' não encontrada na tabela")
        
        # Verificar dados existentes
        cursor.execute(f"SELECT COUNT(*) FROM {tabela}")
        count = cursor.fetchone()[0]
        print(f"\n📈 Registros na tabela: {count}")
        
        if count > 0:
            # Mostrar estrutura das colunas para verificar se 'values' existe
            cursor.execute(f"DESCRIBE {tabela}")
            colunas_desc = cursor.fetchall()
            print(f"\n📋 Colunas da tabela:")
            for col in colunas_desc:
                nome_col = col[0]
                if nome_col.lower() == 'values':
                    print(f"   🎯 {nome_col} (PALAVRA RESERVADA - será renomeada)")
                else:
                    print(f"   - {nome_col}")
        
        print(f"\n✅ Teste da tabela sys_form_inputs concluído!")
        
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

def testar_mapeamento_colunas():
    """Testa a função de mapeamento de nomes de colunas."""
    
    print("🧪 Testando mapeamento de nomes de colunas...")
    
    # Testar algumas palavras reservadas
    colunas_teste = [
        "id", "name", "values", "type", "order", "group", "select", 
        "where", "from", "table", "index", "unique", "primary"
    ]
    
    print("\n📋 Resultados do mapeamento:")
    for coluna in colunas_teste:
        mapeada = mapear_nome_coluna(coluna)
        if coluna != mapeada:
            print(f"   ⚠️  '{coluna}' -> '{mapeada}' (palavra reservada)")
        else:
            print(f"   ✅ '{coluna}' -> '{mapeada}' (sem alteração)")

if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description='Testa a tabela sys_form_inputs')
    parser.add_argument('--mapping', action='store_true', help='Testar apenas mapeamento de colunas')
    args = parser.parse_args()
    
    if args.mapping:
        testar_mapeamento_colunas()
    else:
        print("🔍 Testando tabela sys_form_inputs...")
        testar_sys_form_inputs()
        print("\n" + "="*60)
        testar_mapeamento_colunas()
