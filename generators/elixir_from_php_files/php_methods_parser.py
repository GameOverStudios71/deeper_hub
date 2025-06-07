import os
import re
import shutil

# ==============================================================================
# CONFIGURAÇÃO: Verifique e ajuste estes caminhos conforme necessário.
# ==============================================================================

php_dir = r"C:\\Users\\Admin\\deeper_hub\\una\\"
elixir_dir = r"C:\\Users\\Admin\\deeper_hub\\lib\\deeper_hub\\services\\"

# ==============================================================================
# SCRIPT DE MIGRAÇÃO (Nenhuma alteração necessária abaixo)
# ==============================================================================

def delete_output_directories():
    """Apaga o diretório de saída para garantir uma execução limpa."""
    print(f"Atenção: O conteúdo do diretório '{elixir_dir}' será apagado.")
    if os.path.exists(elixir_dir):
        try:
            shutil.rmtree(elixir_dir)
            print(f"Diretório {elixir_dir} apagado com sucesso.")
        except Exception as e:
            print(f"Erro ao apagar diretório {elixir_dir}: {e}")
            exit()
    os.makedirs(elixir_dir, exist_ok=True)

def to_snake_case(name):
    """Converte uma string de camelCase para snake_case (usado para arquivos e parâmetros)."""
    name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    name = re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()
    return name.lstrip('$')

def to_elixir_function_name(name):
    """Converte um nome de método PHP para um nome de função Elixir válido,
       mantendo o camelCase mas garantindo que a primeira letra seja minúscula."""
    if not name:
        return ""
    return name[0].lower() + name[1:]

def convert_php_params_to_elixir(php_params_str):
    """Converte uma string de parâmetros PHP para uma lista de parâmetros Elixir,
       prefixando-os com '_' para evitar warnings de variável não utilizada."""
    if not php_params_str.strip():
        return ""
    params = re.split(r',\s*', php_params_str)
    elixir_params = []
    for param in params:
        match = re.search(r'\$([a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*)', param)
        if match:
            var_name = match.group(1)
            elixir_params.append("_" + to_snake_case(var_name))
            
    return ", ".join(elixir_params)

def deve_ignorar_diretorio(diretorio):
    """Verifica se um diretório deve ser ignorado com base em uma lista de padrões."""
    return bool(re.search(r'tests|periodic|samples|russian|mailchimp|english|developer|install|upgrade|xero|api|artificer|azure|cas_|charts|chat|datafox|decorous|dolphin|drupal|editor|elasticsearch|facebook|fontawesome|froala|google|intercom|linkedin|lucid|mailchip|nexus|oauth2|ocean|okta|opencv|plyr|profiler|protean|se_migration|shopify|smtpmailer|snipcart|stripe_connect|twitter|una_connect|xero|update', diretorio, re.IGNORECASE))

def find_matching_brace(content, start_index):
    """Encontra a chave '}' correspondente a uma chave '{' inicial."""
    if start_index < 0 or content[start_index] != '{':
        return -1
    brace_count = 1
    for i, char in enumerate(content[start_index+1:], start_index+1):
        if char == '{':
            brace_count += 1
        elif char == '}':
            brace_count -= 1
            if brace_count == 0:
                return i
    return -1

def clean_docstring(text):
    """Limpa a documentação (PHPDoc) para ser usada no Elixir, preservando a indentação interna."""
    if text is None:
        return ""
    if text.startswith('/**'):
        text = text[3:]
    if text.endswith('*/'):
        text = text[:-2]
    
    lines = text.splitlines()
    cleaned_lines = []
    for line in lines:
        stripped_line = line.lstrip()
        if stripped_line.startswith('*'):
            content_part = stripped_line[1:]
            if content_part.startswith(' '):
                content_part = content_part[1:]
            indent_size = len(line) - len(stripped_line)
            indentation = line[:indent_size]
            final_line = indentation + content_part
        else:
            final_line = line
        cleaned_lines.append("  " + final_line.rstrip())

    result = "\n".join(cleaned_lines)
    return result.replace('\\', '\\\\').replace('"""', '\\"\\"\\"')

def parse_php_file(file_path, elixir_base_dir):
    """Analisa um arquivo PHP e gera arquivos Elixir para CADA classe/interface encontrada."""
    try:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as file:
            content = file.read()
    except Exception as e:
        print(f"  -> Erro ao ler o arquivo {file_path}: {e}")
        return

    # <<< MODIFICADO: Expressão regular mais robusta para `extends` e `implements` >>>
    class_pattern = r'((?:/\*\*(?:[^*]|\*(?!/))*?\*/\s*)?)(?:abstract\s+|final\s+)?(class|interface)\s+([\w\\]+)\s*(?:extends\s+([^ \t\n\r{]+))?\s*(?:implements\s+(.+?))?\s*{'
    
    for class_match in re.finditer(class_pattern, content):
        
        doc_raw, type_decl, class_name, extends, implements_str = class_match.groups()
        class_doc = clean_docstring(doc_raw)
        
        if implements_str:
            implements = [imp.strip().replace('\\', '.') for imp in implements_str.split(',')]
        else:
            implements = []

        body_start = class_match.end() - 1
        body_end = find_matching_brace(content, body_start)
        if body_end == -1:
            print(f"  -> Aviso: Não foi possível encontrar o corpo correspondente para '{class_name}' em {file_path}")
            continue
        
        class_content = content[body_start + 1 : body_end]

        elixir_module_name = class_name
        if type_decl == 'interface':
            if class_name.startswith('i'):
                elixir_module_name = class_name[1:].capitalize() + 'Interface'
            else:
                elixir_module_name = class_name.capitalize() + 'Interface'

        methods = []
        method_pattern = r'(/\*\*(?:[^*]|\*(?!/))*?\*/\s*)?(?:public|protected|private|static|\s)*\s*function\s+(&)?\s*([\w]+)\s*\(([^)]*)\)'
        
        for method_match in re.finditer(method_pattern, class_content, re.DOTALL):
            method_doc_raw, _, method_name, php_params = method_match.groups()
            
            method_body = ""
            method_def_end = method_match.end()
            body_char_match = re.search(r'\s*({|;)', class_content[method_def_end:])
            if body_char_match and body_char_match.group(1) == '{':
                body_start_rel = method_def_end + body_char_match.start(1)
                body_start_abs = body_start_rel + 1
                body_end_abs = find_matching_brace(class_content, body_start_rel)
                if body_end_abs != -1:
                    method_body = class_content[body_start_abs:body_end_abs]

            methods.append({
                'name': to_elixir_function_name(method_name),
                'params': convert_php_params_to_elixir(php_params),
                'body': "\n".join(["    # " + line.rstrip() for line in method_body.splitlines()]) if method_body else "    # Corpo do método não definido no PHP (abstrato ou de interface).",
                'docstring': clean_docstring(method_doc_raw),
            })
        
        output_dir = os.path.join(elixir_base_dir, 'classes' if type_decl == 'class' else 'interfaces')
        os.makedirs(output_dir, exist_ok=True)
        elixir_file_path = os.path.join(output_dir, f"{to_snake_case(elixir_module_name)}.ex")

        doc_reference = f"  Original file: {file_path}"
        doc_content = f"{doc_reference}\n\n{class_doc}" if class_doc.strip() else f"{doc_reference}\n\n  Módulo para {elixir_module_name}."
        
        elixir_content = f"defmodule DeeperHub.Services.{elixir_module_name} do\n"
        elixir_content += f"  @moduledoc \"\"\"\n{doc_content}\n  \"\"\"\n"

        if extends:
            elixir_content += f"\n  # Herda de: {extends.replace('\\', '.')}\n"
        if implements:
            elixir_content += f"  # Implementa: {', '.join(implements)}\n"

        for method in methods:
            elixir_content += "\n"
            if method['docstring'].strip():
                elixir_content += f"  @doc \"\"\"\n{method['docstring']}\n  \"\"\"\n"
            
            elixir_content += f"  def {method['name']}({method['params']}) do\n"
            elixir_content += f"{method['body']}\n"
            elixir_content += "    :ok\n"
            elixir_content += "  end\n"

        elixir_content += "end\n"

        with open(elixir_file_path, 'w', encoding='utf-8') as elixir_file:
            elixir_file.write(elixir_content)
        print(f"  -> Arquivo Elixir gerado: {elixir_file_path}")

def process_php_files(root_php_dir, root_elixir_dir):
    """Função principal que orquestra todo o processo de conversão."""
    delete_output_directories()
    
    print("\nIniciando varredura dos arquivos PHP...")
    file_count = 0
    for root, dirs, files in os.walk(root_php_dir):
        dirs[:] = [d for d in dirs if not deve_ignorar_diretorio(d)]
        
        for file in files:
            if file.endswith('.php'):
                file_path = os.path.join(root, file)
                print(f"Processando: {file_path}")
                relative_path_dir = os.path.dirname(os.path.relpath(file_path, root_php_dir))
                elixir_base_dir = os.path.join(root_elixir_dir, relative_path_dir)
                parse_php_file(file_path, elixir_base_dir)
                file_count += 1
    
    print(f"\nProcessamento concluído. {file_count} arquivos PHP analisados.")

if __name__ == "__main__":
    process_php_files(php_dir, elixir_dir)