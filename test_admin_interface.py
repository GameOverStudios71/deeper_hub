#!/usr/bin/env python3
"""
Script de teste para verificar se a interface administrativa está funcionando.
Abre o navegador e verifica se os arquivos estão sendo servidos corretamente.
"""

import webbrowser
import http.server
import socketserver
import threading
import time
import os
import sys
from pathlib import Path

def start_server(port=8080):
    """Inicia um servidor HTTP simples para servir os arquivos estáticos."""
    
    # Mudar para o diretório client
    client_dir = Path(__file__).parent / "client"
    
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
    """Verifica se todos os arquivos necessários existem."""
    
    client_dir = Path(__file__).parent / "client"
    required_files = [
        "admin/index.html",
        "admin/css/admin.css",
        "admin/js/admin.js",
        "admin/js/api.js",
        "admin/js/components.js",
        "admin/js/utils.js",
        "ui/TuiCss/dist/tuicss.min.css",
        "ui/TuiCss/dist/tuicss.min.js",
        "ui/bootstrap-4.4.1-dist/css/bootstrap-grid.min.css"
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

def test_admin_interface():
    """Testa a interface administrativa."""
    
    print("="*60)
    print(" TESTE DA INTERFACE ADMINISTRATIVA - DEEPER HUB CMS")
    print("="*60)
    
    # Verificar arquivos
    print("\n🔍 Verificando arquivos necessários...")
    if not check_files():
        print("\n❌ Alguns arquivos estão ausentes. Verifique a estrutura do projeto.")
        return False
    
    print("\n✅ Todos os arquivos necessários foram encontrados!")
    
    # Iniciar servidor em thread separada
    print("\n🚀 Iniciando servidor de desenvolvimento...")
    
    server_thread = threading.Thread(target=start_server, daemon=True)
    server_thread.start()
    
    # Aguardar um pouco para o servidor iniciar
    time.sleep(2)
    
    # Abrir navegador
    admin_url = "http://localhost:8080/admin/index.html"
    print(f"\n🌐 Abrindo interface administrativa em: {admin_url}")
    
    try:
        webbrowser.open(admin_url)
        print("\n✅ Navegador aberto com sucesso!")
    except Exception as e:
        print(f"\n❌ Erro ao abrir navegador: {e}")
        print(f"   Abra manualmente: {admin_url}")
    
    # Instruções para o usuário
    print("\n" + "="*60)
    print(" INSTRUÇÕES DE TESTE")
    print("="*60)
    print("""
🎯 O que testar na interface administrativa:

1. LAYOUT E VISUAL:
   ✓ Interface com visual DOS/NCurses (azul, fonte monoespaçada)
   ✓ Menu superior com File, Edit, View, Tools, Help
   ✓ Menu lateral com seções (Dashboard, Pages, Users, etc.)
   ✓ Barra de status na parte inferior
   ✓ Tabs para múltiplas seções abertas

2. NAVEGAÇÃO:
   ✓ Clique nas seções do menu lateral
   ✓ Teste os atalhos de teclado (F1, F5, F10, etc.)
   ✓ Teste os menus dropdown
   ✓ Teste o fechamento de tabs

3. DASHBOARD:
   ✓ Cards de estatísticas
   ✓ Atividade recente
   ✓ Botões de ação rápida

4. FUNCIONALIDADES:
   ✓ Notificações (aparecem no canto superior direito)
   ✓ Modais de confirmação
   ✓ Responsividade (redimensione a janela)

5. ATALHOS DE TECLADO:
   ✓ F1 - Ajuda
   ✓ F5 - Atualizar
   ✓ F10 - Logout
   ✓ ESC - Fechar modais

⚠️  NOTA: A API ainda não está rodando, então algumas funcionalidades
    podem mostrar erros de conexão. Isso é esperado neste teste.

🔧 Para parar o servidor: Pressione Ctrl+C neste terminal
""")
    
    # Manter servidor rodando
    try:
        print("\n⏳ Servidor rodando... Pressione Ctrl+C para parar.")
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n\n🛑 Servidor parado pelo usuário.")
        print("✅ Teste concluído!")
        return True

def main():
    """Função principal."""
    
    try:
        success = test_admin_interface()
        sys.exit(0 if success else 1)
    except Exception as e:
        print(f"\n❌ Erro durante o teste: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
