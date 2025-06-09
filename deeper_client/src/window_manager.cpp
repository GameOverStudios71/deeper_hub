#include "window_manager.h"
#include "imgui_impl_win32.h"

// Declaração externa da função do ImGui
extern IMGUI_IMPL_API LRESULT ImGui_ImplWin32_WndProcHandler(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam);

// Instância global
WindowManager* g_WindowManager = nullptr;

WindowManager::WindowManager()
    : m_hwnd(nullptr)
    , m_hdc(nullptr)
    , m_isFullscreen(false)
    , m_windowRect{0, 0, 800, 600}
{
    g_WindowManager = this;
}

WindowManager::~WindowManager() {
    Shutdown();
    g_WindowManager = nullptr;
}

bool WindowManager::Initialize(const wchar_t* title, int width, int height) {
    // Registrar classe de janela
    m_wc = { 
        sizeof(m_wc), 
        CS_OWNDC, 
        WndProc, 
        0L, 0L, 
        GetModuleHandle(NULL), 
        NULL, NULL, NULL, NULL, 
        L"DeeperClient", 
        NULL 
    };
    
    if (!::RegisterClassExW(&m_wc)) {
        return false;
    }
    
    // Criar janela inicialmente em modo normal
    m_hwnd = ::CreateWindowW(
        m_wc.lpszClassName, 
        title,
        WS_OVERLAPPEDWINDOW, 
        CW_USEDEFAULT, CW_USEDEFAULT, 
        width, height, 
        NULL, NULL, 
        m_wc.hInstance, 
        NULL
    );
    
    if (!m_hwnd) {
        return false;
    }
    
    // Mostrar a janela inicialmente
    ::ShowWindow(m_hwnd, SW_SHOW);
    ::UpdateWindow(m_hwnd);

    // Obter contexto de dispositivo
    m_hdc = ::GetDC(m_hwnd);
    if (!m_hdc) {
        return false;
    }

    // Salvar posição e tamanho da janela antes de entrar em tela cheia
    ::GetWindowRect(m_hwnd, &m_windowRect);

    // Entrar em modo tela cheia
    SetFullscreenMode(true);
    
    return true;
}

void WindowManager::Shutdown() {
    if (m_hdc) {
        ::ReleaseDC(m_hwnd, m_hdc);
        m_hdc = nullptr;
    }
    
    if (m_hwnd) {
        ::DestroyWindow(m_hwnd);
        m_hwnd = nullptr;
    }
    
    ::UnregisterClassW(m_wc.lpszClassName, m_wc.hInstance);
}

void WindowManager::ToggleFullscreen() {
    SetFullscreenMode(!m_isFullscreen);
}

void WindowManager::SetFullscreenMode(bool fullscreen) {
    if (fullscreen && !m_isFullscreen) {
        // Salvar posição e tamanho da janela antes de entrar em tela cheia
        ::GetWindowRect(m_hwnd, &m_windowRect);
        
        // Obter handle do monitor que contém a janela
        HMONITOR hmon = ::MonitorFromWindow(m_hwnd, MONITOR_DEFAULTTONEAREST);
        MONITORINFO mi = {};
        mi.cbSize = sizeof(mi);
        ::GetMonitorInfo(hmon, &mi);
        
        // Entrar em modo tela cheia
        ::SetWindowLong(m_hwnd, GWL_STYLE, WS_POPUP | WS_VISIBLE);
        ::SetWindowPos(m_hwnd, HWND_TOP,
                      mi.rcMonitor.left, mi.rcMonitor.top,
                      mi.rcMonitor.right - mi.rcMonitor.left,
                      mi.rcMonitor.bottom - mi.rcMonitor.top,
                      SWP_FRAMECHANGED);
        ::ShowWindow(m_hwnd, SW_SHOW);
        
        m_isFullscreen = true;
    } 
    else if (!fullscreen && m_isFullscreen) {
        // Restaurar estilo da janela
        ::SetWindowLong(m_hwnd, GWL_STYLE, WS_OVERLAPPEDWINDOW | WS_VISIBLE);
        
        // Restaurar posição e tamanho da janela
        ::SetWindowPos(m_hwnd, NULL,
                      m_windowRect.left, m_windowRect.top,
                      m_windowRect.right - m_windowRect.left,
                      m_windowRect.bottom - m_windowRect.top,
                      SWP_FRAMECHANGED);
        ::ShowWindow(m_hwnd, SW_SHOW);
        
        m_isFullscreen = false;
    }
}

bool WindowManager::ProcessMessages() {
    MSG msg;
    while (::PeekMessage(&msg, NULL, 0U, 0U, PM_REMOVE)) {
        ::TranslateMessage(&msg);
        ::DispatchMessage(&msg);
        if (msg.message == WM_QUIT) {
            return false;
        }
    }
    return true;
}

// Manipulador de mensagens da janela
LRESULT WINAPI WindowManager::WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
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
            if (g_WindowManager) {
                g_WindowManager->ToggleFullscreen();
            }
            return 0;
        }
        break;
    }
    return ::DefWindowProcW(hWnd, msg, wParam, lParam);
}
