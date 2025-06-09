#include "window_manager.h"
#include "http_client.h"
#include "ui_manager.h"
#include "opengl_context.h"

// Instâncias globais dos gerenciadores
WindowManager g_windowManager;
HttpClient g_httpClient;
UIManager g_uiManager;
OpenGLContext g_openglContext;

// Callback para quando a conexão for solicitada
void OnConnectRequested() {
    g_httpClient.GetAsync("localhost", 4000, "/",
        [](const std::string& response, bool success) {
            (void)success; // Suprimir warning de parâmetro não utilizado
            g_uiManager.SetConnectionStatus(false, response);
        });
    g_uiManager.SetConnectionStatus(true, "");
}

int main(int argc, char** argv) {
    // Suprimir warnings de parâmetros não utilizados
    (void)argc;
    (void)argv;
    // Inicializar gerenciador de janela
    if (!g_windowManager.Initialize(L"Deeper Client", 800, 600)) {
        return -1;
    }

    // Inicializar contexto OpenGL
    if (!g_openglContext.Initialize(g_windowManager.GetHDC())) {
        return -1;
    }

    // Inicializar gerenciador de UI
    if (!g_uiManager.Initialize(g_windowManager.GetHWND())) {
        return -1;
    }

    // Configurar callback de conexão
    g_uiManager.SetConnectCallback(OnConnectRequested);

    // Configurar cores de fundo
    g_openglContext.SetClearColor(0.15f, 0.15f, 0.15f, 1.00f);

    // Loop principal
    bool running = true;
    while (running) {
        // Processar mensagens do Windows
        if (!g_windowManager.ProcessMessages()) {
            running = false;
            break;
        }

        // Atualizar status da conexão na UI
        g_uiManager.SetConnectionStatus(g_httpClient.IsRequestInProgress(),
                                       g_httpClient.GetLastResponse());

        // Iniciar frame da UI
        g_uiManager.NewFrame();

        // Configurar viewport e limpar tela
        ImGuiIO& io = ImGui::GetIO();
        g_openglContext.SetViewport((int)io.DisplaySize.x, (int)io.DisplaySize.y);
        g_openglContext.Clear();

        // Renderizar UI
        g_uiManager.Render();

        // Trocar buffers
        g_openglContext.SwapBuffers();
    }

    // Limpeza - os destrutores dos objetos globais farão a limpeza automaticamente
    return 0;
}


