import os
import re

# Diretorios de entrada e saida
php_dir = r"C:\\Users\\Admin\\deeper_hub\\una\\"
elixir_dir = r"C:\\Users\\Admin\\deeper_hub\\lib\\deeper_hub\\services\\"

def to_snake_case(name):
    name = name.lstrip('_')
    result = ''
    for i, char in enumerate(name):
        if i == 0:
            result += char.lower()
        elif i > 0 and char.isupper():
            result += char
        else:
            result += char.lower()
    return result

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

# Função para limpar texto de documentação, removendo ou escapando caracteres inválidos
def clean_docstring(text):
    if text is None:
        return ""
    # Substitui caracteres de escape Unicode inválidos ou problemáticos
    text = text.encode('ascii', 'ignore').decode('ascii')
    # Escapa caracteres problemáticos como @
    text = text.replace('@', '\\@')
    # Corrige a indentação das linhas para corresponder ao nível do heredoc
    lines = text.splitlines()
    cleaned_lines = ["  " + line for line in lines]
    return "\n".join(cleaned_lines).replace('"""', '"')

# Funcao para extrair metodos e assinaturas de um arquivo PHP e gerar arquivo Elixir
def parse_php_file(file_path, elixir_base_dir):
    with open(file_path, 'r', encoding='utf-8', errors='ignore') as file:
        content = file.read()

    # Extrair classes ou interfaces
    class_pattern = r'(class|interface)\s+(\w+)\s*(?:extends\s+(\w+))?\s*(?:implements\s+([\w,\s]+))?\s*{([\s\S]*?)}'
    class_matches = re.finditer(class_pattern, content)
    for class_match in class_matches:
        type_declaration = class_match.group(1)
        class_name = class_match.group(2)
        extends = class_match.group(3) if class_match.group(3) else None
        implements = class_match.group(4).split(',') if class_match.group(4) else []
        implements = [imp.strip() for imp in implements if imp.strip()]
        class_content = class_match.group(5)

        # Extrair documentação da classe
        class_start = class_match.start()
        class_docstring = extract_docstring(content[:class_start])
        class_docstring = clean_docstring(class_docstring)

        # Extrair métodos
        methods = []
        method_pattern = r'(?:public|protected|private)?\s*(static)?\s*function\s+(\w+)\s*\(([^)]*)\)\s*(?::\s*(\w+))?\s*(?:{([\s\S]*?)}|;)'
        method_matches = re.finditer(method_pattern, class_content)
        for method_match in method_matches:
            is_static = bool(method_match.group(1))
            method_name = to_snake_case(method_match.group(2))
            params = method_match.group(3).strip()
            return_type = method_match.group(4) if method_match.group(4) else None
            method_start = method_match.start()
            method_body = method_match.group(5) if method_match.group(5) else ""
            method_docstring = extract_docstring(class_content[:method_start])
            method_docstring = clean_docstring(method_docstring)

            # Indentar corpo do método como comentário
            if method_body:
                method_body_lines = method_body.splitlines()
                indented_body = "\n".join(["    # " + line.rstrip() for line in method_body_lines if line.strip()])
            else:
                indented_body = "# TODO: Implementacao futura"

            methods.append({
                'name': method_name,
                'params': params,
                'return_type': return_type,
                'body': indented_body,
                'docstring': method_docstring,
                'is_static': is_static
            })

        # Determinar diretório de saída com base no tipo de declaração
        if type_declaration == 'interface':
            output_dir = os.path.join(elixir_base_dir, 'interfaces')
        else:
            output_dir = os.path.join(elixir_base_dir, 'classes')

        os.makedirs(output_dir, exist_ok=True)
        elixir_file_path = os.path.join(output_dir, f"{class_name}.ex")

        # Gerar conteúdo Elixir
        class_name_capitalized = class_name[0].upper() + class_name[1:] if class_name else class_name
        elixir_content = f"defmodule {class_name_capitalized} do\n"
        if class_docstring:
            elixir_content += f"  @moduledoc \"\"\"\n{class_docstring}\n  \"\"\"\n"
        else:
            elixir_content += f"  @moduledoc \"\"\"\nDocumentacao para o modulo {class_name_capitalized}.\n  \"\"\"\n"

        if extends:
            elixir_content += f"  # Herda de {extends}\n"
        if implements:
            elixir_content += f"  # Implementa interfaces: {', '.join(implements)}\n"

        if type_declaration == 'interface':
            for method in methods:
                method_name = method['name']
                if method['docstring']:
                    elixir_content += f"\n  @doc \"\"\"\n  {method['docstring']}\n  \"\"\"\n"
                else:
                    elixir_content += f"\n  @doc \"\"\"\n  Funcao correspondente ao metodo PHP {method_name}\n  \"\"\"\n"
                elixir_content += f"  def {method_name}(_params) do\n    :ok\n  end\n"
        else:
            for method in methods:
                method_name = method['name']
                if method['docstring']:
                    elixir_content += f"\n  @doc \"\"\"\n  {method['docstring']}\n  \"\"\"\n"
                else:
                    elixir_content += f"\n  @doc \"\"\"\n  Funcao correspondente ao metodo PHP {method_name}\n  \"\"\"\n"
                elixir_content += f"  def {method_name}(_params) do\n{method['body']}\n    :ok\n  end\n"

        elixir_content += "end\n"

        with open(elixir_file_path, 'w', encoding='utf-8') as elixir_file:
            elixir_file.write(elixir_content)

        print(f"Arquivo Elixir gerado: {elixir_file_path}")

# Funcao para extrair documentacao de um bloco de código
def extract_docstring(content):
    docstring_pattern = r'/\*\*(.*?)\*/'
    docstring_match = re.search(docstring_pattern, content, re.DOTALL)
    if docstring_match:
        return docstring_match.group(1).strip()
    else:
        return None

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
