#!/usr/bin/env python3
"""
Script para corrigir os caminhos das APIs no arquivo api.js
"""

import re

def fix_api_paths():
    """Corrige os caminhos das APIs."""
    
    file_path = "client/admin/js/api.js"
    
    print(f"🔧 Corrigindo caminhos das APIs em {file_path}...")
    
    # Ler o arquivo
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Lista de APIs para corrigir
    apis_to_fix = [
        'forms', 'menus', 'media', 'users', 'settings', 'themes', 'audit'
    ]
    
    # Corrigir cada API
    for api in apis_to_fix:
        print(f"  Corrigindo API: {api}")
        
        # Padrões para encontrar e substituir
        patterns = [
            (rf'return this\.get\(`/{api}', rf'return this.get(`/cms/{api}'),
            (rf'this\.get\(`/{api}/', rf'this.get(`/cms/{api}/'),
            (rf'this\.post\(\'/{api}\'', rf'this.post(\'/cms/{api}\''),
            (rf'this\.post\(`/{api}/', rf'this.post(`/cms/{api}/'),
            (rf'this\.put\(`/{api}/', rf'this.put(`/cms/{api}/'),
            (rf'this\.delete\(`/{api}/', rf'this.delete(`/cms/{api}/'),
        ]
        
        for pattern, replacement in patterns:
            content = re.sub(pattern, replacement, content)
    
    # Escrever o arquivo corrigido
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"✅ APIs corrigidas com sucesso!")

if __name__ == "__main__":
    fix_api_paths()
