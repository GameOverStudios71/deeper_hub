import os
import re

# Diretorios de entrada e saida
php_dir = r"C:\\Users\\Admin\\deeper_hub\\una\\"
elixir_dir = r"C:\\Users\\Admin\\deeper_hub\\lib\\deeper_hub\\una\\"

# Função para verificar se o diretório deve ser ignorado
def deve_ignorar_diretorio(diretorio):
    return bool(re.search(r'periodic|scripts|samples|russian|mailchimp|english|developer|install|upgrade|xero|api|artificer|azure|cas_|charts|chat|datafox|decorous|dolphin|drupal|editor|elasticsearch|facebook|fontawesome|froala|google|intercom|linkedin|lucid|mailchip|nexus|oauth2|ocean|okta|opencv|plyr|profiler|protean|se_migration|shopify|smtpmailer|snipcart|stripe_connect|twitter|una_connect|xero|update', diretorio, re.IGNORECASE))

# Funcao para criar diretorios necessarios
def ensure_directory(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

# Funcao para extrair metodos e assinaturas de um arquivo PHP e gerar arquivo Elixir
def parse_php_file(file_path, elixir_base_dir):
    relative_path = os.path.relpath(file_path, php_dir)
    elixir_file_path = os.path.join(elixir_base_dir, os.path.splitext(relative_path)[0] + ".ex")
    elixir_dir_path = os.path.dirname(elixir_file_path)
    ensure_directory(elixir_dir_path)
    
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
        
        # Encontrar todas as declarações de classes e interfaces
        class_matches = list(re.finditer(r'(class|interface)\s+(\w+)\s*(?:extends\s+\w+)?\s*(?:implements\s+\w+(?:\s*,\s*\w+)*)?\s*{', content))
        if not class_matches:
            return

        # Criar um diretório para protocolos se houver interfaces
        protocol_dir = os.path.join(elixir_base_dir, "../protocols")
        ensure_directory(protocol_dir)

        for idx, class_match in enumerate(class_matches):
            type_declaration = class_match.group(1)
            class_name = class_match.group(2)
            class_start = class_match.end()
            # Encontrar o fim da classe ou interface
            brace_count = 1
            class_end = class_start
            for char in content[class_start:]:
                if char == '{':
                    brace_count += 1
                elif char == '}':
                    brace_count -= 1
                    if brace_count == 0:
                        break
                class_end += 1
            class_content = content[class_start:class_end]
            # Encontrar todos os métodos dentro da classe ou interface
            method_matches = re.finditer(r'(?:public|protected|private)?\s*(static)?\s*function\s+(\w+)\s*\(([^)]*)\)\s*(?::\s*(\w+))?\s*(?:{|$|;)', class_content)
            methods = []
            for method_match in method_matches:
                method_name = method_match.group(2)
                parameters = method_match.group(3).strip()
                return_type = method_match.group(4) if len(method_match.groups()) > 3 else ''
                
                # Converter para formato Elixir
                elixir_method_name = method_name.replace(' ', '_')
                if elixir_method_name == '__construct':
                    elixir_method_name = 'init'
                # Garantir que o nome da função comece com letra minúscula ou underscore
                if elixir_method_name and elixir_method_name[0].isupper():
                    elixir_method_name = elixir_method_name[0].lower() + elixir_method_name[1:]
                # Manter o formato original do PHP, sem converter para snake_case
                elixir_parameters = parameters.replace(' ', '').replace('$', '') if parameters else ''
                elixir_return_type = return_type if return_type else 'any'
                
                # Extrair o conteúdo do método (se houver)
                method_start = method_match.start()
                brace_count = 0
                method_end = method_start
                in_method = False
                method_content = ""
                commented_content = ""
                if type_declaration == 'class':
                    for i, char in enumerate(class_content[method_start:], start=method_start):
                        if char == '{':
                            brace_count += 1
                            in_method = True
                        elif char == '}':
                            brace_count -= 1
                            if brace_count == 0 and in_method:
                                method_end = i + 1
                                break
                    method_content = class_content[method_start:method_end]
                    # Verificar se o método está vazio (sem conteúdo além de chaves)
                    if '{' in method_content:
                        method_body = method_content[method_content.find('{')+1:method_content.rfind('}')].strip()
                        if not method_body:
                            continue  # Ignorar métodos vazios
                    # Formatar o conteúdo do método como comentário
                    method_content_lines = method_content.splitlines()
                    commented_content = '\n'.join(['    # ' + line for line in method_content_lines])

                methods.append({
                    'name': elixir_method_name,
                    'parameters': elixir_parameters,
                    'return_type': elixir_return_type,
                    'original_name': method_name,
                    'content': commented_content
                })

            # Gerar conteúdo do arquivo Elixir
            if type_declaration == 'interface':
                elixir_module_name = "DeeperHub.Inc.Protocols." + class_name
                elixir_file_path = os.path.join(protocol_dir, class_name + ".ex")
                elixir_content = '''
defprotocol ''' + elixir_module_name + ''' do
  @moduledoc """
  Protocolo gerado automaticamente a partir da interface PHP ''' + file_path.replace('\\', '/') + '''
  """
'''
                for method in methods:
                    elixir_content += '''
  @doc """
  Funcao correspondente ao metodo da interface PHP ''' + method['original_name'] + '''

  ## Parametros
    - ''' + (method['parameters'] if method['parameters'] else 'nenhum') + '''

  ## Retorno
    - ''' + method['return_type'] + '''
  """
  def ''' + method['name'] + '''(struct''' + (', ' + method['parameters'] if method['parameters'] else '') + ''')
'''
                elixir_content += '''
end
'''
            else:
                elixir_module_name = "DeeperHub.Inc.Classes." + class_name
                elixir_content = '''
defmodule ''' + elixir_module_name + ''' do
  @moduledoc """
  Modulo gerado automaticamente a partir do arquivo PHP ''' + file_path.replace('\\', '/') + '''
  """
'''
                for method in methods:
                    elixir_content += '''
  @doc """
  Funcao correspondente ao metodo PHP ''' + method['original_name'] + '''

  ## Parametros
    - ''' + (method['parameters'] if method['parameters'] else 'nenhum') + '''

  ## Retorno
    - ''' + method['return_type'] + '''
  """
  def ''' + method['name'] + '''(%{}) do
    # TODO: Implementacao futura
    ''' + method['content'] + '''
    :ok
  end
'''
                elixir_content += '''
end
'''

            # Apagar o arquivo existente, se houver
            if os.path.exists(elixir_file_path):
                os.remove(elixir_file_path)
            
            with open(elixir_file_path, 'w', encoding='utf-8') as elixir_file:
                elixir_file.write(elixir_content)
            
            print(f"Gerado: {elixir_file_path}")

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
