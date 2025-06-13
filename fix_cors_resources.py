#!/usr/bin/env python3
"""
Script para adicionar suporte a CORS (OPTIONS) em todos os resources do CMS.
"""

import os
import re
from pathlib import Path

def add_cors_to_resource(file_path):
    """Adiciona suporte a CORS OPTIONS em um resource."""
    
    print(f"Processando: {file_path}")
    
    # Ler o arquivo
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Verificar se já tem OPTIONS
    if 'options _' in content:
        print(f"  ✅ Já tem suporte a OPTIONS")
        return
    
    # Padrão para encontrar o match _ (fallback)
    fallback_pattern = r'(\s+# Fallback para rotas não encontradas\s+match _ do.*?end)'
    
    match = re.search(fallback_pattern, content, re.DOTALL)
    if not match:
        print(f"  ❌ Não encontrou padrão de fallback")
        return
    
    # Código CORS para inserir
    cors_code = '''  # Handle CORS preflight requests
  options _ do
    conn
    |> put_resp_header("access-control-allow-origin", "*")
    |> put_resp_header("access-control-allow-methods", "GET, POST, PUT, DELETE, OPTIONS")
    |> put_resp_header("access-control-allow-headers", "content-type, authorization, x-requested-with")
    |> put_resp_header("access-control-max-age", "86400")
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{status: "ok"}))
  end

'''
    
    # Inserir o código CORS antes do fallback
    fallback_start = match.start()
    new_content = content[:fallback_start] + cors_code + content[fallback_start:]
    
    # Escrever o arquivo modificado
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"  ✅ CORS adicionado com sucesso")

def main():
    """Função principal."""
    
    print("🔧 Adicionando suporte a CORS em todos os resources...")
    
    # Diretório dos resources
    resources_dir = Path("lib/deeper_hub_web/resources/cms")
    
    if not resources_dir.exists():
        print(f"❌ Diretório não encontrado: {resources_dir}")
        return
    
    # Lista de resources para processar
    resource_files = [
        "user_resource.ex",
        "widget_resource.ex", 
        "form_resource.ex",
        "menu_resource.ex",
        "media_resource.ex",
        "theme_resource.ex",
        "audit_resource.ex",
        "relationship_resource.ex"
    ]
    
    processed = 0
    for resource_file in resource_files:
        file_path = resources_dir / resource_file
        
        if file_path.exists():
            add_cors_to_resource(file_path)
            processed += 1
        else:
            print(f"⚠️  Arquivo não encontrado: {file_path}")
    
    print(f"\n✅ Processamento concluído!")
    print(f"   Arquivos processados: {processed}")
    print(f"   Arquivos não encontrados: {len(resource_files) - processed}")

if __name__ == "__main__":
    main()
