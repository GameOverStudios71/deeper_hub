#!/usr/bin/env python3
"""
Script para iniciar o cliente administrativo do DeeperHub CMS.
Inicia o servidor frontend e abre a interface administrativa no navegador.
"""

import webbrowser
import http.server
import socketserver
import threading
import time
import os
import sys
import requests
from pathlib import Path

def start_server(port=8080):
    """Inicia um servidor HTTP simples para servir os arquivos estáticos."""
    
    # Mudar para o diretório client
    client_dir = Path(__file__).parent / "../client"
    
    if not client_dir.exists():
        print(f"❌ Diretório client não encontrado: {client_dir}")
        return None
    
    os.chdir(client_dir)
    
    class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
        def end_headers(self):
            # Adicionar headers CORS para desenvolvimento
            self.send_header('Access-Control-Allow-Origin', '*')
            self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
            self.send_header('Access-Control-Allow-Headers', 'Content-Type')
            super().end_headers()
        
        def log_message(self, format, *args):
            # Log customizado
            print(f"[{time.strftime('%H:%M:%S')}] {format % args}")
    
    try:
        with socketserver.TCPServer(("", port), CustomHTTPRequestHandler) as httpd:
            print(f"✅ Servidor iniciado em http://localhost:{port}")
            print(f"📁 Servindo arquivos de: {client_dir.absolute()}")
            httpd.serve_forever()
    except OSError as e:
        if e.errno == 98:  # Address already in use
            print(f"❌ Porta {port} já está em uso. Tentando porta {port + 1}...")
            return start_server(port + 1)
        else:
            print(f"❌ Erro ao iniciar servidor: {e}")
            return None

def check_files():
    """Verifica se todos os arquivos necessários do CMS existem."""

    client_dir = Path(__file__).parent / "../client"
    required_files = [
        "index.html",
        "css/admin.css",
        "js/config.js",
        "js/cms-client.js",
        "js/utils.js",
        "js/auth.js",
        "js/app.js",
        "js/dashboard.js",
        "js/pages.js",
        "js/forms.js",
        "js/widgets.js",
        "js/media.js",
        "js/menus.js",
        "js/users.js",
        "js/settings.js",
        "js/audit.js"
    ]

    missing_files = []
    existing_files = []

    for file_path in required_files:
        full_path = client_dir / file_path
        if full_path.exists():
            existing_files.append(file_path)
            print(f"✅ {file_path}")
        else:
            missing_files.append(file_path)
            print(f"❌ {file_path}")

    print(f"\n📊 Resumo:")
    print(f"   Arquivos encontrados: {len(existing_files)}")
    print(f"   Arquivos ausentes: {len(missing_files)}")

    if missing_files:
        print(f"\n⚠️  Arquivos ausentes:")
        for file_path in missing_files:
            print(f"   - {file_path}")
        return False

    return True

def check_backend():
    """Verifica se o backend está rodando."""
    try:
        response = requests.get("http://localhost:4000/", timeout=3)
        if response.status_code == 200:
            data = response.json()
            if data.get('status') == 'ok':
                print("✅ Backend está rodando em http://localhost:4000")
                return True
        print("⚠️ Backend respondeu mas não está OK")
        return False
    except requests.exceptions.RequestException:
        print("❌ Backend não está rodando em http://localhost:4000")
        return False

def check_config():
    """Verifica e mostra a configuração atual do cliente."""
    client_dir = Path(__file__).parent / "../client"
    config_file = client_dir / "js/config.js"

    if not config_file.exists():
        print("❌ Arquivo de configuração não encontrado")
        return False

    try:
        with open(config_file, 'r', encoding='utf-8') as f:
            content = f.read()

        # Extrair configurações básicas
        print("📋 Modo: PRODUÇÃO (backend real)")
        print("   - Conectando ao backend Elixir")
        print("   - Dados persistentes no SQLite")

        if 'localhost:4000' in content:
            print("🔗 API URL: http://localhost:4000/api/cms")

        return True
    except Exception as e:
        print(f"❌ Erro ao ler configuração: {e}")
        return False

def start_cms_client():
    """Inicia o cliente administrativo do DeeperHub CMS."""

    print("="*60)
    print(" DEEPERHUB CMS - CLIENTE ADMINISTRATIVO")
    print("="*60)

    # Verificar arquivos
    print("\n🔍 Verificando arquivos do cliente...")
    if not check_files():
        print("\n❌ Alguns arquivos estão ausentes. Verifique a estrutura do projeto.")
        return False

    print("\n✅ Todos os arquivos necessários foram encontrados!")

    # Verificar configuração
    print("\n⚙️ Verificando configuração...")
    check_config()

    # Verificar backend
    print("\n🔍 Verificando backend...")
    backend_running = check_backend()

    if not backend_running:
        print("\n⚠️ Backend não está rodando. O cliente precisa do backend para funcionar.")
        print("💡 Para iniciar o backend:")
        print("   1. Execute: mix deps.get")
        print("   2. Execute: mix run --no-halt")

    # Iniciar servidor em thread separada
    print("\n🚀 Iniciando servidor frontend...")

    server_thread = threading.Thread(target=start_server, daemon=True)
    server_thread.start()

    # Aguardar um pouco para o servidor iniciar
    time.sleep(2)

    # Abrir navegador
    admin_url = "http://localhost:8080"
    print(f"\n🌐 Abrindo cliente administrativo em: {admin_url}")

    try:
        webbrowser.open(admin_url)
        print("\n✅ Navegador aberto com sucesso!")
    except Exception as e:
        print(f"\n❌ Erro ao abrir navegador: {e}")
        print(f"   Abra manualmente: {admin_url}")

    # Instruções para o usuário
    print("\n" + "="*60)
    print(" COMO USAR O CMS")
    print("="*60)
    print("""
🔐 CREDENCIAIS DE LOGIN:
   Email:    sysop@system.com
   Password: password123

🎯 FUNCIONALIDADES DISPONÍVEIS:

1. DASHBOARD:
   ✓ Estatísticas do sistema
   ✓ Atividades recentes
   ✓ Ações rápidas

2. GERENCIAMENTO DE CONTEÚDO:
   ✓ Pages - Criar e gerenciar páginas
   ✓ Forms - Construtor de formulários
   ✓ Widgets - Componentes reutilizáveis
   ✓ Media - Biblioteca de mídia
   ✓ Menus - Sistema de navegação

3. ADMINISTRAÇÃO:
   ✓ Users - Gerenciar usuários
   ✓ Settings - Configurações do sistema
   ✓ Audit - Logs de auditoria

4. OPERAÇÕES CRUD:
   ✓ Criar, Listar, Editar, Excluir
   ✓ Busca e filtros
   ✓ Paginação automática

🧪 TESTE COMPLETO:
   Acesse: http://localhost:8080/test-checklist.html
   Para uma lista completa de funcionalidades para testar

🔧 Para parar o servidor: Pressione Ctrl+C neste terminal
""")

    # Manter servidor rodando
    try:
        print("\n⏳ Servidor rodando... Pressione Ctrl+C para parar.")
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n\n🛑 Servidor parado pelo usuário.")
        print("✅ Cliente administrativo encerrado!")
        return True

def main():
    """Função principal."""

    import argparse

    parser = argparse.ArgumentParser(description='Iniciar Cliente Administrativo DeeperHub CMS')
    parser.add_argument('--port', type=int, default=8080,
                       help='Porta para o servidor frontend (padrão: 8080)')
    parser.add_argument('--no-browser', action='store_true',
                       help='Não abrir o navegador automaticamente')
    parser.add_argument('--check-only', action='store_true',
                       help='Apenas verificar arquivos e configuração')

    args = parser.parse_args()

    if args.check_only:
        print("🔍 Verificando apenas arquivos e configuração...")
        files_ok = check_files()
        config_ok = check_config()
        backend_ok = check_backend()

        print(f"\n📊 Status:")
        print(f"   Arquivos: {'✅ OK' if files_ok else '❌ ERRO'}")
        print(f"   Config:   {'✅ OK' if config_ok else '❌ ERRO'}")
        print(f"   Backend:  {'✅ OK' if backend_ok else '❌ OFFLINE'}")

        sys.exit(0 if (files_ok and config_ok) else 1)

    try:
        # Modificar porta se especificada
        global start_server
        original_start_server = start_server

        def start_server_with_port(port=args.port):
            return original_start_server(port)

        start_server = start_server_with_port

        # Modificar comportamento do navegador
        if args.no_browser:
            global webbrowser
            webbrowser.open = lambda url: print(f"🌐 Abra manualmente: {url}")

        success = start_cms_client()
        sys.exit(0 if success else 1)
    except Exception as e:
        print(f"\n❌ Erro durante a execução: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()