import os
import re

# Diretorios de entrada e saida
php_dir = r"C:\\Users\\Admin\\deeper_hub\\una\\"
elixir_dir = r"C:\\Users\\Admin\\deeper_hub\\lib\\deeper_hub\\services\\"

# Função para verificar se o diretório deve ser ignorado
def deve_ignorar_diretorio(diretorio):
    return bool(re.search(r'periodic|scripts|samples|russian|mailchimp|english|developer|install|upgrade|xero|api|artificer|azure|cas_|charts|chat|datafox|decorous|dolphin|drupal|editor|elasticsearch|facebook|fontawesome|froala|google|intercom|linkedin|lucid|mailchip|nexus|oauth2|ocean|okta|opencv|plyr|profiler|protean|se_migration|shopify|smtpmailer|snipcart|stripe_connect|twitter|una_connect|xero|update', diretorio, re.IGNORECASE))

# Funcao para criar diretorios necessarios
def ensure_directory(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

# Funcao para encontrar o fechamento de um bloco de código
def find_matching_brace(content, start):
    brace_count = 1
    for i, char in enumerate(content[start+1:], start+1):
        if char == '{':
            brace_count += 1
        elif char == '}':
            brace_count -= 1
            if brace_count == 0:
                return i
    return -1

# Funcao para indentar linhas de código
def indent_lines(content, prefix):
    lines = content.split('\n')
    indented_lines = ['    ' + prefix + ' ' + line for line in lines]
    return '\n'.join(indented_lines)

# Funcao para extrair metodos e assinaturas de um arquivo PHP e gerar arquivo Elixir
def parse_php_file(file_path, elixir_base_dir):
    relative_path = os.path.relpath(file_path, php_dir)
    elixir_file_path = os.path.join(elixir_base_dir, os.path.splitext(relative_path)[0] + ".ex")
    elixir_dir_path = os.path.dirname(elixir_file_path)
    ensure_directory(elixir_dir_path)
    
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
        
        # Encontrar todas as declarações de classes e interfaces
        class_matches = re.finditer(r'(class|interface)\s+(\w+)\s*(?:extends\s+(\w+))?\s*(?:implements\s+([^\{]*))?\s*\{', content)
        for class_match in class_matches:
            type_declaration = class_match.group(1)
            class_name = class_match.group(2)
            extends = class_match.group(3) if class_match.group(3) else None
            implements = class_match.group(4) if class_match.group(4) else None
            class_start = class_match.start()
            class_end = find_matching_brace(content, class_start)
            class_content = content[class_start:class_end + 1]
            
            # Extrair métodos
            methods = []
            method_matches = re.finditer(r'(?:public|protected|private)?\s*(static)?\s*function\s+(\w+)\s*\(([^)]*)\)\s*(?::\s*(\w+))?\s*(?:{|$|;)', class_content)
            for method_match in method_matches:
                is_static = bool(method_match.group(1))
                method_name = method_match.group(2)
                params = method_match.group(3).strip()
                return_type = method_match.group(4) if method_match.group(4) else None
                method_start = method_match.start()
                method_end = find_matching_brace(class_content, method_start) if '{' in class_content[method_start:method_start+1] else method_start + class_content[method_start:].find(';') + 1
                method_content = class_content[method_start:method_end + 1]
                methods.append({
                    'name': method_name,
                    'params': params,
                    'return_type': return_type,
                    'content': method_content,
                    'is_static': is_static
                })

            # Gerar conteúdo do arquivo Elixir
            if type_declaration == 'interface':
                elixir_module_name = "DeeperHub.Inc.Protocols." + class_name
                elixir_file_path = os.path.join(elixir_dir, class_name + ".ex")
                elixir_content = '''
defprotocol ''' + elixir_module_name + ''' do
  @moduledoc """
  Protocolo gerado automaticamente a partir da interface PHP ''' + file_path + '''
  """
'''
                for method in methods:
                    method_name = method['name']
                    params = method['params'].strip()
                    return_type = method['return_type'] if method['return_type'] else 'any'
                    commented_content = indent_lines(method['content'], '#')
                    elixir_content += '''
  @doc """
  Funcao correspondente ao metodo PHP ''' + method_name + '''

  ## Parametros
    - ''' + params.replace(',', '\n    - ') + '''

  ## Retorno
    - ''' + return_type + '''
  """
  def ''' + method_name + '''(params)
'''
                elixir_content += '''end
'''
            else: # class
                elixir_module_name = "DeeperHub.Inc.Classes." + class_name
                elixir_file_path = os.path.join(elixir_base_dir, os.path.splitext(relative_path)[0] + ".ex")
                elixir_content = '''
defmodule ''' + elixir_module_name + ''' do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP ''' + file_path + '''
  """
'''
                if extends:
                    elixir_content += '''
  # Heranca de ''' + extends + '''
'''
                if implements:
                    elixir_content += '''
  # Implementa interfaces: ''' + implements + '''
'''
                for method in methods:
                    method_name = method['name']
                    params = method['params'].strip()
                    return_type = method['return_type'] if method['return_type'] else 'any'
                    commented_content = indent_lines(method['content'], '#')
                    is_static = method['is_static']
                    elixir_content += '''
  @doc """
  Funcao correspondente ao metodo PHP ''' + method_name + '''

  ## Parametros
    - ''' + params.replace(',', '\n    - ') + '''

  ## Retorno
    - ''' + return_type + '''
  """
  def ''' + method_name + '''(params) do
    # TODO: Implementacao futura
    ''' + commented_content + '''
    :ok
  end
'''
                elixir_content += '''end
'''

            # Escrever conteúdo no arquivo Elixir
            ensure_directory(os.path.dirname(elixir_file_path))
            with open(elixir_file_path, 'w', encoding='utf-8') as elixir_file:
                elixir_file.write(elixir_content)
            print(f"Arquivo Elixir gerado: {elixir_file_path}")

# Funcao principal para processar todos os arquivos PHP
def process_php_files(php_dir, elixir_dir):
    for root, _, files in os.walk(php_dir):
        # Verificar se o diretório atual deve ser ignorado
        if deve_ignorar_diretorio(root):
            continue
        for file in files:
            if file.endswith('.php'):
                file_path = os.path.join(root, file)
                print(f"Processando: {file_path}")
                parse_php_file(file_path, elixir_dir)
    
    print("Processamento concluido. Arquivos Elixir gerados.")

if __name__ == "__main__":
    process_php_files(php_dir, elixir_dir)
