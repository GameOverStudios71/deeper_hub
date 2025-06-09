#include "imgui.h"
#include "imgui_impl_win32.h"
#include "imgui_impl_opengl3.h"
#include <windows.h>
#include <tchar.h>
#include <GL/gl.h>

// Protótipos de funções
LRESULT WINAPI WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam);
extern IMGUI_IMPL_API LRESULT ImGui_ImplWin32_WndProcHandler(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam);
void ToggleFullscreen(HWND hwnd);

// Variáveis globais
HWND hwnd;
HDC hdc;
HGLRC hglrc;
bool g_IsFullscreen = false;
RECT g_WindowRect = {0, 0, 800, 600}; // Tamanho padrão da janela quando não estiver em tela cheia

int main(int argc, char** argv) {
    // Registrar classe de janela
    WNDCLASSEXW wc = { sizeof(wc), CS_OWNDC, WndProc, 0L, 0L, GetModuleHandle(NULL), NULL, NULL, NULL, NULL, L"ImGui Example", NULL };
    ::RegisterClassExW(&wc);
    
    // Criar janela inicialmente em modo normal (será alterada para fullscreen logo depois)
    hwnd = ::CreateWindowW(wc.lpszClassName, L"Deeper Client", 
                          WS_OVERLAPPEDWINDOW, 
                          CW_USEDEFAULT, CW_USEDEFAULT, 
                          800, 600, 
                          NULL, NULL, wc.hInstance, NULL);
    
    // Inicializar OpenGL
    hdc = ::GetDC(hwnd);
    PIXELFORMATDESCRIPTOR pfd = { sizeof(PIXELFORMATDESCRIPTOR), 1, PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER, PFD_TYPE_RGBA, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 8, 0, PFD_MAIN_PLANE, 0, 0, 0, 0 };
    int pixel_format = ::ChoosePixelFormat(hdc, &pfd);
    ::SetPixelFormat(hdc, pixel_format, &pfd);
    hglrc = ::wglCreateContext(hdc);
    ::wglMakeCurrent(hdc, hglrc);
    
    // Configurar ImGui
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    
    // Configurar estilo
    ImGui::StyleColorsDark();
    
    // Configurar backends
    ImGui_ImplWin32_Init(hwnd);
    ImGui_ImplOpenGL3_Init("#version 130");
    
    // Salvar posição e tamanho da janela antes de entrar em tela cheia
    ::GetWindowRect(hwnd, &g_WindowRect);
    
    // Entrar em modo tela cheia
    ToggleFullscreen(hwnd);
    
    // Cores de fundo
    ImVec4 clear_color = ImVec4(0.15f, 0.15f, 0.15f, 1.00f);
    
    // Loop principal
    bool done = false;
    while (!done) {
        // Processar mensagens do Windows
        MSG msg;
        while (::PeekMessage(&msg, NULL, 0U, 0U, PM_REMOVE)) {
            ::TranslateMessage(&msg);
            ::DispatchMessage(&msg);
            if (msg.message == WM_QUIT)
                done = true;
        }
        if (done)
            break;
            
        // Iniciar frame ImGui
        ImGui_ImplOpenGL3_NewFrame();
        ImGui_ImplWin32_NewFrame();
        ImGui::NewFrame();
        
        // Criar interface ImGui personalizada
        {
            // Criar janela em tela cheia sem bordas
            ImGuiWindowFlags window_flags = ImGuiWindowFlags_NoDecoration | 
                                           ImGuiWindowFlags_NoMove | 
                                           ImGuiWindowFlags_NoResize | 
                                           ImGuiWindowFlags_NoSavedSettings;
            
            // Obter tamanho da tela
            const ImGuiViewport* viewport = ImGui::GetMainViewport();
            ImGui::SetNextWindowPos(viewport->WorkPos);
            ImGui::SetNextWindowSize(viewport->WorkSize);
            
            // Criar janela principal
            ImGui::Begin("Main Window", NULL, window_flags);
            
            ImGui::Text("Bem-vindo ao Deeper Client");
            ImGui::Text("Pressione Alt+Enter para alternar entre tela cheia e modo janela");
            ImGui::Separator();
            
            if (ImGui::Button("Configurações", ImVec2(150, 30))) {
                // Código para abrir configurações
            }
            
            ImGui::SameLine();
            
            if (ImGui::Button("Conectar", ImVec2(150, 30))) {
                // Código para conectar
            }
            
            ImGui::End();
        }
        
        // Renderizar
        ImGui::Render();
        glViewport(0, 0, (int)io.DisplaySize.x, (int)io.DisplaySize.y);
        glClearColor(clear_color.x, clear_color.y, clear_color.z, clear_color.w);
        glClear(GL_COLOR_BUFFER_BIT);
        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
        ::SwapBuffers(hdc);
    }
    
    // Limpeza
    ImGui_ImplOpenGL3_Shutdown();
    ImGui_ImplWin32_Shutdown();
    ImGui::DestroyContext();
    
    ::wglMakeCurrent(NULL, NULL);
    ::wglDeleteContext(hglrc);
    ::ReleaseDC(hwnd, hdc);
    ::DestroyWindow(hwnd);
    ::UnregisterClassW(wc.lpszClassName, wc.hInstance);
    
    return 0;
}

// Função para alternar entre tela cheia e modo janela
void ToggleFullscreen(HWND hwnd) {
    if (!g_IsFullscreen) {
        // Salvar posição e tamanho da janela antes de entrar em tela cheia
        ::GetWindowRect(hwnd, &g_WindowRect);
        
        // Obter handle do monitor que contém a janela
        HMONITOR hmon = ::MonitorFromWindow(hwnd, MONITOR_DEFAULTTONEAREST);
        MONITORINFO mi = { sizeof(mi) };
        ::GetMonitorInfo(hmon, &mi);
        
        // Entrar em modo tela cheia
        ::SetWindowLong(hwnd, GWL_STYLE, WS_POPUP | WS_VISIBLE);
        ::SetWindowPos(hwnd, HWND_TOP,
                      mi.rcMonitor.left, mi.rcMonitor.top,
                      mi.rcMonitor.right - mi.rcMonitor.left,
                      mi.rcMonitor.bottom - mi.rcMonitor.top,
                      SWP_FRAMECHANGED);
        ::ShowWindow(hwnd, SW_SHOW);
    } else {
        // Restaurar estilo da janela
        ::SetWindowLong(hwnd, GWL_STYLE, WS_OVERLAPPEDWINDOW | WS_VISIBLE);
        
        // Restaurar posição e tamanho da janela
        ::SetWindowPos(hwnd, NULL,
                      g_WindowRect.left, g_WindowRect.top,
                      g_WindowRect.right - g_WindowRect.left,
                      g_WindowRect.bottom - g_WindowRect.top,
                      SWP_FRAMECHANGED);
        ::ShowWindow(hwnd, SW_SHOW);
    }
    
    g_IsFullscreen = !g_IsFullscreen;
}

// Manipulador de mensagens da janela
LRESULT WINAPI WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
    if (ImGui_ImplWin32_WndProcHandler(hWnd, msg, wParam, lParam))
        return true;
        
    switch (msg) {
    case WM_SIZE:
        return 0;
    case WM_SYSCOMMAND:
        if ((wParam & 0xfff0) == SC_KEYMENU) // Desabilitar ALT application menu
            return 0;
        break;
    case WM_DESTROY:
        ::PostQuitMessage(0);
        return 0;
    case WM_KEYDOWN:
        // Alt+Enter para alternar modo tela cheia
        if (wParam == VK_RETURN && (GetKeyState(VK_MENU) & 0x8000)) {
            ToggleFullscreen(hWnd);
            return 0;
        }
        break;
    }
    return ::DefWindowProcW(hWnd, msg, wParam, lParam);
}