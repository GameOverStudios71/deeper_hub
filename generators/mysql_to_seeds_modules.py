import os
import mysql.connector
from datetime import datetime, date

# Função para conectar ao MySQL
def conectar_mysql(host='localhost', usuario='root', senha='', banco='una'):
    conexao = mysql.connector.connect(
        host=host,
        user=usuario,
        password=senha,
        database=banco
    )
    return conexao

# Função para obter informações das tabelas
def obter_tabelas(conexao):
    cursor = conexao.cursor()
    cursor.execute("SHOW TABLES")
    tabelas = [tabela[0] for tabela in cursor.fetchall()]
    return tabelas

# Função para limpar diretórios de migrations e schemas
def limpar_diretorios(args):
    # Cria diretórios se não existirem
    migrations_dir = os.path.join("../lib", "deeper_hub", "core", "data", "migrations")
    seeds_dir = os.path.join("../lib", "deeper_hub", "core", "data", "seeds")
    
    # Criar diretórios se não existirem
    for dir_path in [migrations_dir, seeds_dir]:
        if not os.path.exists(dir_path):
            os.makedirs(dir_path)
    
    # Limpar diretório seeds somente se --nodeletefolder não estiver definido
    if not args.nodeletefolder:
        for arquivo in os.listdir(seeds_dir):
            caminho_arquivo = os.path.join(seeds_dir, arquivo)
            if os.path.isfile(caminho_arquivo):
                try:
                    os.unlink(caminho_arquivo)
                except PermissionError:
                    print(f"Aviso: Não foi possível excluir {caminho_arquivo} - arquivo em uso")
                else:
                    print(f"Arquivo removido: {caminho_arquivo}")

# Função para gerar seeds das tabelas
def criar_seeds(conexao, tabela):
    cursor = conexao.cursor()
    cursor.execute(f"SELECT * FROM {tabela}")
    dados = cursor.fetchall()
    colunas = [desc[0] for desc in cursor.description]

    if not dados:
        print(f"Tabela {tabela} está vazia. Seed não será criado.")
        return

    linhas = []
    for registro in dados:
        campos = []
        for i, valor in enumerate(registro):
            if valor is None:
                campos.append("nil")
            elif isinstance(valor, (datetime, date)):
                campos.append(f"~N[{valor.strftime('%Y-%m-%d %H:%M:%S')}]")
            elif isinstance(valor, str):
                campos.append(f"\"{valor.replace('\"', '\\\"')}\"")
            elif isinstance(valor, bool):
                campos.append("true" if valor else "false")
            elif isinstance(valor, (int, float)):
                campos.append(str(valor))
            else:
                campos.append(f"\"{str(valor).replace('\"', '\\\"')}\"")
        linha = "[]" if not campos else "[" + ", ".join(campos) + "]"
        linhas.append(linha)
    
    # Gerar o conteúdo do arquivo de seed
    conteudo = f"""defmodule DeeperHub.Core.Data.Seeds.Seed{tabela.title().replace('_', '')} do
  @doc \"\"\"
  Executa o seed para a tabela {tabela}.
  \"\"\"
  def run do
    require DeeperHub.Core.Logger
    data = [
      {',\n      '.join(linhas)}
    ]
    
    table_name = \"{tabela}\"
    columns = { "[" + ", ".join([f'\"{c}\"' for c in colunas]) + "]" }
    placeholders = Enum.map(1..length(columns), fn _i -> \"?\" end) |> Enum.join(\", \")
    sql = \"INSERT INTO #{{table_name}} (#{{Enum.join(columns, \", \")}}) VALUES (#{{placeholders}})\"
    
    Enum.each(data, fn record ->
      case DeeperHub.Core.Data.Repo.execute(sql, record) do
        {{ :ok, result }} ->
          DeeperHub.Core.Logger.info(\"Registro inserido com sucesso na tabela #{{table_name}}: #{{inspect(result)}}\")
        {{ :error, reason }} ->
          DeeperHub.Core.Logger.warning(\"Erro ao inserir registro na tabela #{{table_name}}: #{{inspect(reason)}}\", [])
      end
    end)
    
    data
  end
end"""
    
    # Escrever o arquivo de seed
    seeds_dir = os.path.join("../lib", "deeper_hub", "core", "data", "seeds")
    seed_path = os.path.join(seeds_dir, f"seed_{tabela}.ex")
    try:
        with open(seed_path, 'w', encoding='utf-8') as arquivo:
            arquivo.write(conteudo)
        print(f"Seed criado: {seed_path}")
    except Exception as e:
        print(f"Erro ao criar seed {seed_path}: {e}")

# Função para atualizar o registro de migrações
def atualizar_registro_migracoes(tabelas_com_seed=[]):
    # Deixar vazio, já que só vamos gerar seeds
    pass

# Função para criar o gerenciador de seeds
def criar_seed_manager(tabelas_com_seed):
    if not tabelas_com_seed:
        return

    modulos_seed = [f"DeeperHub.Core.Data.Seeds.Seed{tabela.title().replace('_', '')}" for tabela in tabelas_com_seed]
    lista_seeds = "\n    ".join([f"{modulo}," for modulo in modulos_seed])

    conteudo = f"""# Lista de todos os seeds
seeds = [
    {lista_seeds}
]"""
    
    # Escrever o arquivo
    seeds_dir = os.path.join("../lib", "deeper_hub", "core", "data", "seeds")
    manager_path = os.path.join(seeds_dir, "seeds.txt")
    try:
        with open(manager_path, 'w', encoding='utf-8') as arquivo:
            arquivo.write(conteudo)
        print(f"Lista de seeds criada: {manager_path}")
    except Exception as e:
        print(f"Erro ao criar lista de seeds {manager_path}: {e}")

if __name__ == "__main__":
    import argparse
    
    # Configurar o parser de argumentos
    parser = argparse.ArgumentParser(description='Gerador de seeds para DeeperHub')
    parser.add_argument('--table', type=str, help='Nome da tabela específica para gerar seed (opcional)')
    parser.add_argument('--nodeletefolder', action="store_true", help='Não apagar o diretório de seeds antes de gerar novos seeds')
    args = parser.parse_args()
    
    # Conectar ao MySQL
    try:
        conexao = conectar_mysql()
        print("Conexão com MySQL estabelecida com sucesso.")
        
        # Limpar diretórios
        limpar_diretorios(args)
        print("Diretórios limpos com sucesso.")
        
        # Obter tabelas
        all_tabelas = obter_tabelas(conexao)
        if args.table:
            tabela_especifica = args.table.lower()
            tabelas = [tabela for tabela in all_tabelas if tabela.lower() == tabela_especifica]
            if not tabelas:
                print(f"Erro: Tabela '{args.table}' não encontrada no banco de dados.")
                exit(1)
            print(f"Gerando seed apenas para a tabela: {tabelas[0]}")
        else:
            tabelas = all_tabelas
            print(f"Tabelas encontradas: {', '.join(tabelas)}")
        
        # Lista para armazenar tabelas que têm seeds
        tabelas_com_seed = []
        
        # Processar cada tabela individualmente (criar apenas seeds)
        for tabela in tabelas:
            print(f"Processando tabela: {tabela}")
            
            # Verificar se a tabela tem dados para seed
            cursor = conexao.cursor()
            cursor.execute(f"SELECT COUNT(*) FROM {tabela}")
            count = cursor.fetchone()[0]
            
            # Criar seed para esta tabela (se tiver dados)
            if count > 0:
                criar_seeds(conexao, tabela)
                tabelas_com_seed.append(tabela)
            
            print(f"    + {tabela} [OK]")
        
        # Criar gerenciador de seeds se houver tabelas com seed
        if tabelas_com_seed:
            # Se estiver gerando para uma tabela específica, verificar seeds existentes
            if args.table:
                seeds_dir = os.path.join("../lib", "deeper_hub", "core", "data", "seeds")
                existing_seeds = [f.replace("seed_", "").replace(".ex", "") for f in os.listdir(seeds_dir) 
                                if f.startswith("seed_") and f != "seeds_registry.ex" and os.path.isfile(os.path.join(seeds_dir, f))]
                
                # Adicionar as tabelas com seed que não estão na lista
                for tabela in tabelas_com_seed:
                    if tabela not in existing_seeds:
                        existing_seeds.append(tabela)
            
            criar_seed_manager(existing_seeds if args.table else tabelas_com_seed)
            print("Gerenciador de seeds criado com sucesso.")
        
        print("Processo concluído com sucesso!")
        
    except mysql.connector.Error as err:
        print(f"Erro ao conectar ao MySQL: {err}")
    finally:
        if 'conexao' in locals() and conexao.is_connected():
            conexao.close()
            print("Conexão com MySQL encerrada.")